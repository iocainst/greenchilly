# Create your views here.
from djangogolf.web.models import *
from django.template import Context,loader,RequestContext
from django.utils.translation import gettext_lazy as _
from django.shortcuts import render_to_response, get_object_or_404
from django.template import Library, Node, NodeList, resolve_variable
from django.http import HttpResponse, Http404,HttpResponseRedirect,HttpResponseNotFound
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required, user_passes_test
from django.core.mail import send_mail
import md5,re,os,random
from django import forms
from django.utils.encoding import smart_unicode
from django.conf import settings
from django.db import transaction
from django.db.models import get_model
from django.forms import ModelForm

menu_items = [
                {"name":_("Home"),"url":"home/","id":""},
                #{"name":_("Add Course"),"url":"addcourse/","id":""},
                {"name":_("Manage Courses"),"url":"managecourses/","id":""},
                {"name":_("Manage Players"),"url":"manageplayers/","id":""},
                {"name":_("Manage Handicaps"),"url":"managehandicaps/","id":""},
                {"name":_("Manage Tournaments"),"url":"managetournaments/","id":""},
                #{"name":_("Manage Entries"),"url":"manageentries/","id":""},
#                {"name":_("Browse Slides"),"url":"browseslides/","id":""},
#                {"name":_("Register"),"url":"register/","id":""},
#                {"name":_("Contributors"),"url":"Contributors/","id":""},
 #               {"name":_("Add Recipe"),"url":"addRecipe/","id":""},
#                {"name":_("Manage Recipes"),"url":"manageRecipes/","id":""},
#                {"name":_("Speakers Schedule" ),"url":"speakerlist/","id":""},
#               {"name":_("Volunteers"),"url":"volunteers/","id":""},
#                {"name":_("Add/Edit volunteer"),"url":"addvolunteer/","id":""},
#                {"name":_("Statistics"),"url":"statistics/","id":""},
#                {"name":_("Tag cloud"),"url":"feeds/cloud_list","id":""},
              ]

#-------------------utilites

MESSAGES = {
            'NO': _("Tournament results are declared"),
            'NP': _("You have not paid"),
            'AW': _("You have already written the exam"),
            }
def message(request,msg):
    msg = unquote(msg)
    t = loader.get_template("web/message.html")
    c = Context(
                {
                 'request':request,
                'msg': MESSAGES[msg],
                 })
    return HttpResponse(t.render(c))


def scorecomp(x,y):
    if x[1][20] != y[1][20]:
        return x[1][20] - y[1][20]
    elif x[1][19] != y[1][19]: #better second half
        return x[1][19] - y[1][19]
    elif sum(x[1][13:19]) != sum(y[1][13:19]): #better last six
        return sum(x[1][13:19]) - sum(y[1][13:19])
    elif sum(x[1][16:19]) != sum(y[1][16:19]): #better last three
        return sum(x[1][16:19]) - sum(y[1][16:19])
    elif x[1][18] != y[1][18]: #better last hole
        return x[1][18] - y[1][18]
    else:
        return 0
#----------------------------------------user stuff

def index(request):
    """front page"""
    return render_to_response('web/index.html',context_instance=RequestContext(request,))


class TempRegisterform(forms.ModelForm):
    class Meta:
        model = Tempreg
        fields = ('username','email')

