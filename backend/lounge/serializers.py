from rest_framework import serializers
from hotel.models import Hotel_client_log, Hotel_client_item
from structure_app.models import Client, Division, Shift_work, Customer
from product_app.models import Product, Commodity, Product_category, Item_transfer, Item_transfer_type, Item_balance, Item_balance_log
from payment_app.models import Order, Order_detial, Payment
from structure_app.serializers import CustomersSerializer, ClientsSerializer
from financial_app.models import Money_transfer, Currency, Money_transfer_type, Wallet
import json
from django.contrib.auth import get_user_model
User = get_user_model()


class LoungeShowingUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'last_name', 'first_name', 'email']


class ProductCategoriesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product_category
        fields = '__all__'

class ItemBalancesForProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Item_balance
        fields = '__all__'

class ProductsSerializer(serializers.ModelSerializer):
    # balances = ItemBalancesForProductSerializer(many=True)
    class Meta:
        model = Product
        fields = '__all__'
        # extra_fields = ['balances']

class CommoditiesSerializer(serializers.ModelSerializer):
    # balances = ItemBalancesForProductSerializer(many=True)
    class Meta:
        model = Commodity
        fields = '__all__'
        # extra_fields = ['balances']


class LoungeDivisionsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Division
        fields = '__all__'


class LoungeClientsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Client
        fields = '__all__'

class LoungePaymentsSerializer(serializers.ModelSerializer):

    class Meta:
        model = Payment
        fields = '__all__'

class LoungeOrderDetialsSerializer(serializers.ModelSerializer):
    product = ProductsSerializer(many=False)

    class Meta:
        model = Order_detial
        fields = '__all__'

class LoungeShowingCustomerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = '__all__'

class LoungeOrdersSerializer(serializers.ModelSerializer):
    client = LoungeClientsSerializer(many=False)
    payments = LoungePaymentsSerializer(many=True)
    worker = LoungeShowingUserSerializer(many=False)
    customer = LoungeShowingCustomerSerializer(many=False)
    # order_detials = LoungeOrderDetialsSerializer(many=True)

    class Meta:
        model = Order
        # fields = ['id', 'created_at', 'updated_at', 'amount', 'required_date', 'is_now', 'status',
        #           'client', 'created_by', 'customer', 'division', 'shift_work', 'updated_by', 'order_detials']
        fields = '__all__'

class WalletsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Wallet
        fields = '__all__'


class LoungeOrderPaymentsSerializer(serializers.ModelSerializer):
    orders = LoungeOrdersSerializer(many=True)
    wallet = WalletsSerializer(many=False)

    class Meta:
        model = Payment
        fields = '__all__'


class OrderRecieverSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'


class OrderDetailRecieverSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order_detial
        fields = '__all__'

    def create(self, validated_data):
        division = Division.objects.get(pk=5)
        last_notFinished_shiftWork = Shift_work.objects.filter(
            finished=False, division=division).order_by('-id')[0]
        if last_notFinished_shiftWork:
            detial = Order_detial.objects.create(
                **validated_data)
            if detial:
                itemTransferType = Item_transfer_type.objects.get(pk=3)
                itemTransferType4 = Item_transfer_type.objects.get(pk=4)
                # 19 5001 Лоунж бармен хэсэг
                client = Client.objects.get(pk=19)
                product = Product.objects.get(pk=validated_data['product'].id)
                if product.is_ingrediented:
                    for ingredents in product.ingredients.all():
                        hemjee = validated_data['quantity'] * ingredents.size
                        if ingredents.size_type.id == 1:
                            itemTransfer = Item_transfer.objects.create(commodity=ingredents.commodity, fr_client=client, fr_division=client.division, quantity=hemjee, created_by=validated_data['created_by'], order_detial=detial, item_transfer_type=itemTransferType4, to_product=product, product_quantity=validated_data['quantity'])
                        if ingredents.size_type.id == 2:
                            itemTransfer = Item_transfer.objects.create(commodity=ingredents.commodity, fr_client=client, fr_division=client.division, size=hemjee, created_by=validated_data['created_by'], order_detial=detial, item_transfer_type=itemTransferType4, to_product=product, product_quantity=validated_data['quantity'])
                        
                        
                        if itemTransfer:
                            fr_client_item_balance = Item_balance.objects.filter(
                                commodity=ingredents.commodity, client=client).order_by('-id')[:1]
                            if fr_client_item_balance:
                                balance = Item_balance.objects.get(
                                    pk=fr_client_item_balance[0].id)

                                if ingredents.size_type.id == 1:
                                    quantity = balance.quantity - hemjee
                                    balance.quantity = quantity
                                if ingredents.size_type.id == 2:
                                    size = balance.size - hemjee
                                    balance.size = size

                                balance.updated_by = validated_data['created_by']
                                balance.save()
                    for ingredents in product.ingredients_producted.all():
                        hemjee = validated_data['quantity'] * ingredents.size
                        itemTransfer = Item_transfer.objects.create(product=ingredents.commodity, fr_client=client, fr_division=client.division, quantity=hemjee, created_by=validated_data['created_by'], order_detial=detial, item_transfer_type=itemTransferType4, to_product=product, product_quantity=validated_data['quantity'])
                        
                        
                        if itemTransfer:
                            fr_client_item_balance = Item_balance.objects.filter(
                                product=ingredents.commodity, client=client).order_by('-id')[:1]
                            if len(fr_client_item_balance) > 0:
                                balance = fr_client_item_balance.first()
                                quantity = balance.quantity - hemjee
                                balance.quantity = quantity
                                balance.updated_by = validated_data['created_by']
                                balance.save()
                else:
                    itemTransfer = Item_transfer.objects.create(product=validated_data['product'], fr_client=client, fr_division=client.division, quantity=validated_data['quantity'], created_by=validated_data['created_by'], order_detial=detial, item_transfer_type=itemTransferType)
                    if itemTransfer:
                        fr_client_item_balance = Item_balance.objects.filter(
                            product=validated_data['product'], client=client).order_by('-id')[:1]

                        if fr_client_item_balance:
                            print("quantity bga")
                            balance = Item_balance.objects.get(
                                pk=fr_client_item_balance[0].id)
                            quantity = balance.quantity - \
                                validated_data['quantity']
                            print(quantity)
                            balance.updated_by = validated_data['created_by']
                            balance.quantity = quantity
                            balance.save()
                        else:
                            print("quantity bhgui")
            return detial


