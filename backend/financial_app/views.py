
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group
from django.contrib import messages
from django.core.paginator import Paginator
from django.db.models import Q, Sum
from .models import Budget, Budget_type, EbarimtPhoto
from .forms import BudgetCreateForm, BudgetUpdateForm
from django.http import JsonResponse
from structure_app.decorators import group_required
from django.views.decorators.csrf import csrf_exempt

# Төсвийн жагсаалт
@login_required
def budget_list(request):
    query = request.GET.get('q', '')
    status_filter = request.GET.get('status', '')
    type_filter = request.GET.get('type', '')
    
    budgets = Budget.objects.all()
    
    if query:
        budgets = budgets.filter(
            Q(name__icontains=query) |
            Q(description__icontains=query) |
            Q(coordinator__username__icontains=query)
        )
    
    if status_filter:
        budgets = budgets.filter(status=status_filter)
    
    if type_filter:
        budgets = budgets.filter(budget_type_id=type_filter)
    
    # Эрэмбэлэх
    sort_by = request.GET.get('sort', '-created_at')
    budgets = budgets.order_by(sort_by)
    
    # Хуудаслалт
    paginator = Paginator(budgets, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    # Статистик
    from django.db.models import Sum
    total_amount = budgets.aggregate(Sum('amount'))['amount__sum'] or 0
    total_oppressed = budgets.aggregate(Sum('oppressed'))['oppressed__sum'] or 0
    total_returned = budgets.aggregate(Sum('returned'))['returned__sum'] or 0
    total_balance = budgets.aggregate(Sum('balance'))['balance__sum'] or 0
    
    # Төлөвүүдийн жагсаалтыг моделоос авах
    status_choices = [choice[0] for choice in Budget.STATUS_CHOICES]
    
    # Нэмэлт статистик
    if total_amount > 0:
        usage_percentage = (total_oppressed / total_amount) * 100
        balance_percentage = (total_balance / total_amount) * 100
    else:
        usage_percentage = 0
        balance_percentage = 0

    context = {
        'page_obj': page_obj,
        'query': query,
        'status_filter': status_filter,
        'type_filter': type_filter,
        'total_amount': total_amount,
        'total_oppressed': total_oppressed,
        'total_returned': total_returned,
        'total_balance': total_balance,
        'usage_percentage': usage_percentage,
        'balance_percentage': balance_percentage,
        'budget_types': Budget_type.objects.all(),
        'status_choices': status_choices
    }
    
    return render(request, 'budgets/budget_list.html', context)

# Төсөв үүсгэх
@group_required('Захирал')
@login_required
def budget_create(request):
    if request.method == 'POST':
        form = BudgetCreateForm(request.POST, request=request)  # Request дамжуулах
        if form.is_valid():
            form.save()
            messages.success(request, 'Төсөв амжилттай үүсгэгдлээ!')
            return redirect('budget_list')
    else:
        form = BudgetCreateForm(request=request)  # Request дамжуулах
    
    # Төсөв авагч group-ийн мэдээлэл
    try:
        budget_recipient_group = Group.objects.get(name='Төсөв авагч')
        recipients_count = budget_recipient_group.user_set.count()
    except Group.DoesNotExist:
        recipients_count = 0
    
    return render(request, 'budgets/budget_create_form.html', {
        'form': form,
        'title': 'Шинэ төсөв үүсгэх',
        'recipients_count': recipients_count
    })

# Төсөв засах
@group_required('Захирал')
@login_required
def budget_update(request, pk):
    budget = get_object_or_404(Budget, pk=pk)
    
    if request.method == 'POST':
        form = BudgetUpdateForm(request.POST, instance=budget, request=request)  # Request дамжуулах
        if form.is_valid():
            form.save()
            messages.success(request, 'Төсөв амжилттай шинэчлэгдлээ!')
            return redirect('budget_list')
    else:
        form = BudgetUpdateForm(instance=budget, request=request)  # Request дамжуулах
    
    return render(request, 'budgets/budget_update_form.html', {
        'form': form,
        'title': 'Төсөв засах',
        'budget': budget,
    })

# Төсөв устгах
@login_required
def budget_delete(request, pk):
    budget = get_object_or_404(Budget, pk=pk)
    
    if request.method == 'POST':
        budget.delete()
        messages.success(request, 'Төсөв амжилттай устгагдлаа!')
        return redirect('budget_list')
    
    return render(request, 'budgets/budget_confirm_delete.html', {
        'budget': budget
    })

# Төсвийн дэлгэрэнгүй
@login_required
def budget_detail(request, pk):
    budget = get_object_or_404(Budget, pk=pk)
    
    # Хэрэглэгчийн group мэдээлэл
    coordinator_groups = []
    if budget.coordinator:
        coordinator_groups = [group.name for group in budget.coordinator.groups.all()]
    
    products = []
    commodities = []
    total = 0
    for item in budget.bought_item_transfers.all():
        total += item.total_amount
        if item.product:
            products.append(item)
        else:
            commodities.append(item)

    budget.oppressed = total
    budget.save()

    return render(request, 'budgets/budget_detail.html', {
        'budget': budget,
        'coordinator_groups': coordinator_groups,
        'product_transfers':products,
        'commodity_transfers':commodities,
    })

# Төсвийн мэдээлэл JSON format-аар авах
@login_required
def budget_json(request, pk):
    budget = get_object_or_404(Budget, pk=pk)
    
    data = {
        'id': budget.id,
        'name': budget.name,
        'budget_type': budget.budget_type.name if budget.budget_type else '',
        'coordinator': budget.coordinator.get_full_name() if budget.coordinator else '',
        'description': budget.description,
        'amount': float(budget.amount),
        'balance': float(budget.balance),
        'status': budget.status,
        'created_at': budget.created_at.strftime('%Y-%m-%d %H:%M') if hasattr(budget, 'created_at') else '',
        'modified_at': budget.modified_at.strftime('%Y-%m-d %H:%M'),
        'modified_by': budget.modified_by.get_full_name() if budget.modified_by else ''
    }
    
    return JsonResponse(data)

from django.http import JsonResponse
from django.views.decorators.http import require_POST
from django.views.decorators.csrf import csrf_exempt
import json

@require_POST
@group_required('Захирал')
@csrf_exempt  # AJAX хүсэлтэд зориулсанfrom product_app.models import Item_transfer
def delete_transfer(request, id):
    """
    AJAX хүсэлтээр бараа/материал төсвөөс хасдаг view
    """

    is_director = request.user.groups.filter(name='Захирал').exists()
    if not is_director:
        return JsonResponse({
            'success': False,
            'error': 'Та энэ үйлдлийг хийх эрхгүй байна. Зөвхөн Захирал болон Админ устгах боломжтой.'
        }, status=403)

    from product_app.models import Item_transfer, Item_balance
    try:
        # JSON өгөгдөл унших
        data = json.loads(request.body)
        transfer_type = data.get('transfer_type', 'product')  # product эсвэл commodity
        
        if transfer_type == 'product':

            # Бүтээгдэхүүн хасах
            try:
                transfer = Item_transfer.objects.get(id=id)
                budget = transfer.budget
                
                # Төсвийн зарцуулсан дүнг буцаах
                budget.oppressed = max(0, budget.oppressed - transfer.total_amount)
                budget.save()
                
                # Мэдээллийг хадгалж авах
                transfer_name = transfer.product.name
                transfer_amount = transfer.total_amount
                
                # Үлдэгдлийг balance аас хасах
                fr_division = transfer.fr_division
                fr_client = transfer.fr_client
                fr_user = transfer.fr_user
                
                user_balance = None
                client_balance = None
                if fr_user:
                    user_balance = Item_balance.objects.filter(user=fr_user.id, product=transfer.product.id)
                    if len(user_balance) > 0:
                        user_balance = user_balance[0]

                if fr_client:
                    client_balance = Item_balance.objects.filter(client=fr_client.id, product=transfer.product.id)
                    if len(client_balance) > 0:
                        client_balance = client_balance[0]

                print(user_balance, client_balance)
                if user_balance and not client_balance:
                    if transfer.product.is_gramm:
                        if user_balance.size > transfer.size:
                            user_balance.size = user_balance.size - transfer.size
                            user_balance.save()
                        else:
                            return JsonResponse({
                                'success': False,
                                'error': 'Хэрэглэгчийн үлдэгдэл хасах утгаас бага байна.'
                            }, status=404)
                    else:
                        if user_balance.quantity > transfer.quantity:
                            user_balance.quantity = user_balance.quantity - transfer.quantity
                            user_balance.save()
                        else:
                            return JsonResponse({
                                'success': False,
                                'error': 'Хэрэглэгчийн үлдэгдэл хасах утгаас бага байна.'
                            }, status=404)

                if client_balance and not user_balance:
                    if transfer.product.is_gramm:
                        if client_balance.size > transfer.size:
                            client_balance.size = client_balance.size - transfer.size
                            client_balance.save()
                        else:
                            return JsonResponse({
                                'success': False,
                                'error': 'Цэгийн үлдэгдэл хасах утгаас бага байна.'
                            }, status=404)
                    else:
                        if client_balance.quantity > transfer.quantity:
                            client_balance.quantity = client_balance.quantity - transfer.quantity
                            client_balance.save()
                        else:
                            return JsonResponse({
                                'success': False,
                                'error': 'Цэгийн үлдэгдэл хасах утгаас бага байна.'
                            }, status=404)
                        
                # Transfer-ийг устгах
                transfer.delete()
                
                return JsonResponse({
                    'success': True,
                    'message': f'"{transfer_name}" бүтээгдэхүүн ("{transfer_amount}") амжилттай хасагдлаа',
                    'budget_totals': {
                        'oppressed': float(budget.oppressed),
                        'returned': float(budget.returned),
                        'balance': float(budget.balance)
                    }
                })
                
            except transfer.DoesNotExist:
                return JsonResponse({
                    'success': False,
                    'error': 'Бүтээгдэхүүний хасалт олдсонгүй'
                }, status=404)
                
        elif transfer_type == 'commodity':

            # Материал хасах
            try:
                transfer = Item_transfer.objects.get(id=id)
                budget = transfer.budget
                
                # Төсвийн зарцуулсан дүнг буцаах
                budget.oppressed = max(0, budget.oppressed - transfer.total_amount)
                budget.save()
                
                # Мэдээллийг хадгалж авах
                transfer_name = transfer.commodity.name
                transfer_amount = transfer.total_amount
                
                # Үлдэгдлийг balance аас хасах
                fr_division = transfer.fr_division
                fr_client = transfer.fr_client
                fr_user = transfer.fr_user
                
                user_balance = None
                client_balance = None
                if fr_user:
                    user_balance = Item_balance.objects.filter(user=fr_user.id, commodity=transfer.commodity.id)
                    if len(user_balance) > 0:
                        user_balance = user_balance[0]

                if fr_client:
                    client_balance = Item_balance.objects.filter(client=fr_client.id, commodity=transfer.commodity.id)
                    if len(client_balance) > 0:
                        client_balance = client_balance[0]
                           
                if user_balance and not client_balance:
                    if transfer.commodity.size_type.abbreviation == "гр":
                        if user_balance.size > transfer.size:
                            user_balance.size = user_balance.size - transfer.size
                            user_balance.save()
                        else:
                            return JsonResponse({
                                'success': False,
                                'error': 'Хэрэглэгчийн үлдэгдэл хасах утгаас бага байна.'
                            }, status=404)
                    elif transfer.commodity.size_type.abbreviation == "Ш":
                        if user_balance.quantity > transfer.quantity:
                            user_balance.quantity = user_balance.quantity - transfer.quantity
                            user_balance.save()
                        else:
                            return JsonResponse({
                                'success': False,
                                'error': 'Хэрэглэгчийн үлдэгдэл хасах утгаас бага байна.'
                            }, status=404)
                    else:
                        return JsonResponse({
                            'success': False,
                            'error': 'Материалын хэмжих нэгж гр, ш -ийн аль нэг нь биш байна. Шалгана уу!'
                        }, status=404)

                if client_balance and not user_balance:
                    if transfer.commodity.size_type.abbreviation == "гр":
                        if client_balance.size > transfer.size:
                            client_balance.size = client_balance.size - transfer.size
                            client_balance.save()
                        else:
                            return JsonResponse({
                                'success': False,
                                'error': 'Цэгийн үлдэгдэл хасах утгаас бага байна.'
                            }, status=404)
                    elif transfer.commodity.size_type.abbreviation == "Ш":
                        if client_balance.quantity > transfer.quantity:
                            client_balance.quantity = client_balance.quantity - transfer.quantity
                            client_balance.save()
                        else:
                            return JsonResponse({
                                'success': False,
                                'error': 'Цэгийн үлдэгдэл хасах утгаас бага байна.'
                            }, status=404)
                    else:
                        return JsonResponse({
                            'success': False,
                            'error': 'Материалын хэмжих нэгж гр, ш -ийн аль нэг нь биш байна. Шалгана уу!'
                        }, status=404)

                # Transfer-ийг устгах
                transfer.delete()
                
                return JsonResponse({
                    'success': True,
                    'message': f'"{transfer_name}" материал ("{transfer_amount}") амжилттай хасагдлаа',
                    'budget_totals': {
                        'oppressed': float(budget.oppressed),
                        'returned': float(budget.returned),
                        'balance': float(budget.balance)
                    }
                })
                
            except transfer.DoesNotExist:
                return JsonResponse({
                    'success': False,
                    'error': 'Материалын хасалт олдсонгүй'
                }, status=404)
                
        else:
            return JsonResponse({
                'success': False,
                'error': 'Буруу хасалтын төрөл'
            }, status=400)
            
    except json.JSONDecodeError:
        return JsonResponse({
            'success': False,
            'error': 'Буруу JSON формат'
        }, status=400)
        
    except Exception as e:
        return JsonResponse({
            'success': False,
            'error': str(e)
        }, status=500)