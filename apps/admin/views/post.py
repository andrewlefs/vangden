from django.views.generic import (
    ListView, CreateView, UpdateView, DeleteView
)
from django.core.urlresolvers import reverse_lazy
from django import forms
from apps.core.views import AdminRequiredMixin, BaseView
from apps.categories.models import Category
from apps.posts.models import Post


class ListPostView(BaseView, AdminRequiredMixin, ListView):
    template_name = 'admin/posts/list.html'
    model = Post
    paginate_by = 20

    def get_queryset(self):
        return Post.objects.order_by('-id')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Danh sách tin tức',
                'sidebar': ['post']
            }
        }
        context.update(info)
        return context


class PostForm(forms.ModelForm):
    """docstring for PostForm"""
    category = forms.ModelChoiceField(queryset=Category.objects.all(),
                                      widget=forms.Select(attrs={'class': 'form-control select2',
                                                                 'style': 'width: 100%;'}))

    class Meta:
        model = Post
        fields = ('name', 'slug', 'description',
                  'image', 'content', 'category')


class CreatePostView(BaseView, AdminRequiredMixin, CreateView):
    template_name = 'admin/posts/create.html'
    model = Post
    initial = {
        'category': '1',
    }
    form_class = PostForm

    def get_context_data(self, **kwargs):
        context = super(CreatePostView, self).get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Thêm tin tức',
                'sidebar': ['post']
            }
        }
        context.update(info)
        return context

    def get_success_url(self):
        return reverse_lazy('admin:list_post')


class UpdatePostView(BaseView, AdminRequiredMixin, UpdateView):
    template_name = 'admin/posts/update.html'
    model = Post
    form_class = PostForm

    def get_context_data(self, **kwargs):
        context = super(UpdatePostView, self).get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Cập nhật tin tức',
                'sidebar': ['post']
            }
        }
        context.update(info)
        return context

    def get_success_url(self):
        return reverse_lazy('admin:list_post')


class DeletePostView(BaseView, AdminRequiredMixin, DeleteView):
    model = Post

    def get(self, request, *args, **kwargs):
        return self.post(request, *args, **kwargs)

    def get_success_url(self):
        return reverse_lazy('admin:list_post')
