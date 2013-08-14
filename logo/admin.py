from django.contrib import admin
from models import Logo, PaidLogo

class LogoAdmin(admin.ModelAdmin):
    fields= ('image' ,'click_url', 'start_date','end_date')
    
    def save_model(self, request, obj, form, change):
        super(LogoAdmin, self).save_model(request, obj, form, change)
        obj.created_by = request.user
        obj.save()

admin.site.register(Logo, LogoAdmin)
admin.site.register(PaidLogo)