def register(request):
    """view to register a new user
        """
    if request.POST:
        form = TempRegisterform(request.POST)
        if form.is_valid():
            fm = form.cleaned_data
            if len(fm['username']) > 30 or len(fm['username']) < 4:
                form.errors['username']=[_("User Name must be 4-30 characters long")]
            else:
                r = re.compile(r"[A-Za-z0-9_]")
                for alph in fm['username']:
                    if  not r.match(alph):
                        form.errors['username']=[_("Invalid character %s in Username") %(alph)]
                if not form.errors:
                    test = User.objects.filter(username__iexact=fm['username'])
                    if test:
                        form.errors['username'] = [("Username registered, try something else")]
                    else:
                        test1 = Tempreg.objects.filter(username__iexact=fm['username'])
                        if test1:
                            form.errors['username'] = [_("Username pending registration. Try tomorrow")]
                    teste = User.objects.filter(email__iexact=fm['email'])
                    if teste:
                        form.errors['email'] = [_("Email registered. Try something else")]
                    else:
                        teste1 = Tempreg.objects.filter(email__iexact=fm['email'])
                        if teste1:
                            form.errors['email'] = [("Username pending registration. Try tomorrow")]
            if not form.errors:
                new_reg = form.save()
                new_reg.code = str(random.random())[2:]
                new_reg.save()
                lst = Tempreg.objects.filter(date__lt=datetime.now() - timedelta(1))
                for p in lst:
                    p.delete()
                url = "http://quadmulc.nrcfosshelpline.in/web/adduser/%s/" %(new_reg.code)
                mg = makemsg(new_reg.username,url)
                subj = "Registration for %s at quadmulc"\
                       %(new_reg.username)
                frm = "webmaster@nrcfosshelpline.in"
                to = [new_reg.email]
                send_mail(subj,mg,frm,to,fail_silently=False)
                return HttpResponseRedirect("/regthank/%i/" % new_reg.id)
    else:
        form = TempRegisterform()
    return render_to_response("web/register.html",
                            context_instance=RequestContext(request,
                              {"form":form.as_table(),
                               }))

def regthank(request,id):
    """need just one view for all messages and warnings
        """
    p = Tempreg.objects.get(pk=id)
    t = loader.get_template("web/regthank.html")
    c = Context(
                {"p":p,
                 "request":request,
                 })
    return HttpResponse(t.render(c))

class Adduserform(forms.Form):
    username = forms.CharField(max_length=30,label=_("Username"))
    pass1 = forms.CharField(max_length=50,widget=forms.PasswordInput,
                                            label=_("Enter Password"))
    pass2 = forms.CharField(max_length=50,widget=forms.PasswordInput,
                                            label=_("Enter Password Again"))
    def clean_pass2(self):
        if len(self.cleaned_data['pass1']) < 6:
            raise forms.ValidationError('Password must be at\
            least 6 letters long')
        else:
            if self.cleaned_data['pass1'] != self.cleaned_data['pass2']:
                raise forms.ValidationError('Passwords do not match')

@transaction.commit_on_success
def adduser(request,code):
    """view to add a user given the username and password
        """
    if code:
        try:
            usr = Tempreg.objects.get(code__exact=code)
            data = {}
            if usr:
                data['email']=usr.email
                data['code']=usr.code
                data['username']=usr.username
        except:
            return HttpResponseRedirect('/sorry/')
    if request.POST:
        form = Adduserform(request.POST)
        if form.is_valid():
            fm = form.cleaned_data
            if fm['username'] != data['username']:
                    form.errors['username'] = [_("Type your username exactly\
                    as you entered it before")]
            if not form.errors:
                newuser = User.objects.create_user(username=fm['username'],
                                        email=data['email'],
                                        password=fm['pass1'])
                newuser.save()
                oldreg = Tempreg.objects.get(username=fm['username'])
                oldreg.delete()
                user = authenticate(username=fm['username'],
                    password=fm['pass1'])
                login(request,user)
                return HttpResponseRedirect('/edituser/')
    else:
        form = Adduserform()
    return render_to_response('web/adduser.html',
                            context_instance=RequestContext(request,
                              {'form':form.as_table(),
                               }))

class Edituserform(forms.Form):
    def __init__(self, *args, **kwargs):
            super(Edituserform, self).__init__(*args, **kwargs)


    first_name = forms.CharField(max_length=30,
                                            label=_("First Name or Initials"),
                                            required=False)
    last_name = forms.CharField(max_length=30,
                                            label=_("Last Name"),
                                            required=True)
    pass1 = forms.CharField(max_length=50,widget=forms.PasswordInput,
                                            label=_("Enter New Password"),
                                            required=False)
    pass2 = forms.CharField(max_length=50,widget=forms.PasswordInput,
                                            label=_("Enter New Password Again"),
                                            required=False)

    def clean_pass2(self):
        if self.cleaned_data['pass1'] != self.cleaned_data['pass2']:
                raise forms.ValidationError('Passwords do not match')
        else:
            if len(self.cleaned_data['pass1']) < 6 and len(self.cleaned_data['pass1']) >0:
                raise forms.ValidationError('Password must be at\
            least 6 letters long')
        return self.cleaned_data['pass2']


