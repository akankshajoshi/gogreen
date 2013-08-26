import os
import socket
import datetime
from logo.models import GovrnLogo
from homepage.models import Heading
from website.models import Category, Subcategory

def shared(request):
    cats = Category.objects.all()
    sub = cats[0].subcategory_set.all()[0]
    categ_subCateg = filter(lambda x:x[1]!=None, [[cat.name, cat.subcategory_set.all()[0]] if cat.subcategory_set.all() else [cat.name, None] for cat in cats])
    headings = Heading.objects.all()
    govn_logos = GovrnLogo.objects.all()
    return {'cats':cats,'sub': sub,'list':categ_subCateg,'headings':headings,'govn_logos':govn_logos}