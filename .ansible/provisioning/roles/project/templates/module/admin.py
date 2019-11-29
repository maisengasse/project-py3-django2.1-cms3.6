# -*- coding: utf-8 -*-
from django.utils.translation import ugettext_lazy as _
from django.utils.safestring import mark_safe
from django.contrib import admin
from django.urls import reverse
from django.db import models
from django import forms
from django.conf import settings
from cms.models import Page
from cms.admin.placeholderadmin import PlaceholderAdminMixin
from maisen.cmstools.widgets import CKEditorWidget, CodeMirrorWidget
from {{ project_name }}.{{ item[0].module_name }}.models import {{ item[0].model_class }}

class {{ item[0].model_class }}AdminForm(forms.ModelForm):
    class Meta:
        model = {{ item[0].model_class }}
        fields = '__all__'
        widgets = {
            'description' : CKEditorWidget(),
        }

class {{ item[0].model_class }}Admin(PlaceholderAdminMixin, admin.ModelAdmin):
    form = {{ item[0].model_class }}AdminForm
    fieldsets = [
{% if item[0].publish_workflows %}
        (_('Veröffentlichung'), {'fields': ('valid_from', 'valid_to'), 'classes' : ('collapse',)}),
{% else %}
        (None, {'fields': ('published', )}),
{% endif %}
{% if item[0].categorized %}
        (None, {'fields': ({% if item[0].detailpage %}'_link_preview', {% endif %}'category', 'title', 'description', 'images'), }),
{% else %}
        (None, {'fields': ({% if item[0].detailpage %}'_link_preview', {% endif %}'title', 'description', 'images'), }),
{% endif %}
    ]
{% if item[0].detailpage %}
    readonly_fields = ('_link_preview',)
{% endif %}
    list_display = ('title', '_currently_valid', 'sort', 'created')
    list_editable = ('sort',)
    def _description(self, obj):
        return obj.description
    _description.allow_tags = True

    def _currently_valid(self, obj):
{% if item[0].publish_workflows %}
        return obj.is_currently_valid()
{% else %}
        return obj.published
{% endif %}
    _currently_valid.boolean = True
    _currently_valid.short_description = "Aktuell öffentlich"

{% if item[0].detailpage %}
    def _link_preview(self, obj):
        out = ""
        if obj and obj.id:
            out = (
                f"Vorschau der Detailseite: <a href='javascript:window.open({reverse('{{ item[0].module_name }}_preview', args=[obj.id])})' target='_blank'>{reverse('{{ item[0].module_name }}_preview', args=[obj.id])}</a>"
            )
        else:
            out = "<em>erst nach dem Speichern möglich</em>"
        return mark_safe(out)
    _link_preview.short_description = "Vorschau"
{% endif %}

admin.site.register({{ item[0].model_class }}, {{ item[0].model_class }}Admin)


{% if item[0].categorized %}
from models import {{ item[0].model_class }}Category
class {{ item[0].model_class }}CategoryAdmin(PlaceholderAdminMixin, admin.ModelAdmin):
    fields = ('title',)
    list_display = ('title', 'sort', 'created')
    list_editable = ('sort',)

admin.site.register({{ item[0].model_class }}Category, {{ item[0].model_class }}CategoryAdmin)
{% endif %}
