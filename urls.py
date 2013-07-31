from django.conf.urls.defaults import patterns, include, url
from django.conf import settings
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^tinymce/', include('tinymce.urls')),
    url(r'^$', 'gogreen.website.views.index_page'),
    url(r'^(?P<subcat>[-\w+]*)/(?P<subcat_id>\d+)/$','gogreen.website.views.view_category', name='view_company_list'),
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