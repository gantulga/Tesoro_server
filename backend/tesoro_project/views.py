from django.shortcuts import render, redirect, get_list_or_404, get_object_or_404
from django.contrib import messages
from django.contrib.auth import get_user_model
from django.core.paginator import Paginator
from django.views.generic.edit import FormView
from django.urls import path
from django.conf import settings
import datetime
from django.http import HttpResponseRedirect
import os
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt, csrf_protect
import requests
import wget
import shutil
from django.db.models import Q, Avg, Count, Sum, F
from django.core.files import File  # you need this somewhere
import urllib
from pytz import timezone
import time
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.models import Group
from structure_app.models import Client, Division, Shift_work, Configuration_value
from product_app.models import Product, Commodity, Item_transfer, Item_transfer_type, Item_balance, Item_balance_log, Product_category
from financial_app.models import Budget, Wallet, Money_transfer
from payment_app.models import Order_detial, Order, Payment
from django.views.decorators.cache import never_cache
from django.core.cache import cache
import json
from rest_framework.decorators import api_view
import socket
from rest_framework.response import Response
from payment_app.models import Bill

def home(request):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        return render(request, 'home.html', {})
    else:
        return redirect('/accounts/login/')

@never_cache
def itemBalance(request):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        client = request.GET.get('client', None)
        if client == None:
            all_items = Item_balance.objects.all()
        else:
            all_items = Item_balance.objects.filter(client=client)
        clients = Client.objects.all()
        shift_workers = Shift_work.objects.filter(finished=True).order_by('-created_at')
        return render(request, 'itemBalance.html', {'all_items':all_items, 'shift_workers':shift_workers, 'clients':clients})
    else:
        return redirect('/accounts/login/')


@never_cache
def itemBalanceShiftWorker(request, shiftworker):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        shift_worker = get_object_or_404(Shift_work, pk=shiftworker)
        all_items = Item_balance_log.objects.filter(shift_work=shift_worker)
        shift_workers = Shift_work.objects.filter(finished=True).order_by('-created_at')
        return render(request, 'itemBalance.html', {'all_items':all_items, 'shift_workers':shift_workers, 'shift_worker':shift_worker})
    else:
        return redirect('/accounts/login/')

@never_cache
def addProduct(request):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        if request.method == 'POST':
            budget = None
            if request.POST['budget']:
                budget = Budget.objects.get(pk=request.POST['budget'])
            # fr_wallet = request.POST['fr_wallet']
            to_client = Client.objects.get(pk=request.POST['client'])
            to_division = to_client.division
            item_transfer_type = Item_transfer_type.objects.get(pk=1)
            index = 1
            while index < 31:
                if request.POST['product'+str(index)]:
                    total_amount = int(request.POST['quantity'+str(index)]) * int(request.POST['price'+str(index)])
                    product = Product.objects.get(pk=request.POST['product'+str(index)])
                    item_transfer = Item_transfer.objects.create(item_transfer_type=item_transfer_type, product=product, to_division=to_division, to_client=to_client, is_confirmed=True, confirmed_by=request.user, created_by=request.user, quantity=int(request.POST['quantity'+str(index)]), unit_price=float(request.POST['price'+str(index)]), total_amount=total_amount)
                    if item_transfer:
                        itemBalance = Item_balance.objects.filter(product=product, client=item_transfer.to_client.id)
                        if len(itemBalance) > 0:
                            itemBalance[0].quantity = itemBalance[0].quantity + item_transfer.quantity
                            itemBalance[0].save()
                        else:
                            item = Item_balance.objects.create(created_by=request.user, quantity=item_transfer.quantity, client=item_transfer.to_client, division=item_transfer.to_division, product=product)
                        

                else:
                    print("None")
                index += 1


            return redirect('/addProduct')
        else:
            all_products = Product.objects.filter(is_ingrediented=False)
            all_budgets = Budget.objects.filter(status='Төсөвлөсөн').order_by("-id")
            all_wallets = Wallet.objects.filter(is_pos=False)
            all_divisions = Division.objects.all()
            all_clients = Client.objects.all()
            return render(request, 'addProduct.html', {'all_products':all_products, 'range': range(30), 'all_budgets':all_budgets, 'all_wallets':all_wallets, 'all_divisions':all_divisions, 'all_clients':all_clients})
    else:
        return redirect('/accounts/login/')


