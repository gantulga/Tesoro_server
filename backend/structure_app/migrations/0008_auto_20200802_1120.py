# Generated by Django 3.0.2 on 2020-08-02 03:20

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('structure_app', '0007_client_room_clean'),
    ]

    operations = [
        migrations.RenameField(
            model_name='client',
            old_name='free',
            new_name='room_free',
        ),
    ]
