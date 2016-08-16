from django.views.generic import (
    DetailView, ListView
)
from apps.core.views import BaseView
from apps.products.models import Product
from apps.posts.models import Post
from django.db.models import Q

class ProductListView(BaseView, ListView):
    model = Product
    template_name = 'products/index.html'
    paginate_by = 9

    def get_queryset(self):
        try:
            name = self.request.GET['search']
        except Exception as e:
            name = ''
        if name != '':
            q_object = Q(name__icontains=name) | Q(price__icontains=name) | Q(description__icontains=name)
            object_list = self.model.objects.filter(q_object)
        else:
            object_list = self.model.objects.order_by('-id')
        return object_list

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Sản phẩm'
            },
            'posts': Post.objects.order_by('-id')[0:2]
        }
        context.update(info)
        return context


class ProductDetailView(BaseView, DetailView):
    model = Product
    template_name = 'products/detail.html'

    def get_context_data(self, **kwargs):
        context = super(ProductDetailView, self).get_context_data(**kwargs)

        if self.object.catalogue.parent:
            relates = Product.objects.filter(catalogue__parent__id=self.object.catalogue.parent.id).exclude(id=self.object.id).order_by("?")[0:16]
        else:
            relates = Product.objects.filter(catalogue__id=self.object.catalogue.id).exclude(id=self.object.id).order_by("?")[0:16]

        info = {
            'info': {
                'title': self.object.name
            },
            'products': Product.objects.order_by('-id')[0:6],
            'relates': relates
        }
        context.update(info)
        return context
