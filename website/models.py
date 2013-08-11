from choices import COUNTRY_CHOICES, STATE_CHOICES, CITY_CHOICES, YEAR_CHOICES, \
    TURNOVER_CHOICES, EMP_CHOICES, CONTACT_CHOICES
from django.contrib.auth.models import User
from django.db import models
from tinymce.models import HTMLField


class Icons(models.Model):
    icon = models.FileField(upload_to='uploads/company/icons')
     
class Blog(models.Model):
    title = models.CharField(max_length=200)
    linkurl = models.CharField(max_length=200, null=True, blank=True)
    image = models.ImageField(null=True, upload_to='uploads/blogimage', blank=True)
    text = HTMLField(max_length=5000, null=True, blank=True)
    creation_date = models.DateTimeField(auto_now_add=True)
    publish_date = models.DateTimeField()
    
    def __unicode__(self):
        return self.title
     
     
class ContactUsText(models.Model):
    text = HTMLField()
    creation_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    updated_by = models.ForeignKey(User)
    
class TermsNCondition(models.Model):
    text = HTMLField()
    creation_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    updated_by = models.ForeignKey(User)
     
class AboutUs(models.Model):
    text = HTMLField()
    creation_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    updated_by = models.ForeignKey(User)
    
class Enquiry(models.Model):
    name = models.CharField(max_length=200)
    email = models.EmailField()
    text = HTMLField(max_length=1000)
    mobile = models.CharField(max_length=12)
    creation_date = models.DateTimeField(auto_now_add=True)
    moderation_date = models.DateTimeField(auto_now=True) 
    is_approve = models.BooleanField(default=False)
    approve_by = models.ForeignKey(User)

class BusinessType(models.Model):
    name = models.CharField(max_length=20)
    
    def __unicode__(self):
        return self.name 

class Company(models.Model):
    company_name = models.CharField(max_length=200)
    company_tagline = models.CharField(max_length=200, null=True, blank=True)
    address = models.CharField(max_length=200)
    city = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    country = models.CharField(choices=COUNTRY_CHOICES ,max_length=50)
    mobile = models.CharField(max_length=40, null=True, blank=True)
    phone = models.CharField(max_length=12, null=True, blank=True)
    contact_person = models.CharField(max_length=30, null=True, blank=True)
    contact_email = models.EmailField()
    website = models.URLField(null=True, blank=True)
    business_type = models.ManyToManyField('BusinessType')
    company_profile = models.CharField(max_length=2000)
    product_profile = models.CharField(max_length=1000)
    green_o_meter = models.CharField(max_length=100, null=True, blank=True)
    subcategory = models.ManyToManyField('Subcategory')
    year_founded = models.IntegerField(choices=YEAR_CHOICES, null=True, blank=True)
    no_of_emp = models.IntegerField(choices=EMP_CHOICES, null=True, blank=True)
    turnover = models.IntegerField(choices=TURNOVER_CHOICES, null=True, blank=True)
    certifications = models.CharField(max_length=200, null=True, blank=True)
    featured_logo = models.ImageField(upload_to='uploads/comp_img/', null=True, blank=True)
    featured_blog = models.BooleanField(default=False)
    featured_downloads = models.FileField(upload_to='uploads/comp_downloads/',null=True, blank=True)
    featured_jobs = models.ForeignKey('Jobs', null=True, blank=True)
    created_date = models.DateField(auto_now_add=True)
    modified_date = models.DateField(auto_now=True)
    modified_by = models.ForeignKey(User)
    
    def __unicode__(self):
        return self.company_name
    
            
class GreenOMeter(models.Model):
    name = models.CharField(max_length=200)
    icon = models.ImageField(upload_to ='uploads/greenometer/',null=True,blank=True)
    
    def __unicode__(self):
        return self.name
    
