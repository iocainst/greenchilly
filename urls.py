from django.conf.urls.defaults import *
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Example:
     (r'', include('djangogolf.web.urls')),
     (r'^i18n/', include('django.conf.urls.i18n')),
     (r'^login/$','django.contrib.auth.views.login'),
    (r'^logout/$','django.contrib.auth.views.logout'),
    (r'^passwordreset/$','django.contrib.auth.views.password_reset'),
    (r'^passwordreset/done/$','django.contrib.auth.views.password_reset_done'),

    # Uncomment the admin/doc line below and add 'django.contrib.admindocs'
    # to INSTALLED_APPS to enable admin documentation:
    # (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
     (r'^admin/(.*)', admin.site.root),
)
