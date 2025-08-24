# your_app/templatetags/custom_filters.py
from django import template

register = template.Library()

@register.filter
def negate(value):
    """Утгыг эсрэгээр нь өөрчилнө"""
    try:
        return -value
    except (TypeError, ValueError):
        return value