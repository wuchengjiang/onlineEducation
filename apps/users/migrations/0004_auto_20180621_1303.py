# Generated by Django 2.0.2 on 2018-06-21 13:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_auto_20180621_1236'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailverifyrecord',
            name='code',
            field=models.CharField(blank=True, max_length=20, null=True, verbose_name='验证码'),
        ),
        migrations.AlterField(
            model_name='emailverifyrecord',
            name='email',
            field=models.EmailField(blank=True, max_length=50, null=True, verbose_name='邮箱'),
        ),
        migrations.AlterField(
            model_name='emailverifyrecord',
            name='send_type',
            field=models.CharField(blank=True, choices=[('register', '注册'), ('forget', '找回密码'), ('update_email', '修改邮箱')], max_length=10, null=True),
        ),
    ]
