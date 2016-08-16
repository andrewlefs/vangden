from django.core.urlresolvers import reverse_lazy
from django.db import models
from django.conf import settings
from apps.core.models import Descriable, Timestampable
from apps.catalogues.models import Catalogue
from ckeditor_uploader.fields import RichTextUploadingField


class Product(Descriable, Timestampable):
    STATUS_CHOICE = (
        (0, 'Hết Hàng'),
        (1, 'Còn Hàng')
    )
    catalogue = models.ForeignKey(Catalogue)
    image = models.ImageField(upload_to='products', blank=True, max_length=500)
    attachment = models.FileField(upload_to='attachments', blank=True, max_length=500)
    price = models.FloatField(blank=True, default=0)
    price_sale = models.FloatField(blank=True, default=0)
    hot = models.BooleanField(blank=True, default=False)
    content = RichTextUploadingField(blank=True, default='')
    tag = models.TextField(blank=True, default='')
    status = models.IntegerField(choices=STATUS_CHOICE, default=1)

    def __str__(self):
        return self.name

    def get_image_url(self):
        if self.image:
            return self.image.url
        else:
            return settings.DEFAULT_IMAGE

    def get_absolute_url(self):
        return reverse_lazy('product:detail', kwargs={'pk': self.id, 'slug': self.slug})

    class Meta:
        db_table = 'product'
