from choices import YEAR_CHOICES, \
    TURNOVER_CHOICES, EMP_CHOICES, RATING_CHOICES
from django.contrib.auth.models import User
from django.db import models
from tinymce.models import HTMLField
from utils import get_image_by_size
from django.conf import settings
from datetime import datetime as dt
import json


class Blog(models.Model):
    title = models.CharField(max_length=200)
    linkurl = models.CharField(max_length=200, null=True, blank=True)
    image = models.ImageField(null=True, upload_to='uploads/blogimage', blank=True)
    text = models.TextField(null=True, blank=True)
    creation_date = models.DateTimeField(auto_now_add=True)
    
    def __unicode__(self):
        return self.title
    
    def save(self):
        super(Blog, self).save()
        if self.image:
            thumbname = get_image_by_size(self.image,'blog')
            self.image = 'uploads/blogimage/' + thumbname
        super(Blog, self).save()
     
     
class BusinessType(models.Model):
    name = models.CharField(max_length=20)
    
    def __unicode__(self):
        return self.name 

class Company(models.Model):
    company_name = models.CharField(max_length=200)
    company_tagline = models.CharField(max_length=200, null=True, blank=True)
    meta_desc = models.CharField(null=True, blank=True, verbose_name='Meta Description', max_length=50)
    meta_kword = models.CharField(max_length=50, null=True, blank=True, verbose_name='Meta Keywords')
    address = models.CharField(max_length=200)
    city = models.IntegerField(max_length=50)
    state = models.IntegerField(max_length=50)
    mobile = models.CharField(max_length=100, null=True, blank=True)
    phone = models.CharField(max_length=50, null=True, blank=True)
    contact_person = models.CharField(max_length=30, null=True, blank=True)
    contact_email = models.EmailField(null=True, blank=True)
    website = models.URLField(null=True, blank=True)
    business_type = models.ManyToManyField('BusinessType')
    business_description = models.TextField(null=True)
    deals_in = models.TextField(null=True,blank=True)
    green_o_meter = models.CharField(max_length=100, null=True, blank=True)
    rating = models.IntegerField(choices=RATING_CHOICES, default=0)
    subcategory = models.ManyToManyField('Subcategory')
    year_founded = models.IntegerField(choices=YEAR_CHOICES, null=True, blank=True)
    no_of_emp = models.IntegerField(choices=EMP_CHOICES, null=True, blank=True)
    turnover = models.IntegerField(choices=TURNOVER_CHOICES, null=True, blank=True)
    certifications = models.FileField(upload_to='uploads/comp_certi/',null=True, blank=True)
    company_logo = models.ImageField(upload_to='uploads/comp_logo/', null=True, blank=True)
    brouchers = models.FileField(upload_to='uploads/comp_downloads/',null=True, blank=True, verbose_name='brouchers(if any)')
    created_date = models.DateField(auto_now=True)
    modified_date = models.DateField(auto_now=True)
    modified_by = models.ForeignKey(User)
    
    def __unicode__(self):
        return self.company_name
    
           
    def save(self,*args,**kwargs):
        super(Company, self).save()
        if self.company_logo:
            thumbname = get_image_by_size(self.company_logo,'company_logo')
            self.company_logo = 'uploads/comp_logo/' + thumbname
#         create_companyjson()
        super(Company, self).save()
        
    def get_business_type(self):
        b_types = BusinessType.objects.filter(company=self).values_list('name',flat=True)
        return ','.join(list(b_types))
    
    def get_green_o_meter(self):
        objs = []
        if self.green_o_meter:
            val = self.green_o_meter
            objs = GreenOMeter.objects.filter(pk__in=val.split(','))
        return objs
    
    def get_city(self):
        city = City.objects.filter(id=self.city)
        return city.name
    
    def get_state(self):
        state = State.objects.filter(id=self.state)
        return state.name

# def create_companyjson():
#     companies = Company.objects.all().values_list('company_name',flat=True)
# #     company_json = json.dumps({'company':companies})
#     f = open('media/js/auto_companies.js','w')
#     text = 'var companies = ' + 
#     f.write(companies)
 
class CompanyProductImg(models.Model):
    company = models.ForeignKey('Company')
    image = models.ImageField(upload_to='uploads/comp_imgs')

    def save(self):
        super(CompanyProductImg, self).save()
    	if self.image:
    	    thumbname = get_image_by_size(self.image,'comp_prod_img')
    	    self.image = 'uploads/comp_imgs/' + thumbname
    	super(CompanyProductImg, self).save()

class Comment(models.Model):
    company = models.ForeignKey('Company')
    name = models.CharField(max_length=200)
    email = models.EmailField()
    text = HTMLField(max_length=1000)
    creation_date = models.DateTimeField(auto_now_add=True)
    moderation_date = models.DateTimeField(auto_now=True) 
    status = models.IntegerField(choices=((0,'Submitted'),(1,'Accepted'),(2,'Rejected')),default=0)
    done_by = models.ForeignKey(User, null=True)

class ContactUs(models.Model):
    company = models.ForeignKey('Company')
    name = models.CharField(max_length=200)
    email = models.EmailField()
    text = HTMLField(max_length=1000)
    creation_date = models.DateTimeField()
    moderation_date = models.DateTimeField() 
    status = models.IntegerField(choices=((0,'Submitted'),(1,'Viewed'),(2,'Declined')), default=0)
    done_by = models.IntegerField(null=True)
    

class GreenOMeter(models.Model):
    name = models.CharField(max_length=200)
    icon = models.ImageField(upload_to ='uploads/greenometer/',null=True,blank=True)
    
    def __unicode__(self):
        return self.name
    
    def save(self):
        super(GreenOMeter, self).save()
        if self.icon:
            thumbname = get_image_by_size(self.icon,'green_o_meter')
            self.icon = 'uploads/greenometer/' + thumbname
        super(GreenOMeter, self).save()

class CatManager(models.Manager):
    def get_query_set(self):
        new_set = []
        queryset = super(CatManager, self).get_query_set()
        for query in queryset:
            if query.subcategory_set.count():
                new_set.append(query)
        return new_set

class Category(models.Model):
    name = models.CharField(max_length=250)
    created_date = models.DateTimeField(auto_now_add=True)
    is_deleted = models.BooleanField(default=False)
    sort_order = models.IntegerField(default=1)
    icon = models.ImageField(upload_to='uploads/category')
    objects = models.Manager()
    has_sub_objs = CatManager()
    
    def __unicode__(self):
        return self.name

class Subcategory(models.Model):
    category = models.ManyToManyField(Category)
    name = models.CharField(max_length=250)
    meta_desc = models.CharField(null=True, blank=True, verbose_name='Meta Description', max_length=50)
    meta_kword = models.CharField(max_length=50, null=True, blank=True, verbose_name='Meta Keywords')
    created_date = models.DateTimeField(auto_now_add=True)
    is_deleted = models.BooleanField(default=False)
    sort_order = models.IntegerField(default=1)
    
    def __unicode__(self):
        return self.name         


class PopularKeyword(models.Model):
    keyword = models.CharField(max_length=200)
    timestamp = models.DateTimeField(auto_now=True)
    subcat = models.ManyToManyField('Subcategory')
    def __unicode__(self):
        return self.keyword
    
    
class State(models.Model):
    name = models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.name
    
class City(models.Model):
    name = models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.name