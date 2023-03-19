from django.contrib import admin
from .models import *

admin.site.site_header = 'Tesoro Center - Хэрэглэгчийн програм'

class OrderAdmin(admin.ModelAdmin):
	#list_display = ('name', 'division')
	exclude = ['created_by', 'updated_by']
	list_display = ('id', 'client', 'discount', 'discounted_amount', 'amount', 'status', 'worker', 'customer')
	def save_model(self, request, obj, form, change):
		if not change:
			obj.created_by = request.user
		elif change:
			obj.updated_by = request.user
		obj.save()

class OrderDetialAdmin(admin.ModelAdmin):
	#list_display = ('name', 'division')
	exclude = ['created_by', 'updated_by']
	list_display = ('order', 'client', 'product', 'quantity', 'subtotal', 'discount')
	def save_model(self, request, obj, form, change):
		if not change:
			obj.created_by = request.user
		elif change:
			obj.updated_by = request.user
		obj.save()

class BillAdmin(admin.ModelAdmin):
	#list_display = ('name', 'division')
	exclude = ['created_by', 'updated_by']
	list_display = ('id', 'order', 'date', 'amount', 'bill_type', 'lottery', 'status', 'error_code')
	def save_model(self, request, obj, form, change):
		if not change:
			obj.created_by = request.user
		elif change:
			obj.updated_by = request.user
		obj.save()

class PaymentAdmin(admin.ModelAdmin):
	exclude = ['created_by', 'updated_by']
	list_display = ('id', 'created_at', 'wallet', 'shift_work', 'amount')
	def save_model(self, request, obj, form, change):
		if not change:
			obj.created_by = request.user
		elif change:
			obj.updated_by = request.user
		obj.save()

class OrderPaymentsAdmin(admin.ModelAdmin):
	exclude = ['created_by', 'updated_by']
	list_display = ('id', 'created_at', 'order', 'payment')
	ordering = ('-order', '-created_at')
	def save_model(self, request, obj, form, change):
		if not change:
			obj.created_by = request.user
		elif change:
			obj.updated_by = request.user
		obj.save()

# Register your models here.
admin.site.register(Order, OrderAdmin)
admin.site.register(Order_detial, OrderDetialAdmin)
admin.site.register(Bill, BillAdmin)
admin.site.register(Payment, PaymentAdmin)
admin.site.register(Order_payments, OrderPaymentsAdmin)