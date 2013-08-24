from django.db import models
from django.contrib.auth.models import User
from website.models import Category

class HomePageLogo(models.Model):
    name = models.CharField(max_length=25)
    image = models.ImageField(upload_to='uploads/logo')
    click_url = models.URLField()
    created_by = models.ForeignKey(User)
    start_date = models.DateField()
    end_date = models.DateField()
    
class PaidLogo(models.Model):
    name = models.CharField(max_length=25)
    image = models.ImageField(upload_to='uploads/logo')
    click_url = models.URLField()
    start_date = models.DateTimeField(auto_now_add=True)
    end_date = models.DateField(auto_now=True)
    category = models.ManyToManyField(Category)
    
class GovrnLogo(models.Model):
    image = models.ImageField(upload_to='uploads/logo')
    click_url = models.URLField(null=True, blank=True)

class BigBanner(models.Model):
    image = models.ImageField(upload_to='uploads/bigbaner')
    created_by = models.ForeignKey(User)
    created_date = models.DateTimeField(auto_now_add=True)
    published_date = models.DateField(auto_now=True)