# Generated by Django 4.1.6 on 2023-03-18 02:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("payment_app", "0025_merge_20230215_2105"),
    ]

    operations = [
        migrations.AddField(
            model_name="payment",
            name="is_deleted",
            field=models.BooleanField(default=0),
        ),
    ]
