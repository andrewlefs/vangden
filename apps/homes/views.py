from django.views.generic import (
    TemplateView
)
from apps.core.views import BaseView
from apps.catalogues.models import Catalogue
from apps.products.models import Product
from apps.posts.models import Post


class HomePageView(BaseView, TemplateView):
    template_name = 'homes/index.html'

    def get_context_data(self, **kwargs):
        context = super(HomePageView, self).get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Trang chủ'
            },
            'object_list': self.get_data(),
            'posts': Post.objects.order_by("-id")[:5],
            'product_news': Product.objects.order_by('-id')[0:8]
        }
        context.update(info)
        return context

    def get_data(self):
        catalogues = Catalogue.objects.filter(parent__isnull=True)
        list_catalogue_product = []
        for catalogue in catalogues:
            list_id_catalogue = self.get_parent(catalogue)
            list_id_catalogue.append(catalogue.id)
            obj = {
                'catalogue': catalogue,
                'catalogue_sub': Catalogue.objects.filter(parent=catalogue.id),
                'products': Product.objects.filter(catalogue__parent__id__in=list_id_catalogue).order_by("-id")[:10],
            }
            if obj['products']:
                list_catalogue_product.append(obj)
        return list_catalogue_product

    def get_parent(self, item):
        catalogues = Catalogue.objects.filter(parent=item.id)
        list = []
        for catalogue in catalogues:
            if catalogue.children.all():
                self.get_child(list, catalogue)
        return list

    def get_child(self, list, catalogue):
        list.append(catalogue.id)
        for catalogue_child in catalogue.children.all():
            if catalogue.children.all():
                self.get_child(list, catalogue_child)


class ContactDetailView(BaseView, TemplateView):
    template_name = 'homes/contact.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Liên hệ'
            },
        }
        context.update(info)
        return context