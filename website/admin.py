from models import AboutUs, ContactUs, Enquiry, Company , \
     Category, Subcategory, PopularKeyword, BusinessType, GreenOMeter 
from django.conf import settings
from django.contrib import admin
from forms import CompanyForm


class TopBannerAdmin(admin.ModelAdmin):
    list_display = ('image', 'published_date')
    fields = ('image')
    def save_model(self, request, obj, form, change):
        super(TopBannerAdmin, self).save_model(request, obj, form, change)
        obj.created_by = request.user 
        obj.save()
   
class CompanyAdmin(admin.ModelAdmin):
    model = Company
    form = CompanyForm    

    def save_model(self, request, obj, form, change):
        if obj.green_o_meter:
            gom = eval(obj.green_o_meter)
            gom = ','.join(gom)
            obj.green_o_meter = gom
        obj.save()
        super(CompanyAdmin, self).save_model(request, obj, form, change)
            
class PopularKeywordAdmin(admin.StackedInline):
    model=PopularKeyword
    extra=1
            
class SubcategoryAdmin(admin.ModelAdmin):
    inlines = [PopularKeywordAdmin,]
    
    

admin.site.register(ContactUs)
admin.site.register(Enquiry)
admin.site.register(Company, CompanyAdmin)
admin.site.register(Category)
admin.site.register(Subcategory, SubcategoryAdmin)
admin.site.register(BusinessType)
admin.site.register(GreenOMeter)
