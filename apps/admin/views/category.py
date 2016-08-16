from django.core.urlresolvers import reverse_lazy
from django.views.generic import (
    CreateView, UpdateView, DeleteView, ListView,
)
from apps.core.views import AdminRequiredMixin, SuperUserRequiredMixin, BaseView
from apps.categories.models import Category


class ListCategoryView(BaseView, AdminRequiredMixin, ListView):
    """docstring for ListCategoryView"""
    model = Category
    template_name = 'admin/categories/list.html'
    paginate_by = 20

    def get_queryset(self):
        return Category.objects.order_by('-id')

    def get_context_data(self, **kwargs):
        context = super(ListCategoryView, self).get_context_data(**kwargs)
        info = {
            'title': 'Danh mục tin tức',
            'sidebar': ['category']
        }
        context['info'] = info
        return context


class CreateCategoryView(BaseView, AdminRequiredMixin, CreateView):
    """docstring for CreateCategoryView"""
    model = Category
    template_name = 'admin/categories/create.html'
    fields = ['name', 'slug']

    def get_context_data(self, **kwargs):
        context = super(CreateCategoryView, self).get_context_data(**kwargs)
        info = {
            'title': 'Tạo danh mục tin tức',
            'sidebar': ['category']
        }
        context['info'] = info
        return context

    def get_success_url(self):
        return reverse_lazy('admin:list_category')


class UpdateCategoryView(BaseView, AdminRequiredMixin, UpdateView):
    """docstring for UpdateCategoryView"""
    model = Category
    template_name = 'admin/categories/update.html'
    fields = ['name', 'slug']

    def get_context_data(self, **kwargs):
        context = super(UpdateCategoryView, self).get_context_data(**kwargs)
        info = {
            'title': 'Cập nhật danh mục tin tức',
            'sidebar': ['category']
        }
        context['info'] = info
        return context

    def get_success_url(self):
        return reverse_lazy('admin:list_category')


class DeleteCategoryView(BaseView, SuperUserRequiredMixin, DeleteView):
    """docstring for DeleteCategoryView"""
    model = Category

    def get(self, request, *args, **kwargs):
        return self.post(request, *args, **kwargs)

    def get_success_url(self):
        return reverse_lazy('admin:list_category')
