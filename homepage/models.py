from django.db import models
from django.contrib.auth.models import User

class Heading(models.Model):
    text = models.CharField(max_length=150)
    created_by = models.ForeignKey(User)
    created_date = models.DateTimeField(auto_now_add=True)
    
class BigBanner(models.Model):
    image = models.ImageField(upload_to='media/bigbaner')
    created_by = models.ForeignKey(User)
    created_date = models.DateTimeField(auto_now_add=True)
    published_date = models.DateField(auto_now=True)
    
class Logo(models.Model):
    image = models.ImageField(upload_to='media/logo')
    click_url = models.URLField()
    created_by = models.ForeignKey(User)
    created_date = models.DateTimeField(auto_now_add=True)
    published_date = models.DateField(auto_now=True)
    
class CompanyCount(models.Model):
    text1 = models.CharField(max_length=10)
    text2 = models.CharField(max_length=10)
    created_by = models.ForeignKey(User)
    
class Testimonials(models.Model):
    name = models.CharField(max_length=200)
    company = models.CharField(null=True,max_length=200, blank=True)
    email = models.EmailField(null=True, blank=True)
    description = models.CharField(max_length=400)
    created_by = models.ForeignKey(User)
    created_date = models.DateTimeField(auto_now_add=True)
    published_date = models.DateTimeField(auto_now=True)