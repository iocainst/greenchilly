# Create your views here.
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


def isingroup(user, grp):
    """
    A function to check if the user is a member of the given group.
    """
    return user.is_authenticated() and user.groups.filter(name=grp).count() > 0


DIFFERENTIALS = {
    5: 1,
    6: 1,
    7: 2,
    8: 2,
    9: 3,
    10: 3,
    11: 4,
    12: 4,
    13: 5,
    14: 5,
    15: 6,
    16: 6,
    17: 7,
    18: 8,
    19: 9,
    20: 10,
    }

menu_items = [

        {"name": _("Manage Courses"), "url": "managecourses/", "id": ""},
        {"name": _("Manage Players"), "url": "manageplayers/", "id": ""},
        {"name": _("Manage Handicaps"), "url": "managehandicaps/", "id": ""},
        {"name": _("Manage Tournaments"), "url": "managetournaments/", "id": ""},
        {"name": _("Hole difficulty csv"), "url": "statscsv/", "id": ""},
        {"name": _("Group cards"), "url": "showmembergroupcards/", "id": ""},
        {"name": _("Seasonal csv"), "url": "holediffdaterange/", "id": ""},
]
display_items = [
        {"name": _("Home"), "url": "home/", "id": ""},
        {"name": _("Statistics"), "url": "displaystats/", "id": ""},
        {"name": _("Leaderboards"), "url": "manageleaderboards/", "id": ""},
        {"name": _("Handicaps"), "url": "displayhandicaplist/", "id": ""},
]

#-------------------utilites


def sorry(request):
    t = loader.get_template("web/sorry.html")
    c = Context(
            {
            "request": request,
            })
    return HttpResponse(t.render(c))

MESSAGES = {
    'NO': _("Tournament results are declared"),
    'NP': _("You have not paid"),
    'AW': _("You have already written the exam"),
    }

def message(request, msg):
    msg = unquote(msg)
    t = loader.get_template("web/message.html")
    c = Context(
            {
            'request': request,
            'msg': MESSAGES[msg],
            })
    return HttpResponse(t.render(c))


def holecmp(x, y):
    return x.hole.number - y.hole.number


def datecomp(x, y):
    a = 0
    if x['date'] > y['date']:
        a = 1
    elif x['date'] < y['date']:
        a = -1
    return a


def scorecomp(x, y):
    def lastot(sc, first, last):
        tot = 0
        for num in range(first, last + 1):
            tot += sc['scores'][num]['sc']
        return tot

    if x[1]['total'] != y[1]['total']:
        return x[1]['total'] - y[1]['total']
    elif x[1]['back'] != y[1]['back']: #better second half
        return x[1]['back'] - y[1]['back']
    elif lastot(x[1], 13, 18) != lastot(y[1], 13, 18): #better last six
        return lastot(x[1], 13, 18) - lastot(y[1], 13, 18)
    elif lastot(x[1], 16, 18) != lastot(y[1], 16, 18): #better last three
        return lastot(x[1], 16, 18) - lastot(y[1], 16, 18)
    elif x[1]['scores'][18]['sc'] != y[1]['scores'][18]['sc']: #better last hole
        return x[1]['scores'][18]['sc'] - y[1]['scores'][18]['sc']
    else:
        return 0


def hdcmp(x, y):
    z = int(1000 * (x[1] - y[1]))
    return z


def cumsort(x, y):
    z = x[1] - y[1]
    return z


def allresultssort(x, y):
    return x[1]['total'] - y[1]['total']


def diffcomp(x, y):
    z = int(1000 * (x[1] - y[1]))
    return z


def holecomp(x, y):
    z = x[0] - y[0]
    return z


def addtime(stme, interval):
    datefull = datetime.datetime(1, 1, 1, stme.hour, stme.minute)
    newdate = datefull + datetime.timedelta(minutes=interval)
    return newdate.time()

#----------------------------------------user stuff

def index(request):
    """front page"""
    return render_to_response('web/index.html', context_instance=RequestContext(request, ))


def getfmonth():
    """returns the first month of the database"""
    epr = Practiceround.objects.all().order_by('rounddate')[0].rounddate
    if Matchentry.objects.all().count() > 0:
        eme = Matchentry.objects.all().order_by('tournament__startdate')[0].tournament.startdate
    else:
        eme = datetime.datetime.today()
    start = min(epr, eme)
    #get the first month
    if start.month == 12:
        sm = 1
        sy = start.year + 1
    else:
        sm = start.month + 1
        sy = start.year
    fmonth = datetime.datetime(sy, sm, 1)
    return fmonth


def chart(request, ply):
    """chart"""

    player = Player.objects.get(pk=ply)
    title = "Handicap variations for %s" % player
    back = '/statsdisp/%s/' % player.id
    fmonth = getfmonth()
    data = []
    while fmonth < datetime.datetime.today():
        memb = Member.objects.get(player=player)
        hindex = caldatehand(memb, fmonth)
        st = "%s %s" % (calendar.month_abbr[fmonth.month], fmonth.year)
        if hindex != 0.0:
            data.append([st, hindex])
        fmonth = fmonth + datetime.timedelta(days=calendar.monthrange(fmonth.year, fmonth.month)[1])
    description = [("Month", "string"),
        ("Handicap", "number")]


    # Loading it into gviz_api.DataTable
    data_table = gviz_api.DataTable(description)
    data_table.LoadData(data)
    json = data_table.ToJSon()
    # Creating a JSon string
    #json = data_table.ToJSon(columns_order=("name", "salary", "full_time"),
    #order_by="salary")
    return render_to_response('web/charttest.html', context_instance=RequestContext(request, {
        'json': json,
        'memb': memb,
        'back': back,
        'title': title}))


def roundstats(request):
    """round played stats"""
    fmonth = getfmonth()
    data = []
    club = Homeclub.objects.all()[0].course
    while fmonth < datetime.datetime.today():
        tr = Matchentry.objects.filter(
            tournament__startdate__gte=fmonth,
            tournament__startdate__lte=fmonth + datetime.timedelta(
                days=calendar.monthrange(fmonth.year, fmonth.month)[1] - 1)).count()
        pr = Practiceround.objects.filter(
            rounddate__gte=fmonth,
            rounddate__lte=fmonth + datetime.timedelta(days=calendar.monthrange(fmonth.year, fmonth.month)[1] - 1),
            tee__course=club).count()
        aw = Practiceround.objects.filter(
            rounddate__gte=fmonth,
            rounddate__lte=fmonth + datetime.timedelta(
                days=calendar.monthrange(fmonth.year, fmonth.month)[1] - 1)).exclude(
            tee__course=club).count()
        st = "%s %s" % (calendar.month_abbr[fmonth.month], fmonth.year)
        if tr + pr + aw > 20:
            data.append([st, tr, pr, aw, tr + pr + aw])
        fmonth = fmonth + datetime.timedelta(days=calendar.monthrange(fmonth.year, fmonth.month)[1])
    description = [("Month", "string"),
        ("Tournament", "number"),
        ("Practice", "number"),
        ("Away", "number"),
        ("Total", "number")]
    # Loading it into gviz_api.DataTable
    data_table = gviz_api.DataTable(description)
    data_table.LoadData(data)
    json = data_table.ToJSon()
    # Creating a JSon string
    #json = data_table.ToJSon(columns_order=("name", "salary", "full_time"),
    #order_by="salary")
    return render_to_response('web/charttest.html', context_instance=RequestContext(request, {
        'json': json,
        }))


def monthroundstats(request, year, month):
    """round played stats"""
    mnth = datetime.datetime(int(year), int(month), 1)
    ply = "%s %s" % (calendar.month_abbr[int(month)], year)
    fmonth = mnth
    data = []
    club = Homeclub.objects.all()[0].course
    while fmonth <= mnth + datetime.timedelta(days=calendar.monthrange(fmonth.year, fmonth.month)[1]):
        tr = Matchentry.objects.filter(
            tournament__startdate=fmonth).count()
        pr = Practiceround.objects.filter(
            rounddate=fmonth,
            tee__course=club).count()
        st = "%s %s" % (calendar.day_abbr[calendar.weekday(fmonth.year, fmonth.month, fmonth.day)], fmonth.day)
        data.append([st, tr, pr, tr + pr])
        fmonth = fmonth + datetime.timedelta(days=1)
    description = [("Date", "string"),
        ("Tournament", "number"),
        ("Practice", "number"),
        ("Total", "number")]
    # Loading it into gviz_api.DataTable
    data_table = gviz_api.DataTable(description)
    data_table.LoadData(data)
    json = data_table.ToJSon()
    return render_to_response('web/charttest.html', context_instance=RequestContext(request, {
        'json': json,
        'title': 'Rounds played',
        'ply': ply,
        }))


def holestats(request, hle):
    """round played stats"""
    holes = [x for x in range(1, 19)]
    club = Homeclub.objects.all()[0].course
    tscrs = Score.objects.filter(hole__number=int(hle), matchentry__player__homeclub=club)
    pscrs = Pscore.objects.filter(
        hole__number=int(hle), practiceround__member__player__homeclub=club)
    dick = {
        'pars': 0,
        'birdies': 0,
        'eagle+': 0,
        'bogeys': 0,
        'doubles': 0,
        'triple+': 0,
        }
    ply = 'all - tournament only'
    scrs = [x for x in tscrs]
    scrs = scrs + [x for x in pscrs]
    for scr in scrs:
        if scr.score == 0:
            dick['triple+'] += 1
        elif scr.score - scr.hole.par == 0:
            dick['pars'] += 1
        elif scr.score - scr.hole.par == 1:
            dick['bogeys'] += 1
        elif scr.score - scr.hole.par == 2:
            dick['doubles'] += 1
        elif scr.score - scr.hole.par >= 3:
            dick['triple+'] += 1
        elif scr.score - scr.hole.par == -1:
            dick['birdies'] += 1
        elif scr.score - scr.hole.par <= -2:
            dick['eagle+'] += 1
    description = [("Score", "string"),
        ("Count", "number")]
    data_table = gviz_api.DataTable(description)
    data = []
    data.append(('pars', dick['pars']))
    data.append(('birdies', dick['birdies']))
    data.append(('bogeys', dick['bogeys']))
    data.append(('doubles', dick['doubles']))
    data.append(('triple+', dick['triple+']))
    if dick['eagle+'] > 0:
        data.append(('eagle+', dick['eagle+']))
    data_table.LoadData(data)
    json = data_table.ToJSon()
    return render_to_response('web/holestats.html', context_instance=RequestContext(request, {
        'json': json,
        'hle': hle,
        'ply': ply,
        'holes': holes,
        }))


def holestatsind(request, ply):
    """hole stats for individuals"""
    ply = Player.objects.get(pk=ply)
    holes = [x for x in range(1, 19)]
    back = '/statsdisp/%s/' % ply.id
    json = {}
    for hle in holes:
        tscrs = Score.objects.filter(hole__number=int(hle), matchentry__player=ply)
        pscrs = Pscore.objects.filter(
            hole__number=int(hle), practiceround__member__player=ply)
        dick = {
            'pars': 0,
            'birdies': 0,
            'eagle+': 0,
            'bogeys': 0,
            'doubles': 0,
            'triple+': 0,
            }
        diff = 0
        scrs = [x for x in tscrs]
        scrs = scrs + [x for x in pscrs]
        for scr in scrs:
            if scr.score == 0:
                dick['triple+'] += 1
            elif scr.score - scr.hole.par == 0:
                dick['pars'] += 1
            elif scr.score - scr.hole.par == 1:
                dick['bogeys'] += 1
            elif scr.score - scr.hole.par == 2:
                dick['doubles'] += 1
            elif scr.score - scr.hole.par >= 3:
                dick['triple+'] += 1
            elif scr.score - scr.hole.par == -1:
                dick['birdies'] += 1
            elif scr.score - scr.hole.par <= -2:
                dick['eagle+'] += 1
            if scr.score == 0:
                diff += 3
            else:
                diff += scr.score - scr.hole.par
        description = [("Score", "string"),
            ("Count", "number")]
        data_table = gviz_api.DataTable(description)
        data = []
        data.append(('pars', dick['pars']))
        data.append(('birdies', dick['birdies']))
        data.append(('bogeys', dick['bogeys']))
        data.append(('doubles', dick['doubles']))
        data.append(('triple+', dick['triple+']))
        if dick['eagle+'] > 0:
            data.append(('eagle+', dick['eagle+']))
        data_table.LoadData(data)
        json[hle] = data_table.ToJSon()
    return render_to_response('web/holestatsind.html',
        context_instance=RequestContext(request, {
            'json': json,
            'ply': ply,
            'back': back,
            'holes': holes,
            }))


def holediff(request):
    """hole difficulty"""
    title = 'Relative hole difficulty'
    club = Homeclub.objects.all()[0].course
    ply = 'All players'
    scrs = Score.objects.select_related(depth=1).all()
    pscrs = Pscore.objects.select_related(depth=1).filter(hole__tee__course=club)
    dick = {}
    hls = Hole.objects.filter(tee__course=club)
    for hl in hls:
        dick[hl.number] = {}
        dick[hl.number]['diff'] = 0
        dick[hl.number]['tot'] = 0
        dick[hl.number]['pdiff'] = 0
        dick[hl.number]['ptot'] = 0
    for scr in scrs:
        if scr.score == 0:
            dick[scr.hole.number]['diff'] += 3
        else:
            dick[scr.hole.number]['diff'] += scr.score - scr.hole.par
        dick[scr.hole.number]['tot'] += 1
    for scr in pscrs:
        if scr.score == 0:
            dick[scr.hole.number]['pdiff'] += 3
        else:
            dick[scr.hole.number]['pdiff'] += scr.score - scr.hole.par
        dick[scr.hole.number]['ptot'] += 1
    description = [("Hole", "string"),
        ("Tournament", "number"),
        ("Practice", "number")]
    data_table = gviz_api.DataTable(description)
    data = []
    for k, v in dick.items():
        if v['tot'] == 0:
            v['tot'] = 1
        if v['ptot'] == 0:
            v['ptot'] = 1
        data.append((str(k), v['diff'] * 1.0 / v['tot'], v['pdiff'] * 1.0 / v['ptot']))
    data_table.LoadData(data)
    json = data_table.ToJSon()
    return render_to_response('web/charttest.html', context_instance=RequestContext(request, {
        'json': json,
        'title': title,
        'ply': ply,

        }))


