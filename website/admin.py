from models import Company , Comment, Category, Subcategory, PopularKeyword, \
    BusinessType, GreenOMeter, CompanyProductImg, Blog, ContactUs, State, City 
from django.conf import settings
from django.contrib import admin
from forms import CompanyForm, PopularKeywordForm
from datetime import datetime as dt
from django.contrib.auth.models import User

class BlogAdmin(admin.ModelAdmin):
    pass


class CompanyProductImgInline(admin.StackedInline):
    model = CompanyProductImg
    extra = 1
    max_num = 5

class CompanyAdmin(admin.ModelAdmin):
    form = CompanyForm    
    exclude = ('modified_by',)
    inlines = (CompanyProductImgInline,)
    list_display = ('company_name','get_comments','get_contactus')
    search_fields = ['company_name','id']
    
    
    def get_comments(self, obj):
        """Returns the url for the comments of the Company.
        """
        return '<a target="_blank" href="/admin/website/comment?company=%s">View Comments</a>' % (obj.id)
    get_comments.short_description = 'Comments'
    get_comments.allow_tags = True
    
    def get_contactus(self, obj):
        """Returns the url for the comments of the Company.
        """
        return '<a target="_blank" href="/admin/website/contactus?company=%s">View ContactUs</a>' % (obj.id)
    get_contactus.short_description = 'ContactUs'
    get_contactus.allow_tags = True

    def save_model(self, request, obj, form, change):
        obj.modified_by = request.user
        if obj.green_o_meter:
            gom = eval(obj.green_o_meter)
            gom = ','.join(gom)
            obj.green_o_meter = gom
        obj.save()
        super(CompanyAdmin, self).save_model(request, obj, form, change)
        
    def render_change_form(self, request, context, *args, **kwargs):
        try:
            gom = context['original'].green_o_meter
            context['adminform'].form.initial['green_o_meter'] = gom.split(',')
        except:
            pass
        return super(CompanyAdmin, self).render_change_form(request, context, args, kwargs)
            

    
class CommentAdmin(admin.ModelAdmin):
    model = Comment
    list_display = ('name','get_company_name','email','done_by','status')
    list_editable = ('status',)
    list_filter = ('status',)
    
    def get_company_name(self, obj):
        return obj.company.company_name
    get_company_name.short_description = 'Company Name'
    
    def queryset(self, request):
        qs = super(CommentAdmin, self).queryset(request)
        if request.GET.get('company'):
            company = request.GET.get('company')
            qs= qs.filter(company=Company.objects.get(id=int(company), status=1))
        else:
            qs = qs.filter(status=0)
        return qs
    
    def save_model(self, request, obj, form, change):
        super(CommentAdmin, self).save_model(request, obj, form, change)
        obj.done_by = request.user
        obj.save()
        
class ContactUsAdmin(admin.ModelAdmin):
    model = ContactUs
    list_display = ('name','get_company_name','email','creation_date','get_done_by','moderation_date','status')
    fields = ('name','email','creation_date','done_by','moderation_date','status')
    list_editable = ['status']
    
    def get_company_name(self, obj):
        return obj.company.company_name
    get_company_name.short_description = 'Company Name'
    
    def queryset(self, request):
        qs = super(ContactUsAdmin, self).queryset(request)
        if request.GET.get('company'):
            company = request.GET.get('company')
            qs= qs.filter(company=Company.objects.get(id=int(company)), status=1)
        else:
            qs = qs.filter(status=0)
        return qs
    
    def save_model(self, request, obj, form, change):
        if change:
            obj.done_by = request.user.id
            obj.moderation_date = dt.now()
            obj.save()
    
    def get_done_by(self,obj):
        return User.objects.get(id=obj.done_by)
    get_done_by.short_description = 'Done By'
        
    def changelist_view(self, request, extra_context=None):
        if not request.GET.get('company'):
            self.list_display = [field for field in self.list_display if field not in ('get_done_by','moderation_date',)]         
        return super(ContactUsAdmin, self).changelist_view(request, extra_context)
    
    def change_view(self, request, object_id, extra_context=None):
        """Modify the the change view to show you own error message when
        you are no longer allowed to change a 'Package'.
        """
        # Make all readonly fields if user doesn't have permission to edit.
        if not request.user.is_superuser:
            self.readonly_fields = [field for field in self.fields if field != 'status']
        else:
            self.readonly_fields = []
        response = super(ContactUsAdmin, self).change_view(request, object_id, extra_context=None)
        return response

class PopularKeywordAdmin(admin.ModelAdmin):
    form = PopularKeywordForm

class CityAdmin(admin.ModelAdmin):
    def queryset(self, request):
        return super(CityAdmin, self).queryset(request).order_by('name')

class StateAdmin(admin.ModelAdmin):
    def queryset(self, request):
        qs = super(StateAdmin, self).queryset(request)
        qs = qs.order_by('name')
        return qs


admin.site.register(Company, CompanyAdmin)
admin.site.register(Comment, CommentAdmin)
admin.site.register(ContactUs, ContactUsAdmin)
admin.site.register(Category)
admin.site.register(Subcategory)
admin.site.register(PopularKeyword, PopularKeywordAdmin)
admin.site.register(BusinessType)
admin.site.register(GreenOMeter)
admin.site.register(Blog, BlogAdmin)
admin.site.register(State)
admin.site.register(City, CityAdmin)