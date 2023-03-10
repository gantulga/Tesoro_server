# Generated by Django 3.2 on 2023-02-27 02:26

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('product_app', '0024_auto_20230227_1021'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='product',
            name='unit_size',
        ),
        migrations.AlterField(
            model_name='product',
            name='gramm',
            field=models.PositiveIntegerField(blank=True, null=True, verbose_name='Хэдэн граммын бүтээгдэхүүн вэ?'),
        ),
        migrations.AlterField(
            model_name='product',
            name='same_commodity',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='same_products', to='product_app.commodity', verbose_name='Материалруу хөрвүүлвэл ямар материал болох вэ?'),
        ),
    ]