def holediffrange(request, mx, mn):
    """hole difficulty within a range"""
    mx = int(mx)
    mn = int(mn)
    club = Homeclub.objects.all()[0].course
    dick = {}
    hls = Hole.objects.filter(tee__course=club)
    for hl in hls:
        dick[hl.number] = {}
        dick[hl.number]['diff'] = 0
        dick[hl.number]['tot'] = 0
        dick[hl.number]['pdiff'] = 0
        dick[hl.number]['ptot'] = 0
    mentries = Matchentry.objects.all()
    for mentry in mentries:
        if mn <= mentry.getcoursehandicap() <= mx:
            scrs = Score.objects.select_related(depth=1).filter(matchentry=mentry)
            for scr in scrs:
                if scr.score == 0:
                    dick[scr.hole.number]['diff'] += 3
                else:
                    dick[scr.hole.number]['diff'] += scr.score - scr.hole.par
                dick[scr.hole.number]['tot'] += 1
    mentries = Practiceround.objects.filter(tee__course=club)
    for mentry in mentries:
        if mn <= mentry.getcoursehandicap() <= mx:
            scrs = Pscore.objects.select_related(depth=1).filter(practiceround=mentry)
            for scr in scrs:
                if scr.score == 0:
                    dick[scr.hole.number]['pdiff'] += 3
                else:
                    dick[scr.hole.number]['pdiff'] += scr.score - scr.hole.par
                dick[scr.hole.number]['ptot'] += 1
    description = [("Hole", "string"),
        ("Tournament", "number"),
        ("Practice", "number")
    ]
    data_table = gviz_api.DataTable(description)
    data = []
    for k, v in dick.items():
        data.append((str(k), v['diff'] * 1.0 / v['tot'], v['pdiff'] * 1.0 / v['ptot']))
    data_table.LoadData(data)
    json = data_table.ToJSon()
    return render_to_response('web/charttest.html', context_instance=RequestContext(request, {
        'json': json,
        }))


def holediffdata(mx, mn):
    """hole difficulty within a range"""
    mx = int(mx)
    mn = int(mn)
    club = Homeclub.objects.all()[0].course
    dick = {}
    hls = Hole.objects.filter(tee__course=club)
    for hl in hls:
        dick[hl.number] = {}
        dick[hl.number]['diff'] = 0
        dick[hl.number]['tot'] = 0
    mentries = Matchentry.objects.all()
    for mentry in mentries:
        if mn <= mentry.getcoursehandicap() <= mx:
            scrs = Score.objects.select_related(depth=1).filter(matchentry=mentry)
            for scr in scrs:
                if scr.score == 0:
                    dick[scr.hole.number]['diff'] += 3
                else:
                    dick[scr.hole.number]['diff'] += scr.score - scr.hole.par
                dick[scr.hole.number]['tot'] += 1
    return dick


def statscsv(request):
    response = HttpResponse(mimetype='text/csv')
    response['Content-Disposition'] = 'attachment; filename=strokeindex.csv'
    cats = [
        (0, 30),
        (0, 9),
        (10, 17),
        (18, 24),
        (25, 40)
    ]
    writer = csv.writer(response)
    top = [x for x in range(1, 19)]
    top.insert(0, 'category')
    writer.writerow(top)
    for cat in cats:
        dick = holediffdata(cat[1], cat[0])
        title = '%s-%s' % (cat[0], cat[1])
        row = [title]
        for v in dick.values():
            row.append(round(v['diff'] * 1.0 / v['tot'], 2))
        writer.writerow(row)
    return response


def holediffdate(request):
    """hole difficulty within a range of """

    club = Homeclub.objects.all()[0].course
    dick = {}
    hls = Hole.objects.filter(tee__course=club)
    for hl in hls:
        dick[hl.number] = {}
        dick[hl.number]['diff'] = 0
        dick[hl.number]['tot'] = 0
        dick[hl.number]['pdiff'] = 0
        dick[hl.number]['ptot'] = 0
    mentries = Matchentry.objects.all()
    for mentry in mentries:
        if mentry.tournament.startdate.month in [11, 12, 1, 2, 3]:
            scrs = Score.objects.select_related(depth=1).filter(matchentry=mentry)
            for scr in scrs:
                if scr.score == 0:
                    dick[scr.hole.number]['diff'] += 3
                else:
                    dick[scr.hole.number]['diff'] += scr.score - scr.hole.par
                dick[scr.hole.number]['tot'] += 1
        else:
            scrs = Score.objects.select_related(depth=1).filter(matchentry=mentry)
            for scr in scrs:
                if scr.score == 0:
                    dick[scr.hole.number]['pdiff'] += 3
                else:
                    dick[scr.hole.number]['pdiff'] += scr.score - scr.hole.par
                dick[scr.hole.number]['ptot'] += 1
    description = [("Hole", "string"),
        ("Nov-Mar", "number"),
        ("Apr-Oct", "number")
    ]
    data_table = gviz_api.DataTable(description)
    data = []
    for k, v in dick.items():
        data.append((str(k), v['diff'] * 1.0 / v['tot'], v['pdiff'] * 1.0 / v['ptot']))
    data_table.LoadData(data)
    json = data_table.ToJSon()
    return render_to_response('web/charttest.html', context_instance=RequestContext(request, {
        'json': json,
        }))


def holediffdateind(request, ply):
    """seasonal difficulty for indvidual """

    club = Homeclub.objects.all()[0].course
    dick = {}
    hls = Hole.objects.filter(tee__course=club)
    for hl in hls:
        dick[hl.number] = {}
        dick[hl.number]['diff'] = 0
        dick[hl.number]['tot'] = 0
        dick[hl.number]['pdiff'] = 0
        dick[hl.number]['ptot'] = 0
    player = Player.objects.get(pk=ply)
    mentries = Matchentry.objects.filter(player=player)
    for mentry in mentries:
        if mentry.tournament.startdate.month in [11, 12, 1, 2, 3]:
            scrs = Score.objects.select_related(depth=1).filter(matchentry=mentry)
            for scr in scrs:
                if scr.score == 0:
                    dick[scr.hole.number]['diff'] += 3
                else:
                    dick[scr.hole.number]['diff'] += scr.score - scr.hole.par
                dick[scr.hole.number]['tot'] += 1
        else:
            scrs = Score.objects.select_related(depth=1).filter(matchentry=mentry)
            for scr in scrs:
                if scr.score == 0:
                    dick[scr.hole.number]['pdiff'] += 3
                else:
                    dick[scr.hole.number]['pdiff'] += scr.score - scr.hole.par
                dick[scr.hole.number]['ptot'] += 1
    description = [("Hole", "string"),
        ("Nov-Mar", "number"),
        ("Apr-Oct", "number")
    ]
    data_table = gviz_api.DataTable(description)
    data = []
    for k, v in dick.items():
        data.append((str(k), v['diff'] * 1.0 / v['tot'], v['pdiff'] * 1.0 / v['ptot']))
    data_table.LoadData(data)
    json = data_table.ToJSon()
    return render_to_response('web/charttest.html', context_instance=RequestContext(request, {
        'json': json,
        }))


class Handicaprangeform(forms.Form):
    mn = forms.IntegerField(label=_("minimum handicap"))
    mx = forms.IntegerField(label=_("maximum handicap"))


def holediffdaterange(request):
    """hole difficulty within a range of dates and hcaps"""
    if request.POST:
        form = Handicaprangeform(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            mn = cd['mn']
            mx = cd['mx']
            response = HttpResponse(mimetype='text/csv')
            response['Content-Disposition'] = 'attachment; filename=strokeindex.csv'
            writer = csv.writer(response)
            title = ['seasonal variation for handicap range %s to %s' % (mn, mx)]
            writer.writerow(title)
            top = [x for x in range(1, 19)]
            top.insert(0, 'season')
            writer.writerow(top)
            club = Homeclub.objects.all()[0].course
            dick = {}
            hls = Hole.objects.filter(tee__course=club)
            for hl in hls:
                dick[hl.number] = {}
                dick[hl.number]['diff'] = 0
                dick[hl.number]['tot'] = 0
                dick[hl.number]['pdiff'] = 0
                dick[hl.number]['ptot'] = 0
            mentries = Matchentry.objects.all()
            for mentry in mentries:
                if int(mn) <= mentry.getcoursehandicap() <= int(mx):
                    if mentry.tournament.startdate.month in [11, 12, 1, 2, 3]:
                        scrs = Score.objects.select_related(depth=1).filter(matchentry=mentry)
                        for scr in scrs:
                            if scr.score == 0:
                                dick[scr.hole.number]['diff'] += 3
                            else:
                                dick[scr.hole.number]['diff'] += scr.score - scr.hole.par
                            dick[scr.hole.number]['tot'] += 1
                    else:
                        scrs = Score.objects.select_related(depth=1).filter(matchentry=mentry)
                        for scr in scrs:
                            if scr.score == 0:
                                dick[scr.hole.number]['pdiff'] += 3
                            else:
                                dick[scr.hole.number]['pdiff'] += scr.score - scr.hole.par
                            dick[scr.hole.number]['ptot'] += 1
            row = ['nov-mar']
            for v in dick.values():
                row.append(round(v['diff'] * 1.0 / v['tot'], 2))
            writer.writerow(row)
            row = ['apr-oct']
            for v in dick.values():
                row.append(round(v['pdiff'] * 1.0 / v['ptot'], 2))
            writer.writerow(row)
            return response
    else:
        form = Handicaprangeform()
    return render_to_response('web/handicapform.html', context_instance=RequestContext(request, {
        'form': form,
        }))


def holediffind(request, id):
    """hole difficulty"""
    title = 'Relative difficulty of holes'
    ply = Player.objects.get(pk=id)
    club = Homeclub.objects.all()[0].course
    back = '/statsdisp/%s/' % id
    scrs = Score.objects.filter(matchentry__player=ply)
    pscrs = Pscore.objects.filter(hole__tee__course=club, practiceround__member__player=ply)
    dick = {}
    hls = Hole.objects.filter(tee__course=club)
    for hl in hls:
        dick[hl.number] = {}
        dick[hl.number]['diff'] = 0
        dick[hl.number]['tot'] = 0
        dick[hl.number]['pdiff'] = 0
        dick[hl.number]['ptot'] = 0
    for scr in scrs:
        if scr.score == 0:
            dick[scr.hole.number]['diff'] += 3
        else:
            dick[scr.hole.number]['diff'] += scr.score - scr.hole.par
        dick[scr.hole.number]['tot'] += 1
    for scr in pscrs:
        if scr.score == 0:
            dick[scr.hole.number]['pdiff'] += 3
        else:
            dick[scr.hole.number]['pdiff'] += scr.score - scr.hole.par
        dick[scr.hole.number]['ptot'] += 1
    description = [("Hole", "string"),
        ("Tournament", "number"),
        ("Practice", "number")]
    data_table = gviz_api.DataTable(description)
    data = []
    for k, v in dick.items():
        if v['tot'] == 0:
            v['tot'] = 1
        if v['ptot'] == 0:
            v['ptot'] = 1
        data.append((str(k), v['diff'] * 1.0 / v['tot'], v['pdiff'] * 1.0 / v['ptot']))
    data_table.LoadData(data)
    json = data_table.ToJSon()
    return render_to_response('web/charttest.html', context_instance=RequestContext(request, {
        'json': json,
        'ply': ply,
        'back': back,
        'title': title
    }))


class Statsform(forms.Form):
    def __init__(self, *args, **kwargs):
        super(Statsform, self).__init__(*args, **kwargs)
        self.fields['player'].choices = [(x.player.id, x.player) for x in
                                                                 Member.objects.all().order_by('player__last_name')]

    player = forms.ChoiceField(label=_("Player"))


class Statsform1(forms.Form):
    date = forms.DateField(label=_("Date"))


def displaystats(request):
    if request.POST:
        print request.POST
        if 'ply' in request.POST.keys():
            form = Statsform(request.POST)
            if form.is_valid():
                cd = form.cleaned_data
                return HttpResponseRedirect("/statsdisp/%s/" % cd['player'])
        elif 'datef' in request.POST.keys():
            form1 = Statsform1(request.POST)
            if form1.is_valid():
                cd = form1.cleaned_data
                month = cd['date'].month
                year = cd['date'].year
                return HttpResponseRedirect("/monthroundstats/%s/%s/" % (year, month))
    else:
        form = Statsform()
        form1 = Statsform1()
    return render_to_response("web/displaystats.html",
        context_instance=RequestContext(request,
                {
                "form": form,
                "form1": form1,
                }))


def statsdisp(request, ply):
    player = Player.objects.get(pk=ply)

    return render_to_response("web/statsdisp.html",
        context_instance=RequestContext(request,
                {"ply": ply,
                 'player': player,
                 }))


def sorry(request):
    t = loader.get_template("web/sorry.html")
    c = Context(
            {
            "request": request,
            })
    return HttpResponse(t.render(c))


#--------------------------------- golf stuff
# Course setup and change
class Courseform(ModelForm):
    class Meta:
        model = Course
        exclude = ()


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addcourse(request, id=None):
    """creates or edits a course
        """
    edit = False
    if id:
        oldcourse = Course.objects.get(pk=id)
        instance = oldcourse
        edit = True
    else:
        instance = None
    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/managecourses/')
        form = Courseform(request.POST, instance=instance)
        if form.is_valid():
            f = form.save()
            if 'save' in request.POST.keys():
                return HttpResponseRedirect('/managecourses/')
            else:
                return HttpResponseRedirect('/addcourse/')
    else:
        form = Courseform(instance=instance)
    return render_to_response('web/additem.html',
        context_instance=RequestContext(request,
                {'form': form,
                 'title': 'course',
                 'edit': edit,
                 }))

#draw
class Drawform(ModelForm):
    def __init__(self, tourn, *args, **kwargs):
        super(Drawform, self).__init__(*args, **kwargs)
        self.fields['tournament'].queryset = Tournament.objects.filter(id=int(tourn))

    class Meta:
        model = Draw
        exclude = ('done', 'drawlist')


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def adddraw(request, tourn):
    """creates or edits a draw
        """
    draw = None
    edit = False
    id = None
    try:
        id = Draw.objects.get(tournament=tourn).id
    except:
        pass
    if id:
        draw = Draw.objects.get(pk=id)
        instance = draw
        edit = True
    else:
        instance = None
    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/managetournaments/')
        form = Drawform(tourn, request.POST, instance=instance)
        if form.is_valid():
            f = form.save()

            return HttpResponseRedirect('/addteeoff/%s/' % f.id)

    else:
        form = Drawform(tourn, instance=instance)
    return render_to_response('web/adddraw.html',
        context_instance=RequestContext(request,
                {'form': form,
                 'title': 'draw',
                 'edit': edit,
                 'draw': draw}))


class Teeform(ModelForm):
    def __init__(self, courseid, *args, **kwargs):
        super(Teeform, self).__init__(*args, **kwargs)
        self.fields['course'].queryset = Course.objects.filter(id=int(courseid))

    class Meta:
        model = Tee
        exclude = ()


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addtee(request, courseid, id=None):
    """creates or edits a course
        """
    edit = False
    if id:
        oldcourse = Tee.objects.get(pk=id)
        instance = oldcourse
        edit = True
    else:
        instance = None
    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/showcourse/%d/' % courseid)
        form = Teeform(courseid, request.POST, instance=instance)
        if form.is_valid():
            f = form.save()
            if 'save' in request.POST.keys():
                return HttpResponseRedirect('/showcourse/%d/' % int(courseid))
            else:
                return HttpResponseRedirect('/addtee/%d/' % int(courseid))
    else:
        form = Teeform(courseid, instance=instance)
    return render_to_response('web/additem.html',
        context_instance=RequestContext(request,
                {'form': form,
                 'title': 'tee',
                 'edit': edit}))


class Holeform(ModelForm):
#def __init__(self,teeid,*args,**kwargs):
#super(Holeform,self).__init__(*args,**kwargs)
#self.teeid = teeid
#def clean(self):
#super(Holeform,self).clean()
#self.tee = Tee.objects.get(pk = self.teeid)
#for hole in self.tee.hole_set.all():
#if int(self.cleaned_data['number']) == int(hole.number) and int(hole.number) != int(self.oldcourse.number):
#raise forms.ValidationError('Duplicate hole number')
#if int(self.cleaned_data['strokeindex']) == int(hole.strokeindex) and int(hole.number) != int(self.oldcourse.number):
#raise forms.ValidationError('Duplicate stroke index')
#return self.cleaned_data

    class Meta:
        model = Hole
        exclude = ('tee',)


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addhole(request, teeid, id=None):
    """creates or edits a hole
        """
    edit = False
    tee = Tee.objects.get(pk=teeid)
    course = tee.course_id
    if id:
        oldcourse = Hole.objects.get(pk=id)
        instance = oldcourse
        edit = True
    else:
        instance = None
    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/showtee/%d/%d/' % (course, int(teeid)))
        form = Holeform(request.POST, instance=instance)
        if form.is_valid():
            f = form.save(commit=False)
            f.tee = tee
            f.save()
            if 'save' in request.POST.keys():
                return HttpResponseRedirect('/showtee/%d/%d/' % (course, f.tee_id))
            else:
                return HttpResponseRedirect('/addhole/%d/' % (int(teeid)))
    else:
        form = Holeform(instance=instance)
    return render_to_response('web/additem.html',
        context_instance=RequestContext(request,
                {'form': form,
                 'title': 'hole for %s' % tee,
                 'edit': edit}))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managecourses(request):
    """Displays all courses"""
    cr = Course.objects.all()
    return render_to_response('web/managecourses.html',
        context_instance=RequestContext(request,
                {'cr': cr}))


def manageleaderboards(request):
    """Displays all courses"""
    cr = Tournament.objects.filter(closed=False)
    return render_to_response('web/manageleaderboards.html',
        context_instance=RequestContext(request,
                {'cr': cr}))


def showcourse(request, id):
    """Displays one course"""
    cr = Course.objects.get(pk=id)
    return render_to_response('web/showcourse.html',
        context_instance=RequestContext(request,
                {'cr': cr}))


def showtee(request, course, id):
    """Displays one tee"""
    cr = Tee.objects.get(pk=id)
    return render_to_response('web/showtee.html',
        context_instance=RequestContext(request,
                {'cr': cr,
                 'course': course}))


def showscores(request, matchentry):
    """Displays one tee"""
    mentry = Matchentry.objects.get(pk=matchentry)
    card = Score.objects.filter(matchentry=mentry)
    return render_to_response('web/showscores.html',
        context_instance=RequestContext(request,
                {'card': card,
                 'mentry': mentry}))


class Addscoresform(forms.Form):
    """
        form to enter scores of a matchentry
        """

    def __init__(self, id, *args, **kwargs):
        super(Addscoresform, self).__init__(*args, **kwargs)
        self.id = id
        self.tee = Tee.objects.get(pk=self.id)

        for hle in range(1, 19):
            self.fields[hle] = forms.IntegerField(required=False, label="No: %d "
            % (hle))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addscores(request, matchentry):
    """
    Function to add/edit scores.
    """
    mentry = Matchentry.objects.get(pk=matchentry)
    if mentry.tournament.closed:
        return HttpResponseRedirect('/message/%s/' % ('NO'))
    id = mentry.tee_id
    tee = Tee.objects.get(pk=id)
    data = {}
    scores = Score.objects.filter(matchentry=mentry)
    for score in scores:
        data[score.hole.number] = score.score
    if request.POST:
        pst = request.POST.copy()
        for num in range(1, 19):
            if str(num) in pst:
                if pst[str(num)] == '':
                    pst[str(num)] = 0
                hle, created = Score.objects.get_or_create(matchentry=mentry,
                    hole=Hole.objects.get(tee=tee, number=num))
            if created or hle.score != pst[str(num)]:
            #           fm = hle.save(commit=False)
                hle.score = pst[str(num)]
                hle.save()
        if 'repeat' in request.POST.keys():
            return HttpResponseRedirect('/addscores/%s/' % id)
        else:
            return HttpResponseRedirect('/managescores/%s/' % mentry.tournament_id)
    else:
        form = Addscoresform(id, data)

    return render_to_response("web/addscores.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'mentry': mentry
        }))

