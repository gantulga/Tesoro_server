from django.core.management.base import BaseCommand, CommandError
from payment_app.models import Bill
import requests


class Command(BaseCommand):
    def handle(self, *args, **options):
        print("Ebarimt ilgeegdej bn!")
        response = requests.get("http://192.168.1.8:8000/api/bill/sendData")
        bills = Bill.objects.filter(status='1')
        if response.ok and response.text == "success":
            print("Ebarimtiin too: ", str(len(bills)))
            for bill in bills:
                bill.status = '6'
                bill.save()
        bills = Bill.objects.filter(status='1')