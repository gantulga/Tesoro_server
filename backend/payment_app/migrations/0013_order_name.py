# Generated by Django 3.1.4 on 2021-08-30 03:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('payment_app', '0012_remove_order_detial_temp'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='name',
            field=models.TextField(blank=True, null=True),
        ),
    ]
