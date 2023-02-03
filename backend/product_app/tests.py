from django.test import TestCase
from product_app.models import Product_category, Product
import MySQLdb
# Create your tests here.

all_products = Product.objects.all().exclude(division=3)

for product in all_products:
    categories = product.categories.all()
    for category in categories:
        if category.parent != None:
            if category.parent in categories:
                print("Included")
            else:
                product.categories.add(category.parent)
                print("Added")
