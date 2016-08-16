from django.views.generic import (
    ListView
)
from apps.core.views import BaseView
from apps.catalogues.models import Catalogue
from apps.products.models import Product
from apps.posts.models import Post


class CatalogueDetailView(BaseView, ListView):
    model = Product
    template_name = 'catalogues/detail.html'
    paginate_by = 9

    def get_queryset(self):
        item = Catalogue.objects.get(id=self.kwargs['pk'])
        list = []
        if item.children.all():
            list = self.get_parent(item)
        list.append(item.id)
        return Product.objects.filter(catalogue__pk__in=list).order_by('-id')

    def get_context_data(self, **kwargs):
        context = super(CatalogueDetailView, self).get_context_data(**kwargs)
        catalogue = Catalogue.objects.get(id=self.kwargs['pk'])
        info = {
            'info': {
                'title': catalogue.name
            },
            'catalogue': catalogue,
            'posts': Post.objects.order_by('-id')[0:2]
        }
        context.update(info)
        return context

    def get_parent(self, item):
        catalogues = Catalogue.objects.filter(parent=item.id)
        list = []
        for catalogue in catalogues:
            if catalogue.children.all():
                self.get_child(list, catalogue)
            list.append(catalogue.id)
        return list

    def get_child(self, list, catalogue):
        list.append(catalogue.id)
        for catalogue_child in catalogue.children.all():
            if catalogue.children.all():
                self.get_child(list, catalogue_child)
