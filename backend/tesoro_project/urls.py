from django.contrib import admin
from django.urls import path, include
from django.conf import settings
# from django.conf.urls import url
from django.urls import include, re_path
from django.conf.urls.static import static
from . import views
from product_app.views import balanceChecker, itemBalanceChanger
from rest_framework import routers
from hotel.api import HotelClientLogsViewSet, HotelRoomsViewSet, HotelOrdersViewSet, HotelOrdersViewSet2, HotelOrdersViewSet3, HotelOrdersViewSet4, HotelOrderDetialsViewSet, HotelPaymentsViewSet, HotelProductsViewSet, HotelOrderDetialsViewSet2, UnderpaymentsViewSet, HotelOrdersNewHotelViewSet, BeforeReceivablesViewSet, ShiftOrdersViewSet, ShiftPaymentsViewSet
from lounge.api import ProductCategoriesViewSet, LoungeProductsViewSet, LoungeDivisionsViewSet, LoungeClientsViewSet, LoungeOrdersViewSet, LoungeOrderDetialsViewSet, LoungeOrderPaymentsViewSet, OrderRecieverViewSet, OrderDetailRecieverViewSet, LoungeShiftWorksViewSet, LoungeLastShiftWorksViewSet, LoungePaymentsViewSet, LoungeOrderUpdateViewSet, unSafe_WorkersViewSet, LoungeUnderPaymentsViewSet, LoungeMoneyTransfersViewSet, LoungeMoneyTransferTypesViewSet, LoungeMoneyTransferPostViewSet, BarmenProductBalancesViewSet, LoungeLastShiftWorkUpdateViewSet, LoungeProductBalanceLogsViewSet, LoungeUnpaidOrdersViewSet
from product_app.api import ItemTransfersViewSet, CommoditiesViewSet, ProductsViewSet, StoresViewSet, TransferTypesViewSet, ClientProductsViewSet, ClientCommoditiesViewSet, UserProductsViewSet, UserCommoditiesViewSet, BalancesViewSet, DivisionItemBalancesViewSet
from structure_app.api import SettingsViewSet, CustomersViewSet, UsersViewSet, DivisionsViewSet, ClientsViewSet, DivisionClientsViewSet, ShiftWorksViewSet, LastShiftWorkViewSet
from financial_app.api import FinanceWalletsViewSet, BudgetsViewSet
from rest_framework.authtoken import views as auth_views
from structure_app.views import index as structure_app_index, shiftWorkUnpaidOrderChecker
from django.views.generic.base import TemplateView # new
from payment_app import views as payment_views

router = routers.DefaultRouter()
router.register('hotel/clientlogs', HotelClientLogsViewSet, 'clientlogs') #hotel app
router.register('hotel/rooms', HotelRoomsViewSet, 'rooms') #hotel app
# router.register('hotel/orders', HotelOrdersViewSet, 'hotelOrders')
# router.register('hotel/newRoomOrder',
#                 HotelOrdersNewHotelViewSet, 'newRoomOrder')
# router.register('hotel/underpayments',
#                 UnderpaymentsViewSet, 'hotelUnderpayments')
router.register('hotel/beforereceivables', BeforeReceivablesViewSet, 'beforereceivables')  #hotel app
router.register('hotel/workshiftorders', ShiftOrdersViewSet, 'workshiftorders')  #hotel app
router.register('hotel/workshiftpayments', ShiftPaymentsViewSet, 'workshiftpayments')  #hotel app

# router.register('hotel/orders2', HotelOrdersViewSet4, 'hotelOrders2')
router.register('hotel/ordersForPayments', HotelOrdersViewSet2, 'ordersForPayments')
# router.register('hotel/ordersDetials',
#                 HotelOrderDetialsViewSet, 'hotelOrdersDetials')
# router.register('hotel/ordersDetials2',
#                 HotelOrderDetialsViewSet2, 'hotelOrdersDetials2')
# router.register('hotel/products', HotelProductsViewSet, 'hotelProducts')
# router.register('hotel/payments', HotelPaymentsViewSet, 'hotelPayments')
# router.register('hotel/shiftWorks', ShiftWorksViewSet, 'shiftWorks')

# router.register('item/transfers', ItemTransfersViewSet, 'itemTransfers')
# router.register('item/commodities', CommoditiesViewSet, 'commodities')
# router.register('item/products', ProductsViewSet, 'products')
# router.register('item/balances', BalancesViewSet, 'balances')
# router.register('item/transfers', ItemTransfersViewSet, 'itemTransfers')
# router.register('item/transferTypes', TransferTypesViewSet, 'transferTypes')

router.register('lounge/productCategories', ProductCategoriesViewSet, 'productCategories')
router.register('lounge/divisions', LoungeDivisionsViewSet, 'divisions')
router.register('lounge/postOrder', OrderRecieverViewSet, 'postOrder')
router.register('lounge/postOrderDetail', OrderDetailRecieverViewSet, 'postOrderDetails')
router.register('lounge/payments', LoungePaymentsViewSet, 'loungePayments')
router.register('lounge/shiftWorks', LoungeShiftWorksViewSet, 'shiftWorks')
router.register('lounge/LastShiftWorks', LoungeLastShiftWorksViewSet, 'LastShiftWorks')
router.register('lounge/shiftWorkUpdate', LoungeLastShiftWorkUpdateViewSet, 'shiftWorkUpdate')
router.register('lounge/orderUpdate', LoungeOrderUpdateViewSet, 'orderUpdate')
router.register('lounge/workers', unSafe_WorkersViewSet, 'workers')
router.register('lounge/loungeUnderPayments', LoungeUnderPaymentsViewSet, 'loungeUnderPayments')
router.register('lounge/loungeMoneyTransfers', LoungeMoneyTransfersViewSet, 'loungeMoneyTransfers')
router.register('lounge/loungeMoneyTransferTypes', LoungeMoneyTransferTypesViewSet, 'loungeMoneyTransferTypes')
router.register('lounge/BarmenProductBalances', BarmenProductBalancesViewSet, 'BarmenProductBalances')


