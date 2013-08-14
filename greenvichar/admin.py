from models import Comments, GreenVichar,  Event, PostArticle, \
    PicsVideo, Questionire, StoryQuotes, GreenVicharImg, GrnVchrHome
from django.contrib import admin
from django.conf import settings
    
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
    list_display = ('title', 'vichar_type', 'publish_date')
    fields = ('title', 'vichar_type', 'publish_date')
    
    class Media:
        js = [settings.MEDIA_URL + '/admin/js/admin.js']
        
    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        obj.save()
        super(GreenVicharAdmin, self).save_model(request, obj, form, change)

admin.site.register(Comments, CommentAdmin)
admin.site.register(GrnVchrHome)
admin.site.register(GreenVichar, GreenVicharAdmin)