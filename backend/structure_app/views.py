from django.shortcuts import render
from django.http import HttpResponse, HttpResponseNotFound
from product_app.models import Product, Product_category, Item_balance
from django.db.models import Q
from structure_app.models import Client, Division
from django.contrib.auth import get_user_model
from django.http import JsonResponse
from .models import Shift_work
from django.shortcuts import render, redirect, get_list_or_404, get_object_or_404
import json

User = get_user_model()


def index(request):
    # all_category = Product_category.objects.filter(
    #     ~Q(id__in=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]))

    # for cat in all_category:
    #     for product in cat.products.all():
    #         already_created = Item_balance.objects.filter(product=product)
    #         if not already_created:
    #             client = Client.objects.get(pk=19)
    #             created_by = User.objects.get(pk=1)
    #             division = Division.objects.get(pk=5)
    #             item_balance = Item_balance.objects.create(
    #                 quantity=100, client=client, created_by=created_by, division=division, product=product)

    #             if item_balance:
    #                 print(product.name + " - created!")

    # all_category = Product_category.objects.all()

    # for cat in all_category:
    #     if cat.id in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 27, 28, 29]:
    #         # Хийгддэг бүтээгдэхүүн
    #         cat.is_created = True
    #         cat.save()
    #     else:
    #         cat.is_created = False
    #         cat.save()

    # all_category = Product_category.objects.all()

    # for cat in all_category:
    #     if cat.parent == None:
    #         print(cat.name)
    #         for child in cat.child_categories.all():
    #             print(child.name)
    #             for item in child.products.all():
    #                 print(item.name)
    #                 item.categories.add(cat)

    return HttpResponse('<h1>Page was found</h1>')

def index(request):
    
    return HttpResponse('<h1>Page was found</h1>')

def shiftWorkUnpaidOrderChecker(request, shift_work_id):
    shift_work = get_object_or_404(Shift_work, pk=shift_work_id)
    can_i_end = True
    if len(shift_work.orders.filter(worker__isnull=True, customer__isnull=True).exclude(status="Төлбөр гүйцэт төлсөн.")) > 0:
        can_i_end = False
    return JsonResponse({"shift_work":shift_work_id, "can_i_end":can_i_end})