@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
@transaction.commit_on_success
def edituser(request):
    """view to edit a user's profile - this is saved in User
        """
    if request.POST:
        form = Edituserform(request.POST)
        if form.is_valid():
            fm = form.cleaned_data
            newuser = User.objects.get(pk=request.user.id)
            newuser.first_name = fm['first_name']
            newuser.last_name = fm['last_name']
            if fm.get('pass1') and fm.get('pass2'):
                newuser.set_password(fm['pass1'])
            newuser.save()
            return HttpResponseRedirect("/delegatefull/%d/" %newdel.id )
    else:
        id = request.user.id
        usr = User.objects.get(pk=id)
        data = {
                        'username': usr.username,
                        'first_name':usr.first_name,
                        'last_name': usr.last_name
                        }
        form = Edituserform(data)
    return render_to_response("web/edituser.html",
                            context_instance=RequestContext(request,
                              {'form':form,
                               }))

def sorry(request):
    t = loader.get_template("web/sorry.html")
    c = Context(
                {
                 "request":request,
                 })
    return HttpResponse(t.render(c))

#--------------------------------- end of user stuff

#--------------------------------- golf stuff
# Course setup and change
class Courseform(ModelForm):
    class Meta:
        model = Course

def addcourse(request,id=None):
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
        form = Courseform(request.POST,instance=instance)
        if form.is_valid():
            f=form.save()
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

class Teeform(ModelForm):
    def __init__(self, courseid, *args, **kwargs):
        super(Teeform, self).__init__(*args, **kwargs)
        self.fields['course'].queryset = Course.objects.filter(id=int(courseid))
    class Meta:
        model = Tee

def addtee(request,courseid,id=None):
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
        form = Teeform(courseid,request.POST,instance=instance)
        if form.is_valid():
            f=form.save()
            if 'save' in request.POST.keys():
                return HttpResponseRedirect('/showcourse/%d/' % int(courseid))
            else:
                return HttpResponseRedirect('/addtee/%d/' % int(courseid))
    else:
        form = Teeform(courseid,instance=instance)
    return render_to_response('web/additem.html',
                        context_instance=RequestContext(request,
                          {'form': form,
                          'title': 'tee',
                          'edit': edit}))

class Holeform(ModelForm):
    def __init__(self, teeid, *args, **kwargs):
        super(Holeform, self).__init__(*args, **kwargs)
        self.fields['tee'].queryset = Tee.objects.filter(id=int(teeid))
    class Meta:
        model = Hole

def addhole(request,teeid,id=None):
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
            return HttpResponseRedirect('/showtee/%d/%d/' % (course,int(teeid)))
        form = Holeform(teeid,request.POST,instance=instance)
        if form.is_valid():
            f=form.save()
            if 'save' in request.POST.keys():
                return HttpResponseRedirect('/showtee/%d/%d/' % (course,f.tee_id))
            else:
                return HttpResponseRedirect('/addhole/%d/' % (int(teeid)))
    else:
        form = Holeform(teeid,instance=instance)
    return render_to_response('web/additem.html',
                        context_instance=RequestContext(request,
                          {'form': form,
                          'title': 'hole',
                          'edit': edit}))

def managecourses(request):
    """Displays all courses"""
    cr = Course.objects.all()
    return render_to_response('web/managecourses.html',
                        context_instance=RequestContext(request,
                          {'cr': cr}))


def showcourse(request,id):
    """Displays one course"""
    cr = Course.objects.get(pk=id)
    return render_to_response('web/showcourse.html',
                        context_instance=RequestContext(request,
                          {'cr': cr}))

def showtee(request,course,id):
    """Displays one tee"""
    cr = Tee.objects.get(pk=id)
    return render_to_response('web/showtee.html',
                        context_instance=RequestContext(request,
                          {'cr': cr,
                          'course': course}))

