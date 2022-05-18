from rest_framework.permissions import BasePermission
from .models import Client, Status
from users.models import User

""" To check that a user belongs to django administration group 'SalesGroup':
    current_user = request.user
    isSale = current_user.groups.filter(name = 'SalesGroup').exists()
    print('SALESCONTACT = ', sales_contact)
    print('REQUEST_USER = ', request.user)
    print('isCurrentUserSalesContact ===== ', isCurrentUserSalesContact)
    print('SUPPORTCONTACT = ', support_contact)
"""


class AllowAccessToClientOrContract(BasePermission):
    """Sales can view and update assigned customers or contracts."""

    def has_object_permission(self, request, view, obj):
        current_user = request.user
        isSale = current_user.groups.filter(name="SalesGroup").exists()
        salesContactId = obj.salesContact_id
        sales_contact = User.objects.get(pk=salesContactId).username
        isCurrentUserSalesContact = f"{request.user}" == sales_contact
        return isCurrentUserSalesContact and isSale


class AllowAccessToEvent(BasePermission):
    """Sales can view and update client event."""

    def has_object_permission(self, request, view, obj):
        clientId = obj.client_id
        sales_contact = Client.objects.get(pk=clientId).salesContact
        supportContactId = obj.supportContact_id
        eventStatusId = obj.eventStatus_id
        eventIsOver = Status.objects.get(pk=eventStatusId).eventIsOver
        support_contact = User.objects.get(pk=supportContactId).username
        isCurrentUserSalesContact = f"{request.user}" == f"{sales_contact}"
        print('ISCURRENTSALESCONTACT', isCurrentUserSalesContact)
        print('SALESCONTACT = ', sales_contact)
        print('CURRENT_USER = ', request.user)
        isCurrentUserSupportContact = f"{request.user}" == support_contact
        return isCurrentUserSalesContact or (
            isCurrentUserSupportContact and not eventIsOver
        )