#pscores
class Addpscoresform(forms.Form):
    """
        form to enter pscores of a practiceround
        """

    def __init__(self, *args, **kwargs):
        super(Addpscoresform, self).__init__(*args, **kwargs)

        for hle in range(1, 19):
            self.fields[hle] = forms.IntegerField(label="No: %d" % (hle), required=False)


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addpscores(request, prnd):
    """
    Function to add/edit pscores.
    """
    mentry = Practiceround.objects.get(pk=prnd)
    tee = mentry.tee
    data = {}
    club = mentry.member.player.homeclub.shortname
    scores = Pscore.objects.filter(practiceround=mentry)
    for score in scores:
        data[score.hole.number] = score.score
    if request.POST:
        form = Addpscoresform(request.POST)
        if form.is_valid():
            pst = request.POST.copy()
            for num in range(1, 19):
                if str(num) in pst:
                    if pst[str(num)] == '':
                        pst[str(num)] = 0
                    hle, created = Pscore.objects.get_or_create(practiceround=mentry,
                        hole=Hole.objects.get(tee=tee, number=num))
                if created or hle.score != pst[str(num)]:
                #           fm = hle.save(commit=False)
                    hle.score = pst[str(num)]
                    hle.save()

            return HttpResponseRedirect('/managepracticerounds/')
    else:
        form = Addpscoresform(data)

    return render_to_response("web/addpscores.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'mentry': mentry
        }))

# add/edit players

class Playerform(ModelForm):
    class Meta:
        model = Player
        exclude = ()


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addplayer(request, id=None):
    """
    Function to add/edit player.
    """
    flname = ''
    flurl = ''
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Player.objects.get(pk=id)
        try:
            flname = instance.photo
            flurl = instance.photo.url
        except:
            pass
        edit = True
    if request.POST:
        form = Playerform(request.POST, request.FILES, instance=instance)
        if form.is_valid():
            fm = form.save()
            if 'repeat' in request.POST.keys():
                return HttpResponseRedirect('/addplayer/')
            else:
                return HttpResponseRedirect('/manageplayers/')
    else:
        form = Playerform(instance=instance)
        try:
            flname = instance.photo
            flurl = instance.photo.url
        except:
            pass

    return render_to_response("web/addplayer.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'title': 'player',
                                                  'flurl': flurl,
                                                  'flname': flname,
                                                  }))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def manageplayers(request):
    """Displays all players"""
    cr = Player.objects.all()
    return render_to_response('web/manageplayers.html',
        context_instance=RequestContext(request,
                {'cr': cr}))

# add/edit members

class Memberform(ModelForm):
    def __init__(self, club, *args, **kwargs):
        super(Memberform, self).__init__(*args, **kwargs)
        self.club = club
        mems = Member.objects.filter(player__homeclub__shortname=self.club)
        ap = []
        for mem in mems:
            ap.append(mem.player.id)
        self.fields['player'].choices = [(x.id, x) for x in Player.objects.filter(homeclub__shortname=self.club) if
                                                   x.id not in ap]

    class Meta:
        model = Member
        exclude = ()


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addmember(request):
    """
    Function to add member
    """

    club = Homeclub.objects.all()[0].course.shortname
    if request.POST:
        form = Memberform(club, request.POST)
        if form.is_valid():
            fm = form.save()
            if 'repeat' in request.POST.keys():
                return HttpResponseRedirect('/addmember/')
            else:
                return HttpResponseRedirect('/managemembers/')
    else:
        form = Memberform(club)
    return render_to_response("web/additem.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'title': 'member',
                                                  'club': club,
                                                  }))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def deletemember(request, id):
    """
    Function to add member
    """

    memb = Member.objects.get(pk=id)
    if request.POST:
        if 'delete' in request.POST.keys():
            memb.delete()
            return HttpResponseRedirect('/managemembers/')
        else:
            return HttpResponseRedirect('/managemembers/')
    else:
        return render_to_response("web/confirm.html",
            context_instance=RequestContext(request, {'obj': memb,
                                                      }))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managemembers(request):
    """Displays all members"""
    club = Homeclub.objects.all()[0].course.shortname
    cr = Member.objects.filter(player__homeclub__shortname=club)
    return render_to_response('web/managemembers.html',
        context_instance=RequestContext(request,
                {'cr': cr,
                 'club': club}))


class Handicapform(ModelForm):
    def __init__(self, player, *args, **kwargs):
        super(Handicapform, self).__init__(*args, **kwargs)
        self.player = player
        #def clean(self):
        #super(Handicapform,self).clean()
        #for hand in self.player.handicap_set.all():
        #if self.cleaned_data['valto'] == hand.valto:
        #raise ValidationError(_("There is another handicap with the same to-date"))
        #if self.cleaned_data['valto'] < hand.valto:
        #raise ValidationError(_("There is another handicap with the a to-date\
        #greater than this one"))
        #return self.cleaned_data

    class Meta:
        model = Handicap
        exclude = ('player',)


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addhandicap(request, plr, id=None):
    """
    Function to add/edit handicap.
    """
    player = Player.objects.get(pk=plr)
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Handicap.objects.get(pk=id)
        edit = True
    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/managehandicaps/')
        form = Handicapform(player, request.POST, instance=instance)
        if form.is_valid():
            fm = form.save(commit=False)
            fm.player = player
            fm.save()
            return HttpResponseRedirect('/managehandicaps/')
    else:
        form = Handicapform(player, instance=instance)

    return render_to_response("web/addhandicap.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'title': 'handicap',
                                                  'edit': edit,
                                                  'player': player,
                                                  }))

#-----------tournaments

class Tournamentform(ModelForm):
    class Meta:
        model = Tournament
        exclude = ()


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addtournament(request, id=None):
    """
    Function to add/edit tournament.
    """
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Tournament.objects.get(pk=id)
        edit = True
    if request.POST:
        form = Tournamentform(request.POST, instance=instance)
        if form.is_valid():
            fm = form.save()
            return HttpResponseRedirect('/managetournaments/')
    else:
        form = Tournamentform(instance=instance)

    return render_to_response("web/additem.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'title': 'tournament',
                                                  'edit': edit,
                                                  }))

#add trophy
class Trophyform(ModelForm):
    class Meta:
        model = Trophy
        exclude = ('tournament',)


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addtrophy(request, trn, id=None):
    """
    Function to add/edit trophy.
    """
    tourn = Tournament.objects.get(pk=trn)
    if tourn.closed:
        return HttpResponseRedirect('/message/%s/' % ('NO'))
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Trophy.objects.get(pk=id)
        edit = True
    if request.POST:
        form = Trophyform(request.POST, instance=instance)
        if form.is_valid():
            fm = form.save(commit=False)
            fm.tournament = tourn
            fm.save()
            return HttpResponseRedirect('/managetrophies/%s/' % trn)
    else:
        form = Trophyform(instance=instance)

    return render_to_response("web/additem.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'title': 'trophy',
                                                  'edit': edit,
                                                  'tourn': tourn,
                                                  }))

#partnershiptrophy
class Partnershiptrophyform(ModelForm):
    class Meta:
        model = Partnershiptrophy
        exclude = ('tournament',)


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addpartnershiptrophy(request, trn, id=None):
    """
    Function to add/edit partnershiptrophy.
    """
    tourn = Tournament.objects.get(pk=trn)
    if tourn.closed:
        return HttpResponseRedirect('/message/%s/' % ('NO'))
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Partnershiptrophy.objects.get(pk=id)
    if request.POST:
        form = Partnershiptrophyform(request.POST, instance=instance)
        if form.is_valid():
            fm = form.save(commit=False)
            fm.tournament = tourn
            fm.save()
            return HttpResponseRedirect('/managepartnershiptrophies/%s/' % trn)
    else:
        form = Partnershiptrophyform(instance=instance)

    return render_to_response("web/additem.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'title': 'partnershiptrophy',
                                                  'edit': edit,
                                                  'tourn': tourn,
                                                  }))

#partnership3trophy
class Partnership3trophyform(ModelForm):
    class Meta:
        model = Partnership3trophy
        exclude = ('tournament',)


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addpartnership3trophy(request, trn, id=None):
    """
    Function to add/edit partnershiptrophy.
    """
    tourn = Tournament.objects.get(pk=trn)
    if tourn.closed:
        return HttpResponseRedirect('/message/%s/' % ('NO'))
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Partnership3trophy.objects.get(pk=id)
        edit = True
    if request.POST:
        form = Partnership3trophyform(request.POST, instance=instance)
        if form.is_valid():
            fm = form.save(commit=False)
            fm.tournament = tourn
            fm.save()
            return HttpResponseRedirect('/managepartnership3trophies/%s/' % trn)
    else:
        form = Partnership3trophyform(instance=instance)

    return render_to_response("web/additem.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'title': 'partnership3trophy',
                                                  'edit': edit,
                                                  'tourn': tourn,
                                                  }))

#entries
class Matchentryform(ModelForm):
    def __init__(self, tourn, *args, **kwargs):
        super(Matchentryform, self).__init__(*args, **kwargs)
        self.tourn = tourn
        self.tr = Matchentry.objects.filter(tournament=self.tourn)
        ap = []
        for x in self.tr:
            ap.append(x.player.id)
        self.fields['player'].choices = [(x.id, x) for x in Player.objects.all() if x.id not in ap]
        # need to add only the tees of the course in question
        self.course = Tournament.objects.get(pk=self.tourn).course
        self.fields['tee'].choices = [(x.id, x) for x in self.course.tee_set.all()]

    class Meta:
        model = Matchentry
        exclude = ('tournament',)


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addmatchentry(request, tourn, id=None):
    """
    Function to add/edit matchentry.
    """
    trn = Tournament.objects.get(pk=tourn)
    if trn.closed:
        return HttpResponseRedirect('/message/%s/' % ('NO'))
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Matchentry.objects.get(pk=id)
        edit = True
    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/manageentries/%s/' % tourn)
        form = Matchentryform(tourn, request.POST, instance=instance)
        if form.is_valid():
            fm = form.save(commit=False)

            fm.tournament_id = tourn
            fm.save()
        if 'repeat' in request.POST.keys():
            return HttpResponseRedirect('/addmatchentry/%s/' % tourn)
        else:
            return HttpResponseRedirect('/manageentries/%s/' % tourn)
    else:
        form = Matchentryform(tourn, instance=instance)

    return render_to_response("web/additem.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'title': 'matchentry',
                                                  'edit': edit,
                                                  }))

