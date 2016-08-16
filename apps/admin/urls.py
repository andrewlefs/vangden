from  django.conf.urls import url
from .views import (
    dashboard, post, category, catalogue, product, user
)

urlpatterns = [
    url(r'^$', dashboard.DashboardView.as_view(), name='dashboard'),
    url(r'^profile/$', dashboard.ChangePasswordView.as_view(), name='profile'),
    url(r'^login/$', dashboard.LoginView.as_view(), name='login'),
    url(r'^logout/$', 'django.contrib.auth.views.logout',
        {'next_page': '/admin/login/'}, name='logout'),

    # Url for category post
    url(r'^category/post/$', category.ListCategoryView.as_view(), name='list_category'),
    url(r'^category/post/create/$', category.CreateCategoryView.as_view(), name='create_category'),
    url(r'^category/post/update/(?P<pk>[0-9]+)/$', category.UpdateCategoryView.as_view(),
        name='update_category'),
    url(r'^category/post/delete/(?P<pk>[0-9]+)/$', category.DeleteCategoryView.as_view(),
        name='delete_category'),

    # Url for category product
    url(r'^category/product/$', catalogue.ListCatalogueView.as_view(), name='list_catalogue'),
    url(r'^category/product/create/$', catalogue.CreateCatalogueView.as_view(), name='create_catalogue'),
    url(r'^category/product/update/(?P<pk>[0-9]+)/$', catalogue.UpdateCatalogueView.as_view(),
        name='update_catalogue'),
    url(r'^category/product/delete/(?P<pk>[0-9]+)/$', catalogue.DeleteCatalogueView.as_view(),
        name='delete_catalogue'),

    # Url for post
    url(r'^post/$', post.ListPostView.as_view(), name='list_post'),
    url(r'^post/create/$', post.CreatePostView.as_view(), name='create_post'),
    url(r'^post/update/(?P<pk>[0-9]+)/$', post.UpdatePostView.as_view(), name='update_post'),
    url(r'^post/delete/(?P<pk>[0-9]+)/$', post.DeletePostView.as_view(), name='delete_post'),

    # Url for product
    url(r'^product/$', product.ListProductView.as_view(), name='list_product'),
    url(r'^product/create/$', product.CreateProductView.as_view(), name='create_product'),
    url(r'^product/update/(?P<pk>[0-9]+)/$', product.UpdateProductView.as_view(), name='update_product'),
    url(r'^product/delete/(?P<pk>[0-9]+)/$', product.DeleteProductView.as_view(), name='delete_product'),

    # Url for user
    url(r'^user/$', user.ListUserProfileView.as_view(), name='list_user'),
    url(r'^user/create/$', user.CreateUserProfileView.as_view(), name='create_user'),
    url(r'^user/update/(?P<pk>[0-9]+)/$', user.UpdateUserProfileView.as_view(), name='update_user'),
    url(r'^user/delete/(?P<pk>[0-9]+)/$', user.DeleteUserProfileView.as_view(), name='delete_user'),
]