@never_cache
def loungeShiftReport(request, shiftworker):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        shift_worker = get_object_or_404(Shift_work, pk=shiftworker)
        all_items = Item_balance_log.objects.filter(shift_work=shift_worker)
        shift_workers = Shift_work.objects.filter(finished=True)
        return render(request, 'itemBalance.html', {'all_items':all_items, 'shift_workers':shift_workers, 'shift_worker':shift_worker})
    else:
        return redirect('/accounts/login/')


@never_cache
def addCommodity(request):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        if request.method == 'POST':
            budget = None
            if request.POST['budget']:
                budget = Budget.objects.get(pk=request.POST['budget'])
            # fr_wallet = request.POST['fr_wallet']
            to_client = Client.objects.get(pk=request.POST['client'])
            to_division = to_client.division
            item_transfer_type = Item_transfer_type.objects.get(pk=1)
            index = 1
            while index < 31:
                if request.POST['commodity'+str(index)]:
                    commodity = Commodity.objects.get(pk=request.POST['commodity'+str(index)])
                    print(request.POST)
                    if request.POST['size_type'+str(index)] == "quantity":
                        item_transfer = Item_transfer.objects.create(item_transfer_type=item_transfer_type, commodity=commodity, to_division=to_division, to_client=to_client, is_confirmed=True, confirmed_by=request.user, created_by=request.user, quantity=int(request.POST['quantity'+str(index)]), unit_price=float(request.POST['price'+str(index)]), total_amount=float(request.POST['total'+str(index)]))
                    else:
                        item_transfer = Item_transfer.objects.create(item_transfer_type=item_transfer_type, commodity=commodity, to_division=to_division, to_client=to_client, is_confirmed=True, confirmed_by=request.user, created_by=request.user, size=int(request.POST['quantity'+str(index)]), unit_price=float(request.POST['price'+str(index)]), total_amount=float(request.POST['total'+str(index)]))
                    
                    if item_transfer:
                        itemBalance = Item_balance.objects.filter(commodity=commodity, client=item_transfer.to_client.id)
                        if len(itemBalance) > 0:
                            if request.POST['size_type'+str(index)] == "quantity":
                                itemBalance[0].quantity = itemBalance[0].quantity + item_transfer.quantity
                            else:
                                itemBalance[0].size = itemBalance[0].size + item_transfer.size
                            itemBalance[0].save()
                        else:
                            if request.POST['size_type'+str(index)] == "quantity":
                                item = Item_balance.objects.create(created_by=request.user, quantity=item_transfer.quantity, client=item_transfer.to_client, division=item_transfer.to_division, commodity=commodity)
                            else:
                                item = Item_balance.objects.create(created_by=request.user, size=item_transfer.size, client=item_transfer.to_client, division=item_transfer.to_division, commodity=commodity)
                else:
                    print("None")
                index += 1


            return redirect('/addCommodity')
        else:
            all_commodities = Commodity.objects.all().order_by('name')
            all_budgets = Budget.objects.filter(status='Төсөвлөсөн').order_by("-id")
            all_wallets = Wallet.objects.filter(is_pos=False)
            all_divisions = Division.objects.all()
            all_clients = Client.objects.all()
            return render(request, 'addCommodity.html', {'all_commodities':all_commodities, 'range': range(30), 'all_budgets':all_budgets, 'all_wallets':all_wallets, 'all_divisions':all_divisions, 'all_clients':all_clients})
    else:
        return redirect('/accounts/login/')



@never_cache
def commodityInformation(request, commodity_id):
    commodity = get_object_or_404(Commodity, pk=commodity_id)
    if commodity.size_type.abbreviation == "гр":
        size_type = "size"
    else:
        size_type = "quantity"

    return JsonResponse({'size_type': size_type, 'unit_size': commodity.unit_size})


@never_cache
def kitchenFoods(request):
    detail = request.GET.get('detail', None)
    if detail:
        order_detail = Order_detial.objects.get(pk=detail)
        if order_detail:
            order_detail.finished = True
            order_detail.finished_at = datetime.datetime.now()
            order_detail.save()

    food_cat_ids = []
    food_cat = Product_category.objects.get(pk=5)
    for cat in food_cat.child_categories.all():
        food_cat_ids.append(cat.id)

    today_min = datetime.datetime.combine(datetime.date.today(), datetime.time.min)
    today_max = datetime.datetime.combine(datetime.date.today(), datetime.time.max)

    not_finished_orders = Order_detial.objects.filter(product__categories__in=food_cat_ids, finished=False, created_at__range=(today_min, today_max)).order_by("created_at")
    finished_orders = Order_detial.objects.filter(product__categories__in=food_cat_ids, finished=True, created_at__range=(today_min, today_max)).order_by("-id")
    return render(request, 'kitchen.html', {'not_finished_orders':not_finished_orders, 'finished_orders':finished_orders})



