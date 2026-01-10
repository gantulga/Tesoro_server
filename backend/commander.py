import os
import requests
import time
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "tesoro_project.settings")
import django
django.setup()
from product_app.models import Product
from datetime import datetime

data = [
    {
        "name": "Bluemoon"
    },
    {
        "name": "Chass"
    },
    {
        "name": "Guinness 500ml"
    },
    {
        "name": "Harbin ice 500ml"
    },
    {
        "name": "Heineken 0.33"
    },
    {
        "name": "Hoegaarden"
    },
    {
        "name": "Kaltenberg 500ml"
    },
    {
        "name": "Kirin Ichiban"
    },
    {
        "name": "Kloud"
    },
    {
        "name": "Krush"
    },
    {
        "name": "Miller 500ml"
    },
    {
        "name": "Sengur"
    },
    {
        "name": "Terra"
    },
    {
        "name": "Tsingtao"
    },
    {
        "name": "Ub Hero"
    },
    {
        "name": "Сибирская корона 500ml"
    },
    {
        "name": "Singha"
    },
    {
        "name": "Jack Single barrel 700ml"
    },
    {
        "name": "Jack Daniel's Fire 50ml"
    },
    {
        "name": "Jack Daniel's Honey 50ml"
    },
    {
        "name": "Jameson 50ml"
    },
    {
        "name": "Wild Turkey 50ml"
    },
    {
        "name": "JP Chenet X.O"
    },
    {
        "name": "Tanqueray"
    },
    {
        "name": "Barrister 50ml"
    },
    {
        "name": "Tanqueray 50ml"
    },
    {
        "name": "Tenjaku 50ml"
    },
    {
        "name": "Bailey's 750ml"
    },
    {
        "name": "Bailey's 50ml"
    },
    {
        "name": "Jagermeister 50ml"
    },
    {
        "name": "Kahlua 50ml"
    },
    {
        "name": "Sambuca 50ml"
    },
    {
        "name": "Altos del Plata Red 750ml"
    },
    {
        "name": "Freixenet Mia"
    },
    {
        "name": "Louis Eschenauer Red 750ml"
    },
    {
        "name": "Piccini Pinocchio Rosso"
    },
    {
        "name": "Altos del Plata Red 125ml"
    },
    {
        "name": "Domaine La Baume Red 125ml"
    },
    {
        "name": "Freixenet Mia 100ml"
    },
    {
        "name": "Louis Eschenauer Red 125ml"
    },
    {
        "name": "Montmeyrac 750ml"
    },
    {
        "name": "Piccini Pinocchio Rosso 100ml"
    },
    {
        "name": "Freixenet Mia Rose"
    },
    {
        "name": "Domaine La Baume Rose 100"
    },
    {
        "name": "Freixenet Mia rose 100ml"
    },
    {
        "name": "Captain Morgan spiced gold 1000ml"
    },
    {
        "name": "BACARDI CARTA NEGRA RUM 700ml"
    },
    {
        "name": "Bacardi Superior 50ml"
    },
    {
        "name": "Captain Morgan spiced gold 50ml"
    },
    {
        "name": "Ballantine's Finest 750ml"
    },
    {
        "name": "Crown Royal 750ml"
    },
    {
        "name": "Ballantine's Finest 50ml"
    },
    {
        "name": "Johnnie Walker Black 50ml"
    },
    {
        "name": "Johnnie Walker Red 50ml"
    },
    {
        "name": "Freixenet Mia Mojito"
    },
    {
        "name": "Freixenet Mia Mojito 100ml"
    },
    {
        "name": "Pepe Lopez Gold 750ml"
    },
    {
        "name": "Pepe Lopez Gold 50ml"
    },
    {
        "name": "Aperol 50ml"
    },
    {
        "name": "Campari 50ml"
    },
    {
        "name": "Martini Bianco 50ml"
    },
    {
        "name": "Martini Extra Dry 50ml"
    },
    {
        "name": "Martini Rosso 50ml"
    },
    {
        "name": "Beluga 50ml"
    },
    {
        "name": "Belvedere 50ml"
    },
    {
        "name": "Ciroc 50ml"
    },
    {
        "name": "Finlandia 50ml"
    },
    {
        "name": "Koskenkorva 50ml"
    },
    {
        "name": "Smirnoff red 50ml"
    },
    {
        "name": "Velvet 50ml"
    },
    {
        "name": "Altos del Plata White 750ml"
    },
    {
        "name": "Louis Eschenauer White 750ml"
    },
    {
        "name": "Altos del Plata White 125ml"
    },
    {
        "name": "Domaine La Baume White 125ml"
    },
    {
        "name": "Louis Eschenauer White 125ml"
    },
    {
        "name": "Maison Castle"
    },
    {
        "name": "Avatar"
    },
    {
        "name": "Passion fruit"
    },
    {
        "name": "Power"
    },
    {
        "name": "Cola Zero"
    },
    {
        "name": "Dayao"
    },
    {
        "name": "Fever-Tree"
    },
    {
        "name": "Fruit combo tea"
    },
    {
        "name": "SanBenedetto sparkling 500ml"
    },
    {
        "name": "SanBenedetto still 500ml"
    },
    {
        "name": "Экос"
    },
    {
        "name": "Karaage"
    },
    {
        "name": "Spicy Tonkotsu ramen"
    },
    {
        "name": "Tonkotsu"
    },
    {
        "name": "Tonkotsu ramen"
    },
    {
        "name": "Бүдэжигэ 2хүн"
    },
    {
        "name": "Гоймон"
    },
    {
        "name": "Догбугги"
    },
    {
        "name": "Жэюүгбуггим 1 хүн"
    },
    {
        "name": "Калбижим 1хүн"
    },
    {
        "name": "Калбитан 2хүн"
    },
    {
        "name": "Кимбаб"
    },
    {
        "name": "Кимчи сангёбсал 2хүн"
    },
    {
        "name": "Миёогтой шөл"
    },
    {
        "name": "Тактуритан 1 хүн"
    },
    {
        "name": "Тэнжанжигэ"
    },
    {
        "name": "Таккалби"
    },
    {
        "name": "Өндөгний ороомог"
    },
    {
        "name": "Tesoro нэрийн стэйк"
    },
    {
        "name": "Гахайн хавирга"
    },
    {
        "name": "Ногоотой хуурга"
    },
    {
        "name": "Салмон загас"
    },
    {
        "name": "стейк"
    },
    {
        "name": "Теляпи загас"
    },
    {
        "name": "Терияки тахиа"
    },
    {
        "name": "Үхрийн шарсан хавирга"
    },
    {
        "name": "Хонины шарсан хавирга"
    },
    {
        "name": "Чихэрлэг тахиа"
    },
    {
        "name": "Шаржигнуур тахиа"
    },
    {
        "name": "Шаржигнуур тахиа"
    },
    {
        "name": "Шарсан элэг"
    },
    {
        "name": "Якисоба"
    },
    {
        "name": "Яргай загас"
    },
    {
        "name": "Mushroom (taglatil) pasta"
    },
    {
        "name": "Бологнайз паста"
    },
    {
        "name": "Бүлгүги пицца"
    },
    {
        "name": "Кето пицца"
    },
    {
        "name": "Махтай пицца"
    },
    {
        "name": "Салям пицца"
    },
    {
        "name": "Тахианы махтай пицца"
    },
    {
        "name": "Туна пицца"
    },
    {
        "name": "Холимог пицца"
    },
    {
        "name": "Tako"
    },
    {
        "name": "Tesoro нэрийн салат"
    },
    {
        "name": "Бууцайтай үхрийн хэлэн салат"
    },
    {
        "name": "Гүзээний салат"
    },
    {
        "name": "Огурцый сармис цууны салат"
    },
    {
        "name": "Салат зууш"
    },
    {
        "name": "Шинэ ногооны салат"
    },
    {
        "name": "Ананастай тахианы салат"
    },
    {
        "name": "Монгол махан цуглуулга (2-3)"
    },
    {
        "name": "Солонгос хоолны цуглуулга 2-3"
    },
    {
        "name": "Солонгос хоолны цуглуулга 4-5"
    },
    {
        "name": "Тахианы махан цуглуулга 2-3"
    },
    {
        "name": "Хавирганы махан цуглуулга (2-3)"
    },
    {
        "name": "Хавирганы махан цуглуулга (4-5)"
    },
    {
        "name": "Korean set"
    },
    {
        "name": "bread"
    },
    {
        "name": "Peanuts"
    },
    {
        "name": "Бин"
    },
    {
        "name": "Бресс"
    },
    {
        "name": "Будаа"
    },
    {
        "name": "Зууш"
    },
    {
        "name": "Мантуу"
    },
    {
        "name": "Сийр"
    },
    {
        "name": "Шарсан төмс 2хүн"
    },
    {
        "name": "Өндөг далайн байцаатай шөл"
    },
    {
        "name": "Өндөг помидор шөл"
    },
    {
        "name": "Сонгинотой франц шөл"
    },
    {
        "name": "Удон гоймонтой шөл"
    },
    {
        "name": "Бүлгүгги 1хүн"
    },
    {
        "name": "Камжатан 1хүн"
    },
    {
        "name": "Рабугги"
    },
    {
        "name": "Шарсан банш"
    },
    {
        "name": "Тойгны шөл"
    },
    {
        "name": "Alpen gold"
    },
    {
        "name": "Nuts"
    }
]

for i in data:
    product = Product.objects.filter(name=i['name'])
    if product:
        product[0].enabled = False
        product[0].save()
        print(product[0].name, product[0].enabled)
