from rest_framework.serializers import ModelSerializer

from .models import Client, Contract, Event


class ClientSerializer(ModelSerializer):
    class Meta:
        model = Client
        fields = [
            "pk",
            "firstName",
            "lastName",
            "email",
            "phone",
            "mobile",
            "companyName",
            "dateCreated",
            "dateUpdated",
            "salesContact",
        ]


class ContractSerializer(ModelSerializer):
    class Meta:
        model = Contract
        fields = [
            "pk",
            "salesContact",
            "client",
            "dateCreated",
            "dateUpdated",
            "status",
            "amount",
            "paiementDue",
        ]


class EventSerializer(ModelSerializer):
    class Meta:
        model = Event
        fields = [
            "pk",
            "client",
            "dateCreated",
            "dateUpdated",
            "supportContact",
            "eventStatus",
            "attendees",
            "eventDate",
            "notes",
        ]
