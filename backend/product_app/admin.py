from django.contrib import admin
from .models import *

admin.site.site_header = 'Tesoro Center - Хэрэглэгчийн програм'


class Basis_assetAdmin(admin.ModelAdmin):
    list_display = ('name', 'division')
    exclude = ['created_by', 'updated_by']

    def save_model(self, request, obj, form, change):
        if not change:
            obj.created_by = request.user
        elif change:
            obj.updated_by = request.user
        obj.save()


class Basis_asset_countAdmin(admin.ModelAdmin):
    list_display = ('basic_asset', 'quantity_balance', 'counted_day')


class ProductCategoryAdmin(admin.ModelAdmin):
    list_display = ('parent', 'name', 'description')


class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'enabled', 'get_categories', 'is_ingrediented', 'get_ingredients', 'is_gramm', 'gramm', 'same_commodity', 'cost')
    list_per_page = 500
    exclude = ['created_by']
    ordering = ('is_ingrediented', 'is_gramm', 'name')

    # Enabled
    def get_enabled(self, obj):
        return obj.enabled
    get_enabled.boolean = False      # энэ нь icon биш текст хэлбэрээр харуулна
    get_enabled.short_description = 'Enabled'

    # Is ingrediented
    def get_is_ingrediented(self, obj):
        return obj.is_ingrediented
    get_is_ingrediented.boolean = False
    get_is_ingrediented.short_description = 'Is Ingrediented'

    # Is gramm
    def get_is_gramm(self, obj):
        return obj.is_gramm
    get_is_gramm.boolean = False
    get_is_gramm.short_description = 'Is Gramm'
    
    def get_ingredients(self, obj):
        ingredients = []
        for ingredient in obj.ingredients.all():
            ingredients.append(ingredient.commodity.name)
        return ingredients
    
    def get_categories(self, obj):
        categories = []
        for cat in obj.categories.all():
            categories.append(cat.name)
        return categories
    get_categories.admin_order_field = 'categories'

class CommodityAdmin(admin.ModelAdmin):
    list_display = ('name', 'description', 'size_type', 'unit_size', 'get_categories', 'image')

    list_per_page = 500
    exclude = ['created_by']
    ordering = ('categories', 'name')
    
    def get_categories(self, obj):
        categories = []
        for cat in obj.categories.all():
            categories.append(cat.name)
        return categories
    get_categories.admin_order_field = 'categories'

class Item_balanceAdmin(admin.ModelAdmin):
    list_display = ('division', 'client', 'user', 'commodity', 'product', 'quantity', 'size')

class CommodityCategoryAdmin(admin.ModelAdmin):
    list_display = ('division', 'parent', 'name', 'description')

# Register your models here.
admin.site.register(Product_category, ProductCategoryAdmin)
admin.site.register(Commodity_category, CommodityCategoryAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Commodity, CommodityAdmin)
admin.site.register(Size_type)
admin.site.register(Ingredient)
admin.site.register(Ingredient_product)
admin.site.register(Item_transfer_type)
admin.site.register(Store)
admin.site.register(Item_transfer)
admin.site.register(Item_balance, Item_balanceAdmin)
admin.site.register(Item_balance_log, Item_balanceAdmin)
admin.site.register(Basic_asset, Basis_assetAdmin)
admin.site.register(Basic_asset_count, Basis_asset_countAdmin)
admin.site.register(broken_item)
