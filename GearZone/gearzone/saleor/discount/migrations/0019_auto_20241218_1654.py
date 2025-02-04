# Generated by Django 2.2.9 on 2024-12-18 09:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('discount', '0018_auto_20190827_0315'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sale',
            name='value',
            field=models.DecimalField(decimal_places=0, default=0, max_digits=12),
        ),
        migrations.AlterField(
            model_name='voucher',
            name='discount_value',
            field=models.DecimalField(decimal_places=0, max_digits=12),
        ),
        migrations.AlterField(
            model_name='voucher',
            name='min_spent_amount',
            field=models.DecimalField(blank=True, decimal_places=0, max_digits=12, null=True),
        ),
    ]
