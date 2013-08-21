from django.contrib import admin
from models import Heading, CompanyCount, Testimonials

class HeadingAdmin(admin.ModelAdmin):
    fields= ('text',)
    
    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        obj.save()
        super(HeadingAdmin, self).save_model(request, obj, form, change)        

class CompanyCountAdmin(admin.ModelAdmin):
    fields= ('text1', 'text2','tree_planted')
    
    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        obj.save()
        super(CompanyCountAdmin, self).save_model(request, obj, form, change)
        
class TestimonialsAdmin(admin.ModelAdmin):
    fields = ('name', 'company', 'description', 'created_date', 'published_date')
    
    def save_model(self, request, obj, form, change):
        super(TestimonialsAdmin, self).save_model(request, obj, form, change)
        obj.created_by = request.user
        obj.save()
        
admin.site.register(CompanyCount, CompanyCountAdmin)
admin.site.register(Heading, HeadingAdmin)