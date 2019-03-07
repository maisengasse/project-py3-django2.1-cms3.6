from modeltranslation.translator import translator, TranslationOptions
from cms.models import CMSPlugin

class CMSPluginTO(TranslationOptions):
    fields = ()
translator.register(CMSPlugin, CMSPluginTO)
