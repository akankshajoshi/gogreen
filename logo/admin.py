from django.contrib import admin
from models import InsideLogo, PaidLogo, BigBanner, GovrnLogo

class InsideLogoAdmin(admin.ModelAdmin):
    fields= ('image' ,'click_url', 'start_date','end_date')
    
    def save_model(self, request, obj, form, change):
        super(InsideLogoAdmin, self).save_model(request, obj, form, change)
        obj.created_by = request.user
        obj.save()
        
class BigBannerAdmin(admin.ModelAdmin):
    fields= ('image',)
    
    def save_model(self, request, obj, form, change):
        super(BigBannerAdmin, self).save_model(request, obj, form, change)
        obj.created_by = request.user
        obj.save()

admin.site.register(InsideLogo, InsideLogoAdmin)
admin.site.register(PaidLogo)
admin.site.register(BigBanner, BigBannerAdmin)
admin.site.register(GovrnLogo)