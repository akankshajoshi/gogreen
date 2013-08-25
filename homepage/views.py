from django.shortcuts import render_to_response
from django.template import RequestContext
from models import Heading, CompanyCount
from website.models import Category, Subcategory, Company, Blog
from logo.models import GovrnLogo, HomePageLogo
from django.db.models import Q
from datetime import datetime as dt

def home(request):
    comps = []

    blogs = Blog.objects.all().order_by('-creation_date')[:5]
    govn_logos = GovrnLogo.objects.all()
    homelogos = HomePageLogo.objects.filter(start_date__lte=dt.now().date(), end_date__gte=dt.now().date())
    if request.method == 'GET':

        count = CompanyCount.objects.all()[0]

        return render_to_response('home/home.html',
                                  {'count':count, 'blogs':blogs,'govn_logos':govn_logos,'homelogos':homelogos},
                                  context_instance=RequestContext(request))
    else:
        keyword = request.POST.get('keyword')
        search_by = request.POST.get('search_by')
        if keyword:
            if search_by == 'by_name':
                comps = Company.objects.filter(company_name__icontains=keyword)
            else:
                comps = Company.objects.filter(deals_in__icontains=keyword)
        return render_to_response('search/comp_search.html', {'comps':comps}, context_instance=RequestContext(request))

    
