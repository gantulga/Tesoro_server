from django.shortcuts import render
import json
import requests
from datetime import datetime
import http.client
from django.http import HttpResponse
from .models import Order, Order_detial, Bill, Payment
from structure_app.models import Configuration_value
from django.shortcuts import render, redirect, get_list_or_404, get_object_or_404

def createBill(request):
    order = None
    register = request.GET.get('register')
    if request.GET.get('order') != None and request.GET.get('order') != "":
        order = get_object_or_404(Order, pk=request.GET.get('order'))
        data = putData(order, register)
        return HttpResponse(data)
    else:
        redirect('/')
    

def putData(order, register):
    if order.bills.count() == 0:
        conf_value = Configuration_value.objects.first()
        total_vat = 0
        total_city_tax = 0
        total_amount_no_tax = 0
        json_order_lines = []

        if register:
            bill_type = 3
        else:
            bill_type = 1
            if order.customer:
                if order.customer.register:
                    register = order.customer.register

        for detail in order.order_detials.all():
            json_order_lines.append({
                "code": str(detail.product.id),
                "name": detail.product.name,
                "qty": str(detail.quantity) + ".00",
                "measureUnit": "ш",
                "unitPrice": str(detail.subtotal / detail.quantity + (detail.subtotal * conf_value.noat_tax / 100)  + (detail.subtotal * conf_value.capital_city_tax / 100)),
                "totalAmount": str(detail.subtotal),
                "cityTax": str(detail.subtotal * conf_value.capital_city_tax / 100),
                "vat": str(detail.subtotal * conf_value.noat_tax / 100),
                "barCode": ""
            })
            total_vat = total_vat + (detail.subtotal * conf_value.noat_tax / 100)
            total_city_tax = total_city_tax + (detail.subtotal * conf_value.capital_city_tax / 100)
            total_amount_no_tax = total_amount_no_tax + (detail.subtotal)

        if conf_value.district_code < 10:
            district_code = "0" + str(conf_value.district_code)
        else:
            district_code = str(conf_value.district_code)

        if int(order.division.id) < 10:
            pos_number = "000" + str(order.division.id)
        elif int(order.division.id) > 9 and int(order.division.id) < 100:
            pos_number = "00" + str(order.division.id)
        elif int(order.division.id) > 99 and int(order.division.id) < 1000:
            pos_number = "0" + str(order.division.id)
        else:
            pos_number = str(order.division.id)
        
        if int(order.division.id) < 10:
            branch_number = "00" + str(order.division.id)
        elif int(order.division.id) > 9 and int(order.division.id) < 100:
            branch_number = "0" + str(order.division.id)
        else:
            branch_number = str(order.division.id)

        # BILL_TYPE
        #1 Байгууллагаас хувь иргэнд борлуулсан бараа, ажил үйлчилгээний баримт
        #3 Байгууллагаас байгууллагын хооронд борлуулсан бараа, ажил үйлчилгээний баримт
        #5 Нэхэмжлэхээр борлуулсан бараа, ажил, үйлчилгээний баримт

        # TAX_TYPE
        # 1 НӨАТ тооцох баримт
        # Хэрэв борлуулагч ААН, иргэн нь НӨАТ суутган төлөгч биш бол тухайн 
        # баримтанд НӨАТ тооцохгүй.
        # 2 НӨАТ-аас чөлөөлөгдөх бараа, ажил, үйлчилгээ борлуулсан баримт
        # 3 НӨАТ 0% тооцох бараа, ажил, үйлчилгээ борлуулсан баримт
        print(bill_type, register)
        # register = "0000038"
        json_order = {
            "data": {
                "amount": str(total_amount_no_tax + total_city_tax + total_vat),
                "vat": str(total_vat),
                "cashAmount": str(total_amount_no_tax + total_city_tax + total_vat),
                "nonCashAmount": "0.00",
                "cityTax": str(total_city_tax),
                "districtCode": district_code,
                "posNo": pos_number,
                "customerNo": register,
                "billType": str(bill_type),
                "billIdSuffix": str(conf_value.bill_id_suffix + 1),
                "taxType": "1",
                "branchNo": branch_number,
                "stocks": json_order_lines
            }
        }

        r = None
        
        try:
            url = "http://103.50.205.35:8080/put"
            payload = json.dumps(json_order)
            headers = {
            'Content-Type': 'application/json'
            }
            response = requests.request("POST", url, headers=headers, data=payload)
            conf_value.bill_id_suffix = conf_value.bill_id_suffix + 1
            conf_value.save()

            temp = json.loads(response.text)
            
            if "returnBillId" in temp:
                returnBillId = temp['returnBillId']
            else:
                returnBillId = ""

            if "lotteryWarningMsg" in temp:
                lotteryWarningMsg = temp['lotteryWarningMsg']
            else:
                lotteryWarningMsg = ""

            if "internalCode" in temp:
                internalCode = temp['internalCode']
            else:
                internalCode = ""
            
            if temp['success']:
                bill = Bill.objects.create(
                    amount = temp['amount'],
                    vat = temp['vat'],
                    cash_amount = temp['cashAmount'],
                    non_cash_amount = temp['nonCashAmount'],
                    city_tax = temp['cityTax'],

                    district_code = temp['districtCode'],
                    pos_no = temp['posNo'],
                    customer_no = temp['customerNo'],
                    bill_type = temp['billType'],
                    bill_id_suffix = temp['billIdSuffix'],
                    return_bill_id = returnBillId,
                    tax_type = temp['taxType'],

                    success = temp['success'],
                    register_no = temp['registerNo'],
                    bill_id = temp['billId'],
                    date = temp['date'],
                    mac_address = temp['macAddress'],
                    internal_code = str(internalCode),
                    qr_data = temp['qrData'],
                    lottery = temp['lottery'],
                    lottery_warning_msg = lotteryWarningMsg,

                    order = order,
                    client = order.client,
                    division = order.division,
                    customer = order.customer
                )

                r = '{"billId":' + str(bill.id) + ', "success":true}'
                r = json.dumps(r)
                r = json.loads(r)

            else:
                r = '{"errorCode":' + str(temp['errorCode']) + ', "success":false, "message":' + str(temp['message']) + '}'
                r = json.dumps(r)
                r = json.loads(r)
            
            return r

        except requests.exceptions.HTTPError as errh:
            r = '{"errorCode":"HTTPError", "success":false}'
            r = json.dumps(r)
            r = json.loads(r)
        except requests.exceptions.ConnectionError as errc:
            r = '{"errorCode":"ConnectionError", "success":false}'
            r = json.dumps(r)
            r = json.loads(r)
        except requests.exceptions.Timeout as errt:
            r = '{"errorCode":"Timeout", "success":false}'
            r = json.dumps(r)
            r = json.loads(r)
        except requests.exceptions.RequestException as err:
            r = '{"errorCode":"Error", "success":false}'
            r = json.dumps(r)
            r = json.loads(r)
        return r
    else:
        r = '{"errorCode":"Bill is already created", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
        return  r


