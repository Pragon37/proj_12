# Generated by Django 4.0.4 on 2022-05-05 12:59

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Client',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('firstName', models.CharField(max_length=25)),
                ('lastName', models.CharField(max_length=25)),
                ('email', models.EmailField(max_length=40, unique=True, verbose_name='email address')),
                ('phone', models.CharField(max_length=20)),
                ('mobile', models.CharField(max_length=20)),
                ('companyName', models.CharField(max_length=250)),
                ('dateCreated', models.DateTimeField(default=django.utils.timezone.now)),
                ('dateUpdated', models.DateTimeField(default=django.utils.timezone.now)),
            ],
        ),
        migrations.CreateModel(
            name='Contract',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('dateCreated', models.DateTimeField(default=django.utils.timezone.now)),
                ('dateUpdated', models.DateTimeField(default=django.utils.timezone.now)),
                ('status', models.BooleanField(default=False)),
                ('amount', models.FloatField(default=0)),
                ('paiementDue', models.DateTimeField(default=django.utils.timezone.now)),
            ],
        ),
        migrations.CreateModel(
            name='Status',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('eventIsOver', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('dateCreated', models.DateTimeField(default=django.utils.timezone.now)),
                ('dateUpdated', models.DateTimeField(default=django.utils.timezone.now)),
                ('attendees', models.IntegerField(default=0)),
                ('eventDate', models.DateTimeField(default=django.utils.timezone.now)),
                ('notes', models.TextField(blank=True, max_length=8192)),
                ('client', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='client_events', to='core.client')),
                ('eventStatus', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='status_events', to='core.status')),
            ],
        ),
    ]