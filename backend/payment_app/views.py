from django.shortcuts import render
import json
import requests
from datetime import datetime
from django.http import HttpResponse
from .models import Order, Order_detial, Bill, Payment
from structure_app.models import Configuration_value, Printer
from django.shortcuts import render, redirect, get_list_or_404, get_object_or_404
import socket
from PIL import Image, ImageDraw, ImageFont, ImageOps
import struct
import qrcode
import textwrap

def createBill(request):
    order = None
    register = request.GET.get('register')
    printer_number = request.GET.get('printer_number')
    if request.GET.get('order') != None and request.GET.get('order') != "":
        order = get_object_or_404(Order, pk=request.GET.get('order'))
        data = putData(order, register, printer_number)
        return HttpResponse(data)
    else:
        r = '{"errorCode":"Please insert values!", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
        return HttpResponse(r)

def printBill(bill, printer_number):
    bill = Bill.objects.get(pk=bill)
    
    mysocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    mysocket.connect(("192.168.1.9", 9100))

    width = 600
    if bill.bill_type == "1":
        add_h = 750
    elif bill.bill_type == "3":
        add_h = 580

    height = len(bill.order.order_detials.filter(is_deleted=False)) * 70 + add_h
    image = Image.new("RGB", (width, height), "white")
    draw = ImageDraw.Draw(image)
    # font = ImageFont.load_default()

    
    unicode_font_22 = ImageFont.truetype("/home/tesoro/Tesoro_server/backend/media/roboto.ttf", 22)
    unicode_font_26 = ImageFont.truetype("/home/tesoro/Tesoro_server/backend/media/roboto.ttf", 26)
    unicode_font_32 = ImageFont.truetype("/home/tesoro/Tesoro_server/backend/media/roboto.ttf", 32)
    unicode_font_36 = ImageFont.truetype("/home/tesoro/Tesoro_server/backend/media/roboto.ttf", 36)
    unicode_font_48 = ImageFont.truetype("/home/tesoro/Tesoro_server/backend/media/roboto.ttf", 48)
    y = 0

    text = "Tesoro Center"
    draw.text((160, y), text, fill="black", font=unicode_font_48)

    y = y + 70
    draw.text((30, y), "Огноо: " + bill.date, fill="black", font=unicode_font_22)
    draw.text((400, y), "Принтер №: " + bill.printer, fill="black", font=unicode_font_22)

    y = y + 40
    draw.text((30, y), "ҮҮзүүлэгч: " + '"Гүн Арвижих Эрдэнэс" ХХК', fill="black", font=unicode_font_22)
    y = y + 30
    draw.text((30, y), "ҮҮзүүлэгч ТТД: " + "4388771", fill="black", font=unicode_font_22)

    if bill.bill_type == "3":
        y = y + 40
        draw.text((30, y), "Үйлчлүүлэгч: " + bill.customer_name , fill="black", font=unicode_font_22)
        y = y + 30
        draw.text((30, y), "Үйлчлүүлэгчийн ТТД: " + bill.customer_no, fill="black", font=unicode_font_22)
    
    y = y + 40
    draw.text((60, y), "Тоо", fill="black", font=unicode_font_22)

    draw.text((200, y), "Үнэ", fill="black", font=unicode_font_22)

    draw.text((400, y), "Дүн", fill="black", font=unicode_font_22)

    y = y + 15
    draw.text((30, y), "--------------------------------------------------------------------------------", fill="black", font=unicode_font_26)
    
    row_number = 1
    y = y + 30
    for detail in bill.order.order_detials.filter(is_deleted=False):
        det_text = str(row_number) + ". " + str(detail.product.name)
        draw.text((30, y), det_text, fill="black", font=unicode_font_26)

        quantity_text = str(detail.quantity)
        draw.text((60, y + 30), quantity_text, fill="black", font=unicode_font_22)

        price_text = str(detail.product.cost)
        draw.text((170, y + 30), price_text, fill="black", font=unicode_font_22)

        amount_text = str(detail.product.cost * detail.quantity)
        w, h = draw.textsize(amount_text)
        draw.text((width - w - 140, y + 30), amount_text, fill="black", font=unicode_font_22)

        row_number = row_number + 1
        y = y + 70

    draw.text((30, y), "--------------------------------------------------------------------------------", fill="black", font=unicode_font_26)

    niit_dun = "Нийт дүн: " + bill.amount
    y = y + 30
    draw.text((30, y), niit_dun, fill="black", font=unicode_font_26)

    tuluh_dun = "Төлөх дүн: " + bill.amount
    y = y + 30
    draw.text((30, y), tuluh_dun, fill="black", font=unicode_font_36)

    noat_dun = "НӨАТ: " + bill.vat
    y = y + 44
    draw.text((30, y), noat_dun, fill="black", font=unicode_font_26)

    belen_dun = "Бэлэн: " + bill.cash_amount
    y = y + 30
    draw.text((30, y), belen_dun, fill="black", font=unicode_font_26)
    
    belen_bus_dun = "Бэлэн бус: " + bill.non_cash_amount
    y = y + 30
    draw.text((30, y), belen_bus_dun, fill="black", font=unicode_font_26)

    y = y + 30
    draw.text((30, y), "--------------------------------------------------------------------------------", fill="black", font=unicode_font_26)

    ddd = "ДДТД: " + bill.bill_id
    lines = textwrap.wrap(ddd, width=600)
    y = y + 30
    for line in lines:
        draw.text((30, y), line, font=unicode_font_26, fill="black")
        y += 30

    if bill.bill_type == "1":
        ebarimt = "Ebarimt "
        y += 30
        draw.text((270, y), ebarimt, fill="black", font=unicode_font_32)

        ebarimt_dun = "Дүн: " + bill.amount.split(".")[0]
        y += 36
        draw.text((270, y), ebarimt_dun, fill="black", font=unicode_font_32)

        ebarimt_code = "Код: " + bill.lottery
        y += 36
        draw.text((270, y), ebarimt_code, fill="black", font=unicode_font_32)

    image.save("/home/tesoro/Tesoro_server/backend/media/qrCodes/" + str(bill.id) + "-text.jpg")
    im = Image.open("/home/tesoro/Tesoro_server/backend/media/qrCodes/" + str(bill.id) + "-text.jpg")
    # if image is not 1-bit, convert it
    if im.mode != '1':
        im = im.convert('1')
    # if image width is not a multiple of 8 pixels, fix that
    if im.size[0] % 8:
        im2 = Image.new('1', (im.size[0] + 8 - im.size[0] % 8, im.size[1]), 'white')
        im2.paste(im, (0, 0))
        im = im2

    # Invert image, via greyscale for compatibility
    #  (no, I don't know why I need to do this)
    im = ImageOps.invert(im.convert('L'))
    # ... and now convert back to single bit
    im = im.convert('1')
    
    # QR SIDE
    data = (bill.qr_data)
    qr = qrcode.QRCode(box_size=5)
    qr.add_data(data)
    qr_image = qr.make_image()
    qr_image.save('/home/tesoro/Tesoro_server/backend/media/qrCodes/' + str(bill.id) + ".jpg")
    qr_im = Image.open("/home/tesoro/Tesoro_server/backend/media/qrCodes/" + str(bill.id) + ".jpg")
    # if image is not 1-bit, convert it
    if qr_im.mode != '1':
        qr_im = qr_im.convert('1')
    # if image width is not a multiple of 8 pixels, fix that
    if qr_im.size[0] % 8:
        qr_im2 = Image.new('1', (qr_im.size[0] + 8 - qr_im.size[0] % 8, qr_im.size[1]), 'white')
        qr_im2.paste(qr_im, (0, 0))
        qr_im = qr_im2

    # Invert image, via greyscale for compatibility
    #  (no, I don't know why I need to do this)
    qr_im = ImageOps.invert(qr_im.convert('L'))
    # ... and now convert back to single bit
    qr_im = qr_im.convert('1')

    if bill.bill_type == "1":
        im.paste(qr_im, (0, height - 270), mask = qr_im)

    job = [(b''.join((bytearray(b'\x1d\x76\x30\x00'),
                struct.pack('2B', int(im.size[0] / 8 % 256),
                            int(im.size[0] / 8 / 256)),
                struct.pack('2B', int(im.size[1] % 256),
                            int(im.size[1] / 256)),
                im.tobytes()))),
            b'\x1b\r\n',
            b'\x1b\r\n',
            b'\x1b\r\n',
            b'\x1b\r\n',
            b'\x1b\x69'
        ]

    # b'\x1b\x69' тасдах

    #(b''.join((bytearray(b'\x1d\x76\x30\x00'),
    # struct.pack('2B', int(qr_im.size[0] / 8 % 256),
    #             int(qr_im.size[0] / 8 / 256)),
    # struct.pack('2B', int(qr_im.size[1] % 256),
    #             int(qr_im.size[1] / 256)),
    # qr_im.tobytes()))),

    
    for b in job:
        mysocket.sendall(b)
    mysocket.close()

    
    return HttpResponse("done")