def getInformation(request):
    try:
        url = "http://103.50.205.35:8080/getInformation"
        response = requests.request("GET", url)
        r = response.text
    except requests.exceptions.HTTPError as errh:
        r = '{"errorCode":"HTTPError", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
    except requests.exceptions.ConnectionError as errc:
        r = '{"errorCode":"ConnectionError", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
    except requests.exceptions.Timeout as errt:
        r = '{"errorCode":"Timeout", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
    except requests.exceptions.RequestException as err:
        r = '{"errorCode":"Error", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
    return HttpResponse(r)

def checkApi(request):
    try:
        url = "http://103.50.205.35:8080/checkApi"
        response = requests.request("GET", url)
        r = response.text
    except requests.exceptions.HTTPError as errh:
        r = '{"errorCode":"HTTPError", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
    except requests.exceptions.ConnectionError as errc:
        r = '{"errorCode":"ConnectionError", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
    except requests.exceptions.Timeout as errt:
        r = '{"errorCode":"Timeout", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
    except requests.exceptions.RequestException as err:
        r = '{"errorCode":"Error", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
    return HttpResponse(r)

def sendData(request):
    try:
        url = "http://103.50.205.35:8080/sendData"
        response = requests.request("GET", url)
        r = response.text
    except requests.exceptions.HTTPError as errh:
        r = '{"errorCode":"HTTPError", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
    except requests.exceptions.ConnectionError as errc:
        r = '{"errorCode":"ConnectionError", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
    except requests.exceptions.Timeout as errt:
        r = '{"errorCode":"Timeout", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
    except requests.exceptions.RequestException as err:
        r = '{"errorCode":"Error", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
    return HttpResponse(json.loads(r))