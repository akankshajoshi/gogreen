from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('',
    # Examples:
    url(r'^(?P<cname>[-\w+]*)/(?P<cid>\d+)/$', 'website.views.view_company', name='view_company'),
    url(r'^(?P<cat>[-\w+]*)/(?P<subcat>[-\w+]*)/(?P<subcat_id>\d+)/$','website.views.view_category', name='view_category'),
    url(r'^contact/$', 'website.views.ajax_save_contact', name='save_contact'),
    url(r'^review/$', 'website.views.ajax_save_review', name='save_review'),
    url(r'^search/$','website.views.search',name='search')
    )



