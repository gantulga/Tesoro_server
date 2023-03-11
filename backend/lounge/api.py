from structure_app.models import Client, Shift_work, Division
from payment_app.models import Order, Order_detial, Payment
from product_app.models import Product, Product_category, Item_balance, Item_balance_log, Item_transfer, Item_transfer_type
from rest_framework import viewsets, permissions, generics
from .serializers import *
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from django_filters import rest_framework as filters
import datetime
from django_filters.rest_framework import DjangoFilterBackend
from django.db.models import Q
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.response import Response
from financial_app.models import Money_transfer, Money_transfer_type


class ProductCategoriesViewSet(viewsets.ModelViewSet):
    object_id_list = [1, 2, 3, 4]
    queryset = Product_category.objects.all().exclude(id__in=object_id_list)
    # permission_classes = [permissions.AllowAny]
    serializer_class = ProductCategoriesSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)


class LoungeProductsViewSet(generics.ListAPIView):
    queryset = Product.objects.all().exclude(division=3)
    #permission_classes = [permissions.AllowAny]
    serializer_class = ProductsSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)
    # permission_classes = [permissions.AllowAny]
    filter_backends = [SearchFilter, OrderingFilter, DjangoFilterBackend]
    filterset_fields = ['categories', 'categories__parent']
    search_fields = ['name', 'cost']


class LoungeDivisionsViewSet(viewsets.ModelViewSet):
    object_id_list = [1, 2, 7, 8]
    queryset = Division.objects.all().exclude(id__in=object_id_list).order_by('erembe')
    #permission_classes = [permissions.AllowAny]
    serializer_class = LoungeDivisionsSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)


class LoungeClientsViewSet(generics.ListAPIView):
    object_id_list = [14, 15, 16, 17, 18, 19]
    queryset = Client.objects.all().exclude(id__in=object_id_list)
    #permission_classes = [permissions.AllowAny]
    serializer_class = LoungeClientsSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['division']

class LoungeOrdersViewSet(generics.ListAPIView):
    # lounge_division = Division.objects.get(pk=5)
    # last_shift_work = Shift_work.objects.filter(division=lounge_division.id).order_by('-id')[0]
    queryset = Order.objects.all()
    permission_classes = [permissions.AllowAny]
    serializer_class = LoungeOrdersSerializer
    authentication_classes = (TokenAuthentication,)
    # permission_classes = (IsAuthenticated,)
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['client', 'division', 'status', 'shift_work']

class LoungeUnpaidOrdersViewSet(generics.ListAPIView):

    queryset = Order.objects.all().exclude(status="Төлбөр гүйцэт төлсөн.").exclude(worker__id__in=[1, 2, 3, 4])
    permission_classes = [permissions.AllowAny]
    serializer_class = LoungeOrdersSerializer
    authentication_classes = (TokenAuthentication,)
    # permission_classes = (IsAuthenticated,)
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['shift_work']

class LoungeOrderDetialsViewSet(generics.ListAPIView):
    # lounge_division = Division.objects.get(pk=5)
    # last_shift_work = Shift_work.objects.filter(division=lounge_division.id).order_by('-id')[0]
    # queryset = Order_detial.objects.filter(shift_work=last_shift_work.id)
    queryset = Order_detial.objects.all()

    permission_classes = [permissions.AllowAny]
    serializer_class = LoungeOrderDetialsSerializer
    authentication_classes = (TokenAuthentication,)
    # permission_classes = (IsAuthenticated,)
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['order']


class LoungeOrderPaymentsViewSet(generics.ListAPIView):
    lounge_division = Division.objects.get(pk=5)
    last_shift_work = Shift_work.objects.filter(division=lounge_division.id).order_by('-id')[0]
    # queryset = Payment.objects.filter(shift_work=last_shift_work.id)
    queryset = Payment.objects.all()
    # permission_classes = [permissions.AllowAny]
    serializer_class = LoungeOrderPaymentsSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['orders']


class OrderRecieverViewSet(viewsets.ModelViewSet):
    lounge_division = Division.objects.get(pk=5)
    last_shift_work = Shift_work.objects.filter(division=lounge_division.id).order_by('-id')[0]
    queryset = Order.objects.filter(shift_work=last_shift_work.id)
    # permission_classes = [permissions.AllowAny]
    serializer_class = OrderRecieverSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)


class OrderDetailRecieverViewSet(viewsets.ModelViewSet):
    queryset = Order_detial.objects.all()
    # permission_classes = [permissions.AllowAny]
    serializer_class = OrderDetailRecieverSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)


