from django.utils.decorators import method_decorator
from django.contrib.admin.views.decorators import staff_member_required
from django.core.exceptions import PermissionDenied
from django.views.generic import View
from django.views.decorators.gzip import gzip_page
from django.views.generic.detail import ContextMixin
from apps.catalogues.models import Catalogue


class BaseView(ContextMixin):
    @method_decorator(gzip_page)
    def dispatch(self, request, *args, **kwargs):
        return super(BaseView, self).dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(BaseView, self).get_context_data(**kwargs)
        info = {
            'menu': Catalogue.objects.filter(parent__isnull=True),
        }
        context.update(info)
        return context


class AdminRequiredMixin(View):
    @method_decorator(staff_member_required)
    def dispatch(self, request, *arg, **kwargs):
        return super(AdminRequiredMixin, self).dispatch(request, *arg, **kwargs)


class SuperUserRequiredMixin(View):
    def dispatch(self, request, *arg, **kwargs):
        if not request.user.is_active or not request.user.is_superuser:
            raise PermissionDenied
        return super(SuperUserRequiredMixin, self).dispatch(request, *arg, **kwargs)
