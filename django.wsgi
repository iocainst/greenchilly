import os
import sys

sys.path.append('/home/kenneth/djangogolf')
sys.path.append('/home/kenneth')
os.environ['DJANGO_SETTINGS_MODULE'] = 'djangogolf.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()

