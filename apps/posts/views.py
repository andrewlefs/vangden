from django.views.generic import (
    DetailView, TemplateView, ListView
)
from apps.core.views import BaseView
from apps.posts.models import Post


class PostListView(BaseView, ListView):
    model = Post
    template_name = 'posts/index.html'

    def get_queryset(self):
        return Post.objects.order_by('-id')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Tin tức mới'
            },
        }
        context.update(info)
        return context



class PostDetailView(BaseView, DetailView):
    model = Post
    template_name = 'posts/detail.html'

    def get_context_data(self, **kwargs):
        context = super(PostDetailView, self).get_context_data(**kwargs)
        info = {
            'info': {
                'title': self.object.name
            },
            'posts': Post.objects.order_by('-id')[0:10]
        }
        context.update(info)
        return context

