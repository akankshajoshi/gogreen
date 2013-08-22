from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('',
                       url(r'^enquiry/$','footer.views.enquiry', name='enquiry'),
                       )