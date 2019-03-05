# from cms.plugin_pool import plugin_pool
# from maisen.cmstools.stencils.models import StencilData, StencilSlider

# class Stencil(StencilPlugin):
#     name = _("Stencil")
#     render_template = "stencils/stencil.html"
#     fields = ['title','body', 'files', 'container',]
#     allow_children = True
#     child_classes=['Teaser',]
#     child_config = {
#         'Teaser' : {
#             'amount' : 3,
#             'initial' : {
#                 'title' : 'Teaser',
#                 'body' : '<p>Teaser-Text<p>',
#                 'link' : '/',
#                 'images' : [{ 'id' : settings.PLACEHOLDER_IMAGE_ID }]
#             }
#         }
#     }

# plugin_pool.register_plugin(Highlight)
