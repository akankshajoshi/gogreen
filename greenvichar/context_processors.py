import os
import socket
import datetime

from greenvichar.models import GrnVchrHome, GreenVichar, Event,\
    Questionire, StoryQuotes, PicsVideo, Article
from django.conf import settings

def greenvicharcommon(request):
    vichars = GrnVchrHome.objects.all()
    return {'vichars':vichars}