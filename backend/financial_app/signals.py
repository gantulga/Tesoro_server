from django.db.models.signals import pre_save
from django.dispatch import receiver
from django.contrib.auth import get_user_model
from .models import Budget, Budget_type
from django.utils import timezone

User = get_user_model()

@receiver(pre_save, sender=Budget)
@receiver(pre_save, sender=Budget_type)
def update_created_updated_info(sender, instance, **kwargs):
    """
    created_by, updated_by, created_at, updated_at автоматаар бөглөх
    
    Энэ нь forms.py дээрх save() method-тэй хамт ажиллана.
    Хэрэв форм дээр бөглөгдөөгүй бол энд бөглөгдөнө.
    """
    # Хэрэв forms.py дээр бөглөгдсөн бол үлдсэн
    if hasattr(instance, '_skip_signal'):
        return
    
    # Одоогийн цаг
    now = timezone.now()
    
    if not instance.pk:  # Шинэ бичлэг
        # created_at
        if not instance.created_at:
            instance.created_at = now
        
        # updated_at
        instance.updated_at = now
        
    else:  # Бичлэг засах
        # updated_at
        instance.updated_at = now

# Хэрэв forms.py дээр хэрэглэгч бөглөгдөөгүй бол сигнал ашиглах
@receiver(pre_save, sender=Budget)
def update_budget_user_info(sender, instance, **kwargs):
    """
    Budget модел дээр хэрэглэгчийн мэдээлэл автоматаар бөглөх
    """
    # Forms.py дээр бөглөгдсөн бол үлдсэн
    if hasattr(instance, '_user_updated'):
        return
    
    # Thread local storage-оос хэрэглэгчийн мэдээлэл авах
    # (Дараагийн алхамд middleware үүсгэнэ)
    try:
        from .middleware import get_current_user
        current_user = get_current_user()
        
        if not instance.pk:  # Шинэ бичлэг
            if current_user and not instance.created_by_id:
                instance.created_by = current_user
            if current_user:
                instance.updated_by = current_user
        else:  # Бичлэг засах
            if current_user:
                instance.updated_by = current_user
    except:
        # Middleware байхгүй эсвэл алдаа гарвал алгасана
        pass