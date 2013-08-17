from django.contrib.auth.models import User
from django.db import models
from tinymce.models import HTMLField

CONTACT_CHOICES = ((1,'Business Query'), (2,'Advertise with us'), (3,'Other Query'),)

class ContactUs(models.Model):
    name = models.CharField(max_length=200)
    email = models.EmailField()
    text = HTMLField(max_length=1000)
    mobile = models.CharField(max_length=12)
    type = models.IntegerField(choices=CONTACT_CHOICES)
    creation_date = models.DateTimeField(auto_now_add=True)
    moderation_date = models.DateTimeField(auto_now=True) 
    status = models.IntegerField(choices=((0,'Submitted'),(1,'Viewed'),))
    done_by = models.ForeignKey(User)

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
    
