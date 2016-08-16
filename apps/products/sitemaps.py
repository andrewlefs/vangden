from django.contrib.sitemaps import Sitemap
from apps.products.models import Product


class ProductSitemap(Sitemap):
    changefreq = "weekly"
    priority = 0.5

    def items(self):
        return Product.objects.order_by('-id')