@never_cache
def transferProduct(request):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        if request.method == 'POST':
            # fr_wallet = request.POST['fr_wallet']
            fr_client = Client.objects.get(pk=request.POST['fr_client'])
            fr_division = fr_client.division
            to_client = Client.objects.get(pk=request.POST['client'])
            to_division = to_client.division
            item_transfer_type = Item_transfer_type.objects.get(pk=2)
            index = 1
            while index < 31:
                if request.POST['product'+str(index)]:
                    product = Product.objects.get(pk=request.POST['product'+str(index)])
                    item_transfer = Item_transfer.objects.create(item_transfer_type=item_transfer_type, product=product, to_division=to_division, to_client=to_client, fr_division=fr_division, fr_client=fr_client,  is_confirmed=True, confirmed_by=request.user, created_by=request.user, quantity=int(request.POST['quantity'+str(index)]))
                    if item_transfer:
                        hasagdahBalance = Item_balance.objects.filter(product=product.id, client=item_transfer.fr_client.id)
                        if len(hasagdahBalance) > 0:
                            too = int(hasagdahBalance[0].quantity) - int(item_transfer.quantity)
                            hasagdahBalance[0].quantity = too
                            hasagdahBalance[0].save()

                        itemBalance = Item_balance.objects.filter(product=product, client=item_transfer.to_client.id)
                        if len(itemBalance) > 0:
                            itemBalance[0].quantity = itemBalance[0].quantity + item_transfer.quantity
                            itemBalance[0].save()
                        else:
                            item = Item_balance.objects.create(created_by=request.user, quantity=item_transfer.quantity, client=item_transfer.to_client, division=item_transfer.to_division, product=product)

                else:
                    print("None")
                index += 1

            return redirect('/itembalances?client=' + request.POST['client'])
        else:
            client = request.GET.get('client', None)
            if client == None:
                all_balances = []
            else:
                all_balances = Item_balance.objects.filter(client=client, product__isnull=False)
            all_divisions = Division.objects.all()
            all_clients = Client.objects.all()
            return render(request, 'transferProduct.html', {'all_balances':all_balances, 'range': range(30), 'all_divisions':all_divisions, 'all_clients':all_clients, 'client':client})
    else:
        return redirect('/accounts/login/')


@never_cache
def productBalance(request, client_id, product_id):
    client = get_object_or_404(Client, pk=client_id)
    product = get_object_or_404(Product, pk=product_id)
    balance = Item_balance.objects.filter(client=client.id, product=product.id)
    size = None
    size_type = None
    if balance[0].size != None and balance[0].quantity == None:
        size_type = "size"
        size = balance[0].size

    if balance[0].size == None and balance[0].quantity != None :
        size_type = "quantity"
        size = balance[0].quantity

    return JsonResponse({'size_type': size_type, 'size': size})



