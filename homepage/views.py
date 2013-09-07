from django.shortcuts import render_to_response
from django.template import RequestContext
from models import Heading, CompanyCount
from website.models import Category, Subcategory, Company, Blog
from logo.models import GovrnLogo, HomePageLogo, BigBanner
from django.db.models import Q
from datetime import datetime as dt
from forms import CityForm

def home(request):
    comps = []
    blogs = Blog.objects.all().order_by('-creation_date')[:5]
    homelogos = HomePageLogo.objects.filter(start_date__lte=dt.now().date(), end_date__gte=dt.now().date())
    govn_logos = GovrnLogo.objects.all()
    bigbanner = BigBanner.objects.all()[:1]

    if request.method == 'GET':
        count = CompanyCount.objects.all()[0]
        cityform = CityForm()
        return render_to_response('home/home.html',
                                  { 'govnlogos':govn_logos,'bigbanner':bigbanner,'blogs':blogs,'homelogos':homelogos,'cityform':cityform},
                                  context_instance=RequestContext(request))
    
