# Create your views here.
from forms import SignUpForm, SearchForm
from django.shortcuts import render_to_response
from django.template import RequestContext
from models import Company, Category, Subcategory, PopularKeyword, ContactUs, Review
from django.db.models import Q
from django.http import HttpResponse

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
    
def view_company(request, cname, cid):
    comp = Company.objects.filter(id=int(cid))
    if comp:
        data = {'comp':comp[0]}        
    return render_to_response('directory/company.htm', data, context_instance=RequestContext(request))

def ajax_save_contact(request):
    if request.method == 'POST':
        compId = request.POST.get('compId')
        if compId:
            comp = Company.objects.get(id=compId)
            name = request.POST.get('name')
            email = request.POST.get('email')
            text = request.POST.get('text')
            ContactUs.objects.create(company=comp,name=name,email=email,text=text)
            return HttpResponse('Successful')
    else:
        return HttpResponse('BadRequest')
    
def ajax_save_review(request):
    if request.method == 'POST':
        compId = request.POST.get('compId')
        if compId:
            comp = Company.objects.get(id=compId)
            name = request.POST.get('name')
            email = request.POST.get('email')
            text = request.POST.get('text')
            Review.objects.create(company=comp,name=name,email=email,text=text)
            return HttpResponse('Successful')
    else:
        return HttpResponse('BadRequest')