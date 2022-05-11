from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from users.models import User


UserAdmin.fieldsets += ('Custom fields set', {'fields': ('isAdmin', 'isSale', 'isSupport')}),
admin.site.register(User, UserAdmin)
