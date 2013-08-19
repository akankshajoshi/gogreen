from choices import COUNTRY_CHOICES, STATE_CHOICES, CITY_CHOICES, YEAR_CHOICES, \
    TURNOVER_CHOICES, EMP_CHOICES
from django.contrib.auth.models import User
from django.db import models
from tinymce.models import HTMLField



class Blog(models.Model):
    title = models.CharField(max_length=200)
    linkurl = models.CharField(max_length=200, null=True, blank=True)
    image = models.ImageField(null=True, upload_to='uploads/blogimage', blank=True)
    text = HTMLField(max_length=5000, null=True, blank=True)
    creation_date = models.DateTimeField(auto_now_add=True)
    
    def __unicode__(self):
        return self.title     
     
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
    city = models.CharField(max_length=50,choices=CITY_CHOICES)
    state = models.CharField(max_length=50,choices=STATE_CHOICES)
    mobile = models.CharField(max_length=40, null=True, blank=True)
    phone = models.CharField(max_length=12, null=True, blank=True)
    contact_person = models.CharField(max_length=30, null=True, blank=True)
    contact_email = models.EmailField()
    website = models.URLField(null=True, blank=True)
    business_type = models.ManyToManyField('BusinessType')
    business_description = models.TextField(null=True)
    deals_in = models.CharField(max_length=200,null=True,blank=True)
    green_o_meter = models.CharField(max_length=100, null=True, blank=True)
    subcategory = models.ManyToManyField('Subcategory')
    year_founded = models.IntegerField(choices=YEAR_CHOICES, null=True, blank=True)
    no_of_emp = models.IntegerField(choices=EMP_CHOICES, null=True, blank=True)
    turnover = models.IntegerField(choices=TURNOVER_CHOICES, null=True, blank=True)
    certifications = models.FileField(upload_to='uploads/comp_certi/',null=True, blank=True)
    company_logo = models.ImageField(upload_to='uploads/comp_logo/', null=True, blank=True)
    brouchers = models.FileField(upload_to='uploads/comp_downloads/',null=True, blank=True, verbose_name='brouchers(if any)')
    created_date = models.DateField(auto_now_add=True)
    modified_date = models.DateField(auto_now=True)
    modified_by = models.ForeignKey(User)
    
    def __unicode__(self):
        return self.company_name
    

class CompanyProductImg(models.Model):
    company = models.ForeignKey('Company')
    image = models.ImageField(upload_to='uploads/comp_imgs')

class Comment(models.Model):
    company = models.ForeignKey('Company')
    name = models.CharField(max_length=200)
    email = models.EmailField()
    text = HTMLField(max_length=1000)
    creation_date = models.DateTimeField(auto_now_add=True)
    moderation_date = models.DateTimeField(auto_now=True) 
    status = models.IntegerField(choices=((0,'Submitted'),(1,'Accepted'),(2,'Rejected')))
    done_by = models.ForeignKey(User, null=True)

class ContactUs(models.Model):
    company = models.ForeignKey('Company')
    name = models.CharField(max_length=200)
    email = models.EmailField()
    text = HTMLField(max_length=1000)
    mobile = models.CharField(max_length=12)
    creation_date = models.DateTimeField(auto_now_add=True)
    moderation_date = models.DateTimeField(auto_now=True) 
    status = models.IntegerField(choices=((0,'Submitted'),(1,'Viewed'),))
    done_by = models.IntegerField(null=True)
    

class GreenOMeter(models.Model):
    name = models.CharField(max_length=200)
    icon = models.ImageField(upload_to ='uploads/greenometer/',null=True,blank=True)
    
    def __unicode__(self):
        return self.name
    
class Category(models.Model):
    name = models.CharField(max_length=250)
    created_date = models.DateTimeField(auto_now_add=True)
    is_deleted = models.BooleanField(default=False)
    sort_order = models.IntegerField(default=1)
    
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
    
    
