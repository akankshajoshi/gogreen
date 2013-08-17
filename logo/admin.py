from django.contrib import admin
from models import Logo, PaidLogo, BigBanner, GovrnLogo

class LogoAdmin(admin.ModelAdmin):
    fields= ('image' ,'click_url', 'start_date','end_date')
    
    def save_model(self, request, obj, form, change):
        super(LogoAdmin, self).save_model(request, obj, form, change)
        obj.created_by = request.user
        obj.save()
        
class BigBannerAdmin(admin.ModelAdmin):
    fields= ('image',)
    
    def save_model(self, request, obj, form, change):
        super(BigBannerAdmin, self).save_model(request, obj, form, change)
        obj.created_by = request.user
        obj.save()

admin.site.register(Logo, LogoAdmin)
admin.site.register(PaidLogo)
admin.site.register(BigBanner, BigBannerAdmin)
admin.site.register(GovrnLogo)