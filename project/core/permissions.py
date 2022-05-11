from django.shortcuts import get_object_or_404
from rest_framework.permissions import SAFE_METHODS, IsAuthenticated, BasePermission
from .models import Client, Contract, Event
from users.models import User

""" To check that a user belongs to django administration group 'SalesGroup':
    current_user = request.user
    isSale = current_user.groups.filter(name = 'SalesGroup').exists()
"""

class AllowAccessToClientOrContract(BasePermission):
    """Sales can view and update assigned customers or contracts."""

    def has_object_permission(self, request, view, obj):
        current_user = request.user
        isSale = current_user.groups.filter(name = 'SalesGroup').exists()
        salesContactId = obj.salesContact_id
        sales_contact = User.objects.get(pk=salesContactId).username
        print('SALESCONTACT = ', sales_contact)
        print('REQUEST_USER = ', request.user)
        isCurrentUserSalesContact = f'{request.user}' == sales_contact
        print('isCurrentUserSalesContact ===== ', isCurrentUserSalesContact)
        return isCurrentUserSalesContact and isSale

class AllowAccessToEvent(BasePermission):
    """Sales can view and update client event."""

    def has_object_permission(self, request, view, obj):
        clientId = obj.client_id
        print('OBJ = ', obj)
        sales_contact = Client.objects.get(pk=clientId).salesContact
        supportContactId = obj.supportContact_id
        support_contact = User.objects.get(pk=supportContactId).username
        print('SALESCONTACT = ', sales_contact)
        print('SUPPORTCONTACT = ', support_contact)
        print('REQUEST_USER = ', request.user)
        isCurrentUserSalesContact = f'{request.user}' == f'{sales_contact}'
        isCurrentUserSupportContact = f'{request.user}' == support_contact
        print('isCurrentUserSalesContact ===== ', isCurrentUserSalesContact)
        return isCurrentUserSalesContact or isCurrentUserSupportContact

        # salesContactId = obj.salesContact_id
        # sales_contact = User.objects.get(pk=salesContactId).username
        # print('SALESCONTACT = ', sales_contact)
        # print('REQUEST_USER = ', request.user)
        # isCurrentUserSalesContact = f'{request.user}' == sales_contact
        # print('isCurrentUserSalesContact ===== ', isCurrentUserSalesContact)
        # return isCurrentUserSalesContact

        # if f'{request.user}' == 'AnonymousUser':
        #     return False

        # if hasattr(obj, 'project_id'):
        #     """This is an issue"""
        #     project = obj.project_id
        # elif hasattr(obj, 'issue'):
        #     """This is a comment"""
        #     project = obj.issue.project_id

        # """aborts if Client does not exist"""
        # get_object_or_404(Client, pk=project)

        #         project_author = Projects.objects.get(pk=project).author_user
        #         project_contributors = Contributors.objects.filter(project=project).values_list('user__user_name', flat=True)

        #         isobjectauthor = request.user == obj.author_user
        #         isprojectauthor = request.user == project_author
        #         isprojectcontributors = f'{request.user}' in project_contributors

        #         if request.method in self.edit_methods:
        #             return isobjectauthor
        #         else:
        #             return isprojectauthor or isprojectcontributors

        # class AllowAuthorEditOrReadOnly(BasePermission):
        #     edit_methods = ("PUT", "PATCH", "DELETE", )
        #     create_methods = ("POST", )

        #     def has_permission(self, request, view):
        #         if f'{request.user}' == 'AnonymousUser':
        #             return False

        #         project = view.kwargs.get('project_pk')
        #         """aborts if project does not exist"""
        #         get_object_or_404(Projects, pk=project)

        #         project_author = Projects.objects.get(pk=project).author_user
        #         isprojectauthor = request.user == project_author
        #         iscontributor = Contributors.objects.filter(user=request.user, project_id=project).exists()

        #         if request.method in self.create_methods:
        #             return isprojectauthor or iscontributor
        #         else:
        #             return True

        #     def has_object_permission(self, request, view, obj):
        #         if f'{request.user}' == 'AnonymousUser':
        #             return False

        #         if hasattr(obj, 'project_id'):
        #             """This is an issue"""
        #             project = obj.project_id
        #         elif hasattr(obj, 'issue'):
        #             """This is a comment"""
        #             project = obj.issue.project_id

        #         """aborts if project does not exist"""
        #         get_object_or_404(Projects, pk=project)

        #         project_author = Projects.objects.get(pk=project).author_user
        #         project_contributors = Contributors.objects.filter(project=project).values_list('user__user_name', flat=True)

        #         isobjectauthor = request.user == obj.author_user
        #         isprojectauthor = request.user == project_author
        #         isprojectcontributors = f'{request.user}' in project_contributors

        #         if request.method in self.edit_methods:
        #             return isobjectauthor
        #         else:
        #             return isprojectauthor or isprojectcontributors
    # edit_methods = ("PUT", "PATCH",)
    # create_methods = ("GET", )
    # def has_permission(self, request, view):
    #     current_user = request.user
    #     isSale = current_user.groups.filter(name = 'SalesGroup').exists()
    #     print('IsSALE = ', isSale)
    #     print('REQUEST METHOD = ', request.method)
    #     if f'{request.method}' in self.create_methods:
    #         print('RETURN ISALE')
    #         return isSale
    #     else:
    #         print('RETURN FALSE')
    #         return False