#practice round
class Practiceroundform(ModelForm):
    def __init__(self, club, *args, **kwargs):
        super(Practiceroundform, self).__init__(*args, **kwargs)
        self.club = club

        self.fields['member'].queryset = Member.objects.filter(player__homeclub__shortname=self.club)

    class Meta:
        model = Practiceround
        exclude = ('accepted',)


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addpracticeround(request, id=None):
    """
    Function to add/edit practiceround.
    """
    club = Homeclub.objects.all()[0].course.shortname
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Practiceround.objects.get(pk=id)
        if instance.accepted:
            return HttpResponseRedirect('/message/%s/' % ('NO'))
        edit = True
    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/managepracticerounds/')
        form = Practiceroundform(club, request.POST, instance=instance)
        if form.is_valid():
            #add code to make sure there is no scoring record
            fm = form.save(commit=False)
            fm.accepted = False
            fm.save()
            if edit:
                #tee might have changed so redo the pscores if any
                if fm.pscore_set.all().count() > 0:
                    for score in fm.pscore_set.all():
                        num = score.hole.number
                        newhole = Hole.objects.get(tee=fm.tee, number=num)
                        score.hole = newhole
                        score.save()
            if 'repeat' in request.POST.keys():
                return HttpResponseRedirect('/addpracticeround/')
            else:
                return HttpResponseRedirect('/managepracticerounds/')
    else:
        form = Practiceroundform(club, instance=instance)

    return render_to_response("web/additem.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'title': 'practiceround',
                                                  'edit': edit,
                                                  'club': club,
                                                  }))


#Teeoffs
class Teeoffform(ModelForm):
    def __init__(self, dick, *args, **kwargs):
        super(Teeoffform, self).__init__(*args, **kwargs)
        self.draw = dick['draw']
        self.tr = Teeoff.objects.filter(draw=self.draw)
        ap = []
        for x in self.tr:
            ap.append(x.hole)

        self.fields['hole'].choices = [(x,) for x in range(1, 19) if x not in ap]
        self.fields['fourballs'].initial = dick['fourball']
        self.fields['threeballs'].initial = dick['threeball']
        self.fields['twoballs'].initial = dick['twoball']
        self.fields['singles'].initial = dick['single']


    class Meta:
        model = Teeoff
        exclude = ('tournament',)


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addteeoff(request, drw, id=None):
    """
    Function to add/edit teeoff.
    """
    draw = Draw.objects.get(pk=drw)
    trn = Tournament.objects.get(draw=draw)
    tourn = Tournament.objects.get(pk=trn.id)
    if tourn.closed:
        return HttpResponseRedirect('/message/%s/' % ('NO'))
    players = Matchentry.objects.filter(tournament=trn).order_by('?')
    msg = ''
    drawover = False
    ply = len(players)
    teeoffs = draw.teeoff_set.all()
    groups, over = divmod(ply, draw.groupsize)
    dick = {'draw': draw}
    dick['extragroup'] = 0
    dick['fourball'] = 0
    dick['threeball'] = 0
    dick['twoball'] = 0
    dick['single'] = 0
    if draw.groupsize == 4:
        extragroup = over
        if over == 3:
            dick['threeball'] = 1
        if over == 2:
            dick['twoball'] = 1
        if over == 1:
            dick['single'] = 1
        dick['fourball'] = groups
        msg = "There are %d groups of %d including one  group of size %d" % (groups + 1, draw.groupsize, over)
    if draw.groupsize == 3:
        if groups == 0:
            if over == 2:
                dick['twoball'] = 1
            if over == 1:
                dick['single'] = 1
        else:
            dick['fourball'] = over
            dick['threeball'] = groups - dick['fourball']
        msg = "There are %d groups of %d including %d fourballs" % (groups, draw.groupsize, over)
    if draw.groupsize == 2:
        dick['threeball'] = over
        dick['twoball'] = groups
        msg = "There are %d groups of %d including %d threeball" % (groups, draw.groupsize, over)
    for t in teeoffs:
        used = t.fourballs * 4 + t.threeballs * 3 + t.twoballs * 2 + t.singles
        ply = ply - used

        if ply:
            groups, over = divmod(ply, draw.groupsize)

            dick['extragroup'] = 0
            dick['fourball'] = 0
            dick['threeball'] = 0
            dick['twoball'] = 0
            dick['single'] = 0
            if draw.groupsize == 4:
                extragroup = over
                if over == 3:
                    dick['threeball'] = 1
                if over == 2:
                    dick['twoball'] = 1
                if over == 1:
                    dick['single'] = 1
                dick['fourball'] = groups
                msg = "There are %d groups of %d including one  group of size %d" % (groups + 1, draw.groupsize, over)
            if draw.groupsize == 3:
                if groups == 0:
                    if over == 2:
                        dick['twoball'] = 1
                    if over == 1:
                        dick['single'] = 1
                else:
                    dick['fourball'] = over
                    dick['threeball'] = groups - dick['fourball']
                msg = "There are %d groups of %d including %d fourballs" % (groups, draw.groupsize, over)
            if draw.groupsize == 2:
                dick['threeball'] = over
                dick['twoball'] = groups
                msg = "There are %d groups of %d including %d threeball" % (groups, draw.groupsize, over)
        else:
            msg = "All players have been allotted"
            drawover = True
            form = ''

    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/adddraw/%s/' % trn.id)
        form = Teeoffform(dick, request.POST)
        if form.is_valid():
            fm = form.save(commit=False)
            fm.draw_id = drw
            fm.save()

        return HttpResponseRedirect('/adddraw/%s/' % trn.id)
    else:
        form = Teeoffform(dick)

    return render_to_response("web/addteeoff.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'title': 'teeoff',
                                                  'msg': msg,
                                                  'draw': draw,
                                                  'drawover': drawover,
                                                  }))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def deletematchentry(request, id):
    entry = Matchentry.objects.get(pk=id)
    tourn = entry.tournament.id
    trn = entry.tournament
    if trn.closed:
        return HttpResponseRedirect('/message/%s/' % ('NO'))
    if request.POST:
        if 'delete' in request.POST.keys():
            entry.delete()
        return HttpResponseRedirect('/manageentries/%s/' % tourn)
    else:
        return render_to_response("web/confirm.html",
            context_instance=RequestContext(request, {'obj': entry,

                                                      }))


def deletepracticeround(request, sel, club):
    obj = ''
    for x in sel:
        prnd = Practiceround.objects.get(pk=int(x))
        obj = obj + ' ' + str(prnd)

    if request.POST:
        if 'remove' in request.POST.keys():
            for x in sel:
                prnd = Practiceround.objects.get(pk=int(x))
                for sc in prnd.pscore_set.all():
                    sc.delete()
                prnd.delete()
            return HttpResponseRedirect('/managepracticerounds/')
        else:
            return render_to_response("web/confirm.html",
                context_instance=RequestContext(request, {'obj': obj}))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managehandicaps(request):
    """get all players and display their latest handicaps"""
    cr = Player.objects.all()
    return render_to_response('web/managehandicaps.html',
        context_instance=RequestContext(request,
                {'cr': cr}))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managetournaments(request):
    """get all players and display their latest handicaps"""
    cr = Tournament.objects.filter(closed=False)
    return render_to_response('web/managetournaments.html',
        context_instance=RequestContext(request,
                {'cr': cr}))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managetrophies(request, trn):
    """add and get results for trophies"""
    tourn = Tournament.objects.get(pk=trn)
    cr = Trophy.objects.filter(tournament=trn)
    return render_to_response('web/managetrophies.html',
        context_instance=RequestContext(request,
                {'cr': cr,
                 'tourn': tourn}))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managemultitrophies(request, trn):
    """add and get results for trophies"""
    tourn = Tournament.objects.get(pk=trn)
    cr = Trophy.objects.filter(tournament=trn)
    return render_to_response('web/managemultitrophies.html',
        context_instance=RequestContext(request,
                {'cr': cr,
                 'tourn': tourn}))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managepartnershiptrophies(request, trn):
    """add and get results for trophies"""
    tourn = Tournament.objects.get(pk=trn)
    cr = Partnershiptrophy.objects.filter(tournament=trn)
    return render_to_response('web/managepartnershiptrophies.html',
        context_instance=RequestContext(request,
                {'cr': cr,
                 'tourn': tourn}))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managepartnership3trophies(request, trn):
    """add and get results for trophies"""
    tourn = Tournament.objects.get(pk=trn)
    cr = Partnership3trophy.objects.filter(tournament=trn)
    return render_to_response('web/managepartnership3trophies.html',
        context_instance=RequestContext(request,
                {'cr': cr,
                 'tourn': tourn}))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def manageentries(request, trn):
    """match players to tournaments"""
    entries = Matchentry.objects.filter(tournament=trn)
    tourn = Tournament.objects.get(pk=trn)
    return render_to_response('web/manageentries.html',
        context_instance=RequestContext(request,
                {'entries': entries,
                 'tourn': tourn}))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managepracticerounds(request):
    """match players to tournaments"""
    club = Homeclub.objects.all()[0].course.shortname
    ents = Practiceround.objects.filter(
        accepted=False).filter(member__player__homeclub__shortname=club).order_by('-rounddate')
    entries = []
    for ent in ents:
        entries.append((ent, ent.getscores(), ent.getescscores()))
    if request.POST:
        if 'accept' and 'sel' in request.POST.keys():
            for x in request.POST.getlist('sel'):
                prnd = Practiceround.objects.get(pk=int(x))
                #make sure it is a full round
                if prnd.pscore_set.all().count() != 18:
                    continue
                    #add to scoring record
                screc = Scoringrecord.objects.create(
                    scoredate=prnd.rounddate,
                    member=prnd.member,
                    tee=prnd.tee,
                    scoretype=prnd.scoretype,
                    score=prnd.getesctotal(),
                    courserating=prnd.tee.courserating,
                    sloperating=prnd.tee.sloperating)
                prnd.accepted = True
                prnd.save()
            return HttpResponseRedirect('/managepracticerounds/')
        if 'remove' and 'sel' in request.POST.keys():
            dels = request.POST.getlist('sel')
            deletepracticeround(request, dels, club)
            return HttpResponseRedirect('/managepracticerounds/')
    return render_to_response('web/managepracticerounds.html',
        context_instance=RequestContext(request,
                {'entries': entries,
                 'club': club}))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managescores(request, trn):
    """match players to tournaments"""
    entrs = Matchentry.objects.filter(tournament=trn)
    entries = []
    for ent in entrs:
        entries.append((ent, ent.getscores()))
    tourn = Tournament.objects.get(pk=trn)
    tee = tourn.course.tee_set.all()[0]
    return render_to_response('web/managescores.html',
        context_instance=RequestContext(request,
                {'entries': entries,
                 'tourn': tourn,
                 'tee': tee}))


def leaderboard(request, trn, nextt=None):
    """match players to tournaments"""
    nextt = int(nextt)
    if not nextt:
        nextt = 0
    tourn = Tournament.objects.get(pk=trn)
    if tourn.kind == 'IN':
        trps = list(Trophy.objects.filter(tournament=tourn))
    elif tourn.kind == 'PT':
        trps = list(Partnershiptrophy.objects.filter(tournament=tourn))
    elif tourn.kind == 'P3':
        trps = list(Partnership3trophy.objects.filter(tournament=tourn))
    elif tourn.kind == 'TM':
        trps = list(Teamtrophy.objects.filter(tournament=tourn))
    numtrp = len(trps)
    trp = trps[int(nextt)]
    if tourn.kind == 'IN' and tourn.rounds == 1:
        res = getresults(trp)
    if tourn.kind == 'PT':
        res = getpartnerresults(trp)
    if tourn.kind == 'P3':
        res = getpartner3results(trp)
    if tourn.kind == 'TM':
        res = getteamresults(trp)
    tee = trp.tournament.course.tee_set.all()[0]
    if nextt < numtrp - 1:
        nextt += 1
    else:
        nextt = 0
    if tourn.rounds > 1:
        lastround, results = trp.getmultiround()
        rnds = [x for x in range(1, lastround + 1)]
        return render_to_response('web/showmultiresults.html',
            context_instance=RequestContext(request,
                    {
                    'trph': trp,
                    'results': results,
                    'lr': lastround,
                    'rnds': rnds,
                    'tee': tee,
                    'nextt': nextt,
                    'tourn': tourn,
                    'trps': trps, }))
    if tourn.kind == 'TM':
        return render_to_response('web/results.html',
            context_instance=RequestContext(request,
                    {'trph': trp,
                     'trophyentries': res,
                     'tee': tee,
                     'nextt': nextt,
                     'tourn': tourn,
                     'trps': trps,
                     }))
    return render_to_response('web/showresults.html',
        context_instance=RequestContext(request,
                {'trph': trp,
                 'trophyentries': res,
                 'tee': tee,
                 'nextt': nextt,
                 'tourn': tourn,
                 'trps': trps,
                 }))


def getresults(trph):
    """results of a trophy"""
    tourn = trph.tournament.id
    trn = Tournament.objects.get(pk=tourn)
    # get players within the handicap range:
    entries = list(Matchentry.objects.filter(tournament=tourn))
    # get handicap limits
    trophyentries = []
    for entry in entries:
        if not entry.scored():
            continue
        if entry.getcoursehandicap() in range(trph.handicapmin, trph.handicapmax + 1):
            if trph.format == 'AG':
                res = entry.getnettbogey()
            elif trph.format == 'ST':
                res = entry.getnettstableford()
            elif trph.format == 'AD':
                res = entry.getaddleford()
            elif trph.format == 'GM':
                res = entry.getgrossmr()
            elif trph.format == 'GS':
                res = entry.getgrossstableford()
            elif trph.format == 'GG':
                res = entry.getgrossbogey()
            elif trph.format == 'MR':
                res = entry.getnettmr()
            elif trph.format == 'MB':
                res = entry.getnettmodbogey()
            elif trph.format == 'VL':
                res = entry.velappan()
            elif trph.format == 'GB':
                res = entry.getgrossmodbogey()
            elif trph.format in ['A', 'B', 'C', 'D', 'E', 'F', 'AB', 'BG', 'CG']:
                res = entry.getcatmedal(trph.format)
            if res and 'DQ' not in res and len(res['scores'].keys()) == 18:
                trophyentries.append((entry.player, res), )
    if trph.format in ['MR', 'GM', 'A', 'B', 'C', 'D', 'E', 'F', 'AB', 'BG', 'CG']:
        trophyentries.sort(cmp=scorecomp)
    else:
        trophyentries.sort(cmp=scorecomp, reverse=True)
    return trophyentries


def showresults(request, trp):
    """results of a trophy"""
    trph = Trophy.objects.get(pk=trp)
    trophyentries = getresults(trph)
    tee = trph.tournament.course.tee_set.all()[0]
    return render_to_response('web/showresultsstat.html',
        context_instance=RequestContext(request,
                {
                'trph': trph,
                'trophyentries': trophyentries,
                'tee': tee}))


