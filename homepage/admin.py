from django.contrib import admin
from models import Heading, BigBanner, CompanyCount, Testimonials

class HeadingAdmin(admin.ModelAdmin):
    fields= ('text',)
    
    def save_model(self, request, obj, form, change):
        super(HeadingAdmin, self).save_model(request, obj, form, change)
        obj.created_by = request.user
        obj.save()
        
class BigBannerAdmin(admin.ModelAdmin):
    fields= ('image', 'created_date', 'published_date')
    
    def save_model(self, request, obj, form, change):
        super(BigBannerAdmin, self).save_model(request, obj, form, change)
        obj.created_by = request.user
        obj.save()
        

class CompanyCountAdmin(admin.ModelAdmin):
    fields= ('text1', 'text2')
    
    def save_model(self, request, obj, form, change):
        super(CompanyCountAdmin, self).save_model(request, obj, form, change)
        obj.created_by = request.user
        obj.save()
        
class TestimonialsAdmin(admin.ModelAdmin):
    fields = ('name', 'company', 'description', 'created_date', 'published_date')
    
    def save_model(self, request, obj, form, change):
        super(TestimonialsAdmin, self).save_model(request, obj, form, change)
        obj.created_by = request.user
        obj.save()
        
# admin.site.register(Testimonials)
admin.site.register(CompanyCount, CompanyCountAdmin)
# admin.site.register(BigBanner, BigBannerAdmin)
admin.site.register(Heading, HeadingAdmin)