def registerChecker(request):
    if request.GET.get('register') != None and request.GET.get('register') != "":
        url = "http://info.ebarimt.mn/rest/merchant/info?regno=" + request.GET.get('register')
        headers = {
        'Content-Type': 'application/json'
        }
        response = requests.request("GET", url, headers=headers)
        return HttpResponse(response)
    else:
        r = '{"found":false}'
        r = json.dumps(r)
        r = json.loads(r)
        return HttpResponse(r)

def registerCheckerName(register):
    url = "http://info.ebarimt.mn/rest/merchant/info?regno=" + str(register)
    headers = {
        'Content-Type': 'application/json'
    }
    response = requests.request("GET", url, headers=headers)
    return json.loads(response.content)['name']
    
    
def putData(order, register, printer_number):
    if order.bills.count() == 0:
        conf_value = Configuration_value.objects.first()
        total_vat = 0
        total_amount = 0
        json_order_lines = []
        customer_name = ""

        if register:
            bill_type = 3
            customer_name = registerCheckerName(register)
        else:
            bill_type = 1
            if order.customer:
                if order.customer.register:
                    register = order.customer.register

        for detail in order.order_detials.filter(is_deleted=False):
            per_amount = detail.subtotal / detail.quantity
            per_price = float(per_amount) / float((conf_value.noat_tax + 100) / 100)
            vat = float(detail.per_amount) - float(per_price)
            json_order_lines.append({
                "code": str(detail.product.id),
                "name": detail.product.name,
                "qty": str(detail.quantity) + ".00",
                "measureUnit": "ш",
                "unitPrice": str(detail.subtotal / detail.quantity),
                "totalAmount": str(detail.subtotal),
                "cityTax": "0.00",
                "vat": "%.2f" % vat,
                "barCode": ""
            })
            total_vat = total_vat + vat
            total_amount = total_amount + (detail.subtotal)

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


        print("amount:", "%.2f" % total_amount)
        print("vat: ", "%.2f" % total_vat)
        print("cashAmount: ", "%.2f" % total_amount)

        json_order = {
            "data": {
                "amount": "%.2f" % total_amount,
                "vat": "%.2f" % total_vat,
                "cashAmount": "%.2f" % total_amount,
                "nonCashAmount": "0.00",
                "cityTax": "0.00",
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
        print(json_order)
        bill = Bill.objects.create(
            amount = "%.2f" % total_amount,
            vat = "%.2f" % total_vat,
            cash_amount = "%.2f" % total_amount,
            non_cash_amount = "0.00",
            city_tax = "0.00",

            district_code = district_code,
            pos_no = pos_number,
            customer_no = register,
            bill_type = str(bill_type),
            bill_id_suffix = str(conf_value.bill_id_suffix + 1),
            tax_type = "1",
            status = "0",
            order = order,
            client = order.client,
            division = order.division,
            customer = order.customer,
            printer = printer_number,
            customer_name = customer_name
        )

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
                
                # status
                # ('0', 'Бэлтгэгдэж байгаа'),
                # ('1', 'Амжилттай илгээгдсэн'),
                # ('2', 'Алдаа гарсан'),
                # ('3', 'Буцаахаар хүсэлт гаргасан'),
                # ('4', 'Амжилттай буцаагдсан'),
                # ('5', 'Дахин илгээгдсэн'),
                # ('6', 'Татварлуу илгээгдсэн'),
                print(temp['qrData'])
                bill.status = "1"
                bill.returnBillId = returnBillId
                bill.lotteryWarningMsg = lotteryWarningMsg
                bill.internalCode = internalCode
                bill.bill_id = temp['billId']
                bill.date = temp['date']
                bill.mac_address = temp['macAddress']
                bill.qr_data = temp['qrData']
                bill.lottery = temp['lottery']
                bill.register_no = temp['registerNo']
                customer_name = customer_name,
                bill.save()

                r = '{"billId":' + str(bill.id) + ', "success":true}'
                r = json.dumps(r)
                r = json.loads(r)
                printBill(bill.id, printer_number)

            else:
                if "message" in temp:
                    message = temp['message']
                else:
                    message = ""

                bill.message = message
                bill.error_code = temp['errorCode']

                r = '{"errorCode":' + str(temp['errorCode']) + ', "success":false, "message":' + str(temp['message']) + '}'
                r = json.dumps(r)
                r = json.loads(r)
            return r

        except requests.exceptions.HTTPError as errh:
            r = '{"errorCode":"HTTPError", "success":false}'
            bill.error_code = "HTTPError"
            r = json.dumps(r)
            r = json.loads(r)
        except requests.exceptions.ConnectionError as errc:
            r = '{"errorCode":"ConnectionError", "success":false}'
            bill.error_code = "ConnectionError"
            r = json.dumps(r)
            r = json.loads(r)
        except requests.exceptions.Timeout as errt:
            r = '{"errorCode":"Timeout", "success":false}'
            bill.error_code = "Timeout"
            r = json.dumps(r)
            r = json.loads(r)
        except requests.exceptions.RequestException as err:
            r = '{"errorCode":"Error", "success":false}'
            bill.error_code = "Error"
            r = json.dumps(r)
            r = json.loads(r)

        bill.status = "2"
        bill.save()
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


def printOrder(request):
    order = request.GET.get('order')
    if request.GET.get('order') and request.GET.get('printer') and request.GET.get('printer') != "":
        order = get_object_or_404(Order, pk=request.GET.get('order'))
        printer = get_object_or_404(Printer, pk=request.GET.get('printer'))

        mysocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        mysocket.connect((printer.ip, printer.port))

        width = 600
        add_h = 450

        height = len(order.order_detials.filter(is_deleted=False)) * 70 + add_h
        image = Image.new("RGB", (width, height), "white")
        draw = ImageDraw.Draw(image)
        # font = ImageFont.load_default()

        
        unicode_font_22 = ImageFont.truetype("/home/tesoro/Tesoro_server/backend/media/roboto.ttf", 22)
        unicode_font_26 = ImageFont.truetype("/home/tesoro/Tesoro_server/backend/media/roboto.ttf", 26)
        unicode_font_32 = ImageFont.truetype("/home/tesoro/Tesoro_server/backend/media/roboto.ttf", 32)
        unicode_font_36 = ImageFont.truetype("/home/tesoro/Tesoro_server/backend/media/roboto.ttf", 36)
        unicode_font_48 = ImageFont.truetype("/home/tesoro/Tesoro_server/backend/media/roboto.ttf", 48)
        y = 0

        text = "Tesoro Center"
        draw.text((160, y), text, fill="black", font=unicode_font_48)

        y = y + 70
        draw.text((30, y), "Огноо: " + str(order.created_at)[0:18], fill="black", font=unicode_font_22)
        draw.text((400, y), "Принтер №: " + printer.name, fill="black", font=unicode_font_22)
        
        y = y + 40
        draw.text((60, y), "Тоо", fill="black", font=unicode_font_22)

        draw.text((200, y), "Үнэ", fill="black", font=unicode_font_22)

        draw.text((400, y), "Дүн", fill="black", font=unicode_font_22)

        y = y + 15
        draw.text((30, y), "--------------------------------------------------------------------------------", fill="black", font=unicode_font_26)
        
        row_number = 1
        y = y + 30
        for detail in order.order_detials.filter(is_deleted=False):
            det_text = str(row_number) + ". " + str(detail.product.name)
            draw.text((30, y), det_text, fill="black", font=unicode_font_26)

            quantity_text = str(detail.quantity)
            draw.text((60, y + 30), quantity_text, fill="black", font=unicode_font_22)

            price_text = str(detail.product.cost)
            draw.text((170, y + 30), price_text, fill="black", font=unicode_font_22)

            amount_text = str(detail.product.cost * detail.quantity)
            w, h = draw.textsize(amount_text)
            draw.text((width - w - 140, y + 30), amount_text, fill="black", font=unicode_font_22)

            row_number = row_number + 1
            y = y + 70

        draw.text((30, y), "--------------------------------------------------------------------------------", fill="black", font=unicode_font_26)

        niit_dun = "Нийт дүн: " + str(order.amount)
        y = y + 30
        draw.text((30, y), niit_dun, fill="black", font=unicode_font_26)

        y = y + 30
        draw.text((30, y), "--------------------------------------------------------------------------------", fill="black", font=unicode_font_26)

        if order.customer:
            if order.customer.firstname:
                customer = "Үйлчлүүлэгч: " + order.customer.firstname
            else:
                customer = "Үйлчлүүлэгч: " + order.customer.mobile
        else:
            customer = "Үйлчлүүлэгч: ..........................."
        y = y + 30
        draw.text((30, y), customer, fill="black", font=unicode_font_26)

        signature = "Үйлчлүүлэгчийн гарын үсэг: "
        y = y + 30
        draw.text((30, y), signature, fill="black", font=unicode_font_26)

        tailbar = "Нэмэлт тайлбар: "
        y = y + 70
        draw.text((30, y), tailbar, fill="black", font=unicode_font_26)

        image.save("/home/tesoro/Tesoro_server/backend/media/orderPrint/" + str(order.id) + "-text.jpg")
        im = Image.open("/home/tesoro/Tesoro_server/backend/media/orderPrint/" + str(order.id) + "-text.jpg")
        # if image is not 1-bit, convert it
        if im.mode != '1':
            im = im.convert('1')
        # if image width is not a multiple of 8 pixels, fix that
        if im.size[0] % 8:
            im2 = Image.new('1', (im.size[0] + 8 - im.size[0] % 8, im.size[1]), 'white')
            im2.paste(im, (0, 0))
            im = im2

        # Invert image, via greyscale for compatibility
        #  (no, I don't know why I need to do this)
        im = ImageOps.invert(im.convert('L'))
        # ... and now convert back to single bit
        im = im.convert('1')

        job = [(b''.join((bytearray(b'\x1d\x76\x30\x00'),
                    struct.pack('2B', int(im.size[0] / 8 % 256),
                                int(im.size[0] / 8 / 256)),
                    struct.pack('2B', int(im.size[1] % 256),
                                int(im.size[1] / 256)),
                    im.tobytes()))),
                b'\x1b\r\n',
                b'\x1b\r\n',
                b'\x1b\r\n',
                b'\x1b\r\n',
                b'\x1b\x69'
            ]

        for b in job:
            mysocket.sendall(b)
        mysocket.close()
        r = '{"success":true}'
        r = json.dumps(r)
        r = json.loads(r)
        return HttpResponse(r)
    else:
        r = '{"errorCode":"Please insert values!", "success":false}'
        r = json.dumps(r)
        r = json.loads(r)
        return HttpResponse(r)