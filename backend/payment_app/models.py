from django.db import models
from django.contrib.auth import get_user_model
from django.contrib.auth.models import Group
from django.core.validators import MaxValueValidator, MinValueValidator
import datetime
from django.utils import timezone
#from structure_app.models import Division, Client, Customer
from product_app.models import Product, Item_balance


User = get_user_model()
# Create your models here.


class Createdinfo(models.Model):
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    created_by = models.ForeignKey(
        User, related_name='%(class)s_createdby', null=True, blank=True, on_delete=models.DO_NOTHING)

    class Meta:
        abstract = True


class Modifiedinfo(models.Model):
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)
    created_by = models.ForeignKey(
        User, related_name='%(class)s_createdby', null=True, blank=True, on_delete=models.DO_NOTHING)
    updated_by = models.ForeignKey(
        User, related_name='%(class)s_modifiedby', null=True, blank=True, on_delete=models.DO_NOTHING)

    class Meta:
        abstract = True

# Захиалга


class Order(Modifiedinfo):
    client = models.ForeignKey('structure_app.Client', null=False, blank=False, on_delete=models.DO_NOTHING, related_name="orders")
    customer = models.ForeignKey('structure_app.Customer', null=True, blank=True, on_delete=models.DO_NOTHING, related_name="orders")
    worker = models.ForeignKey(User, null=True, blank=True, on_delete=models.DO_NOTHING, related_name="orders")
    amount = models.DecimalField(max_digits=14, decimal_places=2, null=True, blank=True)
    discount = models.DecimalField(max_digits=14, decimal_places=2, null=True, blank=True)
    discounted_amount = models.DecimalField(max_digits=14, decimal_places=2, null=True, blank=True)
    discounted_percent = models.DecimalField(max_digits=14, decimal_places=2, null=True, blank=True)
    discount_by = models.ForeignKey(User, related_name='%(class)s_discount_by', null=True, blank=True, on_delete=models.DO_NOTHING)
    required_date = models.DateTimeField(null=False, blank=False)
    is_now = models.BooleanField(default=1)
    status = models.CharField(null=False, max_length=255)
    division = models.ForeignKey('structure_app.Division', null=False, blank=False, on_delete=models.DO_NOTHING, related_name="orders")
    products = models.ManyToManyField('product_app.Product', through='Order_detial', related_name="orders")
    payments = models.ManyToManyField('Payment', through='Order_payments', related_name="orders")
    shift_work = models.ForeignKey('structure_app.Shift_work', related_name='orders', null=True, blank=True, on_delete=models.DO_NOTHING)

    def __str__(self):
        return str(self.id)

class Order_detial(Modifiedinfo):
    order = models.ForeignKey('Order', on_delete=models.DO_NOTHING, related_name="order_detials")
    product = models.ForeignKey('product_app.Product', on_delete=models.DO_NOTHING, related_name="order_detials")
    client = models.ForeignKey('structure_app.Client', on_delete=models.DO_NOTHING, related_name="client_detials", null=True, blank=True)
    quantity = models.PositiveIntegerField(null=False, default=1)
    discount = models.PositiveIntegerField(null=False, default=0)
    fr_date = models.DateTimeField(null=True, blank=True)
    to_date = models.DateTimeField(null=True, blank=True)
    discount_rate = models.IntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(100)])
    subtotal = models.DecimalField(max_digits=14, decimal_places=2, null=False, blank=False)

    is_deleted = models.BooleanField(default=0)
    why_deleted = models.TextField(null=True, blank=True)
    deleted_date = models.DateTimeField(null=True, blank=True)
    fr_client = models.ForeignKey('structure_app.Client', on_delete=models.DO_NOTHING, related_name="sent_order_detials", null=True, blank=True)
    shift_work = models.ForeignKey('structure_app.Shift_work', related_name='order_detials', null=True, blank=True, on_delete=models.DO_NOTHING)
    finished = models.BooleanField(default=0)
    finished_at = models.DateTimeField(auto_now=False, null=True, blank=True)

    def __init__(self, *args, **kwargs):
        super(Order_detial, self).__init__(*args, **kwargs)
        self.__prev_quantity = self.quantity

    @property
    def elapsed_time(self):
        print("created_at", self.created_at)
        print("now", timezone.now())
        result = timezone.now() - self.created_at
        return int(result.total_seconds() / 60)

    def save(self, *args, **kwargs):
        if self.quantity * self.product.cost != self.subtotal or self.subtotal != self.discount:
            self.subtotal = self.quantity * self.product.cost
            self.discount = self.quantity * self.product.cost
            super().save(*args, **kwargs)
            total = 0
            for det in self.order.order_detials.all():
                total = total + det.subtotal
            self.order.amount = total
            new_discounted_amount = total - self.order.discount
            self.order.discounted_amount = new_discounted_amount
            self.order.discount_rate = self.order.discount / total * 100
            
            payment_total = 0
            for payment in self.order.payments.all():
                payment_total = payment_total + payment.amount

            if payment_total >= new_discounted_amount:
                self.order.status = "Төлбөр гүйцэт төлсөн."
            elif payment_total < new_discounted_amount and payment_total == 0:
                self.order.status = "Төлбөр төлөгдөөгүй."
            elif payment_total < new_discounted_amount and payment_total > 0:
                self.order.status = "Төлбөр дутуу төлсөн."

            self.order.save()

        if self.__prev_quantity != self.quantity:
            item_transfer = self.item_transfers.first()
            item_transfer.quantity = self.quantity
            item_transfer.save()
            item_balance = Item_balance.objects.filter(client=item_transfer.fr_client.id, product=item_transfer.product.id).first()
            if self.__prev_quantity > self.quantity:
                item_balance.quantity = item_balance.quantity + (self.__prev_quantity - self.quantity)
            if self.__prev_quantity < self.quantity:
                item_balance.quantity = item_balance.quantity - (self.quantity - self.__prev_quantity)
            item_balance.save()
        
        super().save(*args, **kwargs)

    def __str__(self):
        return str(self.id)