def showscores(request,matchentry):
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
    def __init__(self,id, *args, **kwargs):
        super(Addscoresform, self).__init__(*args, **kwargs)
        self.id = id
        self.tee = Tee.objects.get(pk=self.id)
        for hle in self.tee.hole_set.all():
            self.fields[hle.number] = forms.IntegerField(required=False,label = "No: %d "
                                                    %(hle.number))

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addscores(request,matchentry):
    """
    Function to add/edit scores.
    """
    mentry = Matchentry.objects.get(pk=matchentry)
    if mentry.tournament.closed:
        return HttpResponseRedirect('/message/%s/' %('NO'))
    id = mentry.player.tee_id
    tee = Tee.objects.get(pk=id)
    data = {}
    scores = Score.objects.filter(matchentry=mentry)
    for score in scores:
        data[score.hole.number]=score.score
    if request.POST:
        for num in range(1,19):
            if str(num) in request.POST.keys():
                hle,created = Score.objects.get_or_create(matchentry=mentry,
                    hole=Hole.objects.get(tee=tee,number=num))
            if created or hle.score != request.POST[str(num)]:
 #           fm = hle.save(commit=False)
                hle.score=request.POST[str(num)]
                hle.save()
        if 'repeat' in request.POST.keys():
            return HttpResponseRedirect('/addscores/%s/' % id)
        else:
            return HttpResponseRedirect('/managescores/%s/' %mentry.tournament_id)
    else:
        form =Addscoresform(id,data)

    return render_to_response("web/addscores.html",
                              context_instance=RequestContext(request,{'form':form,
                                                                'mentry': mentry
                                                                }))

# add/edit players

class Playerform(ModelForm):

    class Meta:
        model = Player



@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addplayer(request,id=None):
    """
    Function to add/edit player.
    """
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Player.objects.get(pk=id)
        edit = True
    if request.POST:
        form = Playerform(request.POST,instance=instance)
        if form.is_valid():
            fm = form.save()
            if 'repeat' in request.POST.keys():
                return HttpResponseRedirect('/addplayer/')
            else:
                return HttpResponseRedirect('/manageplayers/')
    else:
        form = Playerform(instance=instance)

    return render_to_response("web/additem.html",
                              context_instance=RequestContext(request,{'form':form,
                                                                'title': 'player',
                                                                'edit': edit,
                                                                }))
def manageplayers(request):
    """Displays all players"""
    cr = Player.objects.all()
    return render_to_response('web/manageplayers.html',
                        context_instance=RequestContext(request,
                          {'cr': cr}))

class Handicapform(ModelForm):

    class Meta:
        model = Handicap



@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addhandicap(request,id=None):
    """
    Function to add/edit handicap.
    """
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Handicap.objects.get(pk=id)
        edit = True
    if request.POST:
        form = Handicapform(request.POST,instance=instance)
        if form.is_valid():
            fm = form.save()

            return HttpResponseRedirect('/managehandicaps/')
    else:
        form = Handicapform(instance=instance)

    return render_to_response("web/addhandicap.html",
                              context_instance=RequestContext(request,{'form':form,
                                                                'title': 'handicap',
                                                                'edit': edit,
                                                               }))
#-----------tournaments

class Tournamentform(ModelForm):

    class Meta:
        model = Tournament



@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addtournament(request,id=None):
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
        form = Tournamentform(request.POST,instance=instance)
        if form.is_valid():
            fm = form.save()

            return HttpResponseRedirect('/managetournaments/')
    else:
        form = Tournamentform(instance=instance)

    return render_to_response("web/additem.html",
                              context_instance=RequestContext(request,{'form':form,
                                                                'title': 'tournament',
                                                                'edit': edit,
                                                                }))
#add trophy
class Trophyform(ModelForm):

    class Meta:
        model = Trophy
        exclude = ('tournament',)