def showmultiresults(request, trp):
    """multiround tournaments"""
    trph = Trophy.objects.get(pk=trp)
    lastround, results = trph.getmultiround()
    tee = trph.tournament.course.tee_set.all()[0]
    rnds = [x for x in range(1, lastround + 1)]
    return render_to_response('web/showmultiresultsstat.html',
        context_instance=RequestContext(request,
                {
                'trph': trph,
                'results': results,
                'lr': lastround,
                'rnds': rnds,
                'tee': tee}))


#partnership trophy
def getpartnerresults(trph):
    """results of a partnershiptrophy"""
    tourn = trph.tournament.id
    # get players within the handicap range:
    entries = Partner.objects.filter(tournament=tourn)
    # get handicap limits
    trophyentries = []
    for entry in entries:
        res = []
        #scramble has scores for only one partner hence the following 4 lines
        if (not entry.member1.scored() or not entry.member2.scored()) and trph.format not in ['SC', 'SG']:
            continue
        if (not entry.member1.scored() and not entry.member2.scored()) and trph.format in ['SC', 'SG','NS','GS']:
            continue
        if trph.format == 'SG':
            res = entry.getgrossscramble()
        if trph.format == 'GR':
            res = entry.getgrossscores()
        if trph.format == 'GS':
            res = entry.getgrossswitch()
        if trph.format == 'GM':
            res = entry.getgrossmultiply()
        if trph.format == 'MR':
            res = entry.getgrossscoresmr()
            if res == ['dq']:
                continue
        if entry.member1.getcoursehandicap() in range(trph.handicapmin, trph.handicapmax + 1):
            if trph.format == 'SC':
                res = entry.getnettscramble()
            if trph.format == 'NS':
                res = entry.getnettswitch()
            if trph.format == 'NM':
                res = entry.getnettmultiply()
            if trph.format == 'NT':
                res = entry.getscores()
            if trph.format == 'CS':
                res = entry.getcombinedstableford()
            if trph.format == 'GC':
                res = entry.getgrosscombinedstableford()
            if trph.format == 'MT':
                res = entry.getscoresmr()
            if res == ['dq']:
                continue
            if res:
                trophyentries.append((entry, res), )
    if trph.format in ['SC', 'SG', 'MR', 'MT']:
        trophyentries.sort(cmp=scorecomp)
    if trph.format in ['GR', 'NT', 'CS', 'GC','NS','GS','GM','NM']:
        trophyentries.sort(cmp=scorecomp, reverse=True)
    return trophyentries


def showpartnerresults(request, trp):
    """results of a trophy"""
    trph = Partnershiptrophy.objects.get(pk=trp)
    trophyentries = getpartnerresults(trph)
    tee = trph.tournament.course.tee_set.all()[0]
    return render_to_response('web/showresultsstat.html',
        context_instance=RequestContext(request,
                {
                'trph': trph,
                'trophyentries': trophyentries,
                'tee': tee}))


def showteamresults(request, trp):
    """results of a trophy"""
    trph = Teamtrophy.objects.get(pk=trp)
    trophyentries = getteamresults(trph)
    tee = trph.tournament.course.tee_set.all()[0]
    return render_to_response('web/showteamresults.html',
        context_instance=RequestContext(request,
                {
                'trph': trph,
                'trophyentries': trophyentries,
                'tee': tee}))


def getpartner3results(trph):
    """results of a partnershiptrophy"""
    tourn = trph.tournament.id
    # get players within the handicap range:
    entries = Partner3.objects.filter(tournament=tourn)
    # get handicap limits
    trophyentries = []
    for entry in entries:
        res = []
        if not entry.member1.scored():
            continue
        if trph.format == 'N3':
            res = entry.getscores()
        if trph.format == 'G3':
            res = entry.getgrossscores()
        if res:
            trophyentries.append((entry, res), )

    trophyentries.sort(cmp=scorecomp, reverse=True)

    return trophyentries


def getteamresults(trph):
    """results of a teamtrophy"""
    tourn = trph.tournament.id
    # get players within the handicap range:
    entries = Team.objects.filter(tournament=tourn)
    # get handicap limits
    trophyentries = []
    for entry in entries:
        if entry.members.all().count() == 0:
            continue
        res = []
        if trph.format == 'CN':
            res = entry.getscores()
        if trph.format == 'CG':
            res = entry.getgrossscores()
        if trph.format == 'GN':
            res = entry.gkdscores()
        if trph.format == 'GG':
            res = entry.gkdgrossscores()
        if trph.format == 'MN':
            res = entry.medalscores()
        if trph.format == 'MG':
            res = entry.medalgrossscores()
        if 'DQ' not in res:
            trophyentries.append((entry, res), )
    if trph.format in ['GN', 'GG', 'MN', 'MG']:
        trophyentries.sort(cmp=allresultssort)
    else:
        trophyentries.sort(cmp=allresultssort, reverse=True)
    return trophyentries


def showpartner3results(request, trp):
    """results of a trophy"""
    trph = Partnership3trophy.objects.get(pk=trp)
    trophyentries = getpartner3results(trph)
    tee = trph.tournament.course.tee_set.all()[0]
    return render_to_response('web/showpartner3results.html',
        context_instance=RequestContext(request,
                {
                'trph': trph,
                'trophyentries': trophyentries,
                'tee': tee}))


def getdrawlist(drw):
    """
    structure:
    drawlist = [
                {'tee': 1,'groups':[
                {'starttime':stime,players:[
                                            {'sno':sno,'player':player},
                                            {'sno':sno,'player':player}
                                            ]
                }]}]
    """
    draw = Draw.objects.get(pk=drw)
    trn = draw.tournament
    ment = list(Matchentry.objects.filter(tournament=trn).order_by('?'))
    drawlist = []
    sno = 1
    for t in draw.teeoff_set.all():
        stme = t.starttime
        teebox = {}
        teebox['hole'] = t.hole
        teebox['groups'] = []
        grp1 = 0
        if draw.groupsize == 4:
            #get the extra group
            if t.threeballs:
                grp1 = 3
            if t.twoballs:
                grp1 = 2
            if t.singles:
                grp1 = 1
        if grp1:
            players = []
            groups = {}
            for x in range(grp1):
                players.append({'sno': sno, 'player': ment.pop()})
                sno += 1
            groups['starttime'] = stme
            groups['players'] = players
            teebox['groups'].append(groups)
            stme = addtime(stme, draw.interval)
            #now get the range
        if draw.groupsize == 4:
            if t.fourballs:
                for x in range(t.fourballs):
                    groups = {}
                    players = []
                    for y in range(4):
                        players.append({'sno': sno, 'player': ment.pop()})
                        sno += 1
                    groups['starttime'] = stme
                    groups['players'] = players
                    teebox['groups'].append(groups)
                    stme = addtime(stme, draw.interval)
        if draw.groupsize == 3:
            if t.threeballs:
                for x in range(t.threeballs):
                    players = []
                    groups = {}
                    for y in range(3):
                        players.append({'sno': sno, 'player': ment.pop()})
                        sno += 1
                    groups['starttime'] = stme
                    groups['players'] = players
                    teebox['groups'].append(groups)
                    stme = addtime(stme, draw.interval)
            if t.fourballs:
                for x in range(t.fourballs):
                    players = []
                    groups = {}
                    for y in range(4):
                        players.append({'sno': sno, 'player': ment.pop()})
                        sno += 1
                    groups['starttime'] = stme
                    groups['players'] = players
                    teebox['groups'].append(groups)
                    stme = addtime(stme, draw.interval)
        if draw.groupsize == 2:
            for x in range(t.twoballs - t.threeballs):
                groups = {}
                players = []
                for y in range(2):
                    players.append({'sno': sno, 'player': ment.pop()})
                    sno += 1
                groups['starttime'] = stme
                groups['players'] = players
                stme = addtime(stme, draw.interval)
                if t.threeballs:
                    for x in range(t.threeballs):
                        groups = {}
                        players = []
                        for y in range(3):
                            players.append({'sno': sno, 'player': ment.pop()})
                            sno += 1
                        groups['starttime'] = stime
                        groups['players'] = players
                        stme = addtime(stme, draw.interval)
        drawlist.append([teebox])
    return drawlist


def showdraw(request, drw):
    drawlist = getdrawlist(drw)
    if request.POST:
        if 'accept' in request.POST.keys():
            draw = Draw.objects.get(pk=drw)
            flname = draw.getfile()
            fullname = os.path.join(settings.MEDIA_ROOT, 'draws', flname)
            fl = open(fullname, 'w')
            fld = flatdraw(drawlist)
            cPickle.dump(fld, fl)
            fl.close()
            draw.drawlist = flname
            draw.done = True
            draw.save()
            return HttpResponseRedirect("/adjustdraw/%s/" % drw)
        else:
            return HttpResponseRedirect("/showdraw/%s/" % drw)
    return render_to_response('web/showdraw.html',
        context_instance=RequestContext(request,
                {
                'drawlist': drawlist,
                }))


def flatdraw(drawlist):
    fld = []
    for drw in drawlist:
        for d in drw:
            #fld.append(d['hole'])
            for x in d['groups']:
                #fld.append(x['starttime'])
                for ply in x['players']:
                    fld.append([ply['sno'], d['hole'], x['starttime'], ply['player']])

    return fld


def exchangeplayers(fld, x, y):
    xplayer = None
    yplayer = None
    for s in fld:
        if int(s[0]) == int(x):
            xplayer = s[3]
        if int(s[0]) == int(y):
            yplayer = s[3]
    for s in fld:
        if int(s[0]) == int(x):
            s[3] = yplayer
        if int(s[0]) == int(y):
            s[3] = xplayer
    return fld


class Adjustdrawform(forms.Form):
    def __init__(self, request, fld, *args, **kwargs):
        super(Adjustdrawform, self).__init__(*args, **kwargs)
        self.fld = fld
        self.request = request
        self.fields['players'].choices = [(s[0], "%s %s %s " % (s[1], s[2], s[3].player)) for s in self.fld]

    players = forms.MultipleChoiceField(choices=(), required=False, widget=forms.CheckboxSelectMultiple)

    def clean_players(self):
        data = self.cleaned_data['players']
        if 'adjust' in self.request.POST.keys() and len(data) != 2:
            raise forms.ValidationError("Please select exactly 2 players")

        return self.cleaned_data['players']


def adjustdraw(request, drw):
    draw = Draw.objects.get(pk=drw)
    flname = draw.getfile()
    fullname = os.path.join(settings.MEDIA_ROOT, 'draws', flname)
    fl = open(fullname, 'r')
    fld = cPickle.load(fl)
    fl.close()
    if request.method == 'POST':
        form = Adjustdrawform(request, fld, request.POST)
        if form.is_valid():
            fm = form.cleaned_data
            if 'adjust' in request.POST.keys() and 'players' in request.POST.keys():
                a, b = fm['players']
                fld = exchangeplayers(fld, a, b)
                fl = open(fullname, 'w')
                cPickle.dump(fld, fl)
                fl.close()
                return HttpResponseRedirect("/adjustdraw/%s/" % drw)
            else: # 'ok' in request.POST.keys():
                return HttpResponseRedirect("/finaldraw/%s/" % drw)

    else:
        form = Adjustdrawform(request, fld)
    return render_to_response('web/adjustdraw.html',
        context_instance=RequestContext(request,
                {
                'form': form,
                }))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def finaldraw(request, drw):
    """a pretty display of the draw"""
    draw = Draw.objects.get(pk=drw)
    tourn = Tournament.objects.get(pk=draw.tournament.id)
    trophies = tourn.trophy_set.all()
    startdate = tourn.startdate
    troph = ''
    for tr in trophies:
        troph = troph + tr.name + ' ' + tr.get_format_display() + ' ' + str(tr.handicapmin) + ' to ' + str(
            tr.handicapmax) + '<br/>'
    flname = draw.getfile()
    fullname = os.path.join(settings.MEDIA_ROOT, 'draws', flname)
    fl = open(fullname, 'r')
    fld = cPickle.load(fl)
    fl.close()
    display = []
    hole = ''
    tme = ''
    for s in fld:
        if hole != str(s[1]):
            display.append("Teebox: %s" % s[1])
            hole = str(s[1])
        if tme != str(s[2]):
            display.append("Time: %s" % str(s[2]))
            tme = str(s[2])
        display.append("%s %s %s" % (s[0], s[3].player, s[3].getcoursehandicap()))

    return render_to_response('web/finaldraw.html',
        context_instance=RequestContext(request,
                {'display': display,
                 'troph': troph,
                 'startdate': startdate}))


def statistics(trn=None):
    sd = {
        'albatrosses': 0,
        'eagles': 0,
        'birdies': 0,
        'pars': 0,
        'bogeys': 0,
        'doublebogeys': 0,
        'triplebogeys': 0,
        'quadbogeys': 0,
        'over quadbogey': 0,
        }
    hd = {}
    for h in range(1, 19):
        hd[h] = {}
        hd[h]['score'] = 0
        hd[h]['score 0-9'] = 0
        hd[h]['score 10-18'] = 0
        hd[h]['score 19-30'] = 0
        hd[h]['partot'] = 0
    if not trn:
        scores = Score.objects.all()
    else:
        scores = Score.objects.filter(matchentry__tournament=trn)
    for score in scores:
        sc = score.score
        par = score.hole.par
        stroke = score.hole.strokeindex
        ch = score.matchentry.getcoursehandicap()
        if sc == 0:
            if ch >= stroke + 18:
                sc = par + 4
            elif ch >= stroke:
                sc = par + 3
            else:
                sc = par + 2

        hd[score.hole.number]['score'] += sc
        if ch > 18:
            hd[score.hole.number]['score 19-30'] += sc
        elif ch > 9:
            hd[score.hole.number]['score 10-18'] += sc
        else:
            hd[score.hole.number]['score 0-9'] += sc
        hd[score.hole.number]['partot'] += par
        if par - sc == 3:
            sd['albatrosses'] += 1
        if par - sc == 2:
            sd['eagles'] += 1
        if par - sc == 1:
            sd['birdies'] += 1
        if par - sc == 0:
            sd['pars'] += 1
        if par - sc == -1:
            sd['bogeys'] += 1
        if par - sc == -2:
            sd['doublebogeys'] += 1
        if par - sc == -3:
            sd['triplebogeys'] += 1
        if par - sc == -4:
            sd['quadbogeys'] += 1
        if par - sc < -4:
            sd['over quadbogey'] += 1
    slr = {}
    slr['all'] = []
    slr['0-9'] = []
    slr['10-18'] = []
    slr['19-30'] = []
    for k, v in hd.items():
        hdness = round(v['score 0-9'] * 1.0 / v['partot'], 4)
        slr['0-9'].append([k, hdness])
        hdness = round(v['score 10-18'] * 1.0 / v['partot'], 4)
        slr['10-18'].append([k, hdness])
        hdness = round(v['score 19-30'] * 1.0 / v['partot'], 4)
        slr['19-30'].append([k, hdness])
        hdness = round(v['score'] * 1.0 / v['partot'], 4)
        slr['all'].append([k, hdness])
    slr['all'].sort(cmp=hdcmp)
    slr['0-9'].sort(cmp=hdcmp)
    slr['10-18'].sort(cmp=hdcmp)
    slr['19-30'].sort(cmp=hdcmp)
    return {'slr': slr, 'sd': sd}