@never_cache
def transferCommodity(request):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        if request.method == 'POST':
            # fr_wallet = request.POST['fr_wallet']
            fr_client = Client.objects.get(pk=request.POST['fr_client'])
            fr_division = fr_client.division
            to_client = Client.objects.get(pk=request.POST['client'])
            to_division = to_client.division
            item_transfer_type = Item_transfer_type.objects.get(pk=2)
            index = 1
            while index < 31:
                if request.POST['commodity'+str(index)]:
                    commodity = Commodity.objects.get(pk=request.POST['commodity'+str(index)])
                    if commodity.size_type.id == 1:
                        item_transfer = Item_transfer.objects.create(item_transfer_type=item_transfer_type, commodity=commodity, to_division=to_division, to_client=to_client, fr_division=fr_division, fr_client=fr_client,  is_confirmed=True, confirmed_by=request.user, created_by=request.user, quantity=int(request.POST['quantity'+str(index)]))
                    elif commodity.size_type.id == 2:
                        item_transfer = Item_transfer.objects.create(item_transfer_type=item_transfer_type, commodity=commodity, to_division=to_division, to_client=to_client, fr_division=fr_division, fr_client=fr_client,  is_confirmed=True, confirmed_by=request.user, created_by=request.user, size=int(request.POST['quantity'+str(index)]))
                    else:
                        item_transfer = None

                    if item_transfer:
                        hasagdahBalance = Item_balance.objects.filter(commodity=commodity, client=item_transfer.fr_client.id)
                        if len(hasagdahBalance) > 0:
                            if commodity.size_type.id == 1 and hasagdahBalance[0].quantity != None:
                                too = int(hasagdahBalance[0].quantity) - int(item_transfer.quantity)
                                hasagdahBalance[0].quantity = too
                                hasagdahBalance[0].save()
                            elif commodity.size_type.id == 2 and hasagdahBalance[0].size != None:
                                too = int(hasagdahBalance[0].size) - int(item_transfer.size)
                                hasagdahBalance[0].size = too
                                hasagdahBalance[0].save()
                            else:
                                print("ERROR CONTANCT TO ADMIN")

                        itemBalance = Item_balance.objects.filter(commodity=commodity, client=item_transfer.to_client.id)
                        if len(itemBalance) > 0:
                            if commodity.size_type.id == 1 and itemBalance[0].quantity != None:
                                too = int(itemBalance[0].quantity) + int(item_transfer.quantity)
                                itemBalance[0].quantity = too
                                itemBalance[0].save()
                            elif commodity.size_type.id == 2 and itemBalance[0].size != None:
                                too = int(itemBalance[0].size) + int(item_transfer.size)
                                itemBalance[0].size = too
                                itemBalance[0].save()
                            else:
                                print("ERROR CONTANCT TO ADMIN")
                        else:
                            print(item_transfer)
                            if commodity.size_type.id == 1:
                                item = Item_balance.objects.create(created_by=request.user, quantity=item_transfer.quantity, client=item_transfer.to_client, division=item_transfer.to_division, commodity=commodity)
                            elif commodity.size_type.id == 2:
                                item = Item_balance.objects.create(created_by=request.user, size=item_transfer.size, client=item_transfer.to_client, division=item_transfer.to_division, commodity=commodity)
                            else:
                                print("ERROR CONTANCT TO ADMIN")
                            print("creating")
                        

                else:
                    print("None")
                index += 1

            return redirect('/itembalances?client=' + request.POST['client'])
        else:
            client = request.GET.get('client', None)
            if client == None:
                all_balances = []
            else:
                all_balances = Item_balance.objects.filter(client=client, commodity__isnull=False)
            all_divisions = Division.objects.all()
            all_clients = Client.objects.all()
            return render(request, 'transferCommodity.html', {'all_balances':all_balances, 'range': range(30), 'all_divisions':all_divisions, 'all_clients':all_clients, 'client':client})
    else:
        return redirect('/accounts/login/')


@never_cache
def commodityBalance(request, client_id, commodity_id):
    client = get_object_or_404(Client, pk=client_id)
    commodity = get_object_or_404(Product, pk=commodity_id)
    balance = Item_balance.objects.filter(client=client.id, commodity=commodity.id)
    size = None
    size_type = None
    if balance[0].size != None and balance[0].quantity == None:
        size_type = "size"
        size = balance[0].size

    if balance[0].size == None and balance[0].quantity != None :
        size_type = "quantity"
        size = balance[0].quantity

    return JsonResponse({'size_type': size_type, 'size': size})


@never_cache
def ingredientedBalance(request):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        if request.method == 'POST':
            return redirect('/ingredientedbalance')
        else:
            client = request.GET.get('client', None)
            if client == None:
                all_balances = []
            else:
                all_balances = Item_balance.objects.filter(client=client, commodity__isnull=False)
            all_divisions = Division.objects.all()
            all_clients = Client.objects.all()
            return render(request, 'transferCommodity.html', {'all_balances':all_balances, 'range': range(30), 'all_divisions':all_divisions, 'all_clients':all_clients, 'client':client})
    else:
        return redirect('/accounts/login/')


