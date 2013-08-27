from django.db import models
from django.contrib.auth.models import User
from website.models import Category
from website.utils import get_image_by_size

class HomePageLogo(models.Model):
    name = models.CharField(max_length=25)
    image = models.ImageField(upload_to='uploads/logo')
    click_url = models.URLField()
    created_by = models.ForeignKey(User)
    start_date = models.DateField()
    end_date = models.DateField()

    def save(self):
        super(HomePageLogo, self).save()
    	if self.image:
    	    thumbname = get_image_by_size(self.image,'homepage_logo')
    	    self.image = 'uploads/logo/' + thumbname
    	super(HomePageLogo, self).save()
    
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
    
    def save(self):
        super(GovrnLogo, self).save()
        if self.image:
            thumbname = get_image_by_size(self.image,'govn_logo')
            self.image = 'uploads/logo/' + thumbname
        super(GovrnLogo, self).save()

class BigBanner(models.Model):
    image = models.ImageField(upload_to='uploads/bigbaner')
    created_by = models.ForeignKey(User)
    created_date = models.DateTimeField(auto_now_add=True)
    published_date = models.DateField(auto_now=True)