router.register('settings', SettingsViewSet, 'settings') #hotel app
router.register('finance/wallets', FinanceWalletsViewSet, 'wallets')
# router.register('finance/budgets', BudgetsViewSet, 'budgets')
router.register('finance/postMoneyTransfer', LoungeMoneyTransferPostViewSet, 'postMoneyTransfer')
router.register('customers', CustomersViewSet, 'customers')
router.register('users', UsersViewSet, 'users')
# router.register('divisions', DivisionsViewSet, 'divisions')
# router.register('clients', ClientsViewSet, 'clients')
# router.register('stores', StoresViewSet, 'stores')


urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('django.contrib.auth.urls')), # new
    # accounts/login/ [name='login']
    # accounts/logout/ [name='logout']
    # accounts/password_change/ [name='password_change']
    # accounts/password_change/done/ [name='password_change_done']
    # accounts/password_reset/ [name='password_reset']
    # accounts/password_reset/done/ [name='password_reset_done']
    # accounts/reset/<uidb64>/<token>/ [name='password_reset_confirm']
    # accounts/reset/done/ [name='password_reset_complete']
    # path('hotel/', include('hotel.urls')),
    path('api/', include(router.urls)),
    path('generate_token/', auth_views.obtain_auth_token, name='generate_token'),
    re_path('^api/hotel/ordersForClients/(?P<client>.+)/$', HotelOrdersViewSet3.as_view()),

    # re_path('^api/client/(?P<client>.+)/products/$',
    #     ClientProductsViewSet.as_view()),
    # re_path('^api/client/(?P<client>.+)/commodities/$',
    #     ClientCommoditiesViewSet.as_view()),

    # re_path('^api/user/(?P<user>.+)/products/$',
    #     UserProductsViewSet.as_view()),
    # re_path('^api/user/(?P<user>.+)/commodities/$',
    #     UserCommoditiesViewSet.as_view()),

    re_path('^api/division=(?P<division>.+)/clients/$', DivisionClientsViewSet.as_view()), #hotel app
    re_path('^api/division=(?P<division>.+)/item/balances/$', DivisionItemBalancesViewSet.as_view()), #hotel app
    re_path('^api/hotel/shiftWorks/last$', LastShiftWorkViewSet.as_view()), #hotel app



    re_path('^api/lounge/products/$', LoungeProductsViewSet.as_view()),
    re_path('^api/lounge/clients/$', LoungeClientsViewSet.as_view()),
    re_path('^api/lounge/orders/$', LoungeOrdersViewSet.as_view()),
    re_path('^api/lounge/unpaidOrders/$', LoungeUnpaidOrdersViewSet.as_view()),
    re_path('^api/lounge/orderDetials/$', LoungeOrderDetialsViewSet.as_view()),
    re_path('^api/lounge/orderPayments/$', LoungeOrderPaymentsViewSet.as_view()),
    re_path('^api/lounge/balanceLogs/$', LoungeProductBalanceLogsViewSet.as_view()),
    re_path('^printer/$', views.printer),
    path('api/balanceChecker/<int:client_id>/<int:product_id>', balanceChecker),
    path('api/shiftWorkUnpaidOrderChecker/<int:shift_work_id>', shiftWorkUnpaidOrderChecker),

    # re_path('^api/lounge/division/$', LoungeDivisionsViewSet.as_view()),
    # path('product/', include('product_app.urls')),
    # path('basic_asset/', views.Basic_asset_function, name='Basic_asset'),
    path('', views.home, name='home'),
    path('itembalances', views.itemBalance, name='itemBalance'),
    path('loungeItemBalances', views.loungeItemBalances, name='loungeItemBalances'),
    path('itembalances/shiftworker/<int:shiftworker>', views.itemBalanceShiftWorker, name='itemBalanceShiftWorker'),
    path('addProduct', views.addProduct, name='addProduct'),
    path('addCommodity', views.addCommodity, name='addCommodity'),
    path('changePriceProduct', views.changePriceProduct, name='changePriceProduct'),
    path('transferProduct', views.transferProduct, name='transferProduct'),
    path('transferCommodity', views.transferCommodity, name='transferCommodity'),
    path('posNegtgel', views.posNegtgel, name='posNegtgel'),
    path('dailyReport', views.dailyReport, name='dailyReport'),
    path('sendBillToTatvar', views.sendBillToTatvar, name='sendBillToTatvar'),
    path('api/commodityInfo/<int:commodity_id>', views.commodityInformation),
    path('api/productBalance/<int:client_id>/<int:product_id>', views.productBalance),
    path('api/commodityBalance/<int:client_id>/<int:commodity_id>', views.commodityBalance),
    path('kitchen', views.kitchenFoods, name='kitchenFoods'),

    path('api/bill/getInformation', payment_views.getInformation),
    path('api/bill/checkApi', payment_views.checkApi),
    path('api/bill/sendData', payment_views.sendData),
    # path('api/bill/putData', payment_views.putData),
    path('api/bill/createBill', payment_views.createBill),
    path('api/bill/registerChecker', payment_views.registerChecker),

    #tur zuuriin
    path('itemBalanceChanger/<int:client_id>', itemBalanceChanger)
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