@never_cache
def dailyReport(request):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        if request.method == 'POST':
            return redirect('/dailyReport')
        else:
            shift_worker = request.GET.get('shiftWorker', None)
            if shift_worker != None:
                shift_work = get_object_or_404(Shift_work, pk=shift_worker)

                all_wallet = Wallet.objects.all()
                total_payment_balanace = 0
                wallet_balances = []
                for wallet in all_wallet:
                    wallet_balance = 0
                    payments = Payment.objects.filter(wallet=wallet.id, shift_work=shift_work.id)
                    for payment in payments:
                        wallet_balance = wallet_balance + payment.amount
                        total_payment_balanace = total_payment_balanace + payment.amount

                    wallet_balances.append({'wallet':wallet, 'balance':int(wallet_balance)})

                sold_items = []
                all_order_details = Order_detial.objects.filter(shift_work=shift_work.id).order_by('product')
                for detail in all_order_details:
                    index = next((i for i, item in enumerate(sold_items) if item['id'] == int(detail.product.id)), -1)
                    category = None
                    for cat in detail.product.categories.all():
                        if cat.parent == None:
                            category = cat

                    if index < 0:
                        sold_items.append({'id':detail.product.id, 'product': detail.product.name, 'quantity':detail.quantity, 'amount':detail.subtotal, 'category':category})
                    else:
                        sold_items[index]['quantity'] = int(sold_items[index]['quantity']) + int(detail.quantity)
                        sold_items[index]['amount'] = int(sold_items[index]['amount']) + int(detail.subtotal)

                all_shift_workers = Shift_work.objects.all().order_by('-id')
                all_orders = Order.objects.filter(shift_work=shift_work.id)
                total_order_amount = 0
                total_discount = 0
                total_discounted_amount = 0
                total_under_amount_guest = 0
                total_under_amount_worker = 0
                for order in all_orders:
                    total_order_amount = total_order_amount + order.amount
                    total_discount = total_discount + order.discount
                    total_discounted_amount = total_discounted_amount + order.discounted_amount
                    if order.status != "Төлбөр гүйцэт төлсөн.":
                        payment_dun = 0
                        for payment in order.payments.all():
                            payment_dun = payment_dun + payment.amount

                        if order.worker:
                            total_under_amount_worker = total_under_amount_worker + (order.discounted_amount - payment_dun)
                        else:
                            total_under_amount_guest = total_under_amount_guest + (order.discounted_amount - payment_dun)

                worker_under = []
                all_worker_orders = Order.objects.filter(shift_work=shift_work.id, worker__isnull=False).order_by('worker')
                for order in all_worker_orders:
                    index = next((i for i, item in enumerate(worker_under) if item['id'] == int(order.worker.id)), -1)
                    payment_t = 0
                    for payment in order.payments.all():
                        payment_t = payment_t + payment.amount

                    under_payment = order.discounted_amount - payment_t
                    if index < 0:
                        worker_under.append({'id':order.worker.id, 'worker': order.worker.first_name, 'total_amount':order.amount, 'discount':order.discount, 'under_amount':under_payment, 'paid':payment_t})
                    else:
                        worker_under[index]['total_amount'] = int(worker_under[index]['total_amount']) + int(order.amount)
                        worker_under[index]['discount'] = int(worker_under[index]['discount']) + int(order.discount)
                        worker_under[index]['under_amount'] = int(worker_under[index]['under_amount']) + int(under_payment)
                        worker_under[index]['paid'] = int(worker_under[index]['paid']) + int(payment_t)

                all_parent_cats = Product_category.objects.filter(parent__isnull=True)
                print(all_parent_cats)

                return render(request, 'dailyReport.html', {
                    'all_shift_workers':all_shift_workers, 
                    'wallet_balances':wallet_balances, 
                    'shift_work':shift_work, 
                    'total_payment_balanace':int(total_payment_balanace), 
                    'sold_items': sold_items,
                    'total_order_amount':total_order_amount, 
                    'total_discount': total_discount,
                    'total_discounted_amount': total_discounted_amount, 
                    'total_under_amount_worker':total_under_amount_worker,
                    'total_under_amount_guest': total_under_amount_guest,
                    'worker_under':worker_under,
                    'all_parent_cats':all_parent_cats })
            else:
                all_shift_workers = Shift_work.objects.all().order_by('-id')
                return render(request, 'dailyReport.html', {'all_shift_workers':all_shift_workers})
    else:
        return redirect('/accounts/login/')


@never_cache
def posNegtgel(request):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        if request.method == 'POST':
            return redirect('/posNegtgel')
        else:
            # all_orders = Order.objects.all()
            # for order in all_orders:
            #     order.discounted_amount = order.amount
            #     order.discount = 0
            #     order.discounted_percent = 0
            #     order.save()
            return render(request, 'postNegtgel.html', {})


