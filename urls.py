from django.conf.urls.defaults import patterns, include, url
from django.conf import settings
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
from django.views.generic.simple import direct_to_template
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^$', include('homepage.urls')),
    url(r'^footer/', include('footer.urls')),
    url(r'^tinymce/', include('tinymce.urls')),
#     url(r'^$', 'gogreen.website.views.index_page'),
    url(r'^(?P<cat>[-\w+]*)/(?P<subcat>[-\w+]*)/(?P<subcat_id>\d+)/$','gogreen.website.views.view_category', name='view_category'),
#     url(r'^home/$', direct_to_template,{'template':'home/home.html'},name='index'),
    url(r'^greenvichar/$', direct_to_template,{'template':'greenvichar/greenvichar.htm'},name='greenvichar'),
    url(r'^company/$', direct_to_template,{'template':'directory/company.htm'},name='company'),
#     url(r'^category/$', direct_to_template,{'template':'directory/keyword.html'},name='category'),
#     url(r'^search/$', direct_to_template,{'template':'directory/searchresult.htm'},name='search'),
    # url(r'^$', 'gogreen.views.home', name='home'),
    # url(r'^gogreen/', include('gogreen.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)

urlpatterns += patterns("django.views",
        url(r'^media(?P<path>.*)/$',
            "static.serve", {
            "document_root": settings.MEDIA_ROOT,
        })
    )