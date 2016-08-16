from django.contrib.auth.models import User
from django.views.generic import (
    ListView, CreateView, UpdateView,
    DeleteView
)
from django.core.urlresolvers import reverse_lazy
from django.conf import settings
from django import forms
from apps.core.views import SuperUserRequiredMixin, BaseView


class ListUserProfileView(BaseView, SuperUserRequiredMixin, ListView):
    template_name = 'admin/users/list.html'
    model = User
    paginate_by = 20

    def get_queryset(self):
        return User.objects.filter(is_superuser=0).order_by('-id')

    def get_context_data(self, **kwargs):
        context = super(ListUserProfileView, self).get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Danh sách tài khoản',
                'sidebar': ['user']
            }
        }
        context.update(info)
        return context


class UserProfileForm(forms.ModelForm):
    """docstring for UserProfileForm"""
    re_password = forms.CharField(max_length=500)

    class Meta:
        model = User
        fields = ('username', 'email', 'password')

    def clean(self):
        cleaned_data = super(UserProfileForm, self).clean()
        password = cleaned_data.get("password")
        re_password = cleaned_data.get("re_password")

        if password != re_password:
            msg = "Password not contain."
            self.add_error('re_password', msg)


class UserProfileUpdateForm(forms.ModelForm):
    """docstring for UserProfileUpdateForm"""
    password = forms.CharField(max_length=500, required=False)
    re_password = forms.CharField(max_length=500, required=False)

    class Meta:
        model = User
        fields = ('username', 'email')

    def clean(self):
        cleaned_data = super(UserProfileUpdateForm, self).clean()
        password = cleaned_data.get("password")
        re_password = cleaned_data.get("re_password")

        if password != re_password:
            msg = "Password not contain."
            self.add_error('re_password', msg)


class CreateUserProfileView(BaseView, SuperUserRequiredMixin, CreateView):
    template_name = 'admin/users/create.html'
    model = User
    form_class = UserProfileForm

    def get_context_data(self, **kwargs):
        context = super(CreateUserProfileView, self).get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Tạo tài khoản',
                'sidebar': ['user']
            }
        }
        context.update(info)
        return context

    def form_valid(self, form):
        user = form.save(commit=False)
        user.is_staff = True
        user.set_password(user.password)
        user.save()
        return super().form_valid(form)

    def get_success_url(self):
        return reverse_lazy('admin:list_user')


class UpdateUserProfileView(BaseView, SuperUserRequiredMixin, UpdateView):
    template_name = 'admin/users/update.html'
    model = User
    form_class = UserProfileUpdateForm

    def get_context_data(self, **kwargs):
        context = super(UpdateUserProfileView, self).get_context_data(**kwargs)
        info = {
            'info': {
                'title': 'Cập nhật tài khoản',
                'sidebar': ['user']
            }
        }
        context.update(info)
        return context

    def form_valid(self, form):
        user = form.instance
        password = form.cleaned_data.get('password', None)
        if password:
            user.set_password(password)
        return super(UpdateUserProfileView, self).form_valid(form)

    def get_success_url(self):
        return reverse_lazy('admin:list_user')


class DeleteUserProfileView(BaseView, SuperUserRequiredMixin, DeleteView):
    model = User

    def get(self, request, *args, **kwargs):
        return self.post(request, *args, **kwargs)

    def get_success_url(self):
        return reverse_lazy('admin:list_user')