class LoungeShiftWorksSerializer(serializers.ModelSerializer):
    worker = LoungeShowingUserSerializer(many=False)
    controller = LoungeShowingUserSerializer(many=False)

    class Meta:
        model = Shift_work
        fields = '__all__'


class LoungeShiftWorkUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Shift_work
        fields = '__all__'

    def update(self, instance, validated_data):
        for attr, value in validated_data.items():
            setattr(instance, attr, value)
        instance.save()

        # Ээлж хаах үед лоунжны барааны бүх үлдэгдлийг Log болгон хадгалах
        client = Client.objects.get(pk=19)
        division = Division.objects.get(pk=5)
        all_balances = Item_balance.objects.filter(
            client=client, division=division)

        if instance.finished == True:
            for balance in all_balances:
                if balance.product != None:
                    already_created = Item_balance_log.objects.filter(
                        product=balance.product, client=client, division=division, shift_work=instance)
                    if not already_created:
                        if balance.quantity != None:
                            item_balance_log = Item_balance_log.objects.create(
                                product=balance.product, client=client, division=division, quantity=balance.quantity, created_by=instance.worker, shift_work=instance)
                        elif balance.size != None:
                            item_balance_log = Item_balance_log.objects.create(
                                product=balance.product, client=client, division=division, size=balance.size, created_by=instance.worker, shift_work=instance)
                        else:
                            pass
                elif balance.commodity != None:
                    already_created = Item_balance_log.objects.filter(
                        commodity=balance.commodity, client=client, division=division, shift_work=instance)
                    if not already_created:
                        if balance.quantity != None:
                            item_balance_log = Item_balance_log.objects.create(
                                commodity=balance.commodity, client=client, division=division, quantity=balance.quantity, created_by=instance.worker, shift_work=instance)
                        elif balance.size != None:
                            item_balance_log = Item_balance_log.objects.create(
                                commodity=balance.commodity, client=client, division=division, size=balance.size, created_by=instance.worker, shift_work=instance)
                        else:
                            pass

        return instance


