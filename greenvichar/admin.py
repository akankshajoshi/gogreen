from models import VicharComment, GreenVichar,  Event, Article, \
    PicsVideo, Questionire, StoryQuotes, GrnVchrHome
from forms import GreenVicharForm
from django.contrib import admin
from django.conf import settings
    
class VicharCommentAdmin(admin.ModelAdmin):
    list_display = ('get_grnvichar_name','get_vichar_type', 'name', 'email', 'text', 'status','approve_by')
#     actions = ('approve_selected',)
    fields = ('grnvichar','name', 'email', 'text', 'status','approve_by')
    list_editable = ('status',)
    
    def get_grnvichar_name(self, obj):
        return obj.grnvichar.title
    get_grnvichar_name.short_description = 'Green Vichar Name'
    
    def get_vichar_type(self, obj):
        return obj.grnvichar.get_vichar_type()
    get_vichar_type.short_description = 'Green Vichar Type'
        
     
    def approve_selected(self, request, queryset):
        rows_updated = queryset.filter(is_approve=False).update(is_approve=True, approve_by=request.user)
        if rows_updated == 1:
            message_bit = "1 Comment was"
        else:
            message_bit = "%s email moderations were" % rows_updated
        self.message_user(request, "%s successfully marked as Approved." % message_bit)
    approve_selected.short_description = "Approve all selected comments."
     
#     def save_model(self, request, obj, form, change):
#         super(CompanyCommentAdmin, self).save_model(request, obj, form, change)
#         if obj.is_approve:
#             obj.approve_by = request.user
#             obj.save()
    

     
    def queryset(self, request):
        qs = super(VicharCommentAdmin, self).queryset(request)
        qs.filter(status=0).order_by('-moderationdate')
        return qs


class EventInline(admin.StackedInline):
    model = Event
    extra = 1
    max_num = 1
    
class ArticleInline(admin.StackedInline):
    model = Article
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

class GreenVicharAdmin(admin.ModelAdmin):
    
    inlines = [EventInline, ArticleInline, PicsVideoInline, StoryQuotesInline, 
               QuestionireInline]
    list_display = ('get_vichar_type', 'publish_date','published_by')
    fields = ('vichar_type', 'publish_date','published_by')
    form = GreenVicharForm
    
    class Media:
        js = [settings.MEDIA_URL + '/admin/js/admin.js']
        
    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        obj.save()
        super(GreenVicharAdmin, self).save_model(request, obj, form, change)
    
    def get_vichar_type(self, obj):
        return obj.get_vichar_type()
    get_vichar_type.short_description = 'Green Vichar Type'
    
    def queryset(self, request):
        qs = super(GreenVicharAdmin, self).queryset(request)
        if request.user.groups.filter(name='frontenduser').count():
            qs= qs.filter(created_by = request.user)
        else:
            qs= qs.filter(status=0).order_by('-moderationdate')
        return qs
        
#     def add_view(self, request, form_url='', extra_context=None):
#         if request.method == 'GET':
#             initial = {'published_by': request.user.username}
#             form = self.form(initial=initial)
#         super(GreenVicharAdmin, self).add_view(self, request, form_url='', extra_context=None)
    
    
admin.site.register(VicharComment, VicharCommentAdmin)
admin.site.register(GrnVchrHome)
admin.site.register(GreenVichar, GreenVicharAdmin)