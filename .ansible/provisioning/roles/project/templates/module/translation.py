from modeltranslation.translator import translator, TranslationOptions
{% if item[0].plugin %}
from {{ project_name }}.{{ item[0].module_name }}.models import {{ item[0].model_class }}, {{ item[0].model_class }}Teaser 
{% else %}
from {{ project_name }}.{{ item[0].module_name }}.models import {{ item[0].model_class }}
{% endif %}

class {{ item[0].model_class }}TO(TranslationOptions):
    fields = ('title', 'description', )
translator.register({{ item[0].model_class }}, {{ item[0].model_class }}TO)

{% if item[0].categorized %}
from {{ project_name }}.{{ item[0].module_name }}.models import {{ item[0].model_class }}Category
class {{ item[0].model_class }}CategoryTO(TranslationOptions):
    fields = ('title', 'description', )
translator.register({{ item[0].model_class }}Category, {{ item[0].model_class }}CategoryTO)
{% endif %}

{% if item[0].plugin %}
class {{ item[0].model_class }}TeaserTO(TranslationOptions):
    fields = ('title', )
translator.register({{ item[0].model_class }}Teaser, {{ item[0].model_class }}TeaserTO)
{% endif %}