class Jobs(models.Model):
    name = models.CharField(max_length=100)
    title = models.CharField(max_length=100)
    description = HTMLField()
    created_date = models.DateField(auto_now_add=True)
    modified_date = models.DateField(auto_now=True)
    modified_by = models.ForeignKey(User)
    
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
    created_date = models.DateTimeField(auto_now_add=True)
    is_deleted = models.BooleanField(default=False)
    sort_order = models.IntegerField(default=1)
    
    def __unicode__(self):
        return self.name         

class GrnVchrHome(models.Model):
    title = models.CharField(max_length=50)
    text = models.CharField(max_length=250)
    image = models.ImageField(upload_to='uploads/grnvichar')
    
class GreenVichar(models.Model):
    title = models.CharField(max_length=200)
    type = models.IntegerField(choices=GrnVchrHome.objects.all().values_list('id','title'))
    creation_date = models.DateTimeField(auto_now_add=True)
    publish_date = models.DateTimeField()
    created_by = models.ForeignKey(User)
    is_approved = models.BooleanField(default=False)
    approved_by = models.CharField(max_length=200, null=True)
    
    def __unicode__(self):
        return self.title

class Comments(models.Model):
    grnvichar = models.ForeignKey(GreenVichar)
    name = models.CharField(max_length=200)
    email = models.EmailField()
    text = HTMLField(max_length=1000)
    creation_date = models.DateTimeField(auto_now_add=True)
    moderation_date = models.DateTimeField(auto_now=True) 
    is_approve = models.BooleanField(default=False)
    approve_by = models.ForeignKey(User, null=True)
    
class GreenVicharImg(models.Model):
    green_vichar = models.ForeignKey('GreenVichar')
    image = models.ImageField(upload_to='uploads/greenvichar')

class Event(models.Model):
    green_vichar = models.ForeignKey('GreenVichar') 
    event_name = models.CharField(max_length=200,null=True,blank=True)
    location = models.CharField(max_length=200,null=True,blank=True)
    date = models.DateTimeField(null=True,blank=True)
    organiser = models.CharField(max_length=200,null=True,blank=True)
    contact_person = models.CharField(max_length=200,null=True,blank=True)
    contact_number = models.CharField(max_length=20,null=True,blank=True)
    event_detail = models.TextField(max_length=200,null=True,blank=True)

class PostArticle(models.Model):
    green_vichar = models.ForeignKey('GreenVichar')
    heading = models.CharField(max_length=200,null=True,blank=True)
    body = models.TextField(null=True,blank=True)
    uploadHeadImg = models.ImageField(upload_to='uploads/postarticle')
    
class PicsVideo(models.Model):
    green_vichar = models.ForeignKey('GreenVichar')
    pic = models.ImageField(upload_to='uploads/picsvideos')
    links = models.URLField()
        
class StoryQuotes(models.Model):
    green_vichar = models.ForeignKey('GreenVichar')
    heading = models.CharField(max_length=200,null=True,blank=True)
    body = models.TextField(null=True,blank=True)
    
class Questionire(models.Model):
    green_vichar = models.ForeignKey('GreenVichar')
    question = models.CharField(max_length=500)
    answer = models.CharField(max_length=2000, null=True, blank=True)   

class TopBanner(models.Model):
    image = models.ImageField(upload_to='uploads/top_banners')
    published_date = models.DateField()
    created_by = models.ForeignKey(User)

class PopularKeyword(models.Model):
    keyword = models.CharField(max_length=200)
    timestamp = models.DateTimeField(auto_now=True)
    subcat = models.ForeignKey('Subcategory')
    def __unicode__(self):
        return self.keyword
    
class ContactUs(models.Model):
    name = models.CharField(max_length=200)
    email = models.EmailField()
    text = HTMLField(max_length=1000)
    mobile = models.CharField(max_length=12)
    type = models.IntegerField(choices=CONTACT_CHOICES)
    creation_date = models.DateTimeField(auto_now_add=True)
    moderation_date = models.DateTimeField(auto_now=True) 
    is_approve = models.BooleanField(default=False)
    approve_by = models.ForeignKey(User)
    