def closealltournaments():
    tourns = Tournament.objects.filter(closed=False)
    for tourn in tourns:
        closetournament(tourn.id)
    return 1


def refreshtscores():
    tourns = Tournament.objects.all()
    tscores = Scoringrecord.objects.filter(scoretype='T')
    for tourn in tourns:
        mentries = tourn.matchentry_set.all()
        members = Member.objects.values_list('player', flat=True)
        for mentry in mentries:
            #if it is a member, get esc score and add to scoring record
            if mentry.player.id in members and mentry.scored():
                mem = Member.objects.get(player=mentry.player)
                x = Scoringrecord.objects.filter(scoredate=mentry.tournament.startdate,
                    member=mem,
                    scoretype='T').count()
                if x == 0:
                    esc = mentry.getesctotal()
                    sc = Scoringrecord.objects.create(
                        score=esc,
                        member=mem,
                        scoredate=mentry.tournament.startdate,
                        scoretype='T',
                        courserating=mentry.tee.courserating,
                        sloperating=mentry.tee.sloperating,
                        tee=mentry.tee)
    return 1


def addnewtscores():
    tourns = Tournament.objects.all()

    for tourn in tourns:
        mentries = tourn.matchentry_set.all()
        members = Member.objects.values_list('player', flat=True)
        for mentry in mentries:
            #if it is a member, get esc score and add to scoring record
            if mentry.player.id in members and mentry.scored():
                mem = Member.objects.get(player=mentry.player)
                x = Scoringrecord.objects.filter(scoredate=mentry.tournament.startdate,
                    member=mem,
                    scoretype='T').count()
                if x == 0:
                    esc = mentry.getesctotal()
                    sc = Scoringrecord.objects.create(
                        score=esc,
                        member=mem,
                        scoredate=mentry.tournament.startdate,
                        scoretype='T',
                        courserating=mentry.tee.courserating,
                        sloperating=mentry.tee.sloperating,
                        tee=mentry.tee)
    return 1

#@user_passes_test(lambda u: isingroup(u,'committee') == True,login_url="/login/")
def closetournament(request, trn):
    tourn = Tournament.objects.get(pk=trn)
    if tourn.closed:
        return HttpResponseRedirect('/tournamentfull/%s/' % trn)
        #here we have to deal with multiround tournaments
    for rnd in range(1, tourn.rounds + 1):
        mentries = Matchentry.objects.filter(tournament=tourn, round=rnd)
        if rnd > 1:
            currentrounddate = Round.objects.get(tournament=tourn, num=rnd).startdate
        else:
            currentrounddate = tourn.startdate
        members = Member.objects.values_list('player', flat=True)
        for mentry in mentries:
            #if it is a member, get esc score and add to scoring record
            if mentry.player.id in members and mentry.scored():
                mem = Member.objects.get(player=mentry.player)
                esc = mentry.getesctotal()
                if Scoringrecord.objects.filter(member=mem, scoredate=currentrounddate).count() > 0:
                    continue
                sc = Scoringrecord.objects.create(
                    score=esc,
                    member=mem,
                    scoredate=currentrounddate,
                    scoretype='T',
                    courserating=mentry.tee.courserating,
                    sloperating=mentry.tee.sloperating,
                    tee=mentry.tee)


    # #save trophy results
    # for trp in tourn.trophy_set.all():
    #     res = getresults(trp)
    #     flname = trp.getfile()
    #     fullname = os.path.join(settings.MEDIA_ROOT, 'draws', flname)
    #     fl = open(fullname, 'w')
    #     cPickle.dump(res, fl)
    #     fl.close()
        #get stats and save them too
    # res = statistics(trn)
    # flname = tourn.getfile()
    # fullname = os.path.join(settings.MEDIA_ROOT, 'draws', flname)
    # fl = open(fullname, 'w')
    # cPickle.dump(res, fl)
    # fl.close()
    #get cumulative stats and save
    #res = statistics()
    #flname = 'cumulative'
    #fullname = os.path.join(settings.MEDIA_ROOT,'draws',flname)
    #fl = open(fullname,'w')
    #cPickle.dump(res,fl)
    #fl.close()
    tourn.closed = True
    tourn.save()
    return HttpResponseRedirect('/tournamentfull/%s/' % trn)


def displaytournaments(request):
    tourns = Tournament.objects.filter(closed=True)
    flname = 'cumulative'
    fullname = os.path.join(settings.MEDIA_ROOT, 'draws', flname)
    fl = open(fullname, 'r')
    stats = cPickle.load(fl)
    fl.close()
    data = []
    hls = stats['slr']['all']
    for x in hls:
        data.append([x[0], x[1] * 10])
    ticks = []
    for x in range(1, 19):
        ticks.append([x, str(x)])
    data.sort(cmp=holecomp)
    data = [data]
    return render_to_response('web/displaytournaments.html',
        context_instance=RequestContext(request,
                {'tourns': tourns,
                 'stats': stats,
                 'data': data,
                 'ticks': ticks,
                 }))


def tournamentfull(request, trn):
    return render_to_response('web/tournamentfull.html')


@user_passes_test(lambda u: isingroup(u, 'committee') == True, login_url="/login/")
def calculatehandicap(request):
    #get member and most recent scoring records
    membs = Member.objects.all()
    hlist = []
    for memb in membs:
        hindex = calhand(memb)
        try:
            x = currenthandicap.objects.get(member=memb)
            x.handicap = str(hindex)
            x.handicaptype = 'N'
            x.save()
        except:
            x = currenthandicap.objects.create(member=memb, handicap=str(hindex), handicaptype='N')
            #add to handicap table
            #tdy = datetime.datetime.today()
            #rnge = calendar.monthrange(tdy.year,tdy.month)
            #frm = datetime.datetime(tdy.year,tdy.month,1)
            #to = datetime.datetime(tdy.year,tdy.month,rnge[1])
            #y = Handicap.objects.create(player=memb.player,handicap=Decimal(str(hindex)),valfrom=frm,valto=to)
    return HttpResponseRedirect('/displayhandicaplist/')

#@user_passes_test(lambda u: isingroup(u,'committee') == True,login_url="/login/")
def calculatemonthhandicap():
    """calculate and store handicap for every month"""
    #first get the earliest date in the system
    epr = Practiceround.objects.all().order_by('rounddate')[0].rounddate
    eme = Matchentry.objects.all().order_by('tournament__startdate')[0].tournament.startdate
    start = min(epr, eme)
    #get the first month
    if start.month == 12:
        sm = 1
        sy = start.year + 1
    else:
        sm = start.month + 1
        sy = start.year
    fmonth = datetime.datetime(sy, sm, 1)
    while fmonth < datetime.datetime.today():
        membs = Member.objects.all()
        hlist = []
        for memb in membs:
            hindex = caldatehand(memb, fmonth)
            #try:
            #x = currenthandicap.objects.get(member=memb)
            #x.handicap = str(hindex)
            #x.handicaptype = 'N'
            #x.save()
            #except:
            #x = currenthandicap.objects.create(member=memb,handicap=str(hindex),handicaptype='N')
        fmonth = fmonth + datetime.timedelta(days=calendar.monthrange(fmonth.year, fmonth.month)[1])
        #get member and most recent scoring records

        #return HttpResponseRedirect('/displayhandicaplist/')


def getcut(memb, hindex):
    """gets the figures for a possible revision"""
    cut = 0
    app = 'NA'
    if memb.scoringrecord_set.filter(scoretype='T').filter(
        scoredate__gt=datetime.datetime.now() + datetime.timedelta(days=-365)).count() >= 2:
        tscores = memb.scoringrecord_set.filter(scoretype='T').filter(
            scoredate__gt=datetime.datetime.now() + datetime.timedelta(days=-365)).order_by('score')
        x = tscores[1]
        cutdiff = round((x.score - x.courserating) * 113 / x.sloperating, 1)
        cut = float(hindex) - float(cutdiff)
        if cut <= 3.0:
            cut = 0
            app = "NA"
        else:
            avg = round((tscores[0].score - x.courserating) * 113 / x.sloperating + (tscores[
                                                                                     0].score - x.courserating) * 113 / x.sloperating
                , 1) / 2
            ct = round(float(hindex) - float(avg), 1)
            tot = len(tscores)
            app = "Cut %s tscores %s" % (ct, tot)
    return app


class Revisehandicapform(forms.Form):
    def __init__(self, hlist, *args, **kwargs):
        super(Revisehandicapform, self).__init__(*args, **kwargs)
        self.hlist = hlist
        #queryset to be just those who have a cut pending

        self.eligible = []
        for mem in self.hlist:
            if mem[4] != 'NA':
                self.eligible.append(mem[0].id)
        self.fields['member'] = forms.MultipleChoiceField(
            choices=[(x.id, x)for x in Member.objects.filter(id__in=self.eligible)])


@user_passes_test(lambda u: isingroup(u, 'committee') == True, login_url="/login/")
def revisehandicap(request):
    """presents handicaps for revision revises the handicap of selected members
        and saves it with an R marker"""
    hlist = curhandicaplist()
    if request.POST:
        form = Revisehandicapform(hlist, request.POST)
        if form.is_valid():
            for x in request.POST.getlist('member'):
                for hand in hlist:
                    if hand[0].id == int(x):
                        app = hand[4]
                        mem = hand[0]
                        appparse = app.split()
                        ct = float(appparse[1])
                        tot = int(appparse[3])
                        amtcut = gethandicapmargin(tot, ct)
                        currhand = currenthandicap.objects.get(member=mem)
                        hindex = currhand.handicap
                        currhand.handicap = Decimal(str(hindex)) - Decimal(str(amtcut))
                        currhand.handicaptype = 'R'
                        currhand.save()
            return HttpResponseRedirect('/displayhandicaplist/')
    else:
        form = Revisehandicapform(hlist)
    return render_to_response('web/curcut.html',
        context_instance=RequestContext(request,
                {'form': form}))


def curhandicaplist():
    """this will get the list from the current handicap model"""
    membs = Member.objects.all()
    hlist = []
    kind = None
    for memb in membs:
        try:
            hcap = currenthandicap.objects.get(member=memb)
            hindex = hcap.handicap
            kind = [ htype[1] for htype in HANDICAPTYPES if htype[0] == hcap.handicaptype ][0]
        except:
            continue
        if not memb.hide:
            chand = int(round(hindex * memb.membsr() / 113))
            app = getcut(memb, hindex)
            hlist.append((memb, hindex, kind, chand, app))
    return hlist


def getcurhandicaplist(request):
    hlist = curhandicaplist()
    handlist = {'date': datetime.datetime.now(), 'hlist': hlist}
    return render_to_response('web/handicaplist.html',
        context_instance=RequestContext(request,
                {'handlist': handlist, }))


def calhand(memb):
    """calculates handicap index for a member"""
    srec = memb.scoringrecord_set.filter(
        scoredate__gt=datetime.datetime.now() + datetime.timedelta(days=-365)).order_by('-scoredate')[:20]
    #get differentials
    diffs = []
    for sr in srec:
        diff = round((sr.score - sr.courserating) * 113 / sr.sloperating, 1)
        diffs.append((sr, diff))
    if len(diffs) < 5:
        hindex = 0
        memb.hide = True
        memb.save()
    else:
        memb.hide = False
        memb.save()
        diffs.sort(cmp=diffcomp)
        x = len(diffs)
        diffs = diffs[:DIFFERENTIALS[x]]
        tot = 0
        for x in diffs:
            tot += x[1]
        hindex = int(9.6 * tot / len(diffs)) / 10.0
    return hindex


def caldatehand(memb, fmonth):
    """calculates handicap index for a member"""
    srec = memb.scoringrecord_set.filter(
        scoredate__gt=fmonth + datetime.timedelta(days=-365), scoredate__lt=fmonth).order_by('-scoredate')[:20]
    #get differentials
    diffs = []
    for sr in srec:
        diff = round((sr.score - sr.courserating) * 113 / sr.sloperating, 1)
        diffs.append((sr, diff))
    if len(diffs) < 5:
        hindex = 0
        memb.hide = True
        memb.save()
    else:
        memb.hide = False
        memb.save()
        diffs.sort(cmp=diffcomp)
        x = len(diffs)
        diffs = diffs[:DIFFERENTIALS[x]]
        tot = 0
        for x in diffs:
            tot += x[1]
        hindex = int(9.6 * tot / len(diffs)) / 10.0
    return hindex


class Calindhandicapform(forms.Form):
    member = forms.ModelChoiceField(queryset=Member.objects.all(), empty_label=None)


@user_passes_test(lambda u: isingroup(u, 'committee') == True, login_url="/login/")
def calindhandicap(request):
    """given a list of members it chooses a member and recalculates handicap"""
    calculated = False
    memb = None
    hindex = None
    app = None
    if request.method == 'POST':
        form = Calindhandicapform(request.POST)
        if form.is_valid():
            fm = form.cleaned_data
            memb = fm['member']
            hindex = calhand(memb)
            chand = int(round(hindex * memb.membsr() / 113))
            app = getcut(memb, hindex)
            calculated = True
            try:
                x = currenthandicap.objects.get(member=memb)
                x.handicap = str(hindex)
                x.save()
            except:
                x = currenthandicap.objects.create(member=memb, handicap=str(hindex))
    else:
        form = Calindhandicapform()
    return render_to_response('web/calindhandicap.html',
        context_instance=RequestContext(request,
                {'memb': memb,
                 'hindex': hindex,
                 'cut': app,
                 'form': form,
                 'calculated': calculated}))


def displayhandicap(request):
    club = Homeclub.objects.all()[0]
    flname = "handicaplist%s%s%s" % ('ogc',
                                     datetime.datetime.now().year,
                                     datetime.datetime.now().month
        )
    fullname = os.path.join(settings.MEDIA_ROOT, 'draws', flname)
    handlist = {}
    try:
        fl = open(fullname, 'r')
        handlist = cPickle.load(fl)

        fl.close()
    except:
        pass

    return render_to_response('web/handicaplist.html',
        context_instance=RequestContext(request,
                {'handlist': handlist,
                 'club': club}))


