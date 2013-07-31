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
            results = Company.objects.filter(Q(subcategory__in=subcats) | Q(product_profile__icontains=keyword)).distinct()
        return render_to_response('index.html', {'results':results}, context_instance=RequestContext(request))
          
def view_category(request, subcat, subcat_id):
    if request.method == 'GET':
        cats = Category.objects.all()
        populars = PopularKeyword.objects.all()
        sub = Subcategory.objects.get(id=int(subcat_id))
        import pdb;pdb.set_trace()
        if request.GET.get('keyword'):
            keyword = request.GET.get('keyword')
            comps = Company.objects.filter(Q(company_name__icontains=keyword) | Q(product_profile__icontains=keyword) | Q(company_profile__icontains=keyword))
        else:
            comps = sub.company_set.all()
        return render_to_response('cat.html', {'cats': cats, 'populars': populars, 'comps':comps}, context_instance=RequestContext(request))
        