@never_cache
def loungeItemBalances(request):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        cache.clear()
        shiftWorker = request.GET.get('shiftworker', None)
        shift_workers = Shift_work.objects.filter(division=5).order_by('-created_at')
        if shiftWorker != None:
            shift_worker = get_object_or_404(Shift_work, pk=shiftWorker)
            prev_shift_worker = Shift_work.objects.filter(division=5, pk__lt=shift_worker.id).order_by('-id').first()

            last = Shift_work.objects.filter(division=5).order_by('-id').first()
            if shift_worker.finished and last != shift_worker:
                balances = Item_balance_log.objects.filter(client=19, shift_work=shift_worker.id)
                print("Item_balance_log")
            else:
                balances = Item_balance.objects.filter(client=19)
                print("Item_balance")

            if prev_shift_worker.finished:
                prev_balances = Item_balance_log.objects.filter(client=19, shift_work=prev_shift_worker.id)
            else:
                prev_balances = Item_balance.objects.filter(client=19)

            return render(request, 'loungeBalance.html', {'shift_workers':shift_workers, 'prev_balances':prev_balances, 'balances':balances, 'shift_worker':shift_worker})
        else:
            shift_worker = None
            return render(request, 'loungeBalance.html', {'shift_worker':shift_worker, 'shift_workers':shift_workers})

        
    else:
        return redirect('/accounts/login/')

@csrf_exempt
def printer(request):
    if request.method == "POST":
        body = request.body
        res = json.loads(body.decode('utf-8'))
        
        date = "When: " + str(datetime.datetime.now()) + "\n"
        division = Division.objects.get(pk=res['order']['division'])
        if division.id == 3:
            division = "Hotel"
        elif division.id == 4:
            division = "Restaurant"
        elif division.id == 5:
            division = "Lounge"
        elif division.id == 6:
            division = "Karaoke"
        elif division.id == 1:
            division = "Office"
        elif division.id == 7:
            division = "Sauna Spa"
        else: 
            division = "Unkhown"
        
        where = "Where: " + str(division) + "\n"
        
        text = date + where

        bill_included_food = False
        number = 1
        for detail in res['detials']:
            is_food = False
            food_cat = Product_category.objects.get(pk=5)
            product = Product.objects.get(pk=detail['id'])
            for pcat in product.categories.all():
                if pcat in food_cat.child_categories.all():
                    is_food = True
            if is_food:
                bill_included_food = True
                product = Product.objects.get(pk=detail['id'])
                food = str(number) + ". " + str(product.print_name + " - " + str(detail['quantity'])) + "\n"
                text = text + food
                number = number + 1
        
        if bill_included_food:
            mysocket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)         
            host = "192.168.1.9" 
            port = 9100
            mysocket.connect((host, port))

            bill_number = Configuration_value.objects.get(pk=1)
            bill_number.kitchen_bill_number = bill_number.kitchen_bill_number + 1
            bill_number.save()

            text = "-------------------------------------\nNumber" + str(bill_number.kitchen_bill_number) + "\n" + text + "-------------------------------------\n\n\n\n\n\n\n\n\n\n\n"
            mysocket.send(text.encode('utf-8'))
            mysocket.close()

        return JsonResponse("Done", status=200, safe=False)
    else:
        return JsonResponse("Done", status=404, safe=False)

@never_cache
def changePriceProduct(request):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        if request.method == 'POST':
            for key in request.POST:
                if key != 'csrfmiddlewaretoken':
                    value = request.POST[key]
                    product = Product.objects.get(pk=key)
                    product.cost = value
                    product.save()
            return redirect('/changePriceProduct')
        else:
            all_products = Product.objects.all().order_by('id')
            return render(request, 'changePriceProduct.html', {'all_products':all_products})
    else:
        return redirect('/accounts/login/')
    
def sendBillToTatvar(request):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        if request.method == 'POST':
            response = requests.get("http://192.168.1.8:8000/api/bill/sendData")
            bills = Bill.objects.filter(status='1')
            if response.ok and response.text == "success":
                for bill in bills:
                    bill.status = '6'
                    bill.save()
            bills = Bill.objects.filter(status='1')
            
            return render(request, 'sendBillToTatvar.html', {'bills':bills, 'response':response.text})
        else:
            bills = Bill.objects.filter(status='1').order_by('id')
            return render(request, 'sendBillToTatvar.html', {'bills':bills})
    else:
        return redirect('/accounts/login/')