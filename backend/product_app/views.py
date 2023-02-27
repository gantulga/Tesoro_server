from django.http import JsonResponse
from product_app.models import Product, Item_balance
from structure_app.models import Client
from django.shortcuts import render, redirect, get_list_or_404, get_object_or_404
import math
from django.contrib.auth.models import Group
from django.views.decorators.csrf import csrf_exempt

def balanceChecker(request, client_id, product_id):
    product = get_object_or_404(Product, pk=product_id)
    client = get_object_or_404(Client, pk=client_id)
    balance = 0
    zadlah_bolomjtoi_products = []
    if product.is_ingrediented:
        if len(product.ingredients.all()) == 0:
            balance = 1000
        else:
            for ingredient in product.ingredients.all():
                size_type = ingredient.size_type.abbreviation
                if size_type == 'гр':
                    balance_obj = Item_balance.objects.filter(client=client.id, commodity=ingredient.commodity.id)
                    if len(balance_obj) > 0:
                        if balance_obj[0].size >= ingredient.size:
                            b = math.floor(balance_obj[0].size / ingredient.size)
                            if b > balance:
                                balance = b

                    # Үлдэгдэл 0 байвал задлаад материал болгох бүтээгдэхүүн байна уу? шалгах
                    p_products = ingredient.commodity.same_products.all()
                    for p_product in p_products:
                        p_product_balance = Item_balance.objects.filter(client=client.id, product=p_product.id)
                        if len(p_product_balance) > 0:
                            if p_product_balance[0].quantity > 0:
                                data = {'product_id' : p_product.id, 'product_name': p_product.name, 'quantity': p_product_balance[0].quantity}
                                zadlah_bolomjtoi_products.append(data)

            for ingredient_product in product.ingredients_producted.all():
                balance_obj2 = Item_balance.objects.filter(client=client.id, product=ingredient_product.commodity.id)
                if len(balance_obj2) > 0:
                    if balance_obj2[0].quantity >= ingredient_product.size:
                        bb = math.floor(balance_obj2[0].quantity / ingredient_product.size)
                        if bb < balance:
                            balance = bb
                else: 
                    balance = 0
            
    else:
        balance_obj = Item_balance.objects.filter(client=client.id, product=product.id)
        if len(balance_obj) > 0:
            balance = balance_obj[0].quantity
    
    if balance == None:
        balance = 0
            

    return JsonResponse({'division': client.division.id, 'client': client.number, 'product': product.name, 'balance':balance, 'zadlah_product':zadlah_bolomjtoi_products})


def itemBalanceChanger(request, client_id):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        if request.method == 'POST':
            for key in request.POST:
                if key != 'csrfmiddlewaretoken':
                    value = request.POST[key]
                    balance = Item_balance.objects.get(pk=key)
                    if balance.quantity != None and balance.size == None:
                        balance.quantity = value
                        balance.save()
                    elif balance.quantity == None and balance.size != None:
                        balance.size = value
                        balance.save()
                    else:
                        print("ш, гр аль нь мэдэгдэхгүй item: ",balance)

            return redirect('/itemBalanceChanger/' + str(client_id))
        else:
            # Lounge barmen - 19
            sh_product_balances = Item_balance.objects.filter(client=client_id, product__isnull=False, quantity__isnull=False).order_by('product__name')
            gr_product_balances = Item_balance.objects.filter(client=client_id, product__isnull=False, size__isnull=False).order_by('product__name')
            
            sh_commodity_balances = Item_balance.objects.filter(client=client_id, commodity__isnull=False, quantity__isnull=False).order_by('product__name')
            gr_commodity_balances = Item_balance.objects.filter(client=client_id, commodity__isnull=False, size__isnull=False).order_by('product__name')
            return render(request, 'clientBalanceChanger.html', {
                'sh_product_balances':sh_product_balances, 
                'gr_product_balances':gr_product_balances, 
                'sh_commodity_balances':sh_commodity_balances, 
                'gr_commodity_balances':gr_commodity_balances, 
                })
    else:
        return redirect('/accounts/login/')
    
@csrf_exempt
def productToCommodity(request, client_id, product_id):
    product = get_object_or_404(Product, pk=product_id)
    if request.method == 'POST':
        if product.gramm != 0:
            product_balance = Item_balance.objects.filter(client_id=client_id, product=product_id)
            if len(product_balance) > 0:
                if product_balance[0].quantity > 0:
                    product_balance[0].quantity = product_balance[0].quantity - 1
                    product_balance[0].save()

                    commodity_balance = Item_balance.objects.filter(client_id=client_id, commodity=product.same_commodity.id)
                    if len(commodity_balance) > 0:
                        commodity_balance[0].size = commodity_balance[0].size + product.gramm
                        commodity_balance[0].save()
                    else:
                        commodity_balance = Item_balance.objects.create(client_id=client_id, commodity=product.same_commodity, size=product.gramm)
                    return JsonResponse({'okey':True})
                else:
                    print("Productiin uldegdel hureltsehgui bn1")
                    return JsonResponse({'okey':False})
            else:
                print("Productiin uldegdel hureltsehgui bn2")
                return JsonResponse({'okey':False})
        else:
            print("Productiin gramm same_commotidgiin size 2 tentsuu bish bn!!")
            return JsonResponse({'okey':False})
    else:
        return JsonResponse({'okey':False})