class LoungePaymentsSerializer(serializers.ModelSerializer):
    # order = OrderRecieverSerializer(many=False)

    class Meta:
        model = Payment
        # fields = ['id', 'created_at', 'updated_at', 'amount', 'confirmed_by',
        #           'created_by', 'shift_work', 'updated_by', 'wallet', 'division', 'order']
        fields = '__all__'

    def create(self, validated_data):
        payment = Payment.objects.create(
            **validated_data)
        orderObj = Order.objects.get(pk=self.context['request'].data['order'])
        payment.orders.add(orderObj)

        paymentsTotal = 0

        for pment in orderObj.payments.all():
            paymentsTotal = paymentsTotal + pment.amount

        if paymentsTotal == orderObj.amount or paymentsTotal > orderObj.amount:
            orderObj.status = "Төлбөр гүйцэт төлсөн."
            orderObj.save()
        else:
            orderObj.status = "Төлбөр дутуу төлсөн."
            orderObj.save()

        if payment.amount != 0:
            hotelpos = Wallet.objects.get(pk=4)
            loungepos = Wallet.objects.get(pk=5)
            if payment.wallet != hotelpos and payment.wallet != loungepos:
                currency = Currency.objects.get(pk=1)
                money_transfer_type = Money_transfer_type.objects.get(
                    pk=1)
                division = Division.objects.get(pk=5)
                money_transfer = Money_transfer.objects.create(
                    created_by=payment.created_by, amount=payment.amount, currency=currency, division=division, customer=orderObj.customer, money_transfer_type=money_transfer_type, payment=payment, to_wallet=payment.wallet, description="Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.", shift_work=payment.shift_work)
        return payment


class LoungeShowingDivisionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Division
        fields = '__all__'


class LoungeShowingClientSerializer(serializers.ModelSerializer):
    division = LoungeShowingDivisionSerializer(many=False)

    class Meta:
        model = Client
        fields = '__all__'


class LoungeOrderUpdateSerializer(serializers.ModelSerializer):
    payments = LoungePaymentsSerializer(many=True)
    worker = LoungeShowingUserSerializer(many=False)
    created_by = LoungeShowingUserSerializer(many=False)
    customer = LoungeShowingCustomerSerializer(many=False)
    client = LoungeShowingClientSerializer(many=False)

    class Meta:
        model = Order
        fields = '__all__'

    def update(self, instance, validated_data):
        print("1")
        order = Order.objects.get(
            pk=int(self.context['request'].data['order_id']))

        if self.context['request'].data['worker_id'] != None and order.worker == None:
            worker = User.objects.get(
                pk=int(self.context['request'].data['worker_id']))
            order.worker = worker
            order.save()

        if self.context['request'].data['customer_mobile'] != None and order.customer == None:
            mobile = self.context['request'].data['customer_mobile']
            print("2", type(mobile))
            customer = Customer.objects.filter(mobile=mobile)
            print("customer: ", len(customer), customer)
            if len(customer) == 0:
                newCustomer = Customer.objects.create(mobile=self.context['request'].data['customer_mobile'])
                print("3")
                if newCustomer:
                    order.customer = newCustomer
                    order.save()
                    print("4")
                else:
                    print("Customer uusgej chadsangui.")

            if len(customer) > 0:
                order.customer = customer[0]
                order.save()
                print("5")
        return order


class unSafe_WorkersSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username']


class unSafe_divisionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Division
        fields = ['id', 'name']


class unSafe_clientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Client
        fields = ['id', 'number']


class unSafe_productSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ['name', 'cost']


class unSafe_detailsSerializer(serializers.ModelSerializer):
    product = unSafe_productSerializer(many=False, read_only=True)

    class Meta:
        model = Order_detial
        fields = ['product', 'quantity', 'subtotal']


class unSafe_loungaUnderPaymentsSerializer(serializers.ModelSerializer):
    division = unSafe_divisionSerializer(many=False, read_only=True)
    client = unSafe_clientSerializer(many=False, read_only=True)
    order_detials = unSafe_detailsSerializer(many=True, read_only=True)
    payments = LoungePaymentsSerializer(many=True)

    class Meta:
        model = Order
        fields = ['id', 'is_now', 'client', 'division',
                  'discounted_amount', 'status', 'created_at', 'order_detials', 'payments']

    def create(self, validated_data):
        return None

    def update(self, instance, validated_data):
        return None


class LoungeMoneyTransferTypesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Money_transfer_type
        fields = '__all__'


class LoungeMoneyTransfersSerializer(serializers.ModelSerializer):
    fr_wallet = WalletsSerializer(many=False, read_only=True)
    to_wallet = WalletsSerializer(many=False, read_only=True)
    to_user = LoungeShowingUserSerializer(many=False, read_only=True)

    class Meta:
        model = Money_transfer
        fields = '__all__'


class LoungeMoneyTransferPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Money_transfer
        fields = '__all__'

class ItemBalancesSerializer(serializers.ModelSerializer):
    product = ProductsSerializer(many=False)
    commodity = CommoditiesSerializer(many=False)

    class Meta:
        model = Item_balance
        fields = '__all__'

class LoungeProductBalanceLogsSerializer(serializers.ModelSerializer):
    product = ProductsSerializer(many=False)
    commodity = CommoditiesSerializer(many=False)
    class Meta:
        model = Item_balance_log
        fields = '__all__'
