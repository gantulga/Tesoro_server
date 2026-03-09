from django.test import TestCase
from product_app.models import Product_category, Product
import MySQLdb
# Create your tests here.

store = [
    {
        "register": "РР78062368",
        "name": "ЦЭРЭНДОРЖ ОЮУНГЭРЭЛ",
        "noat": False,
        "ttd": "610140260471"
    },
    {
        "register": "8352518",
        "name": "Чиглэл нар",
        "noat": True,
        "ttd": "13202240863"
    },
    {
        "register": "4403908",
        "name": "Согоотын дэлгэрэх",
        "noat": False,
        "ttd": "26100284208"
    },
    {
        "register": "5167647-2",
        "name": "Анун-Тотал",
        "noat": False,
        "ttd": ""
    },
    {
        "register": "2075083",
        "name": "Алтантариа",
        "noat": True,
        "ttd": "76900823237"
    },
    {
        "register": "ИЮ78090463",
        "name": "ЖАМБАЛДОРЖ МӨНХБАЯР",
        "noat": False,
        "ttd": "610181701483"
    },
    {
        "register": "8479097",
        "name": "Арвижих дистрибюшн",
        "noat": True,
        "ttd": "14200114356"
    },
    {
        "register": "6737064",
        "name": "Би Эм Би эко хүнс",
        "noat": True,
        "ttd": "21200495108"
    },
    {
        "register": "6830633",
        "name": "Сэнтрал коммерс",
        "noat": True,
        "ttd": "32200072928"
    },
    {
        "register": "4424271",
        "name": "Дүгэр төгс",
        "noat": True,
        "ttd": "63202304622"
    },
    {
        "register": "5167647-1",
        "name": "Тотал дистрибюшин-Ус, ундаа",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5573548",
        "name": "М АГРО",
        "noat": True,
        "ttd": "22101449537"
    },
    {
        "register": "5996317",
        "name": "Солар кэймп",
        "noat": True,
        "ttd": "65114876575"
    },
    {
        "register": "4420403",
        "name": "Макс өгөөж",
        "noat": True,
        "ttd": "82200198648"
    },
    {
        "register": "5123704",
        "name": "Хангалуунтрейд",
        "noat": True,
        "ttd": "42001000337"
    },
    {
        "register": "5253209",
        "name": "Доктор авто сүлжээ",
        "noat": True,
        "ttd": "18001121253"
    },
    {
        "register": "4279883",
        "name": "Зөв үр дүн",
        "noat": True,
        "ttd": "18100841786"
    },
    {
        "register": "4427505",
        "name": "Дэвжих гарьд аз",
        "noat": False,
        "ttd": "44200331442"
    },
    {
        "register": "6798489",
        "name": "МДН айраг",
        "noat": True,
        "ttd": "61200635804"
    },
    {
        "register": "4388135",
        "name": "Эрдмийт",
        "noat": True,
        "ttd": "82101451091"
    },
    {
        "register": "ОР72110706",
        "name": "БАЯНБААТАР БУЯН-АРВИЖИХ",
        "noat": True,
        "ttd": "610198391219"
    },
    {
        "register": "4194136",
        "name": "Талын монгол гүрэн",
        "noat": True,
        "ttd": "46100201322"
    },
    {
        "register": "2081253",
        "name": "Баярын од",
        "noat": True,
        "ttd": "56900858073"
    },
    {
        "register": "4373723",
        "name": "ЧЭС",
        "noat": True,
        "ttd": "27001080612"
    },
    {
        "register": "6099955",
        "name": "Агар юнайтед",
        "noat": True,
        "ttd": "26100310771"
    },
    {
        "register": "2822067",
        "name": "Жемтрейд",
        "noat": True,
        "ttd": "27001066112"
    },
    {
        "register": "ОЭ77120171",
        "name": "НҮҮДЭЛ АЛТАНШАТАР",
        "noat": False,
        "ttd": "610162092548"
    },
    {
        "register": "ХЖ77011412",
        "name": "ГОМБОСҮРЭН ГАНБААТАР",
        "noat": False,
        "ttd": "610120711788"
    },
    {
        "register": "ЧВ86050405",
        "name": "ХУЛАН",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ФМ90101363",
        "name": "ЦЭДЭНБАЛ АРИУНТУЯА",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ФМ80080304",
        "name": "АЛИМАА",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ФМ62113027",
        "name": "ЧУЛУУН ОЮУНТУЯА",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ФМ62032161",
        "name": "СУРАНХАР",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ФД69102423",
        "name": "ОЮУНДАРЬ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ФВ84040101",
        "name": "ЭРДЭНЭПҮРЭВ АРИУНТҮВШИН",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ФБ62041276",
        "name": "ШАГДАРСҮРЭН ЗОРИГТ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ФА94091819",
        "name": "ÁÀÄÐÀÕ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ФА94062844",
        "name": "СОЛОНГО",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ФА92062415",
        "name": "БИЛГҮҮН",
        "noat": False,
        "ttd": ""
    },
    {
        "register": "ФА02311704",
        "name": "Нямдаваа УРАНБИЛЭГ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "УМ89060462",
        "name": "МЯНГАНБУУ ОТГОНЖАРГАЛ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ТЖ84101601",
        "name": "ӨЛЗИЙЖАРГАЛ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ТЕ72090368",
        "name": "НООСОНХӨХ НЭРГҮЙ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ТГ85062810",
        "name": "ДИДАРСАНГАД БАТЦЭНГЭЛ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ТВ67091601",
        "name": "ЖАМБАЛДОРЖ ТУНГАЛАГ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "РУ89091414",
        "name": "БААТАРЖАЛБУУ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ОЭ80041711",
        "name": "ЦЭВЭЭН ОЧИРХҮҮ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ОР64100901",
        "name": "ХУМГАЛ ОТГОНЧИМЭГ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "НВ96112830",
        "name": "БИЛГҮҮН",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "НВ77032715",
        "name": "БАЛЖИРЦОГТ АЛТАНХАЙЧ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "НА77092079",
        "name": "ДОЛЖИНСОРДОГ БАМБАРУУШ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ИЮ91012404",
        "name": "АРИВЖИХ НОРЖМОО",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ИЭ83120505",
        "name": "ДАВААЖАРГАЛ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ИЭ81092009",
        "name": "ӨНӨРЖАРГАЛ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ИЭ69091764",
        "name": "ОЮУНЧИМЭГ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ИЭ64033069",
        "name": "ЖАМБАЛДОРЖ ЦЭЦГЭЭ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ИЦ74082361",
        "name": "ГҮРЖАВ МАНДАХ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ИХ85071002",
        "name": "АРИУНТУЯА",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ИТ70070313",
        "name": "СҮХБААТАР",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ЙС80111001",
        "name": "ДАВААСҮРЭН",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ИО80120706",
        "name": "ЭНХЧИМЭГ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ЗМ92091101",
        "name": "СҮГЛЭГМАА",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ЗК77092607",
        "name": "ТҮДЭВ БАТМӨНХ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ЕЙ85080901",
        "name": "НЭРГҮЙ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ГН81012718",
        "name": "МЯГМАРДОРЖ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ГМ73052800",
        "name": "ШИРНЭН БАДАМХАНД",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "ВМ72101708",
        "name": "ДОРЖСҮРЭН ЭНХБАЯР",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "АН85082008",
        "name": "БЭЭЖИН АЛТАНЗАГАС",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "АВ85022202",
        "name": "ЛХАМСҮРЭН ОРХОНТУУЛ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "7039801",
        "name": "Хүсэл тэмүүлэл цобис",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6998593",
        "name": "Өнгөт ган нерж",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6988318",
        "name": "Эм Эс Эн трейд",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6959229",
        "name": "Зост хайрхан оргил",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6955894",
        "name": "Сувд ДОНЭЗ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6943144",
        "name": "Төгс арвин ундарга",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6928277",
        "name": "Мөнгөт баян бэрх",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6910092",
        "name": "Цэгц баян",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6891454",
        "name": "Тогтүн стор",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6886973",
        "name": "Номин бизнес клуб баруун бүс",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6874681",
        "name": "Дэлгэр сонгун",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6847455",
        "name": "Сод эковинт",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6834736",
        "name": "Алтан гахай ган",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6737471",
        "name": "АМТАТ ТИМБЕР ХХК",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6736106",
        "name": "Номин бизнес клуб",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6684009",
        "name": "ӨҮЭМЖИ комфорт монголиа",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6669875",
        "name": "Уранган палас",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6656951",
        "name": "Төгс өсөх премиум",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6625223",
        "name": "Премиум майнинг сервисэс",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6587879",
        "name": "Дойт бродерс энд ко",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6547656",
        "name": "Алтан тариа фүүдс",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6531342",
        "name": "Дижитал концепт",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6512275",
        "name": "Рисайкл молл",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6493068",
        "name": "Элит буудай",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6477658",
        "name": "Дэлхийн глобал газрын зураг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6474462",
        "name": "Хүнрү",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6447953",
        "name": "Аврора хотел",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6418635",
        "name": "Ворлд смарт консалтинг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6415105",
        "name": "Шайнинг проспект",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6408788",
        "name": "Ультра Би Си Эй",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6361234",
        "name": "Найман шонхор",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6286267",
        "name": "Буман өгөөж",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6244092",
        "name": "Пи Си молл",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6235972",
        "name": "Гэрэгэ системс",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6225608",
        "name": "Миний дэлгүүр",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6216757",
        "name": "Мираторг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6197019",
        "name": "МК сторе трейдинг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6138969",
        "name": "Эм Си гранд",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6128289",
        "name": "Эй Юу трейд",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6101097",
        "name": "Прайм ван",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6100759",
        "name": "Айсторг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6050409",
        "name": "Артизан",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6049095",
        "name": "Касс молл",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6023894",
        "name": "Голден фүүдс",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5996821",
        "name": "ЕСКК",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5939666",
        "name": "Монголиа тоёоко инн",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5915198",
        "name": "Вивекавикториа",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5909775",
        "name": "Монова трейд",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5906261",
        "name": "Монголкореа сторе",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5850525",
        "name": "Чавххонгор",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5833396",
        "name": "Витафит дистрибюшн",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5731089",
        "name": "Гэрэгэ киоск",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5684854",
        "name": "Ангирзаяа",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5683351",
        "name": "Силкрөүт трейдинг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5677564",
        "name": "Ви интернэйшнл",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5666147",
        "name": "Си Би Эйч кэйр",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5666139",
        "name": "Эф Эм Си Жи глобал",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5644089",
        "name": "Амтат цамхаг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5621224",
        "name": "Электролайт",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5609658",
        "name": "ТЗТ трейд",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5578949",
        "name": "Зебра интернэшнл дистрибьюшн",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5577764",
        "name": "РОСТОРГ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5558603",
        "name": "Отгонбуянт хүрээ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5520584",
        "name": "Датакейр",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5516889",
        "name": "Фаерсэйфти экюпмэнт",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5506239",
        "name": "Шунхлайтрейдинг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5468361",
        "name": "Айтүүлс",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5463858",
        "name": "Си Эм Пи Ай",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5440718",
        "name": "ЮНИМАТ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5427185",
        "name": "ЯМСУБ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5392756",
        "name": "Бльюмон",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5388457",
        "name": "Юнивишн",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5322456",
        "name": "Борнфреш",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5294347",
        "name": "Редбулл",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5256011",
        "name": "Грандпринц",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5241901",
        "name": "Петростар",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5209633",
        "name": "ББТЭ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5187346",
        "name": "Херахолдинг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5180503",
        "name": "Нордлайн",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5178177",
        "name": "Дэдноёд",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5163765",
        "name": "Хануйцүүр",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5156858",
        "name": "Свийтрөүд",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5149037",
        "name": "Шангрила-Улаанбаатар хотел",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5112494",
        "name": "Монголбазальт",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5105935",
        "name": "Апутрейдинг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5088518",
        "name": "Клаймакс-Интернэшнл",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5074681",
        "name": "Дарьгангын өлзийт эрдэнэс",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5069491",
        "name": "Саранхаст",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5062519",
        "name": "Очирдагинас",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "5036895",
        "name": "ЮНИТЕЛ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4426738",
        "name": "Уудам үйлс",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4424476",
        "name": "Үйлст титэм",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4423909",
        "name": "Аястор мобайл",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4422333",
        "name": "Анусор",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4422007",
        "name": "Аясгалан гоо",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4421671",
        "name": "Элбэг өлзий",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4421663",
        "name": "Үндсэн бэрх",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4421078",
        "name": "ТЭБАСА",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4421043",
        "name": "Агула абу",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4420608",
        "name": "Фрута профит трэйдинг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4419421",
        "name": "Пийс лайт дилайт",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4417771",
        "name": "Грийн гоурмет",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4416643",
        "name": "Хантүм глобал",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4416511",
        "name": "Халиун эрдэнэс ундарга",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4416414",
        "name": "Өвч бүрэн импекс",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4415973",
        "name": "Памир уул",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4415914",
        "name": "Хур зүсэр",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4414365",
        "name": "Гадо элбэг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4414276",
        "name": "Тэ наран жин",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4414012",
        "name": "Аранзал партнерс",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4412265",
        "name": "Мелинда",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4411803",
        "name": "Дүйчин равжаа",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4411617",
        "name": "Нар энх ану",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4411099",
        "name": "Буян тэгш дүүрэн",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4410637",
        "name": "Монос орхон фарм",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4409329",
        "name": "Их буудайн хүнс",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4408829",
        "name": "Макс строй",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4408101",
        "name": "Гайхамшигт алтан алим",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4407849",
        "name": "Сэкиз",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4407091",
        "name": "Бүрэн будагт",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4406869",
        "name": "Олон гурил",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4405668",
        "name": "Билгүүн өглөө",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4404998",
        "name": "Дөт кредит",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4404122",
        "name": "МАЭМ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4403541",
        "name": "Эрдэнэс бьюти",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4401972",
        "name": "Баясгалант аялагч",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4401034",
        "name": "АНАНДАЯА",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4400399",
        "name": "АЗ ЛАГШМА",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4398645",
        "name": "Гүрсоронзон",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4397738",
        "name": "Урансархиа",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4396286",
        "name": "Тэнүүнтөвөргөөн",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4395719",
        "name": "Маамуу-Электроникс",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4393481",
        "name": "Буучийн удам",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4392124",
        "name": "Зөөлөннутаг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4391918",
        "name": "Баян өвөр булаг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4390903",
        "name": "Нөмрөгшархай",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4390547",
        "name": "Цахиурт-Од",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4388321",
        "name": "ПСМАА",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4388143",
        "name": "Дабльголд",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4387945",
        "name": "Тайжбүргэд",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4387821",
        "name": "Заяасор",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4387481",
        "name": "Төгстэгш бурзайх",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4385667",
        "name": "Инжбаяр",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4384865",
        "name": "Анхлан-Аз",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4384776",
        "name": "Түмэн-Үзэг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4384687",
        "name": "Номиндорж",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4381963",
        "name": "ТҮШТЭМ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4381599",
        "name": "Оргилхужирт",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4378377",
        "name": "Хосжандаг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4377834",
        "name": "Авзагазэндэм",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4377591",
        "name": "Баясгалантхангай",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4376803",
        "name": "Бат-Ач",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4376153",
        "name": "Өгөөмөртамир",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4375076",
        "name": "Бэрчингэл",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4373731",
        "name": "Асгатын гол",
        "noat": False,
        "ttd": ""
    },
    {
        "register": "4373642",
        "name": "Миний-Ану",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4373103",
        "name": "Шимгроу",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4372875",
        "name": "ЭРСОМ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4372557",
        "name": "Базарын гол",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4371194",
        "name": "Зулзганцахирут",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4369521",
        "name": "Дарханжинст уул",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4369165",
        "name": "БНЧБ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4368746",
        "name": "Идэрбаялаг",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4367995",
        "name": "КСМ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4367138",
        "name": "Мэндгэрэл",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4366921",
        "name": "Жээнди",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4366794",
        "name": "ПУБА",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4279913",
        "name": "Тохь комплекс",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4267362",
        "name": "Хурниадтрейд",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4266145",
        "name": "Грийнмагнолиа",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "4258533",
        "name": "Маргад-Өртөө",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "3323692",
        "name": "Хатан зөгий трейд",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "3318826",
        "name": "Үүдийн шонхор",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2890801",
        "name": "ГУРВАНМӨНХ ХААН",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2884208",
        "name": "ТУЛГА ТӨХӨӨРӨМЖ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2873877",
        "name": "Хаанпалас",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2870142",
        "name": "Төгсбурзай",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2870134",
        "name": "Ойгон-Арвижих",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2866064",
        "name": "ЦЭМИС",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2840936",
        "name": "МТ чингэлтэй",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2816083",
        "name": "Эрдэнэт чанар дистрибюшн",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2802813",
        "name": "Эрдэнэт ус дулаан түгээх сүлжээ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2776022",
        "name": "ХКҮ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2737825",
        "name": "Эрдэнэтхүнс трейд",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2737329",
        "name": "Номадсхоспиталити",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2731118",
        "name": "Авзага",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2729695",
        "name": "Жүр-үр",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2724715",
        "name": "Тод-Өнгө",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2717484",
        "name": "Жачи-Өлзий",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2712512",
        "name": "Шилэнхийц",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2708558",
        "name": "Монос-Улаанбаатар",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2688557",
        "name": "Эрдэнэтийн дулааны цахилгаан станц",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2688417",
        "name": "Эрдэнэтбулганы цахилгаан түгээх сүлжээ",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2679396",
        "name": "Ньюбулл",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2619032",
        "name": "Скаймедиа корпораци",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2598663",
        "name": "Чигэхү",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2580136",
        "name": "Торгоны зам хангамж",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2563401",
        "name": "ВЭНС",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2548429",
        "name": "Таванбогд интернэйшнл",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2547171",
        "name": "Синусдочи",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2116545",
        "name": "Монголшуудан",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2100878",
        "name": "Куйн",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2077108",
        "name": "Сүү",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2075261",
        "name": "НИК",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2074575",
        "name": "Талхчихэр",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2072572",
        "name": "Мобиком корпораци",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2057441",
        "name": "АЛТАНЖОЛОО ТРЕЙД",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "2056836",
        "name": "Цахиур",
        "noat": True,
        "ttd": ""
    },
    {
        "register": "6191592",
        "name": "Максимус дистрибьюшн",
        "noat": True,
        "ttd": "97100272641"
    },
    {
        "register": "2027399",
        "name": "Ноён уул эрдэнэ",
        "noat": True,
        "ttd": "56900850366"
    },
    {
        "register": "5167647",
        "name": "Тотал дистрибюшин",
        "noat": True,
        "ttd": "20101016486"
    },
    {
        "register": "5922364",
        "name": "Даянсофт ХХК",
        "noat": True,
        "ttd": "34101374585"
    }
]

from product_app.models import Store
for company in store:
    have_check = Store.objects.filter(register=company['register'])
    if have_check:
        print("Already registered")
    else:
        store = Store.objects.create(register=company['register'], name=company['name'], noat_payer=company['noat'], ttd=company['ttd'])
        print(store)