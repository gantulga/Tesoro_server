# Generated by Django 3.1.4 on 2021-07-24 02:25

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('product_app', '0013_auto_20210724_1022'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='ingredient_product',
            name='size_type',
        ),
    ]
