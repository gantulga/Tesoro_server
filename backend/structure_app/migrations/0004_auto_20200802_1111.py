# Generated by Django 3.0.2 on 2020-08-02 03:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('structure_app', '0003_auto_20200802_1106'),
    ]

    operations = [
        migrations.AlterField(
            model_name='client',
            name='division',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='clients', to='structure_app.Division'),
        ),
    ]
