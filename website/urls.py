from django.conf.urls.defaults import patterns, include, url
from django.views.generic.simple import direct_to_template
urlpatterns = patterns('',
    # Examples:
    url(r'^(?P<cname>[-\w+]*)/(?P<cid>\d+)/$', 'website.views.view_company', name='view_company'),
    url(r'^(?P<cname>[-\w+]*)/(?P<cid>\d+)/reviews/$','website.views.view_company_reviews', name='view_company_reviews'),
    url(r'^(?P<cat>[-\w+]*)/(?P<subcat>[-\w+]*)/(?P<subcat_id>\d+)/$','website.views.view_category', name='view_category'),
    
    url(r'^contact/$', 'website.views.ajax_save_contact', name='save_contact'),
    url(r'^review/$', 'website.views.ajax_save_review', name='save_review'),
    url(r'^search/$','website.views.search',name='search'),
        (r'^robots\.txt$', direct_to_template, {'template': 'robots.txt', 'mimetype': 'text/plain'}),
    )



