# Generated by Django 3.1.4 on 2021-07-02 09:27

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('product_app', '0007_auto_20210629_1014'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='whole',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='fractions', to='product_app.product'),
        ),
    ]
