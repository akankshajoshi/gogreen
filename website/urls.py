from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('',
    # Examples:
    url(r'^(?P<cname>[-\w+]*)/(?P<cid>\d+)/$', 'website.views.view_company', name='view_company'),
    url(r'^(?P<cat>[-\w+]*)/(?P<subcat>[-\w+]*)/(?P<subcat_id>\d+)/$','website.views.view_category', name='view_category'),
    
    )



