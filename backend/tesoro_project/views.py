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
from PIL import Image, ImageDraw, ImageFont, ImageOps
import struct
import qrcode
import textwrap

def home(request):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():

        bills = Bill.objects.all()
        for bill in bills:
            tatvariin_daraah_orlogo = float(bill.amount) / float(1.1)
            total_vat = float(bill.amount) - tatvariin_daraah_orlogo
            total_vat = "%.2f" % total_vat
            bill_list = []
            if float(bill.vat) != float(total_vat):
                bill_list.append(bill.id)

            print(bill_list)
            print("count bills: ", len(bill_list))

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
        order_detail = Order_detial.objects.get(pk=detail, is_deleted=False)
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

    not_finished_orders = Order_detial.objects.filter(product__categories__in=food_cat_ids, finished=False, created_at__range=(today_min, today_max), is_deleted=False).order_by("created_at")
    finished_orders = Order_detial.objects.filter(product__categories__in=food_cat_ids, finished=True, created_at__range=(today_min, today_max), is_deleted=False).order_by("-id")
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
def dailyReportSoldItems(request):
    group = Group.objects.get(pk=2)
    if group in request.user.groups.all():
        if request.method == 'POST':
            return redirect('/soldItems')
        else:
            shift_worker = request.GET.get('shiftWorker', None)
            if shift_worker != None:
                shift_work = get_object_or_404(Shift_work, pk=shift_worker)
            else:
                shift_work = Shift_work.objects.filter(division=5).order_by('-id').first()

            all_parent_cats = Product_category.objects.filter(parent__isnull=True)
            sold_items = []
            all_order_details = Order_detial.objects.filter(shift_work=shift_work.id, is_deleted=False).order_by('product')
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
            for order in all_orders:
                total_order_amount = total_order_amount + order.amount

            return render(request, 'dailyReportSoldItems.html', {
                'all_shift_workers':all_shift_workers, 
                'shift_work':shift_work,
                'sold_items': sold_items,
                'total_order_amount':total_order_amount, 
                'all_parent_cats':all_parent_cats})
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
            else:
                shift_work = Shift_work.objects.filter(division=5).order_by('-id').first()

            all_wallet = Wallet.objects.filter(is_enabled=True)
            total_payment_balanace = 0
            wallet_balances = []
            umnu_tavisan_uriin_guilgee = []
            umnu_tavisan_uriin_guilgee_dun = 0
            for wallet in all_wallet:
                wallet_balance = 0
                payments = Payment.objects.filter(wallet=wallet.id, shift_work=shift_work.id, is_deleted=False)
                for payment in payments:
                    wallet_balance = wallet_balance + payment.amount

                    umnuh_eeljiin_order = False
                    for ord in payment.orders.all():
                        if ord.shift_work != shift_work:
                            umnuh_eeljiin_order = True
                    if umnuh_eeljiin_order:
                        umnu_tavisan_uriin_guilgee.append(payment)
                        umnu_tavisan_uriin_guilgee_dun = umnu_tavisan_uriin_guilgee_dun + payment.amount
                    else:
                        #yag tuhain udriin order bolhoor paymentiig totalruu append hj bn
                        total_payment_balanace = total_payment_balanace + payment.amount


                wallet_balances.append({'wallet':wallet, 'balance':int(wallet_balance)})

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


            customer_under = []
            all_customer_orders = Order.objects.filter(shift_work=shift_work.id, customer__isnull=False).order_by('customer')
            for order in all_customer_orders:
                index = next((i for i, item in enumerate(customer_under) if item['id'] == int(order.customer.id)), -1)
                payment_t = 0
                for payment in order.payments.all():
                    payment_t = payment_t + payment.amount

                under_payment = order.discounted_amount - payment_t
                if order.customer.firstname:
                    cus = order.customer.firstname + "(" + str(order.customer.id) + ")"
                else:
                    cus = str(order.customer.mobile) + "(" + str(order.customer.id) + ")"
                if index < 0:
                    customer_under.append({'id':order.customer.id, 'customer': cus, 'total_amount':order.amount, 'discount':order.discount, 'under_amount':under_payment, 'paid':payment_t})
                else:
                    customer_under[index]['total_amount'] = int(customer_under[index]['total_amount']) + int(order.amount)
                    customer_under[index]['discount'] = int(customer_under[index]['discount']) + int(order.discount)
                    customer_under[index]['under_amount'] = int(customer_under[index]['under_amount']) + int(under_payment)
                    customer_under[index]['paid'] = int(customer_under[index]['paid']) + int(payment_t)
            
            all_payments = Payment.objects.filter(shift_work=shift_work, is_deleted=False)
            all_deleted_payments = Payment.objects.filter(shift_work=shift_work, is_deleted=True)

            print(all_payments)
            return render(request, 'dailyReport.html', {
                'all_wallets':all_wallet,
                'all_payments':all_payments,
                'all_deleted_payments':all_deleted_payments,
                'all_shift_workers':all_shift_workers, 
                'wallet_balances':wallet_balances, 
                'shift_work':shift_work, 
                'total_payment_balanace':int(total_payment_balanace),
                'total_order_amount':total_order_amount, 
                'total_discount': total_discount,
                'total_discounted_amount': total_discounted_amount, 
                'total_under_amount_worker':total_under_amount_worker,
                'total_under_amount_guest': total_under_amount_guest,
                'worker_under':worker_under,
                'customer_under':customer_under,
                'all_parent_cats':all_parent_cats,
                'umnu_tavisan_uriin_guilgee':umnu_tavisan_uriin_guilgee,
                'umnu_tavisan_uriin_guilgee_dun':umnu_tavisan_uriin_guilgee_dun,
                'payment_total_plus_umnuh_payment_all_total': total_payment_balanace + umnu_tavisan_uriin_guilgee_dun })
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
        if shiftWorker != None:
            current_shift_work = get_object_or_404(Shift_work, pk=shiftWorker)
        else:
            current_shift_work = Shift_work.objects.filter(division=5).order_by('-id').first()

        prev_shift_worker = Shift_work.objects.filter(division=5, pk__lt=current_shift_work.id).order_by('-id').first()

        if prev_shift_worker.finished:
            prev_item_balances = Item_balance_log.objects.filter(client=19, shift_work=prev_shift_worker.id)
        else:
            prev_item_balances = Item_balance.objects.filter(client=19)

        if current_shift_work.finished:
            curr_item_balances = Item_balance_log.objects.filter(client=19, shift_work=current_shift_work.id)
        else:
            curr_item_balances = Item_balance.objects.filter(client=19)

        

        return render(request, 'loungeBalance.html', {})

        
    else:
        return redirect('/accounts/login/')

