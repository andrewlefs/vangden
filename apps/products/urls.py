from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.ProductListView.as_view(), name='index'),
    url(r'^(?P<pk>[0-9]+)-(?P<slug>[\w-]+)/$', views.ProductDetailView.as_view(), name='detail'),
]
