from django.contrib import admin
from .models import *

# Register your models here.
admin.site.site_header = 'Tesoro Center - Хэрэглэгчийн програм'

class ClientAdmin(admin.ModelAdmin):
	list_display = ('id', 'division', 'description')
	exclude = ['created_by']

	def save_model(self, request, obj, form, change):
		if not change:
			obj.created_by = request.user
		obj.save()

admin.site.register(Division)
admin.site.register(Client, ClientAdmin)
admin.site.register(Customer)
admin.site.register(Configuration_value)
admin.site.register(Shift_work)

class Error_listAdmin(admin.ModelAdmin):
	list_display = ('error_value')

admin.site.register(Error_list, Error_listAdmin)