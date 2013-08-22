from django.shortcuts import render_to_response
from django.template import RequestContext
from models import Heading, CompanyCount
from website.models import Category, Subcategory, Company
from django.db.models import Q

def home(request):
    if request.method == 'GET':
        heading = Heading.objects.all()[0]
        count = CompanyCount.objects.all()[0]
        return render_to_response('home/home.html',{'heading':heading, 'count':count}, context_instance=RequestContext(request))
    else:
        search_by = request.POST.get('field')
        keyword = request.POST.get('keyword')
        if search_by == 'company':
            results = Company.objects.filter(company_name__icontains=keyword)
        else:
            cats = Category.objects.filter(name__icontains=keyword)
            subcats = Subcategory.objects.filter(Q(name__icontains=keyword) | Q(category__in=cats))
            results = Company.objects.filter(Q(subcategory__in=subcats) | Q(business_description__icontains=keyword)).distinct()
        return render_to_response('search/comp_search.html', {'results':results}, context_instance=RequestContext(request))

    