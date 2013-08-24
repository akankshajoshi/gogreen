from django.shortcuts import render_to_response
from django.template import RequestContext
from models import Heading, CompanyCount
from website.models import Category, Subcategory, Company, Blog
from django.db.models import Q

def home(request):
    comps = []
    blogs = Blog.objects.all().order_by('-creation_date')[:5]
    if request.method == 'GET':
        heading = Heading.objects.all()[0]
        count = CompanyCount.objects.all()[0]
        return render_to_response('home/home.html',{'heading':heading, 'count':count, 'blogs':blogs}, context_instance=RequestContext(request))
    else:
        cats = Category.objects.all()
        keyword = request.POST.get('keyword')
        search_by = request.POST.get('search_by')
        if keyword:
            if search_by == 'by_name':
                comps = Company.objects.filter(company_name__icontains=keyword)
            else:
                comps = Company.objects.filter(deals_in__icontains=keyword)
        return render_to_response('search/comp_search.html', {'cats': cats, 'comps':comps}, context_instance=RequestContext(request))

    
