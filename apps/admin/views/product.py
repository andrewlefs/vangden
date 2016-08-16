from django.views.generic import (
    ListView, CreateView, UpdateView, DeleteView
)
from django.core.urlresolvers import reverse_lazy
from django import forms
from apps.core.views import AdminRequiredMixin, BaseView
from apps.catalogues.models import Catalogue
from apps.products.models import Product


class ListProductView(BaseView, AdminRequiredMixin, ListView):
    template_name = 'admin/products/list.html'
    model = Product
    paginate_by = 20

    def get_queryset(self):
        return Product.objects.order_by('-id')

    def get_context_data(self, **kwargs):
        context = super(ListProductView, self).get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Danh sách sản phẩm',
                'sidebar': ['product']
            }
        }
        context.update(info)
        return context


class ProductForm(forms.ModelForm):
    """docstring for ProductForm"""

    def __init__(self, *args, **kwargs):
        super(ProductForm, self).__init__(*args, **kwargs)
        self.fields['catalogue'].choices = self.get_parent()

    def get_parent(self):
        catalogues = Catalogue.objects.filter(parent__isnull=True)
        list = []
        for catalogue in catalogues:
            catalogue_tuple = (catalogue.id, catalogue.name)
            list.append(catalogue_tuple)
            if catalogue.children.all():
                self.get_child(list, catalogue, 0)
        return list

    def get_child(self, list, catalogue, loop_root):
        dash = ""
        if loop_root > 0:
            for i in range(loop_root):
                dash = str(dash) + " - "
            catalogue.name = dash + catalogue.name
            catalogue_tuple = (catalogue.id, catalogue.name)
            list.append(catalogue_tuple)
        loop_root = int(loop_root) + 1

        for catalogue_child in catalogue.children.all():
            if catalogue.children.all():
                self.get_child(list, catalogue_child, loop_root)

    class Meta:
        model = Product
        fields = ('name', 'slug', 'description',
                  'image', 'content', 'catalogue', 'price', 'status', 'price_sale', 'hot', 'attachment')

        widgets = {
            'catalogue': forms.Select(attrs={'class': 'form-control select2', 'style': 'width: 100%;'}),
            'status': forms.Select(attrs={'class': 'form-control select2', 'style': 'width: 100%;'}),
            'hot': forms.widgets.CheckboxInput()
        }


class CreateProductView(BaseView, AdminRequiredMixin, CreateView):
    template_name = 'admin/products/create.html'
    model = Product
    form_class = ProductForm

    def get_context_data(self, **kwargs):
        context = super(CreateProductView, self).get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Thêm mới',
                'sidebar': ['product']
            }
        }
        context.update(info)
        return context

    def get_success_url(self):
        return reverse_lazy('admin:list_product')


class UpdateProductView(BaseView, AdminRequiredMixin, UpdateView):
    template_name = 'admin/products/update.html'
    model = Product
    form_class = ProductForm

    def get_context_data(self, **kwargs):
        context = super(UpdateProductView, self).get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Cập nhật',
                'sidebar': ['product']
            }
        }
        context.update(info)
        return context

    def get_success_url(self):
        return reverse_lazy('admin:list_product')


class DeleteProductView(BaseView, AdminRequiredMixin, DeleteView):
    model = Product

    def get(self, request, *args, **kwargs):
        return self.post(request, *args, **kwargs)

    def get_success_url(self):
        return reverse_lazy('admin:list_product')
