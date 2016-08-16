from django.db import models
from django.conf import settings


class UserProfile(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL,
                                related_name='profile', primary_key=True)

    class Meta:
        db_table = 'user_profile'
