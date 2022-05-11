from rest_framework.viewsets import ModelViewSet
from django_filters.rest_framework import DjangoFilterBackend
 
from .models import Client, Contract, Event
from .serializers import ClientSerializer, ContractSerializer, EventSerializer
from rest_framework.permissions import DjangoModelPermissions
from .permissions import AllowAccessToClientOrContract, AllowAccessToEvent

class ClientViewset(ModelViewSet):
 
    serializer_class = ClientSerializer
    permission_classes = [DjangoModelPermissions, AllowAccessToClientOrContract]
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['lastName', 'email']

    def get_queryset(self):
        return Client.objects.all()

class ContractViewset(ModelViewSet):
 
    serializer_class = ContractSerializer
    permission_classes = [DjangoModelPermissions, AllowAccessToClientOrContract]
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['client__lastName', 'client__email', 'dateCreated', 'amount']

    def get_queryset(self):
        return Contract.objects.all()

class EventViewset(ModelViewSet):
 
    serializer_class = EventSerializer
    permission_classes = [DjangoModelPermissions, AllowAccessToEvent]
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['client__lastName', 'client__email']

    def get_queryset(self):
        return Event.objects.all()