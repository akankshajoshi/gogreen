from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('',
    # Examples:
    url(r'^$', 'greenvichar.views.home',name ='greenvichar'),
    url(r'^(?P<vichar_type>[-\w+]*)/(?P<vid>\d+)/listing/$', 'greenvichar.views.view_listing',name ='view_listing'),
    
    )