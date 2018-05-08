from web.models import *
from django.template import Context, loader, RequestContext
from django.utils.translation import gettext_lazy as _
from django.shortcuts import render_to_response
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import  user_passes_test
import   os, random
from django import forms
from django.conf import settings
from django.forms import ModelForm
import cPickle
from utils import gethandicapmargin
from decimal import Decimal
import calendar
import gviz_api
import csv
import web

def playerlist(request):
    players = Player.objects.all()
    return render_to_response('web/sb_base.html',
        context_instance=RequestContext(request,
                {'players': players}))
