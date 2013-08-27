from greenvichar.models import GrnVchrHome, GreenVichar
from django.shortcuts import render_to_response
from django.template import RequestContext

def home(request):
    vichars = GrnVchrHome.objects.all()
    return render_to_response('greenvichar/greenvichar.htm', {'vichars':vichars}, context_instance=RequestContext(request))

def view_listing(request, vichar_type, vid):
#     vichars = GreenVichar.objects.filter(vichar_type=vid)
    return render_to_response('greenvichar/listing.html', {}, context_instance=RequestContext(request))