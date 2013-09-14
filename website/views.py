# Create your views here.
from forms import SearchForm
from django.shortcuts import render_to_response
from django.template import RequestContext
from models import Company, Category, Subcategory, PopularKeyword, ContactUs, Comment, City, CompanyProductImg
from django.db.models import Q
from django.http import HttpResponse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.template.loader import render_to_string
from datetime import datetime as dt
import json
from models import Company
from homepage.forms import CityForm

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
#     cats = Category.objects.all()
    if request.method == 'GET':
        populars = PopularKeyword.objects.all()
        subcat = Subcategory.objects.get(id=int(subcat_id))
        comps = subcat.company_set.all()
        categ=Category.objects.filter(subcategory=subcat)

        populars = subcat.popularkeyword_set.all().order_by('keyword')
        cityform = CityForm()
        return render_to_response('search/keyword.html', {'categ': categ,'populars': populars, 'comps':comps,'subcat':subcat,'cityform':cityform}, context_instance=RequestContext(request))
    
    
def view_company(request, cname, cid):
    comp = Company.objects.filter(id=int(cid))
    cityform = CityForm()
    if comp:
        reviews = Comment.objects.filter(company=comp,status=1)
        productimg = CompanyProductImg.objects.filter(company=comp)
        data = {'comp':comp[0],'reviews':reviews,'cityform':cityform,'productimg':productimg}
        return render_to_response('directory/company.htm', data, context_instance=RequestContext(request))
    else:
        return HttpResponse("Company Does not exist")
    

def view_company_reviews(request, cname, cid):
    comp = Company.objects.filter(id=int(cid))
    if comp:
        reviews = Comment.objects.filter(company=comp,status=1)
        data = {'reviews':reviews}        
        return render_to_response('directory/reviews.html', data, context_instance=RequestContext(request))
    else:
        return HttpResponse("Company Does not exist")

def ajax_save_contact(request):
    status = 0
    if request.method == 'POST':
        compId = request.POST.get('compId')
        if compId:
            comp = Company.objects.get(id=compId)
            name = request.POST.get('name')
            email = request.POST.get('email')
            text = request.POST.get('text')
            creation_date = dt.now()
            moderation_date = dt.now()
            ContactUs.objects.create(company=comp,name=name,email=email,text=text,creation_date=creation_date,moderation_date=moderation_date)
            status = 1
    return HttpResponse(json.dumps({'status':status}), mimetype="application/json")
    
def ajax_save_review(request):
    status = 0
    if request.method == 'POST':
        compId = request.POST.get('compId')
        if compId:
            comp = Company.objects.get(id=compId)
            name = request.POST.get('name')
            email = request.POST.get('email')
            text = request.POST.get('text')
            Comment.objects.create(company=comp,name=name,email=email,text=text)
            status = 1
    return HttpResponse(json.dumps({'status':status}), mimetype="application/json")
    
def search(request):
    if request.method=="POST":
        flag = 0
        keyword = request.POST.get('keyword')
        search_by = request.POST.get('search_by')
        city = request.POST.get('city', 0)
        categ_id = request.POST.get('categ')
        subcat_id = request.POST.get('subcat')
        if keyword:
            if search_by == 'by_name':
                if int(city) > 0 :
                    comps = Company.objects.filter(company_name__icontains=keyword, city=int(city))

                else:
                    comps = Company.objects.filter(company_name__icontains=keyword)
            else:
                if int(city) > 0:
                    comps = Company.objects.filter(Q(deals_in__icontains=keyword) | Q(business_description__icontains=keyword), city=int(city))
                else:

                    comps = Company.objects.filter(Q(deals_in__icontains=keyword) | Q(business_description__icontains=keyword))
        import pdb;pdb.set_trace()
        compcount = comps.count()
        paginator = Paginator(comps, 10)
        page = request.GET.get('page', 1)
        if not (categ_id and subcat_id):
            categ = Category.objects.filter(subcategory=1)[0]
            subcat = Subcategory.objects.get(id=1)
            flag = 1
        else:
            categ = Category.objects.filter(id=int(categ_id))
            subcat = Subcategory.objects.get(id=int(subcat_id))
        try:
            comp1 = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            comp1 = paginator.page(1)
        except EmptyPage:
            # If page is out of range (e.g. 9999), deliver last page of results.
            comp1 = paginator.page(paginator.num_pages)
        if request.is_ajax():
            HTML = render_to_string('search/searchlisting.html',{'comps':comp1,'keyword':keyword,'search_by':search_by}, context_instance=RequestContext(request))
            return HttpResponse(json.dumps({'HTML':HTML,'keyword':keyword,'search_by':search_by}))
        return render_to_response('search/comp_search.html', {'flag':flag,'categ':categ,'subcat':subcat,'compcount':compcount,'comps':comp1,'keyword':keyword,'search_by':search_by,'cityform':CityForm(initial={'city':city})}, context_instance=RequestContext(request))
    else:
        return HttpResponse('BAD REQUEST')

