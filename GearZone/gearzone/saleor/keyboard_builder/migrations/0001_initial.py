# Generated by Django 2.2.9 on 2025-01-10 22:12

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('image', models.ImageField(upload_to='products/')),
                ('category', models.CharField(choices=[('keycap', 'Keycap'), ('switch', 'Switch'), ('kit', 'Kit')], max_length=50)),
            ],
        ),
    ]
