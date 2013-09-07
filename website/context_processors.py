import os
import socket
import datetime

from homepage.models import Heading, CompanyCount
from website.models import Category, Subcategory
from django.conf import settings

def shared(request):
    cats = Category.objects.all()
    sub = cats[0].subcategory_set.all()[0]
    categ_subCateg = filter(lambda x:x[1]!=None, [[cat.name, cat.subcategory_set.all()[0]] if cat.subcategory_set.all() else [cat.name, None] for cat in cats])
    headings = Heading.objects.all()
    count = CompanyCount.objects.all()[0]
    return {'count':count,'cats':cats,'sub': sub,'list':categ_subCateg,'headings':headings}


def media_globals(request):

    c_dic = {}
    c_dic['url_prefix'] = 'http://%s/' % request.META.get('HTTP_HOST')
    c_dic['url_prefix_media'] = 'http://%s%s' % (request.META.get('HTTP_HOST'), settings.MEDIA_URL)
    c_dic['url_prefix_images'] = 'http://%s%s%s/' % (request.META.get('HTTP_HOST'), settings.MEDIA_URL, 'images')
    return c_dic