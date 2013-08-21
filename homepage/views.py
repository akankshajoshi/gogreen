from django.shortcuts import render_to_response
from django.template import RequestContext
from models import Heading, CompanyCount

def home(request):
    if request.method == 'GET':
        heading = Heading.objects.all()[0]
        count = CompanyCount.objects.all()[0]
        return render_to_response('home/home.html',{'heading':heading, 'count':count}, context_instance=RequestContext(request))
    

    