class LoungeShiftWorksViewSet(viewsets.ModelViewSet):
    lounge_division = Division.objects.get(pk=5)
    queryset = Shift_work.objects.filter(division=lounge_division.id).order_by('-id')
    # permission_classes = [permissions.AllowAny]
    serializer_class = LoungeShiftWorksSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)


class LoungeLastShiftWorksViewSet(viewsets.ModelViewSet):
    lounge_division = Division.objects.get(pk=5)
    queryset = Shift_work.objects.filter(
        division=lounge_division.id).order_by('-id')[:1]
    # permission_classes = [permissions.AllowAny]
    serializer_class = LoungeShiftWorksSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)


class LoungeLastShiftWorkUpdateViewSet(viewsets.ModelViewSet):
    queryset = Shift_work.objects.all()
    # permission_classes = [permissions.AllowAny]
    serializer_class = LoungeShiftWorkUpdateSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)


class LoungePaymentsViewSet(viewsets.ModelViewSet):
    lounge_division = Division.objects.get(pk=5)
    queryset = Payment.objects.filter(division=lounge_division.id).order_by('id')
    # permission_classes = [permissions.AllowAny]
    serializer_class = LoungePaymentsSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)


class LoungeOrderUpdateViewSet(viewsets.ModelViewSet):
    queryset = Order.objects.all().order_by('id')
    # permission_classes = [permissions.AllowAny]
    serializer_class = LoungeOrderUpdateSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)


class unSafe_WorkersViewSet(viewsets.ModelViewSet):
    queryset = User.objects.filter(groups__in=[2, 12, 13])
    permission_classes = [permissions.AllowAny]
    serializer_class = unSafe_WorkersSerializer
    authentication_classes = (TokenAuthentication,)
    # permission_classes = (IsAuthenticated,)


class LoungeUnderPaymentsViewSet(viewsets.ModelViewSet):
    lounge_division = Division.objects.get(pk=5)
    last_shift_work = Shift_work.objects.filter(
    division=lounge_division.id).order_by('-id')[0]
    queryset = Order.objects.filter(shift_work=last_shift_work.id, status__in=["Төлбөр төлөгдөөгүй.", "Төлбөр дутуу төлсөн."], worker__isnull=True, customer__isnull=True)
    permission_classes = [permissions.AllowAny]
    serializer_class = unSafe_loungaUnderPaymentsSerializer
    authentication_classes = (TokenAuthentication,)
    # permission_classes = (IsAuthenticated,)


class LoungeMoneyTransfersViewSet(viewsets.ModelViewSet):
    lounge_division = Division.objects.get(pk=5)
    last_shift_work = Shift_work.objects.filter(
        division=lounge_division.id).order_by('-id')[0]
    queryset = Money_transfer.objects.filter(shift_work=last_shift_work.id)
    permission_classes = [permissions.AllowAny]
    serializer_class = LoungeMoneyTransfersSerializer
    authentication_classes = (TokenAuthentication,)
    # permission_classes = (IsAuthenticated,)


class LoungeMoneyTransferPostViewSet(viewsets.ModelViewSet):
    queryset = Money_transfer.objects.all()
    permission_classes = [permissions.AllowAny]
    serializer_class = LoungeMoneyTransferPostSerializer
    authentication_classes = (TokenAuthentication,)
    # permission_classes = (IsAuthenticated,)


class LoungeMoneyTransferTypesViewSet(viewsets.ModelViewSet):
    queryset = Money_transfer_type.objects.all()
    permission_classes = [permissions.AllowAny]
    serializer_class = LoungeMoneyTransferTypesSerializer
    authentication_classes = (TokenAuthentication,)
    # permission_classes = (IsAuthenticated,)

class LoungeProductBalanceLogsViewSet(generics.ListAPIView):
    lounge_division = Division.objects.get(pk=5)
    queryset = Item_balance_log.objects.filter(division=lounge_division)
    permission_classes = [permissions.AllowAny]
    serializer_class = LoungeProductBalanceLogsSerializer
    authentication_classes = (TokenAuthentication,)
    # permission_classes = (IsAuthenticated,)
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['shift_work']

class BarmenProductBalancesViewSet(viewsets.ModelViewSet):
    lounge_take = Client.objects.get(pk=19)
    queryset = Item_balance.objects.filter(client=lounge_take)
    permission_classes = [permissions.AllowAny]
    serializer_class = ItemBalancesSerializer
    authentication_classes = (TokenAuthentication,)
    # permission_classes = (IsAuthenticated,)