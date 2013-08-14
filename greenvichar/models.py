from django.db import models
from django.contrib.auth.models import User
from tinymce.models import HTMLField

class GrnVchrHome(models.Model):
    title = models.CharField(max_length=50)
    text = models.CharField(max_length=250)
    image = models.ImageField(upload_to='uploads/grnvichar')
    
class GreenVichar(models.Model):
    title = models.CharField(max_length=200)
    vichar_type = models.IntegerField(choices=GrnVchrHome.objects.all().values_list('id','title'))
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
