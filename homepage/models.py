from django.db import models
from django.contrib.auth.models import User

class Heading(models.Model):
    text = models.CharField(max_length=150)
    created_by = models.ForeignKey(User)
    created_date = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return self.text


class CompanyCount(models.Model):
    text1 = models.CharField(max_length=10, verbose_name='Registered Companies')
    text2 = models.CharField(max_length=10, verbose_name='Registered products')
    tree_planted = models.CharField(max_length=10, verbose_name='No. of Trees Planted')
    created_by = models.ForeignKey(User)
    
class Testimonials(models.Model):
    name = models.CharField(max_length=200)
    company = models.CharField(null=True,max_length=200, blank=True)
    email = models.EmailField(null=True, blank=True)
    description = models.CharField(max_length=400)
    created_by = models.ForeignKey(User)
    created_date = models.DateTimeField(auto_now_add=True)
    published_date = models.DateTimeField(auto_now=True)