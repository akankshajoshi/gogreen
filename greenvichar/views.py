from greenvichar.models import GrnVchrHome, GreenVichar, Event, \
    Questionire, StoryQuotes, PicsVideo, Article
from django.shortcuts import render_to_response
from django.template import RequestContext


def home(request):
    return render_to_response('greenvichar/greenvichar.htm', context_instance=RequestContext(request))

def view_listing(request, vichar_type, vid):
    green_vichar = GreenVichar.objects.filter(vichar_type=int(vid)).values_list('id',flat=True)
    title= ''
    if int(vid) == 1:
        obj_list = Event.objects.filter(green_vichar__in=green_vichar)

    elif int(vid) == 2:
        obj_list = Article.objects.filter(green_vichar__in=green_vichar)

    elif int(vid) == 3:
        obj_list = PicsVideo.objects.filter(green_vichar__in=green_vichar)

    elif int(vid) == 4:
        obj_list = StoryQuotes.objects.filter(green_vichar__in=green_vichar)

    elif int(vid) == 5:
        obj_list = Questionire.objects.filter(green_vichar__in=green_vichar)

    title = GrnVchrHome.objects.filter(type=int(vid))
    return render_to_response('greenvichar/listing.html', {'obj_list':obj_list,'title':title,'vid':vid}, context_instance=RequestContext(request))