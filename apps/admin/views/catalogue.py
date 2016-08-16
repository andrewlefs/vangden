from django.core.urlresolvers import reverse_lazy
from django.views.generic import (
    CreateView, UpdateView, DeleteView, ListView,
)
from django import forms
from apps.core.views import AdminRequiredMixin, SuperUserRequiredMixin, BaseView
from apps.catalogues.models import Catalogue


class ListCatalogueView(BaseView, AdminRequiredMixin, ListView):
    """docstring for ListCatalogueView"""
    model = Catalogue
    template_name = 'admin/catalogues/list.html'

    def get_queryset(self):
        return Catalogue.objects.filter(parent__isnull=True)

    def get_context_data(self, **kwargs):
        context = super(ListCatalogueView, self).get_context_data(**kwargs)
        info = {
            'title': 'Danh mục sản phẩm',
            'sidebar': ['catalogue']
        }
        context['info'] = info
        return context


class CatalogueForm(forms.ModelForm):
    """docstring for PostForm"""

    def __init__(self, *args, **kwargs):
        super(CatalogueForm, self).__init__(*args, **kwargs)
        self.fields['parent'].choices = self.get_parent()

    def get_parent(self):
        try:
            catalogues = Catalogue.objects.filter(parent__isnull=True)
            list = []
            list.append(('', '---------------'))
            for catalogue in catalogues:
                catalogue_tuple = (catalogue.id, catalogue.name)
                list.append(catalogue_tuple)
                if catalogue.children.all():
                    self.get_child(list, catalogue, 0)
            return list
        except Exception as e:
            print('Error: ', e)

    def get_child(self, list, catalogue, loop_root):
        try:
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
        except Exception as e:
            print("Error: ", e)

    class Meta:
        model = Catalogue
        fields = ('name', 'slug', 'parent')

        widgets = {
            'parent': forms.Select(attrs={'class': 'form-control select2', 'style': 'width: 100%;'})
        }


class CreateCatalogueView(BaseView, AdminRequiredMixin, CreateView):
    """docstring for CreateCatalogueView"""
    model = Catalogue
    template_name = 'admin/catalogues/create.html'
    form_class = CatalogueForm

    def get_context_data(self, **kwargs):
        context = super(CreateCatalogueView, self).get_context_data(**kwargs)
        info = {
            'title': 'Tạo danh mục sản phẩm',
            'sidebar': ['category']
        }
        context['info'] = info
        return context

    def get_success_url(self):
        return reverse_lazy('admin:list_catalogue')


class UpdateCatalogueView(BaseView, AdminRequiredMixin, UpdateView):
    """docstring for UpdateCatalogueView"""
    model = Catalogue
    template_name = 'admin/catalogues/update.html'
    form_class = CatalogueForm

    def get_context_data(self, **kwargs):
        context = super(UpdateCatalogueView, self).get_context_data(**kwargs)
        info = {
            'title': 'Cập nhật danh mục sản phẩm',
            'sidebar': ['category']
        }
        context['info'] = info
        return context

    def get_success_url(self):
        return reverse_lazy('admin:list_catalogue')


class DeleteCatalogueView(BaseView, SuperUserRequiredMixin, DeleteView):
    """docstring for DeleteCatalogueView"""
    model = Catalogue

    def get(self, request, *args, **kwargs):
        return self.post(request, *args, **kwargs)

    def get_success_url(self):
        return reverse_lazy('admin:list_catalogue')
