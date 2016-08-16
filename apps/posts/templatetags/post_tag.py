from django import template

register = template.Library()


@register.filter
def minfilter(num):
    return int(num - 4)


@register.filter
def maxfilter(num):
    return int(num + 4)


@register.filter
def count(num):
    num = int(num) + 1
    return num


@register.filter
def dash(num):
    num = int(num)
    dash_str = ''
    for i in range(num):
        dash_str = str(dash_str) + " - "
    return dash_str


@register.filter
def check_num(num):
    if (int(num) % 5) == 0 and num > 0:
        return True
    else:
        return False

