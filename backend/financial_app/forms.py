from django import forms
from django.contrib.auth.models import User, Group
from .models import Budget, Budget_type
from django.utils import timezone

class BudgetCreateForm(forms.ModelForm):
    class Meta:
        model = Budget
        fields = ['name', 'budget_type', 'coordinator', 'description', 'amount']
        
        widgets = {
            'name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Төсвийн нэр'
            }),
            'budget_type': forms.Select(attrs={
                'class': 'form-control'
            }),
            'coordinator': forms.Select(attrs={
                'class': 'form-control'
            }),
            'description': forms.Textarea(attrs={
                'class': 'form-control',
                'rows': 4,
                'placeholder': 'Тайлбар'
            }),
            'amount': forms.NumberInput(attrs={
                'class': 'form-control',
                'step': '1',
                'min': '0'
            }),
        }
        
        labels = {
            'name': 'Төсвийн нэр',
            'budget_type': 'Төсвийн төрөл',
            'coordinator': 'Зохицуулагч',
            'description': 'Тайлбар',
            'amount': 'Нийт дүн (₮)',
        }
    
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super().__init__(*args, **kwargs)
        
        # Төсөв авагч GROUP-ийн хэрэглэгчдийг сонгох
        try:
            budget_recipient_group = Group.objects.get(name='Төсөв авагч')
            coordinator_queryset = budget_recipient_group.user_set.all()
        except Group.DoesNotExist:
            # GROUP байхгүй бол бүх идэвхтэй хэрэглэгчийг харуулна
            coordinator_queryset = User.objects.filter(is_active=True)
        
        # Хэрэглэгчдийг овог нэрээр эрэмбэлнэ
        coordinator_queryset = coordinator_queryset.order_by('last_name', 'first_name')
        self.fields['coordinator'].queryset = coordinator_queryset
    
    def save(self, commit=True):
        instance = super().save(commit=False)
        
        # Хэрэглэгчийн мэдээлэл оруулах
        if self.request and self.request.user.is_authenticated:
            # Шинэ төсөв үүсгэх үед created_by болон updated_by бөглөх
            if not instance.pk:
                instance.created_by = self.request.user
            instance.updated_by = self.request.user
        
        # Төсвийн төлөв, баланс автоматаар
        if not instance.pk:
            instance.status = Budget.STATUS_PLANNED
            if instance.amount:
                instance.balance = instance.amount
        
        if commit:
            instance.save()
        
        return instance

class BudgetUpdateForm(forms.ModelForm):
    class Meta:
        model = Budget
        fields = ['description', 'amount', 'oppressed', 'returned', 'status']
        
        widgets = {
            'description': forms.Textarea(attrs={
                'class': 'form-control',
                'rows': 4,
                'placeholder': 'Тайлбар'
            }),
            'amount': forms.NumberInput(attrs={
                'class': 'form-control',
                'step': '1',
                'min': '0',
            }),
            'oppressed': forms.NumberInput(attrs={
                'class': 'form-control',
                'step': '1',
                'min': '0',
                'readonly': 'readonly',
                'disabled': 'disabled'
            }),
            'returned': forms.NumberInput(attrs={
                'class': 'form-control',
                'step': '1',
                'min': '0'
            }),
            'status': forms.Select(attrs={
                'class': 'form-control'
            })
        }
        
        labels = {
            'description': 'Тайлбар',
            'amount': 'Төсвийн дүн дүн (₮)',
            'oppressed': 'Зарцуулсан дүн (₮)',
            'returned': 'Буцаан өгсөн дүн (₮)',
            'status': 'Төлөв'
        }
    
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super().__init__(*args, **kwargs)
    
    def save(self, commit=True):
        instance = super().save(commit=False)
        
        # Хэрэглэгчийн мэдээлэл оруулах (updated_by шинэчлэх)
        if self.request and self.request.user.is_authenticated:
            instance.updated_by = self.request.user
        
        if commit:
            instance.save()
        
        return instance
    
    def clean(self):
        cleaned_data = super().clean()
        oppressed = cleaned_data.get('oppressed')
        returned = cleaned_data.get('returned')
        instance = getattr(self, 'instance', None)
        
        # if instance and oppressed is not None and returned is not None:
            # Зарцуулсан дүн буцаан өгсөн дүнгээс бага байж болохгүй
            # if oppressed < returned:
            #     raise forms.ValidationError(
            #         'Зарцуулсан дүн буцаан өгсөн дүнгээс бага байж болохгүй!'
            #     )
            
            # Зарцуулсан дүн нийт дүнгээс их байж болохгүй
            # if oppressed > instance.amount:
            #     raise forms.ValidationError(
            #         f'Зарцуулсан дүн нийт дүнгээс ({instance.amount:.2f} ₮) их байж болохгүй!'
            #     )
        
        return cleaned_data
    
    def clean_oppressed(self):
        oppressed = self.cleaned_data.get('oppressed')
        instance = getattr(self, 'instance', None)
        
        # if instance and oppressed is not None:
        #     # Зарцуулсан дүн сөрөг байж болохгүй
        #     if oppressed < 0:
        #         raise forms.ValidationError('Зарцуулсан дүн сөрөг байж болохгүй!')
            
        #     # Зарцуулсан дүн нийт дүнгээс их байж болохгүй
        #     if oppressed > instance.amount:
        #         raise forms.ValidationError(
        #             f'Зарцуулсан дүн нийт дүнгээс ({instance.amount:.2f} ₮) их байж болохгүй!'
        #         )
        
        return oppressed
    
    def clean_returned(self):
        returned = self.cleaned_data.get('returned')
        
        if returned is not None and returned < 0:
            raise forms.ValidationError('Буцаан өгсөн дүн сөрөг байж болохгүй!')
        
        return returned