def scoringrecord(request, ply):
    """displays a members scoring record"""
    memb = Member.objects.get(pk=ply)
    srec = memb.scoringrecord_set.filter(
        scoredate__gt=datetime.datetime.now() + datetime.timedelta(days=-365)).order_by('-scoredate')[:20]
    #get differentials
    diffs = []
    tdiffs = []
    for sr in srec:
        diff = round((sr.score - sr.courserating) * 113 / sr.sloperating, 1)
        diffs.append((sr, diff))
    diffs.sort(cmp=diffcomp)
    if memb.scoringrecord_set.filter(scoretype='T').filter(
        scoredate__gt=datetime.datetime.now() + datetime.timedelta(days=-365)).count() >= 2:
        tscores = memb.scoringrecord_set.filter(scoretype='T').filter(
            scoredate__gt=datetime.datetime.now() + datetime.timedelta(days=-365)).order_by('score')

        for ts in tscores:
            diff = round((ts.score - ts.tee.courserating) * 113 / ts.tee.sloperating, 1)
            tdiffs.append((ts.score, diff, ts.scoredate))
            tdiffs.sort(cmp=diffcomp)
    return render_to_response('web/scoringrecord.html',
        context_instance=RequestContext(request,
                {'diffs': diffs,
                 'memb': memb,
                 'tdiffs': tdiffs}))


def showcards(request, mem):
    """members 20 most recent cards"""
    memb = Member.objects.get(pk=mem)
    entries = Practiceround.objects.filter(member=mem).filter(
        rounddate__gt=datetime.datetime.now() + datetime.timedelta(days=-365)).order_by('-rounddate')[:20]

    return render_to_response('web/showcards.html',
        context_instance=RequestContext(request,
                {'entries': entries,
                 'memb': memb}))


class Membergroupform(forms.Form):
    fromdate = forms.DateField(label=_("From Date"))
    todate = forms.DateField(label=_("To Date"))
    membergroup = forms.ModelChoiceField(queryset=Membergroup.objects.all())


def showmembergroupcards(request):
    """cards for membergroups within a date range"""
    if request.POST:
        form = Membergroupform(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            response = HttpResponse(mimetype='text/csv')
            response['Content-Disposition'] = 'attachment; filename=strokeindex.csv'
            writer = csv.writer(response)
            todate = cd['todate']
            fromdate = cd['fromdate']
            membergroup = cd['membergroup']
            head = [str(membergroup.name), str(fromdate), str(todate)]
            writer.writerow(head)
            scores = {}
            for member in membergroup.members.all():
                scores[member] = []
                entries = Practiceround.objects.filter(member=member).filter(
                    rounddate__gt=fromdate, rounddate__lt=todate).order_by('-rounddate')
                for entry in entries:
                    scs = entry.getscores()
                    scs['date'] = entry.rounddate
                    scs['type'] = 'practice'
                    scores[member].append(scs)
                mentries = Matchentry.objects.filter(player=member.player).filter(
                    tournament__startdate__gt=fromdate, tournament__startdate__lt=todate).order_by(
                    '-tournament__startdate')
                for mentry in mentries:
                    scs = mentry.getscores()
                    if scs['total'] > 0:
                        scs['date'] = mentry.tournament.startdate
                        scs['type'] = 'tournament'
                        scores[member].append(scs)
                scores[member].sort(cmp=datecomp)
            for k, v in scores.items():
                if len(v) == 0:
                    continue
                top = []
                top.extend([x for x in range(1, 10)])
                top.append('front')
                top.extend([x for x in range(10, 19)])
                top.append('back')
                top.append('total')
                top.insert(0, str(k.currenthandicap().handicap))
                top.insert(0, str(k))
                writer.writerow(top)
                for b in v:
                    row = []
                    row.append(str(b['date']))
                    row.append(str(b['type']))
                    for z in range(1, 10):
                        if b['type'] == 'tournament':
                            row.append(b['scores'][z]['sc'])
                        else:
                            row.append(b['scores'][z])
                    row.append(b['front'])
                    for z in range(10, 19):
                        if b['type'] == 'tournament':
                            row.append(b['scores'][z]['sc'])
                        else:
                            row.append(b['scores'][z])
                    row.append(b['back'])
                    row.append(b['total'])
                    writer.writerow(row)
                    rw = [' ', ' ']
                writer.writerow(rw)
            return response
    else:
        form = Membergroupform()
    return render_to_response('web/membergroup.html',
        context_instance=RequestContext(request,
                {'form': form,
                 }))


#teams stuff
#manageteamtrophies
@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def manageteamtrophy(request, tournid):
    """Displays all team trophies for open tournaments"""
    cr = Teamtrophy.objects.filter(tournament__id=tournid)
    tourn = Tournament.objects.get(pk=tournid)
    return render_to_response('web/manageteamtrophies.html',
        context_instance=RequestContext(request,
                {'cr': cr,
                 'tourn': tourn}))


#add/edit teamtrophies
class Teamtrophyform(ModelForm):
    def __init__(self, tournid, *args, **kwargs):
        super(Teamtrophyform, self).__init__(*args, **kwargs)
        self.fields['tournament'].queryset = Tournament.objects.filter(id=int(tournid))

    class Meta:
        model = Teamtrophy
        exclude = ()


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addteamtrophy(request, tournid, id=None):
    """creates or edits a team trophy
        """
    edit = False
    if id:
        oldcourse = Teamtrophy.objects.get(pk=id)
        instance = oldcourse
        edit = True
    else:
        instance = None
    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/manageteamtrophy/%d/' % int(tournid))
        form = Teamtrophyform(tournid, request.POST, instance=instance)
        if form.is_valid():
            f = form.save()
            if 'save' in request.POST.keys():
                return HttpResponseRedirect('/manageteamtrophy/%d/' % int(tournid))
            else:
                return HttpResponseRedirect('/addteamtrophy/%d/' % int(tournid))
    else:
        form = Teamtrophyform(tournid, instance=instance)
    return render_to_response('web/additem.html',
        context_instance=RequestContext(request,
                {'form': form,
                 'title': 'teamtrophy',
                 'edit': edit}))

#add/edit teams
@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def manageteams(request, tournid):
    """Displays all team trophies for open tournaments"""

    tourn = Tournament.objects.get(pk=tournid)
    cr = Team.objects.filter(tournament=tourn)
    return render_to_response('web/manageteams.html',
        context_instance=RequestContext(request,
                {'cr': cr,
                 'tourn': tourn}))


class Teamform(ModelForm):
    def __init__(self, tournid, id, *args, **kwargs):
        super(Teamform, self).__init__(*args, **kwargs)
        tourn = Tournament.objects.get(pk=int(tournid))
        y = Matchentry.objects.filter(tournament=tourn).order_by('player__last_name')
        self.fields['tournament'].queryset = Tournament.objects.filter(id=int(tournid))
        if id:
            teem = Team.objects.get(pk=int(id))
            z = teem.members.all()
            self.fields['members'].choices = [(x.id, x.player) for x in y if (len(x.team_set.all()) == 0 or x in z)]
        else:
            self.fields['members'].choices = [(x.id, x.player) for x in y if len(x.team_set.all()) == 0]

    class Meta:
        model = Team
        exclude = ()


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addteam(request, tournid, id=None):
    """creates or edits a team
        """
    edit = False
    if id:
        oldcourse = Team.objects.get(pk=id)
        instance = oldcourse
        edit = True
    else:
        instance = None
        id = None
    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/manageteams/%d' % int(tournid))
        form = Teamform(tournid, id, request.POST, instance=instance)
        if form.is_valid():
            print 'here'
            f = form.save()
            if 'save' in request.POST.keys():
                return HttpResponseRedirect('/manageteams/%d' % int(tournid))
            else:
                return HttpResponseRedirect('/addteam/%d/' % int(tournid))
    else:
        form = Teamform(tournid, id, instance=instance)
    return render_to_response('web/additem.html',
        context_instance=RequestContext(request,
                {'form': form,
                 'title': 'team',
                 'edit': edit}))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def deleteteam(request, id):
    """deletes a team"""

    tm = Team.objects.get(pk=id)
    cr = Team.objects.filter(teamtrophy=tm.teamtrophy)
    troph = Teamtrophy.objects.get(pk=tm.teamtrophy.id)
    tm.delete()
    return render_to_response('web/manageteams.html',
        context_instance=RequestContext(request,
                {'cr': cr,
                 'troph': troph}))

#Partner
@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managepartners(request, trn):
    """match players to tournaments"""
    entries = Partner.objects.filter(tournament=trn)
    tourn = Tournament.objects.get(pk=trn)
    return render_to_response('web/managepartnerships.html',
        context_instance=RequestContext(request,
                {'entries': entries,
                 'tourn': tourn}))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managepartners3(request, trn):
    """match players to tournaments"""
    entries = Partner.objects.filter(tournament=trn)
    tourn = Tournament.objects.get(pk=trn)
    return render_to_response('web/managepartnerships3.html',
        context_instance=RequestContext(request,
                {'entries': entries,
                 'tourn': tourn}))


class Partnerform(ModelForm):
    def __init__(self, tourn, *args, **kwargs):
        super(Partnerform, self).__init__(*args, **kwargs)
        self.tourn = tourn
        tr = Matchentry.objects.filter(tournament__id=self.tourn)
        ap = []
        for x in tr:
            if (len(x.p1.all()) or len(x.p2.all())) > 0:
                ap.append(x)
        self.fields['member1'].choices = [(x.id, x.player) for x in Matchentry.objects.filter(tournament__id=self.tourn)
                                                           if x not in ap]
        self.fields['member2'].choices = [(x.id, x.player) for x in Matchentry.objects.filter(tournament__id=self.tourn)
                                                           if x not in ap]
        # need to add only the tees of the course in question

    class Meta:
        model = Partner
        exclude = ('tournament',)


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addpartner(request, tourn, id=None):
    """
    Function to add/edit partner.
    """
    trn = Tournament.objects.get(pk=tourn)

    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Partner.objects.get(pk=id)
        edit = True
    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/managepartners/%s/' % tourn)
        form = Partnerform(tourn, request.POST, instance=instance)
        if form.is_valid():
            fm = form.save(commit=False)

            fm.tournament_id = tourn
            fm.save()
        if 'repeat' in request.POST.keys():
            return HttpResponseRedirect('/addpartner/%s/' % tourn)
        else:
            return HttpResponseRedirect('/managepartners/%s/' % tourn)
    else:
        form = Partnerform(tourn, instance=instance)

    return render_to_response("web/additem.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'title': 'partner',
                                                  'edit': edit,
                                                  }))


class Trophyentryform(ModelForm):
    def __init__(self, tourn, *args, **kwargs):
        super(Trophyentryform, self).__init__(*args, **kwargs)
        self.tourn = tourn
        tr = Matchentry.objects.filter(tournament__id=self.tourn)
        ap = []
        for x in tr:
            if (len(x.p1.all()) or len(x.p2.all())) > 0:
                ap.append(x)
        self.fields['member1'].choices = [(x.id, x.player) for x in Matchentry.objects.filter(tournament__id=self.tourn)
                                                           if x not in ap]
        self.fields['member2'].choices = [(x.id, x.player) for x in Matchentry.objects.filter(tournament__id=self.tourn)
                                                           if x not in ap]
        # need to add only the tees of the course in question

    class Meta:
        model = Trophyentry
        exclude = ('tournament',)


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addtrophyentry(request, tourn, id=None):
    """
    Function to add/edit trophyentry.
    """
    trn = Tournament.objects.get(pk=tourn)

    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Trophyentry.objects.get(pk=id)
        edit = True
    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/managetrophyentrys/%s/' % tourn)
        form = Trophyentryform(tourn, request.POST, instance=instance)
        if form.is_valid():
            fm = form.save(commit=False)

            fm.tournament_id = tourn
            fm.save()
        if 'repeat' in request.POST.keys():
            return HttpResponseRedirect('/addtrophyentry/%s/' % tourn)
        else:
            return HttpResponseRedirect('/managetrophyentrys/%s/' % tourn)
    else:
        form = Trophyentryform(tourn, instance=instance)

    return render_to_response("web/additem.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'title': 'trophyentry',
                                                  'edit': edit,
                                                  }))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def deletepartner(request, id):
    """deletes a partner"""

    tm = Partner.objects.get(pk=id)
    cr = tm.tournament
    tm.delete()
    return HttpResponseRedirect('/managepartners/%s/' % (cr.id))


def results(request, id):
    """deletes a team"""

    tt = Teamtrophy.objects.get(pk=id)
    tourn = tt.tournament.id
    return render_to_response('web/results.html',
        context_instance=RequestContext(request,
                {'tt': tt,
                 'tourn': tourn}))

#rounds

#add round
class Roundform(ModelForm):
    class Meta:
        model = Round
        exclude = ('tournament',)


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addround(request, trn, id=None):
    """
    Function to add/edit round.
    """
    tourn = Tournament.objects.get(pk=trn)
    if tourn.closed:
        return HttpResponseRedirect('/message/%s/' % ('NO'))
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Round.objects.get(pk=id)
        edit = True
    if request.POST:
        form = Roundform(request.POST, instance=instance)
        if form.is_valid():
            fm = form.save(commit=False)
            fm.tournament = tourn
            fm.save()
            return HttpResponseRedirect('/managetrophies/%s/' % trn)
    else:
        form = Roundform(instance=instance)

    return render_to_response("web/additem.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'title': 'round',
                                                  'edit': edit,
                                                  'tourn': tourn,
                                                  }))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managerounds(request, trn):
    """add and get results for trophies"""
    tourn = Tournament.objects.get(pk=trn)
    cr = Round.objects.filter(tournament=trn)
    return render_to_response('web/managerounds.html',
        context_instance=RequestContext(request,
                {'cr': cr,
                 'tourn': tourn}))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def generaterounds(request, trn):
    """generates rounds"""
    tourn = Tournament.objects.get(pk=trn)
    if tourn.rounds == 1:
        return HttpResponseRedirect('/managetournaments/')
    if tourn.hasrounds():
        return HttpResponseRedirect('/managetournaments/')
    else:
        for rn in range(2, tourn.rounds + 1):
            newround = Round.objects.create(tournament=tourn,
                startdate=tourn.startdate + datetime.timedelta(days=rn - 1),
                num=rn)
        ments = tourn.matchentry_set.all()
        for rn in range(2, tourn.rounds + 1):
            for ment in ments:
                newment = Matchentry.objects.create(tournament=ment.tournament,
                    player=ment.player,
                    tee=ment.tee,
                    category=ment.category,
                    round=rn)

    return HttpResponseRedirect('/managerounds/%s/' % trn)


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managerscores(request, rnd):
    """match players to tournaments"""
    round = Round.objects.get(pk=rnd)
    tourn = round.tournament
    num = round.num
    entries = Matchentry.objects.filter(tournament=tourn, round=num)
    tee = tourn.course.tee_set.all()[0]
    return render_to_response('web/managerscores.html',
        context_instance=RequestContext(request,
                {'entries': entries,
                 'tourn': tourn,
                 'tee': tee,
                 'round': round}))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addrscores(request, rnd, matchentry):
    """
    Function to add/edit scores.
    """
    mentry = Matchentry.objects.get(pk=matchentry)
    if mentry.tournament.closed:
        return HttpResponseRedirect('/message/%s/' % ('NO'))
    id = mentry.tee_id
    tee = Tee.objects.get(pk=id)
    data = {}
    scores = Score.objects.filter(matchentry=mentry)
    for score in scores:
        data[score.hole.number] = score.score
    if request.POST:
        pst = request.POST.copy()
        for num in range(1, 19):
            if str(num) in pst:
                if pst[str(num)] == '':
                    pst[str(num)] = 0
                hle, created = Score.objects.get_or_create(matchentry=mentry,
                    hole=Hole.objects.get(tee=tee, number=num))
            if created or hle.score != pst[str(num)]:
            #           fm = hle.save(commit=False)
                hle.score = pst[str(num)]
                hle.save()
        if 'repeat' in request.POST.keys():
            return HttpResponseRedirect('/addrscores/%s/' % id)
        else:
            return HttpResponseRedirect('/managerscores/%s/' % rnd)
    else:
        form = Addscoresform(id, data)

    return render_to_response("web/addscores.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'mentry': mentry,

                                                  }))


