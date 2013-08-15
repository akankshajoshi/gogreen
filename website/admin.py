from models import Company , Comment, Category, Subcategory, PopularKeyword, \
    BusinessType, GreenOMeter, CompanyImg, Blog, ContactUs 
from django.conf import settings
from django.contrib import admin
from forms import CompanyForm

class BlogAdmin(admin.ModelAdmin):
    pass


# class TopBannerAdmin(admin.ModelAdmin):
#     list_display = ('image', 'published_date')
#     fields = ('image')
#     def save_model(self, request, obj, form, change):
#         super(TopBannerAdmin, self).save_model(request, obj, form, change)
#         obj.created_by = request.user 
#         obj.save()

class CompanyImgInline(admin.StackedInline):
    model = CompanyImg
    extra = 1
    max_num = 5

class CompanyAdmin(admin.ModelAdmin):
    form = CompanyForm    
    exclude = ('modified_by',)
    inlines = (CompanyImgInline,)
    list_display = ('company_name','get_comments',)
    
    
    def get_comments(self, obj):
        """Returns the url for the comments of the Company.
        """
        return '<a target="_blank" href="/admin/comments/%s/">View Comments</a>' % (obj.id)
    get_comments.short_description = 'Comments'

    def save_model(self, request, obj, form, change):
        obj.modified_by = request.user
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
    
class CommentAdmin(admin.ModelAdmin):
    model = Comment
    exclude = ('done_by',)
    list_filter = ('company__id',)
    
    def save_model(self, request, obj, form, change):
        super(CommentAdmin, self).save_model(request, obj, form, change)
        obj.done_by = request.user
        obj.save()

class ContactUsAdmin(admin.ModelAdmin):
    model = ContactUs
    exclude = ('done_by',)
    list_filter = ('company__id',)
    
    def save_model(self, request, obj, form, change):
        super(CommentAdmin, self).save_model(request, obj, form, change)
        obj.done_by = request.user.id
        obj.save()
    
admin.site.register(Company, CompanyAdmin)
admin.site.register(Comment, CommentAdmin)
admin.site.register(ContactUs, ContactUsAdmin)
admin.site.register(Category)
admin.site.register(Subcategory, SubcategoryAdmin)
admin.site.register(BusinessType)
admin.site.register(GreenOMeter)
admin.site.register(Blog, BlogAdmin)