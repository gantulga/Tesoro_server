from django.http import JsonResponse
from product_app.models import Product, Item_balance
from django.shortcuts import render, redirect, get_list_or_404, get_object_or_404