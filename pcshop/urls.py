"""pcshop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf import settings
from django.conf.urls import url, include
from django.contrib.sitemaps.views import sitemap
from django.contrib.staticfiles import views
from apps.products.sitemaps import ProductSitemap
from apps.posts.sitemaps import PostSitemap

sitemaps = {
    'products': ProductSitemap(),
    'posts': PostSitemap()
}


urlpatterns = [
    # url(r'^admin/', admin.site.urls),
    url(r'^', include('apps.homes.urls', namespace='home')),
    url(r'^tin-tuc/', include('apps.posts.urls', namespace='post')),
    url(r'^san-pham/', include('apps.products.urls', namespace='product')),
    url(r'^danh-muc/', include('apps.catalogues.urls', namespace='catalogue')),

    url(r'^static/(?P<path>.*)$', views.static.serve,
        {'document_root': settings.STATIC_ROOT,
         'show_indexes': settings.DEBUG}),
    url(r'^media/(?P<path>.*)$', views.static.serve,
        {'document_root': settings.MEDIA_ROOT,
         'show_indexes': settings.DEBUG}),
    url(r'^admin/', include('apps.admin.urls', namespace='admin')),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),

    url(r'^sitemap.xml$', sitemap, {'sitemaps': sitemaps}),
    url(r'^robots.txt$', include('robots.urls')),
]
