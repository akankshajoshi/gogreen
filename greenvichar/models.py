from django.db import models
from django.contrib.auth.models import User
from tinymce.models import HTMLField
from website.utils import get_image_by_size

TYPE_CHOICES = ((1,'Event'),(2,'Article'),(3,'Pics/Video'),(4,'Quotes'),(5,'Questionire'))

class GrnVchrHome(models.Model):
    type = models.IntegerField(choices=TYPE_CHOICES)
    title = models.CharField(max_length=50)
    text = models.CharField(max_length=250)
    image = models.ImageField(upload_to='uploads/grnvichar')

    def save(self):
        super(GrnVchrHome, self).save()
        if self.image:
    	    thumbname = get_image_by_size(self.image,'green_vichar_landing')
    	    self.image = 'uploads/grnvichar/' + thumbname
        super(GrnVchrHome, self).save()
        
    def get_type(self):
        if self.type:
            return TYPE_CHOICES[self.type][1]
        return ''

    
class GreenVichar(models.Model):
    title = models.CharField(max_length=200)
    vichar_type = models.IntegerField()
    creation_date = models.DateTimeField(auto_now_add=True)
    publish_date = models.DateTimeField()
    created_by = models.ForeignKey(User)
    published_by = models.CharField(max_length=100)
    is_approved = models.BooleanField(default=False)
    approved_by = models.CharField(max_length=200, null=True)
     
    def __unicode__(self):
        return self.title
    
    def get_vichar_type(self):
        return TYPE_CHOICES[self.vichar_type][1]

class VicharComment(models.Model):
    grnvichar = models.ForeignKey(GreenVichar)
    name = models.CharField(max_length=200)
    email = models.EmailField()
    text = HTMLField(max_length=1000)
    creation_date = models.DateTimeField(auto_now_add=True)
    moderation_date = models.DateTimeField(auto_now=True) 
    status = models.IntegerField(choices=((0,'Submitted'),(1,'Accepted'),(2,'Rejected')))
    approve_by = models.ForeignKey(User, verbose_name='published_by')
    

class Event(models.Model):
    green_vichar = models.ForeignKey('GreenVichar') 
    title = models.CharField(max_length=200,null=True,blank=True)
    image = models.ImageField(upload_to='uploads/event')
    description = models.TextField()
    
    def save(self):
        super(Event, self).save()
        if self.image:
	        thumbname = get_image_by_size(self.image,'small_eventNimage')
	        self.image = 'uploads/event/' + thumbname
        super(Event, self).save()
    
                              
class Article(models.Model):
    green_vichar = models.ForeignKey('GreenVichar') 
    title = models.CharField(max_length=200,null=True,blank=True)
    image = models.ImageField(upload_to='uploads/article')
    description = models.TextField()

    def save(self):
        super(Article, self).save()
        if self.image:
	        thumbname = get_image_by_size(self.image,'big_eventNimage')
	        self.image = 'uploads/article/' + thumbname
        super(Article, self).save()
    
class PicsVideo(models.Model):
    green_vichar = models.ForeignKey('GreenVichar')
    type = models.IntegerField(choices=((1,'Image'),(2,'Video'),))
    title = models.CharField(max_length=50)
    pic = models.ImageField(upload_to='uploads/picsvideos', null=True, blank=True)
    links = models.URLField(null=True, blank=True)
    
    def save(self):
        super(PicsVideo, self).save()
        if self.pic:
	        thumbname = get_image_by_size(self.pic,'big_eventNimage')
	        self.pic = 'uploads/picsvideos/' + thumbname
        super(PicsVideo, self).save()
    
class StoryQuotes(models.Model):
    green_vichar = models.ForeignKey('GreenVichar')
    text = models.CharField(max_length=200,null=True,blank=True)
    
class Questionire(models.Model):
    green_vichar = models.ForeignKey('GreenVichar')
    question = models.CharField(max_length=500)
    answer = models.CharField(max_length=2000, null=True, blank=True)   
