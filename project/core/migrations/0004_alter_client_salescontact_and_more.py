# Generated by Django 4.0.4 on 2022-05-12 08:23

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('core', '0003_alter_contract_salescontact'),
    ]

    operations = [
        migrations.AlterField(
            model_name='client',
            name='salesContact',
            field=models.ForeignKey(limit_choices_to={'isSale': True}, on_delete=django.db.models.deletion.PROTECT, related_name='clients', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='contract',
            name='salesContact',
            field=models.ForeignKey(limit_choices_to={'isSale': True}, on_delete=django.db.models.deletion.PROTECT, related_name='contracts', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='event',
            name='supportContact',
            field=models.ForeignKey(limit_choices_to={'isSupport': True}, on_delete=django.db.models.deletion.PROTECT, related_name='support_events', to=settings.AUTH_USER_MODEL),
        ),
    ]
