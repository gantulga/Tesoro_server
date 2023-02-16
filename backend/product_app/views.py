from django.http import JsonResponse
from product_app.models import Product, Item_balance
from structure_app.models import Client
from django.shortcuts import render, redirect, get_list_or_404, get_object_or_404
import math
from django.contrib.auth.models import Group

def balanceChecker(request, client_id, product_id):
    product = get_object_or_404(Product, pk=product_id)
    client = get_object_or_404(Client, pk=client_id)
    balance = None
    if product.is_ingrediented:
        if len(product.ingredients.all()) == 0:
            balance = 1000
        else:
            for ingredient in product.ingredients.all():
                size_type = ingredient.size_type.abbreviation
                size = ingredient.size
                if size_type == 'гр':
                    print(client.id, ingredient.commodity.id)
                    balance_obj = Item_balance.objects.filter(client=client.id, commodity=ingredient.commodity.id)
                    if len(balance_obj) > 0:
                        if balance_obj[0].size >= ingredient.size:
                            b = math.floor(balance_obj[0].size / ingredient.size)
                            if balance == None or b < balance:
                                balance = b
                    else: 
                        balance = 0
            
            for ingredient_product in product.ingredients_producted.all():
                balance_obj2 = Item_balance.objects.filter(client=client.id, product=ingredient_product.commodity.id)
                if len(balance_obj2) > 0:
                    print(balance_obj2[0].quantity)
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
            

    print(balance)
    return JsonResponse({'division': client.division.id, 'client': client.number, 'product': product.name, 'balance':balance})


def itemBalanceChanger(request, client_id):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        if request.method == 'POST':
            for key in request.POST:
                if key != 'csrfmiddlewaretoken':
                    value = request.POST[key]
                    balance = Item_balance.objects.get(pk=key)
                    if balance.quantity != None and balance.size == None:
                        balance.quantity = 0
                        balance.save()
                    elif balance.quantity == None and balance.size != None:
                        balance.size = 0
                        balance.save()
                    else:
                        print("ш, гр аль нь мэдэгдэхгүй item: ",balance)

            return redirect('/itemBalanceChanger/' + str(client_id))
        else:
            # Lounge barmen - 19
            sh_product_balances = Item_balance.objects.filter(client=client_id, product__isnull=False, quantity__isnull=False)
            gr_product_balances = Item_balance.objects.filter(client=client_id, product__isnull=False, size__isnull=False)
            
            sh_commodity_balances = Item_balance.objects.filter(client=client_id, commodity__isnull=False, quantity__isnull=False)
            gr_commodity_balances = Item_balance.objects.filter(client=client_id, commodity__isnull=False, size__isnull=False)
            return render(request, 'clientBalanceChanger.html', {
                'sh_product_balances':sh_product_balances, 
                'gr_product_balances':gr_product_balances, 
                'sh_commodity_balances':sh_commodity_balances, 
                'gr_commodity_balances':gr_commodity_balances, 
                })
    else:
        return redirect('/accounts/login/')
    