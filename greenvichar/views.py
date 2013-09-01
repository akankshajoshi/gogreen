from greenvichar.models import GrnVchrHome, GreenVichar, Event, \
    Questionire, StoryQuotes, PicsVideo, Article
from django.shortcuts import render_to_response
from django.template import RequestContext

def home(request):
    vichars = GrnVchrHome.objects.all()
    print vichars
    return render_to_response('greenvichar/greenvichar.htm', {'vichars':vichars}, context_instance=RequestContext(request))

def view_listing(request, vichar_type, vid):
    green_vichar = GreenVichar.objects.get(vichar_type=int(vid))
    if int(vid) == 1:
        obj_list = Event.objects.filter(green_vichar=green_vichar)
    elif int(vid) == 2:
        obj_list = Article.objects.filter(green_vichar=green_vichar)
    elif int(vid) == 3:
        obj_list = PicsVideo.objects.filter(green_vichar=green_vichar)
    elif int(vid) == 4:
        obj_list = StoryQuotes.objects.filter(green_vichar=green_vichar)
    elif int(vid) == 5:
        obj_list = Questionire.objects.filter(green_vichar=green_vichar)
        
    return render_to_response('greenvichar/listing.html', {'obj_list':obj_list,'vid':vid}, context_instance=RequestContext(request))