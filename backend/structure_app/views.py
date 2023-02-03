from django.shortcuts import render
from django.http import HttpResponse, HttpResponseNotFound
from product_app.models import Product, Product_category, Item_balance
from django.db.models import Q
from structure_app.models import Client, Division
from django.contrib.auth import get_user_model
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