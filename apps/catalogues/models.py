from django.db import models
from apps.core.models import Descriable, Timestampable


class Catalogue(Descriable, Timestampable):
    parent = models.ForeignKey('self', blank=True, null=True, related_name="children")

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'catalogue'

