from django.shortcuts import render
import json
import requests
from datetime import datetime

# def putData(data):

bill = {
    "data": {
        "amount": "31206.00",
        "vat": "0.00",
        "cashAmount": "31206.00",
        "nonCashAmount": "0.00",
        "cityTax": "0.00",
        "districtCode": "24",
        "posNo": "0019",
        "customerNo": "",
        "billType": "1",
        "billIdSuffix": "814418",
        "taxType": "2",
        "branchNo": "019",
        "stocks": [
            {
                "code": "Хүү",
                "name": "Зээлийн хүү",
                "qty": "1.00",
                "measureUnit": "ширхэг",
                "unitPrice": "31206.00",
                "totalAmount": "31206.00",
                "cityTax": "0.00",
                "vat": "0.00",
                "barCode": ""
            }
        ]
    }
}

# Create your views here.
def putTest(self):
    json_order_lines = []
    json_order_lines.append({
        'code': '0101067',
        'name': 'Талх',
        'measureUnit': 'kg',
        'qty': '2.00',
        'unitPrice': '727.27',
        'totalAmount': '1454.55',
        'cityTax': '0.00',
        'vat': '145.45',
        'barCode': '8650600040',
    })
    json_order = {
        'amount': '1600.00',
        'vat': '145.45',
        'cashAmount': '1600.00',
        'nonCashAmount': '0.00',
        'cityTax': "0.00",
        'districtCode': '34',
        'posNo': '0086',  # Тухайн байгууллагын дотоод кассын дугаар
        'customerNo': '07008745',  # Худалдан авагч байгууллагын ТТД эсвэл Иргэний регистерийн дугаар
        'billType': '1',
        # Баримтын ДДТД-ыг давхцуулахгүйн тулд олгох дотоод дугаарлалт. Тухайн өдөртөө дахин давтагдашгүй дугаар байна
        'billIdSuffix': '000017',  # u'%s-%s'%(order['shop_id'], order['name']),
        'returnBillId': '',  # Засварлах баримтын дугаар
        # Бараа ажил үйлчилгээний жагсаалт
        'stocks': json_order_lines
    }
    print("================Put===========================")
    json_dump = json.dumps(json_order)
    check_api_result = self.putData(json_dump)
    print(check_api_result)
    return check_api_result


def getInformation():
    url = "http://103.50.205.35:8080/getInformation"
    response = requests.request("GET", url)
    if int(response.status_code) == 200:
        return ("Get Information: ", response.text)
    else:
        return ("Get Information алдаа: {}".format(response.text))

def checkApi():
    url = "http://103.50.205.35:8080/checkApi"
    response = requests.request("GET", url)
    if int(response.status_code) == 200:
        return ("Get Information: ", response.text)
    else:
        return ("Get Information алдаа: {}".format(response.text))

def checkApi():
    url = "http://103.50.205.35:8080/checkApi"
    response = requests.request("GET", url)
    if int(response.status_code) == 200:
        return ("Check API: ", response.text)
    else:
        return ("Check API: {}".format(response.text))

def sendData():
    url = "http://103.50.205.35:8080/sendData"
    response = requests.request("GET", url)
    if int(response.status_code) == 200:
        last_sent_date = datetime.now()
        return ("Send Data: ", response.text)
    else:
        return ("Send Data: {}".format(response.text))