# Generated by Django 4.1.6 on 2023-03-24 09:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("structure_app", "0025_error_list_created_at_error_list_created_by"),
    ]

    operations = [
        migrations.AddField(
            model_name="shift_work",
            name="finished_at",
            field=models.DateTimeField(blank=True, null=True),
        ),
    ]