def rleaderboard(request, trn, rnd):
    """match players to tournaments"""
    tourn = Tournament.objects.get(pk=trn)
    trps = Trophy.objects.filter(tournament=tourn)
    results = []
    for trp in trps:
        res = getrresults(trp, rnd)
        results.append((trp, res))
    return render_to_response('web/rleaderboard.html',
        context_instance=RequestContext(request,
                {'results': results,
                 'tourn': tourn,
                 }))


def getrresults(trph, rnd):
    """results of a trophy"""
    tourn = trph.tournament.id
    round = Round.objects.get(pk=rnd)
    num = round.num
    # get players within the handicap range:
    entries = Matchentry.objects.filter(tournament=tourn, round=num)
    # get handicap limits
    trophyentries = []
    for entry in entries:
        if not entry.scored():
            continue
        if entry.getcoursehandicap() in range(trph.handicapmin, trph.handicapmax + 1):
            if trph.format == 'AG':
                res = entry.getnettbogey()
            elif trph.format == 'ST':
                res = entry.getnettstableford()
            elif trph.format == 'GM':
                res = entry.getgrossmr()
            elif trph.format == 'GS':
                res = entry.getgrossstableford()
            elif trph.format == 'GG':
                res = entry.getgrossbogey()
            elif trph.format == 'MR':
                res = entry.getnettmr()
            elif trph.format == 'MB':
                res = entry.getnettmodbogey()
            elif trph.format == 'VL':
                res = entry.velappan()
            elif trph.format == 'GB':
                res = entry.getgrossmodbogey()
            elif trph.format in ['A', 'B', 'C', 'D', 'AB', 'BG', 'CG']:
                res = entry.getcatmedal(trph.format)
            if res and 'DQ' not in res and len(res['scores'].items()) == 18:
                trophyentries.append((entry.player, res), )
    if trph.format in ['MR', 'GM', 'A', 'B', 'C', 'E', 'F', 'D', 'AB', 'BG', 'CG']:
        trophyentries.sort(cmp=scorecomp)
    else:
        trophyentries.sort(cmp=scorecomp, reverse=True)
    return trophyentries


def getcumresults(trp, rnd):
    """results of a trophy"""
    trph = Trophy.objects.get(pk=trp)
    tourn = trph.tournament.id

    cumstat = {}
    mes = getrresults(trph, rnd)
    for x in mes:
        cumstat[x[0].last_name] = 0
    res = getresults(trph)
    cs = []
    for x in res:
        if cumstat.has_key(x[0].last_name):
            if cumstat[x[0].last_name] == 0:
                cumstat[x[0].last_name] = x[1]['total']
            else:
                cumstat[x[0].last_name] += x[1]['total']
    for k, v in cumstat.items():
        cs.append((k, v))
    cs.sort(cmp=cumsort)

    return cs


def multileaderboard(request, trp):
    def rndcomp(x, y):
        return x[-1] - y[-1]

    trophy = Trophy.objects.get(pk=trp)
    tourn = trophy.tournament
    rounds = 1
    entries = tourn.matchentry_set.all()
    resulttable = {}
    for entry in entries:
        if entry.round > rounds:
            rounds = entry.round
        if entry.player not in resulttable.keys():
            resulttable[entry.player] = {'total': 0}
        roundtot = entry.getroundtotal()
        if roundtot[entry.round] == 0:
            continue
            #check if round is already there if so add else put
        resulttable[entry.player][entry.round] = roundtot[entry.round]
        resulttable[entry.player]['total'] += roundtot[entry.round]
    results = []
    for k, v in resulttable.items():
        if len(v) != rounds + 1:
            continue
        if v['total'] != 0:
            if rounds == 1:
                results.append((k, v[1], v['total']))
            elif rounds == 2:
                results.append((k, v[1], v[2], v['total']))
            elif rounds == 3:
                results.append((k, v[1], v[2], v[3], v['total']))
            else:
                results.append((k, v[1], v[2], v[3], v[4], v['total']))
    results.sort(cmp=rndcomp)
    roundtot = []
    roundtot = [x for x in range(1, rounds + 1)]
    return render_to_response('web/multileaderboard.html',
        context_instance=RequestContext(request,
                {'results': results,
                 'rounds': roundtot,
                 'rnds': rounds}))


def makelower():
    pl = Player.objects.all()
    for p in pl:
        p.last_name = p.last_name.lower()
        p.first_name = p.first_name.lower()
        p.save()
    return 1


def getdups():
    """gets rid of duplicate scoring records"""
    mems = Member.objects.all()
    tod = datetime.datetime.today()
    for mem in mems:
        dte = datetime.date(2009, 1, 1)

        while 1:
            if Scoringrecord.objects.filter(member=mem, scoredate=dte).count() > 1:
                for x in Scoringrecord.objects.filter(member=mem, scoredate=dte)[1:]:
                    print x
                    x.delete()
            if dte.month == tod.month and dte.year == tod.year:
                break
            else:
                dte = dte + datetime.timedelta(days=1)
    return 1


def getprdups():
    mems = Member.objects.all()
    tod = datetime.datetime.today()
    for mem in mems:
        dte = datetime.date(2009, 1, 1)
        while 1:
            if Practiceround.objects.filter(member=mem, rounddate=dte).count() > 1:
                for x in Practiceround.objects.filter(member=mem, rounddate=dte)[1:]:
                    print x
                    x.delete()
            if dte.month == tod.month and dte.year == tod.year:
                break
            else:
                dte = dte + datetime.timedelta(days=1)
    return 1

#partner3
#Partner
@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def managepartners3(request, trn):
    """match players to tournaments"""
    entries = Partner3.objects.filter(tournament=trn)
    tourn = Tournament.objects.get(pk=trn)
    return render_to_response('web/managepartnerships3.html',
        context_instance=RequestContext(request,
                {'entries': entries,
                 'tourn': tourn}))


class Partner3form(ModelForm):
    def __init__(self, tourn, *args, **kwargs):
        super(Partner3form, self).__init__(*args, **kwargs)
        self.tourn = tourn
        tr = Matchentry.objects.filter(tournament__id=self.tourn)
        ap = []
        for x in tr:
            if (len(x.p31.all()) or len(x.p32.all()) or len(x.p33.all())) > 0:
                ap.append(x)
        self.fields['member1'].choices = [(x.id, x.player) for x in Matchentry.objects.filter(tournament__id=self.tourn)
                                                           if x not in ap]
        self.fields['member2'].choices = [(x.id, x.player) for x in Matchentry.objects.filter(tournament__id=self.tourn)
                                                           if x not in ap]
        self.fields['member3'].choices = [(x.id, x.player) for x in Matchentry.objects.filter(tournament__id=self.tourn)
                                                           if x not in ap]
        # need to add only the tees of the course in question

    class Meta:
        model = Partner3
        exclude = ('tournament',)


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def addpartner3(request, tourn, id=None):
    """
    Function to add/edit partner.
    """
    trn = Tournament.objects.get(pk=tourn)

    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Partner3.objects.get(pk=id)
        edit = True
    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/managepartners3/%s/' % tourn)
        form = Partner3form(tourn, request.POST, instance=instance)
        if form.is_valid():
            fm = form.save(commit=False)

            fm.tournament_id = tourn
            fm.save()
        if 'repeat' in request.POST.keys():
            return HttpResponseRedirect('/addpartner3/%s/' % tourn)
        else:
            return HttpResponseRedirect('/managepartners3/%s/' % tourn)
    else:
        form = Partner3form(tourn, instance=instance)

    return render_to_response("web/additem.html",
        context_instance=RequestContext(request, {'form': form,
                                                  'title': 'partner3',
                                                  'edit': edit,
                                                  }))


@user_passes_test(lambda u: u.is_anonymous() == False, login_url="/login/")
def deletepartner3(request, id):
    """deletes a partner3 team"""

    tm = Partner3.objects.get(pk=id)
    trn = tm.tournament.id
    tm.delete()
    return HttpResponseRedirect('/managepartners3/%s/' % trn)


class Matchplayform(forms.Form):
    def __init__(self, tourn, *args, **kwargs):
        self.tourn = tourn
        super(Matchplayform, self).__init__(*args, **kwargs)
        self.fields['player1'].choices = [(x.id, x.player) for x in
                                                           Matchentry.objects.filter(tournament=tourn).order_by(
                                                               'player__last_name')]
        self.fields['player2'].choices = [(x.id, x.player) for x in
                                                           Matchentry.objects.filter(tournament=tourn).order_by(
                                                               'player__last_name')]


    player1 = forms.ChoiceField(label=_("Player 1"))
    player2 = forms.ChoiceField(label=_("Player 2"))


class Strokesform(forms.Form):
    strokes = forms.IntegerField(label=_("strokes"))
    p1 = forms.IntegerField(widget=forms.HiddenInput, required=False)
    p2 = forms.IntegerField(widget=forms.HiddenInput, required=False)


def matchplay(request, tournid):
    """calculates result of match between two players
    it should get strokes from thier handicaps, but
    this can be adjusted.
    logic:
    for each hole,
    if up - player and diff
    else - all square
    if diff > holes left - match over player and diff and holes left
    if diff == holes left - dormie player and diff
    """
    tourn = Tournament.objects.get(pk=tournid)
    strokes = 0
    if request.POST:
        if 'start' in request.POST.keys():
            form = Matchplayform(tourn, request.POST)
            if form.is_valid():
                cd = form.cleaned_data
                pl1 = Matchentry.objects.get(pk=cd['player1'])
                pl2 = Matchentry.objects.get(pk=cd['player2'])
                hand1 = pl1.getcoursehandicap()
                hand2 = pl2.getcoursehandicap()
                strokes = hand1 - hand2
                if strokes < 0:
                    p1 = pl1
                    p2 = pl2
                    strokes = abs(strokes)
                else:
                    p1 = pl2
                    p2 = pl1
                #return the strokesform
            data = {'p1': p1.id, 'p2': p2.id, 'strokes': strokes}
            form = Strokesform(initial=data)
            return render_to_response("web/matchplay.html",
                context_instance=RequestContext(request, {'form': form,
                                                          'calc': 'calc',
                                                          'p1': p1,
                                                          'p2': p2,
                                                          'tourn': tourn}))
        if 'calc' in request.POST.keys():
            form = Strokesform(request.POST)
            if form.is_valid():
                cd = form.cleaned_data
                strokes = cd['strokes']
                p1 = Matchentry.objects.get(pk=cd['p1'])
                p2 = Matchentry.objects.get(pk=cd['p2'])
                #get the scores and sort by hole number
                p1scores = list(p1.matchentries.all())
                p2scores = list(p2.matchentries.all())
                p1scores.sort(cmp=holecmp)
                p2scores.sort(cmp=holecmp)
                cscores = zip(p1scores, p2scores)
                #for each hole see what happened
                match = []
                state = 0
                for csc in cscores:
                    p1cl = 'green'
                    p2cl = 'green'
                    hle = csc[0].hole
                    holestoplay = 18 - hle.number
                    p1score = csc[0].score
                    p2score = csc[1].score
                    # add logic for scratched holes
                    if p1score == 0 and p2score:
                        state = state - 1
                        p1cl = 'red'
                    elif p2score == 0 and p1score:
                        state = state + 1
                        p2cl = 'red'
                    else:
                        if p1score > 0 and p2score > 0:
                            if hle.strokeindex <= strokes - 18:
                                p2score -= 2
                            elif hle.strokeindex <= strokes:
                                p2score -= 1
                            diff = p1score - p2score
                            if diff < 0:
                                state = state + 1
                                p2cl = 'red'
                            elif diff > 0:
                                state = state - 1
                                p1cl = 'red'
                            if abs(state) == holestoplay:
                                mg = 'dormie'
                            else:
                                mg = 'up'
                    if state > 0:
                        if abs(state) > holestoplay or holestoplay == 0:
                            msg = _("%s wins %d and %d") % (p1.player, abs(state), holestoplay)
                        else:
                            msg = _("%s %s %d") % (p1.player, mg, abs(state))
                    elif state < 0:
                        if abs(state) > holestoplay or holestoplay == 0:
                            msg = _("%s wins %d and %d") % (p2.player, abs(state), holestoplay)
                        else:
                            msg = _("%s %s %d") % (p2.player, mg, abs(state))
                    else:
                        msg = _("All square")
                    match.append({
                        'hole': hle.number,
                        'msg': msg,
                        'p1clr': p1cl,
                        'p2clr': p2cl,
                        'p1score': p1score,
                        'p2score': p2score
                    })
                    if abs(state) > holestoplay or holestoplay == 0:
                        break

                return render_to_response("web/matchplay.html",
                    context_instance=RequestContext(request, {
                        'match': match,
                        'display': 'display',
                        'p1': p1,
                        'p2': p2,
                        'tourn': tourn
                    }))



    else:
        form = Matchplayform(tourn)
        return render_to_response("web/matchplay.html",
            context_instance=RequestContext(request, {'form': form,
                                                      'start': 'start',
                                                      'tourn': tourn}))


def addkind():
    trns = Tournament.objects.all()
    for trn in trns:
        if len(trn.partnershiptrophy_set.all()) > 0:
            trn.kind = 'PT'
        elif len(trn.partnership3trophy_set.all()) > 0:
            trn.kind = 'P3'
        elif len(trn.teamtrophy_set.all()) > 0:
            trn.kind = 'TM'
        else:
            trn.kind = 'IN'
        trn.save()


def peoria():
    course = Homeclub.objects.all()[0].course
    tee = course.tee_set.all()[0]
    holes = [(x.number, x.par) for x in tee.hole_set.all()]
    random.shuffle(holes)
    result = []
    checklist = []
    for hole in holes:
        if len(checklist) == 3:
            break
        if hole[1] not in checklist:
            result.append(hole)
            checklist.append(hole[1])
    available = [x for x in holes if x not in result]
    result.extend(available[:3])
    return result


def tourntocsv(request, tournid):
    """archive cbe results
        generate a file based on membno with the lcores
        or just scoring record?
    """


