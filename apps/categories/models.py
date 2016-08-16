from apps.core.models import Descriable, Timestampable


class Category(Descriable, Timestampable):

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'category'
