# Generated by Django 2.0.2 on 2018-06-16 19:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0004_course_category'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='category',
            field=models.CharField(default='', max_length=20, verbose_name='后端开发'),
        ),
    ]
