# custom/processors.py
from django.conf import settings
from django.core.files.storage import default_storage
from PIL import ImageFilter

# def gauss(image, gauss=None, **kwargs):
#     if gauss:
#         image = image.filter(ImageFilter.GaussianBlur(radius=gauss))
#     return image
