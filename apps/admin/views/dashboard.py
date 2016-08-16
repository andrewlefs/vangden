from django.contrib.admin.forms import AdminAuthenticationForm
from django.contrib.auth import login, logout
from django.views.generic import (
    FormView, TemplateView
)
from django.contrib.admin.forms import PasswordChangeForm
from django.http import (HttpResponseRedirect)
from django.core.urlresolvers import (reverse_lazy)
from apps.core.views import BaseView, AdminRequiredMixin
from apps.products.models import Product
from apps.posts.models import Post


class LoginView(FormView):
    template_name = 'admin/login.html'
    form_class = AdminAuthenticationForm

    def get_context_data(self, **kwargs):
        context = super(LoginView, self).get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Login',
            }
        }
        context.update(info)
        return context

    def get(self, request, *args, **kwargs):
        user = request.user
        if user.is_active and user.is_staff:
            return HttpResponseRedirect(self.get_success_url())
        else:
            return super(LoginView, self).get(request, *args, **kwargs)

    def get_success_url(self):
        return reverse_lazy('admin:dashboard')

    def form_valid(self, form):
        admin = form.get_user()
        login(self.request, admin)
        return super(LoginView, self).form_valid(form)


class DashboardView(BaseView, AdminRequiredMixin, TemplateView):
    template_name = 'admin/dashboard.html'

    def get_context_data(self, **kwargs):
        context = super(DashboardView, self).get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Quản lý',
                'sidebar': ['dashboard']
            },
            'posts': Post.objects.order_by('-id')[:10],
            'products': Product.objects.order_by('-id')[:10],
            'post_count': Post.objects.count(),
            'product_count': Product.objects.count(),
        }
        context.update(info)
        return context


class ChangePasswordView(AdminRequiredMixin, FormView):
    form_class = PasswordChangeForm
    template_name = 'admin/profile.html'

    def get_form_kwargs(self):
        kwargs = super(ChangePasswordView, self).get_form_kwargs()
        kwargs['user'] = self.request.user
        return kwargs

    def get_context_data(self, **kwargs):
        context = super(ChangePasswordView, self).get_context_data(**kwargs)
        info = {
            'title': 'Đổi mật khẩu',
        }
        context['info'] = info
        return context

    def form_valid(self, form):
        form.save()
        return super(ChangePasswordView, self).form_valid(form)

    def get_success_url(self):
        logout(self.request)
        return reverse_lazy('admin:login')
