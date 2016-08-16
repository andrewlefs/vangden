from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.HomePageView.as_view(), name='index'),
    url(r'^gioi-thieu', views.ContactDetailView.as_view(), name='contact'),
]