@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addtrophy(request,trn,id=None):
    """
    Function to add/edit trophy.
    """
    tourn = Tournament.objects.get(pk=trn)
    if tourn.closed:
        return HttpResponseRedirect('/message/%s/' %('NO'))
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Trophy.objects.get(pk=id)
        edit = True
    if request.POST:
        form = Trophyform(request.POST,instance=instance)
        if form.is_valid():
            fm = form.save(commit = False)
            fm.tournament=tourn
            fm.save()
            return HttpResponseRedirect('/managetrophies/%s/' % trn)
    else:
        form = Trophyform(instance=instance)

    return render_to_response("web/additem.html",
                              context_instance=RequestContext(request,{'form':form,
                                                                'title': 'trophy',
                                                                'edit': edit,
                                                                'tourn':tourn,
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
        self.fields['player'].choices=[(x.id,x) for x in Player.objects.all() if x.id not in ap]

    class Meta:
        model = Matchentry
        exclude = ('tournament',)



@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addmatchentry(request,tourn,id=None):
    """
    Function to add/edit matchentry.
    """
    trn = Tournament.objects.get(pk=tourn)
    if trn.closed:
        return HttpResponseRedirect('/message/%s/' %('NO'))
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Matchentry.objects.get(pk=id)
        edit = True
    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/manageentries/%s/' %tourn)
        form = Matchentryform(tourn,request.POST,instance=instance)
        if form.is_valid():
            fm = form.save(commit=False)
            fm.tournament_id = tourn
            fm.save()
        if 'repeat' in request.POST.keys():
            return HttpResponseRedirect('/addmatchentry/%s/' %tourn)
        else:
            return HttpResponseRedirect('/manageentries/%s/' %tourn)
    else:
        form = Matchentryform(tourn,instance=instance)

    return render_to_response("web/additem.html",
                              context_instance=RequestContext(request,{'form':form,
                                                                'title': 'matchentry',
                                                                'edit': edit,
                                                                }))
def deletematchentry(request,id):
    entry = Matchentry.objects.get(pk=id)
    tourn = entry.tournament.id
    if tourn.closed:
        return HttpResponseRedirect('/message/%s/' %('NO'))
    if request.POST:
        if 'delete' in request.POST.keys():
            entry.delete()
        return HttpResponseRedirect('/manageentries/%s/' %tourn)
    else:
        return render_to_response("web/confirm.html",
                              context_instance=RequestContext(request,{'obj':entry,

                                                                }))


def managehandicaps(request):
    """get all players and display their latest handicaps"""
    cr = Player.objects.all()
    return render_to_response('web/managehandicaps.html',
                        context_instance=RequestContext(request,
                          {'cr': cr}))

def managetournaments(request):
    """get all players and display their latest handicaps"""
    cr = Tournament.objects.filter(startdate__gt=datetime.datetime.now())
    return render_to_response('web/managetournaments.html',
                        context_instance=RequestContext(request,
                          {'cr': cr}))

def managetrophies(request,trn):
    """add and get results for trophies"""
    tourn = Tournament.objects.get(pk=trn)
    cr = Trophy.objects.filter(tournament=trn)
    return render_to_response('web/managetrophies.html',
                        context_instance=RequestContext(request,
                          {'cr': cr,
                          'tourn': tourn}))

def manageentries(request,trn):
    """match players to tournaments"""
    entries = Matchentry.objects.filter(tournament=trn)
    tourn = Tournament.objects.get(pk=trn)
    return render_to_response('web/manageentries.html',
                        context_instance=RequestContext(request,
                          {'entries': entries,
                          'tourn': tourn}))

def managescores(request,trn):
    """match players to tournaments"""
    entries = Matchentry.objects.filter(tournament=trn)
    tourn = Tournament.objects.get(pk=trn)
    return render_to_response('web/managescores.html',
                        context_instance=RequestContext(request,
                          {'entries': entries,
                          'tourn': tourn}))

def showresults(request,trp):
    """results of a trophy"""
    trph = Trophy.objects.get(pk=trp)
    # get players within the handicap range:
    entries = Matchentry.objects.all()
    # get handicap limits
    trophyentries = []
    for entry in entries:
        if entry.player.getcoursehandicap() in range(trph.handicapmin,trph.handicapmax+1):
            if trph.format == 'AG':
                res = entry.getnettbogey()
            elif trph.format == 'ST':
                res = entry.getnettstableford()
            elif trph.format == 'GM':
                res = entry.getgrossmr()
            elif trph.format == 'GS':
                res = entry.getgrossstableford()
            elif trph.format == 'GB':
                res = entry.getgrossbogey()
            elif trph.format == 'MR':
                res = entry.getnettmr()
            if 'DQ' not in res:
                trophyentries.append((entry.player,res),)
    if trph.format in ['MR','GM']:
        trophyentries.sort(cmp = scorecomp)
    else:
        trophyentries.sort(cmp = scorecomp,reverse=True)
    return render_to_response('web/showresults.html',
                        context_instance=RequestContext(request,
                          {
                          'trph': trph,
                          'trophyentries': trophyentries}))



# Add/edit tournaments
# Add/edit players
# Enter or remove an entry

# add/edit players score
# display score
# display tournament result
