# Generated by Django 2.2.9 on 2025-01-13 02:07

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='BuildKeyboardSlide',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255, verbose_name='Title')),
                ('image', models.ImageField(upload_to='slides/', verbose_name='Slide Image')),
                ('order', models.PositiveIntegerField(default=0, verbose_name='Order')),
            ],
            options={
                'verbose_name': 'Build Keyboard Slide',
                'verbose_name_plural': 'Build Keyboard Slides',
                'ordering': ['order'],
            },
        ),
    ]