class Order_payments(Modifiedinfo):
    order = models.ForeignKey(
        'Order', on_delete=models.DO_NOTHING)
    payment = models.ForeignKey(
        'Payment', on_delete=models.DO_NOTHING)

BILL_TYPE_CHOICES = [
    ('1', 'Хувь хүн'),
    ('3', 'Байгууллага'),
    ('5', 'Нэхэмжлэл'),
]

STATUS_CHOICES = [
    ('0', 'Бэлтгэгдэж байгаа'),
    ('1', 'Амжилттай илгээгдсэн'),
    ('2', 'Алдаа гарсан'),
    ('3', 'Буцаахаар хүсэлт гаргасан'),
    ('4', 'Амжилттай буцаагдсан'),
    ('5', 'Дахин илгээгдсэн'),
    ('6', 'Татварлуу илгээгдсэн'),
]


# Захиалгын төлбөр
class Bill(Modifiedinfo):
    amount = models.CharField(null=True, blank=True, max_length=255)
    vat = models.CharField(null=True, blank=True, max_length=255)
    cash_amount = models.CharField(null=True, blank=True, max_length=255)
    non_cash_amount = models.CharField(null=True, blank=True, max_length=255)
    city_tax = models.CharField(null=True, blank=True, max_length=255)

    district_code = models.CharField(null=True, blank=True, max_length=255)
    pos_no = models.CharField(null=True, blank=True, max_length=255)
    customer_no = models.CharField(null=True, blank=True, max_length=255)
    bill_type = models.CharField(null=True, blank=True, choices=BILL_TYPE_CHOICES, max_length=1)
    bill_id_suffix = models.CharField(null=True, blank=True, max_length=255)
    return_bill_id = models.CharField(null=True, blank=True, max_length=255)
    tax_type = models.CharField(null=True, blank=True, max_length=255)

    register_no = models.CharField(null=True, blank=True, max_length=255)
    bill_id = models.CharField(null=True, blank=True, max_length=255)
    date = models.CharField(null=True, blank=True, max_length=255)
    mac_address = models.CharField(null=True, blank=True, max_length=255)
    internal_code = models.CharField(null=True, blank=True, max_length=255)
    qr_data = models.CharField(null=True, blank=True, max_length=255)
    lottery = models.CharField(null=True, blank=True, max_length=255)
    lottery_warning_msg = models.CharField(null=True, blank=True, max_length=255)

    error_code = models.CharField(null=True, blank=True, max_length=255)
    message = models.CharField(null=True, blank=True, max_length=255) 
    status = models.CharField(null=True, blank=True, choices=STATUS_CHOICES, max_length=1)

    order = models.ForeignKey('Order', null=False, blank=False, on_delete=models.DO_NOTHING, related_name="bills")
    client = models.ForeignKey('structure_app.Client', null=False, blank=False, on_delete=models.DO_NOTHING, related_name="bills")
    division = models.ForeignKey('structure_app.Division', null=False, blank=False, on_delete=models.DO_NOTHING, related_name="bills")
    customer = models.ForeignKey('structure_app.Customer', null=True, blank=True, on_delete=models.DO_NOTHING, related_name="bills")

    def __str__(self):
        return str(self.id)
# Төлбөрийн төлөлт


class Payment(Modifiedinfo):
    confirmed_by = models.ForeignKey(User, null=False, blank=False, on_delete=models.DO_NOTHING, related_name="payments")
    amount = models.DecimalField(max_digits=14, decimal_places=2, null=True, blank=True)
    wallet = models.ForeignKey('financial_app.Wallet', null=False, blank=False,on_delete=models.DO_NOTHING, default=999, related_name="payments")
    shift_work = models.ForeignKey('structure_app.Shift_work', related_name='payments', null=True, blank=True, on_delete=models.DO_NOTHING)
    division = models.ForeignKey('structure_app.Division', null=True, blank=True, on_delete=models.DO_NOTHING, related_name="payments")

    def __str__(self):
        return str(self.id)
        
# POS машины нэгтгэл


class Pos_account_consolidation(Modifiedinfo):
    shift_work = models.ForeignKey('structure_app.Shift_work', related_name='pos_account_consolidation', null=True, blank=True, on_delete=models.DO_NOTHING)
    division = models.ForeignKey('structure_app.Division', null=False, blank=False, on_delete=models.DO_NOTHING, related_name="Pos_account_consolidations")
    fr_date = models.DateTimeField(null=False, blank=False)
    to_date = models.DateTimeField(null=False, blank=False)
    account = models.ForeignKey('financial_app.Wallet', null=False, blank=False, on_delete=models.DO_NOTHING, related_name="Pos_account_consolidations")
    amount = models.DecimalField(max_digits=14, decimal_places=2, null=True, blank=True)
    person_of_charge = models.ForeignKey(User, null=False, blank=False, on_delete=models.DO_NOTHING, related_name="person_of_charge_pos")
    confirmed_by = models.ForeignKey(User, null=False, blank=False, on_delete=models.DO_NOTHING, related_name="confirmed_by_pos")

    def __str__(self):
        return str(self.id)
