from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):

    isAdmin = models.BooleanField("Admin user", default=False)
    isSale = models.BooleanField("Sale user", default=False)
    isSupport = models.BooleanField("Support user", default=False)
