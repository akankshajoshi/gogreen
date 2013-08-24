from django.contrib import admin
from models import HomePageLogo, PaidLogo, BigBanner, GovrnLogo

class HomePageLogoAdmin(admin.ModelAdmin):
    fields= ('image' ,'click_url', 'start_date','end_date')
    
    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        obj.save()
        super(HomePageLogoAdmin, self).save_model(request, obj, form, change)
        
class BigBannerAdmin(admin.ModelAdmin):
    fields= ('image',)
    
    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        obj.save()
        super(BigBannerAdmin, self).save_model(request, obj, form, change)

admin.site.register(HomePageLogo, HomePageLogoAdmin)
admin.site.register(PaidLogo)
admin.site.register(BigBanner, BigBannerAdmin)
admin.site.register(GovrnLogo)