@csrf_exempt
def printer(request):
    if request.method == "POST":
        body = request.body
        res = json.loads(body.decode('utf-8'))
        print(res)
        date = "Хэзээ: " + str(datetime.datetime.now())
        division = Division.objects.get(pk=res['order']['division'])
        client = Client.objects.get(pk=res['order']['client'])
        if division.id == 3:
            division = "Зочид буудал"
        elif division.id == 4:
            division = "Ресторан"
        elif division.id == 5:
            division = "Лоунж"
        elif division.id == 6:
            division = "Караоке"
        elif division.id == 1:
            division = "Оффис"
        elif division.id == 7:
            division = "Спа саун"
        else: 
            division = "Мэдэгдэхгүй"
        
        where = "Хаашаа: " + str(division) + " - " + client.description + "\n"
        configure = Configuration_value.objects.get(pk=1)
        bill_number = configure.kitchen_bill_number
        
        mysocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        mysocket.connect(("192.168.1.10", 9100))

        width = 600
        height = (len(res['detials']) + 6) * 36

        image = Image.new("RGB", (width, height), "white")
        draw = ImageDraw.Draw(image)
        # font = ImageFont.load_default()

        unicode_font_22 = ImageFont.truetype("/home/tesoro/Tesoro_server/backend/media/roboto.ttf", 28)
        y = 0
        
        nnn = "Дугаар: " + str(bill_number)
        y = y + 36
        draw.text((36, y), nnn, fill="black", font=unicode_font_22)
        y = y + 36
        draw.text((36, y), date, fill="black", font=unicode_font_22)
        y = y + 36
        draw.text((36, y), where, fill="black", font=unicode_font_22)
        y = y + 36
        draw.text((36, y), "----------------------------------------", fill="black", font=unicode_font_22)
        
        bill_included_food = False
        number = 1
        for detail in res['detials']:
            is_food = False
            food_cat = Product_category.objects.get(pk=5)
            product = Product.objects.get(pk=detail['id'])
            for pcat in product.categories.all():
                if pcat in food_cat.child_categories.all() or pcat == food_cat:
                    is_food = True
            if is_food:
                bill_included_food = True
                product = Product.objects.get(pk=detail['id'])
                y = y + 36
                food = str(number) + ". " + str(product.name + " - " + str(detail['quantity'])) + "\n"
                draw.text((36, y), food, fill="black", font=unicode_font_22)
                number = number + 1
        
        if bill_included_food:
            configure.kitchen_bill_number = configure.kitchen_bill_number + 1
            configure.save()

            image.save("/home/tesoro/Tesoro_server/backend/media/kitchen-bill/test.jpg")
            im = Image.open("/home/tesoro/Tesoro_server/backend/media/kitchen-bill/test.jpg")
            # if image is not 1-bit, convert it
            if im.mode != '1':
                im = im.convert('1')
            # if image width is not a multiple of 8 pixels, fix that
            if im.size[0] % 8:
                im2 = Image.new('1', (im.size[0] + 8 - im.size[0] % 8, im.size[1]), 'white')
                im2.paste(im, (0, 0))
                im = im2

            # Invert image, via greyscale for compatibility
            #  (no, I don't know why I need to do this)
            im = ImageOps.invert(im.convert('L'))
            # ... and now convert back to single bit
            im = im.convert('1')

            job = [(b''.join((bytearray(b'\x1d\x76\x30\x00'),
                        struct.pack('2B', int(im.size[0] / 8 % 256),
                                    int(im.size[0] / 8 / 256)),
                        struct.pack('2B', int(im.size[1] % 256),
                                    int(im.size[1] / 256)),
                        im.tobytes()))),
                    b'\x1b\r\n',
                    b'\x1b\r\n',
                    b'\x1b\r\n',
                    b'\x1b\r\n',
                    b'\x1b\x69'
                ]
            
            for b in job:
                mysocket.sendall(b)
            mysocket.close()
        print("printed")
        return HttpResponse("done")

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
    

def productToProductIngredient(request):
    products = Product.objects.all()
    return render(request, 'productToProductIngredient.html', {'products':products})
    

def commodityToProductIngredient(request):
    products = Product.objects.all()
    not_ingredient_products = Product.objects.filter(ingredients__isnull=True).exclude(division=3)
    return render(request, 'commodityToProductIngredient.html', {'products':products, 'not_ingredient_products':not_ingredient_products})