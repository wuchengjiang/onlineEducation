# Generated by Django 2.0.2 on 2018-06-22 07:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0004_auto_20180621_1303'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailverifyrecord',
            name='send_type',
            field=models.CharField(blank=True, choices=[('register', '注册'), ('forget', '找回密码'), ('update_email', '修改邮箱')], max_length=50, null=True),
        ),
    ]
