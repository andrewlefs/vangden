from django.core.urlresolvers import reverse_lazy
from django.db import models
from django.conf import settings
from apps.core.models import Descriable, Timestampable
from apps.categories.models import Category
from ckeditor_uploader.fields import RichTextUploadingField


class Post(Descriable, Timestampable):
    category = models.ForeignKey(Category)
    image = models.ImageField(upload_to='posts', blank=True, max_length=500)
    content = RichTextUploadingField()

    def __str__(self):
        return self.name

    def get_image_url(self):
        if self.image:
            return self.image.url
        else:
            return settings.DEFAULT_IMAGE

    def get_absolute_url(self):
        return reverse_lazy('post:detail', kwargs={'pk': self.id, 'slug': self.slug})

    class Meta:
        verbose_name = 'Post'
        verbose_name_plural = 'Posts'
        db_table = 'post'
