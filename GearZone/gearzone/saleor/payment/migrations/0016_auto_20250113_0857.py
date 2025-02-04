# Generated by Django 2.2.9 on 2025-01-13 01:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('payment', '0015_auto_20241218_1654'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='charge_status',
            field=models.CharField(choices=[('not-charged', 'Cash On Delivery(COD)'), ('fully-charged', 'Payment')], default='not-charged', max_length=20),
        ),
    ]
