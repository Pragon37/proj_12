from django.db import models
from django.conf import settings
from django.utils import timezone


class Status(models.Model):
    eventIsOver = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.eventIsOver}"


class Client(models.Model):

    firstName = models.CharField(max_length=25)
    lastName = models.CharField(max_length=25)
    email = models.EmailField("email address", max_length=40, unique=True)
    phone = models.CharField(max_length=20)
    mobile = models.CharField(max_length=20)
    companyName = models.CharField(max_length=250)
    dateCreated = models.DateTimeField(default=timezone.now)
    dateUpdated = models.DateTimeField(default=timezone.now)
    salesContact = models.ForeignKey(
        to=settings.AUTH_USER_MODEL,
        on_delete=models.PROTECT,
        related_name="clients",
        limit_choices_to={"isSale": True},
    )

    def __str__(self):
        return f"{self.pk, self.firstName, self.lastName, self.salesContact.username}"


class Contract(models.Model):

    salesContact = models.ForeignKey(
        to=settings.AUTH_USER_MODEL,
        on_delete=models.PROTECT,
        related_name="contracts",
        limit_choices_to={"isSale": True},
    )
    client = models.ForeignKey(
        to=Client, on_delete=models.PROTECT, related_name="client_contracts"
    )
    dateCreated = models.DateTimeField(default=timezone.now)
    dateUpdated = models.DateTimeField(default=timezone.now)
    status = models.BooleanField(default=False)
    amount = models.FloatField(default=0)
    paiementDue = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return (f"{self.pk, self.salesContact.username}"
                f"{self.client.pk, self.client.firstName}"
                f"{ self.client.lastName, self.amount}")


class Event(models.Model):

    client = models.ForeignKey(
        to=Client, on_delete=models.PROTECT, related_name="client_events"
    )
    dateCreated = models.DateTimeField(default=timezone.now)
    dateUpdated = models.DateTimeField(default=timezone.now)
    supportContact = models.ForeignKey(
        to=settings.AUTH_USER_MODEL,
        on_delete=models.PROTECT,
        related_name="support_events",
        limit_choices_to={"isSupport": True},
    )
    eventStatus = models.ForeignKey(
        to=Status, on_delete=models.PROTECT, related_name="status_events"
    )
    attendees = models.IntegerField(default=0)
    eventDate = models.DateTimeField(default=timezone.now)
    notes = models.TextField(max_length=8192, blank=True)

    def __str__(self):
        return (f"{self.pk, self.supportContact.username}"
                f"{self.client.pk, self.client.firstName}"
                f"{self.client.lastName, self.eventStatus.eventIsOver}")
