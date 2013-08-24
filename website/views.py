# Create your views here.
from forms import SignUpForm, SearchForm
from django.shortcuts import render_to_response
from django.template import RequestContext
from models import Company, Category, Subcategory, PopularKeyword
from django.db.models import Q

def signup(request):
    if request.Method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            status = 'sign up successfully'
        else:
            status = 'wrong entry'
            
    else:
        form = SignUpForm()
    return render_to_response('signup.html', {'form':form, 'status':status}, context_instance=RequestContext(request))

def index_page(request):
    if request.method == 'GET':
        form = SearchForm()
        return render_to_response('index.html', {'form':form}, context_instance=RequestContext(request))
    else:
        search_by = request.POST.get('field')
        keyword = request.POST.get('keyword')
        if search_by == 'company':
            results = Company.objects.filter(company_name__icontains=keyword)
        else:
            cats = Category.objects.filter(name__icontains=keyword)
            subcats = Subcategory.objects.filter(Q(name__icontains=keyword) | Q(category__in=cats))
            results = Company.objects.filter(Q(subcategory__in=subcats) | Q(business_description__icontains=keyword)).distinct()
        return render_to_response('index.html', {'results':results}, context_instance=RequestContext(request))
          
def view_category(request, cat, subcat, subcat_id):
    comps = []
    cats = Category.objects.all()
    if request.method == 'GET':
        populars = PopularKeyword.objects.all()
        sub = Subcategory.objects.get(id=int(subcat_id))
        comps = sub.company_set.all()
        populars = sub.popularkeyword_set.all()
        return render_to_response('search/keyword.html', {'cats': cats, 'populars': populars, 'comps':comps,'sub':sub}, context_instance=RequestContext(request))
    else:
        keyword = request.POST.get('keyword')
        search_by = request.POST.get('search_by')
        if keyword:
            if search_by == 'by_name':
                comps = Company.objects.filter(company_name__icontains=keyword)
            else:
                comps = Company.objects.filter(deals_in__icontains=keyword)
        return render_to_response('search/comp_search.html', {'cats': cats, 'comps':comps}, context_instance=RequestContext(request))