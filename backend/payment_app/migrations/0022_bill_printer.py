# Generated by Django 3.2 on 2023-02-09 06:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('payment_app', '0021_alter_bill_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='bill',
            name='printer',
            field=models.CharField(blank=True, max_length=1, null=True),
        ),
    ]
