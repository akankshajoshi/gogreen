from models import AboutUs, Blog, Comments, ContactUs, Enquiry, Icons, Company , \
    Jobs, Category, Subcategory, GreenVichar, BusinessType, Event, PostArticle, \
    PicsVideo, Questionire, StoryQuotes, GreenVicharImg, GreenOMeter, PopularKeyword, \
    GrnVchrHome
from django.conf import settings
from django.contrib import admin
from forms import CompanyForm

class BlogAdmin(admin.ModelAdmin):
    pass

class CommentAdmin(admin.ModelAdmin):
    list_display = ('grnvichar', 'name', 'email', 'text', 'is_approve', 'moderation_date')
    actions = ('approve_selected',)
    fields = ('grnvichar', 'name', 'email', 'text', 'is_approve', 'moderation_date')
    readonly_fields = ('grnvichar', 'name', 'email', 'text', 'moderation_date')
     
    def approve_selected(self, request, queryset):
        rows_updated = queryset.filter(is_approve=False).update(is_approve=True, approve_by=request.user)
        if rows_updated == 1:
            message_bit = "1 Comment was"
        else:
            message_bit = "%s email moderations were" % rows_updated
        self.message_user(request, "%s successfully marked as Approved." % message_bit)
    approve_selected.short_description = "Approve all selected comments."
     
    def save_model(self, request, obj, form, change):
        super(CommentAdmin, self).save_model(request, obj, form, change)
        if obj.is_approve:
            obj.approve_by = request.user
            obj.save()
     
    def queryset(self, request):
        """Non-superuser should not be able to view superusers.
        """
        qs = super(CommentAdmin, self).queryset(request)
        qs.order_by('-moderationdate')
        return qs
 
 
admin.site.register(Comments, CommentAdmin)

class EventInline(admin.StackedInline):
    model = Event
    extra = 1
    max_num = 1
    
class PostArticleInline(admin.StackedInline):
    model = PostArticle
    extra = 1
    max_num = 1
    
class PicsVideoInline(admin.StackedInline):
    model = PicsVideo
    extra = 1
    max_num = 1

class StoryQuotesInline(admin.StackedInline):
    model = StoryQuotes
    extra = 1
    max_num = 1
    
class QuestionireInline(admin.StackedInline):
    model = Questionire
    extra = 1
    max_num = 1

class GreenVicharImgInline(admin.StackedInline):
    model = GreenVicharImg
    extra = 1
    max_num = 5

class GreenVicharAdmin(admin.ModelAdmin):
    inlines = [GreenVicharImgInline, EventInline, PostArticleInline, PicsVideoInline, StoryQuotesInline, 
               QuestionireInline]
    list_display = ('title', 'type', 'publish_date')
    fields = ('title', 'type', 'publish_date')
    
    class Media:
        js = [settings.MEDIA_URL + '/admin/js/admin.js']
        
    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        obj.save()
        super(GreenVicharAdmin, self).save_model(request, obj, form, change)
            
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
    
    
admin.site.register(Blog)
admin.site.register(GrnVchrHome)
admin.site.register(GreenVichar, GreenVicharAdmin)
admin.site.register(ContactUs)
admin.site.register(Enquiry)
admin.site.register(Icons)
admin.site.register(Company, CompanyAdmin)
admin.site.register(Jobs)
admin.site.register(Category)
admin.site.register(Subcategory, SubcategoryAdmin)
admin.site.register(BusinessType)
admin.site.register(GreenOMeter)
