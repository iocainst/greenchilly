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
import cPickle


DIFFERENTIALS = {
                5:1,
                6:1,
                7:2,
                8:2,
                9:3,
                10:3,
                11:4,
                12:4,
                13:5,
                14:5,
                15:6,
                16:6,
                17:7,
                18:8,
                19:9,
                20:10,
                }

menu_items = [

                {"name":_("Manage Courses"),"url":"managecourses/","id":""},
                {"name":_("Manage Players"),"url":"manageplayers/","id":""},
                {"name":_("Manage Handicaps"),"url":"managehandicaps/","id":""},
                {"name":_("Manage Tournaments"),"url":"managetournaments/","id":""},
                #{"name":_("Manage Practice rounds"),"url":"managepracticerounds/","id":""},
                #{"name":_("Manage Members"),"url":"managemembers/","id":""},
              ]
display_items = [
                {"name":_("Home"),"url":"home/","id":""},
                {"name":_("Tournaments"),"url":"displaytournaments/","id":""},
                {"name":_("Handicaps"),"url":"displayhandicap/","id":""},
                ]

#-------------------utilites

def makemsg(username,url):
    msg = _("\
Dear %(username)s,\n\n\
\
Thank you for registering with us. Please visit this url:\n\n\
%(url)s\n\n\
to complete the registration\n\n\
regards\n\
The Greenchilly Team\
") %{'username': username,'url': url}
    return msg


    return HttpResponse(t.render(c))

def sorry(request):
    t = loader.get_template("web/sorry.html")
    c = Context(
                {
                 "request":request,
                 })
    return HttpResponse(t.render(c))

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

def hdcmp(x,y):
    z = int(1000*(x[1] - y[1]))
    return z
    
def cumsort(x,y):
    z = x[1]-y[1]
    return z

def diffcomp(x,y):
    z = int(1000*(x[1]-y[1]))
    return z

def holecomp(x,y):
    z = x[0]-y[0]
    return z

def addtime(stme,interval):
    datefull = datetime.datetime(1,1,1,stme.hour,stme.minute)
    newdate = datefull + datetime.timedelta(minutes=interval)
    return newdate.time()
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
                lst = Tempreg.objects.filter(date__lt=datetime.datetime.now() - datetime.timedelta(1))
                for p in lst:
                    p.delete()
                url = "http://greenchilly.in/adduser/%s/" %(new_reg.code)
                mg = makemsg(new_reg.username,url)
                subj = "Registration for %s at greenchilly"\
                       %(new_reg.username)
                frm = "webmaster@greenchilly.in"
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
                return HttpResponseRedirect('/')
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

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
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
#draw
class Drawform(ModelForm):
    def __init__(self, tourn, *args, **kwargs):
        super(Drawform, self).__init__(*args, **kwargs)
        self.fields['tournament'].queryset = Tournament.objects.filter(id=int(tourn))
    class Meta:
        model = Draw
        exclude = ('done','drawlist')

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def adddraw(request,tourn):
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
        form = Drawform(tourn,request.POST,instance=instance)
        if form.is_valid():
            f=form.save()

            return HttpResponseRedirect('/addteeoff/%s/' % f.id )

    else:
        form = Drawform(tourn,instance=instance)
    return render_to_response('web/adddraw.html',
                        context_instance=RequestContext(request,
                          {'form': form,
                          'title': 'draw',
                          'edit': edit,
                          'draw':draw}))



class Teeform(ModelForm):
    def __init__(self, courseid, *args, **kwargs):
        super(Teeform, self).__init__(*args, **kwargs)
        self.fields['course'].queryset = Course.objects.filter(id=int(courseid))
    class Meta:
        model = Tee

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
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

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
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
        form = Holeform(request.POST,instance=instance)
        if form.is_valid():
            f=form.save(commit=False)
            f.tee = tee
            f.save()
            if 'save' in request.POST.keys():
                return HttpResponseRedirect('/showtee/%d/%d/' % (course,f.tee_id))
            else:
                return HttpResponseRedirect('/addhole/%d/' % (int(teeid)))
    else:
        form = Holeform(instance=instance)
    return render_to_response('web/additem.html',
                        context_instance=RequestContext(request,
                          {'form': form,
                          'title': 'hole for %s' % tee,
                          'edit': edit}))

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
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
		
		for hle in range(1,19):
			print hle
			self.fields[hle] = forms.IntegerField(required=False,label = "No: %d "
													%(hle))

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addscores(request,matchentry):
    """
    Function to add/edit scores.
    """
    mentry = Matchentry.objects.get(pk=matchentry)
    if mentry.tournament.closed:
        return HttpResponseRedirect('/message/%s/' %('NO'))
    id = mentry.tee_id
    tee = Tee.objects.get(pk=id)
    print tee
    data = {}
    scores = Score.objects.filter(matchentry=mentry)
    for score in scores:
        data[score.hole.number]=score.score
    if request.POST:
        pst = request.POST.copy()
        for num in range(1,19):
            if str(num) in pst:
                if pst[str(num)] == '':
                    pst[str(num)] = 0
                hle,created = Score.objects.get_or_create(matchentry=mentry,
                    hole=Hole.objects.get(tee=tee,number=num))
            if created or hle.score != pst[str(num)]:
 #           fm = hle.save(commit=False)
                hle.score=pst[str(num)]
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

#pscores
class Addpscoresform(forms.Form):
    """
        form to enter pscores of a practiceround
        """
    def __init__(self, *args, **kwargs):
        super(Addpscoresform, self).__init__(*args, **kwargs)

        for hle in range(1,19):
            self.fields[hle] = forms.IntegerField(label = "No: %d" %(hle),required = False)



@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addpscores(request,prnd):
    """
    Function to add/edit pscores.
    """
    mentry = Practiceround.objects.get(pk=prnd)
    tee = mentry.tee
    data = {}
    club = mentry.member.player.homeclub.shortname
    scores = Pscore.objects.filter(practiceround=mentry)
    for score in scores:
        data[score.hole.number]=score.score
    if request.POST:
        form = Addpscoresform(request.POST)
        if form.is_valid():
            pst = request.POST.copy()
            for num in range(1,19):
                if str(num) in pst:
                    if pst[str(num)] == '':
                        pst[str(num)] = 0
                    hle,created = Pscore.objects.get_or_create(practiceround=mentry,
                        hole=Hole.objects.get(tee=tee,number=num))
                if created or hle.score != pst[str(num)]:
     #           fm = hle.save(commit=False)
                    hle.score=pst[str(num)]
                    hle.save()

            return HttpResponseRedirect('/managepracticerounds/%s/' % club)
    else:
        form =Addpscoresform(data)

    return render_to_response("web/addpscores.html",
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
        form = Playerform(request.POST,request.FILES,instance=instance)
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
                              context_instance=RequestContext(request,{'form':form,
                                                                'title': 'player',
                                                                'flurl':flurl,
                                                                'flname':flname,
                                                                'edit': edit,
                                                                }))
@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def manageplayers(request):
    """Displays all players"""
    cr = Player.objects.all()
    return render_to_response('web/manageplayers.html',
                        context_instance=RequestContext(request,
                          {'cr': cr}))
# add/edit members

class Memberform(ModelForm):
    def __init__(self,club,*args,**kwargs):
        super(Memberform,self).__init__(*args,**kwargs)
        self.club = club
        mems = Member.objects.filter(player__homeclub__shortname=self.club)
        ap = []
        for mem in mems:
            ap.append(mem.player.id)
        self.fields['player'].choices=[(x.id,x) for x in Player.objects.filter(homeclub__shortname=self.club) if x.id not in ap]

    class Meta:
        model = Member



@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addmember(request,club,id=None):
    """
    Function to add/edit member.
    """
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Member.objects.get(pk=id)
        edit = True
    if request.POST:
        form = Memberform(club,request.POST,instance=instance)
        if form.is_valid():
            fm = form.save()
            if 'repeat' in request.POST.keys():
                return HttpResponseRedirect('/addmember/%s/' % club)
            else:
                return HttpResponseRedirect('/managemembers/%s/'% club)
    else:
        form = Memberform(club,instance=instance)

    return render_to_response("web/additem.html",
                              context_instance=RequestContext(request,{'form':form,
                                                                'title': 'member',
                                                                'edit': edit,
                                                                'club':club,
                                                                }))
@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def managemembers(request,club):
    """Displays all members"""
    cr = Member.objects.filter(player__homeclub__shortname=club)
    return render_to_response('web/managemembers.html',
                        context_instance=RequestContext(request,
                          {'cr': cr,
                          'club':club}))

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



@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addhandicap(request,plr,id=None):
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
        form = Handicapform(player,request.POST,instance=instance)
        if form.is_valid():
            fm = form.save(commit=False)
            fm.player = player
            fm.save()
            return HttpResponseRedirect('/managehandicaps/')
    else:
        form = Handicapform(player,instance=instance)

    return render_to_response("web/addhandicap.html",
                              context_instance=RequestContext(request,{'form':form,
                                                                'title': 'handicap',
                                                                'edit': edit,
                                                                'player':player,
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
#partnershiptrophy
class Partnershiptrophyform(ModelForm):

    class Meta:
        model = Partnershiptrophy
        exclude = ('tournament',)



@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addpartnershiptrophy(request,trn,id=None):
    """
    Function to add/edit partnershiptrophy.
    """
    tourn = Tournament.objects.get(pk=trn)
    if tourn.closed:
        return HttpResponseRedirect('/message/%s/' %('NO'))
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Partnershiptrophy.objects.get(pk=id)
        edit = True
    if request.POST:
        form = Partnershiptrophyform(request.POST,instance=instance)
        if form.is_valid():
            fm = form.save(commit = False)
            fm.tournament=tourn
            fm.save()
            return HttpResponseRedirect('/managepartnershiptrophies/%s/' % trn)
    else:
        form = Partnershiptrophyform(instance=instance)

    return render_to_response("web/additem.html",
                              context_instance=RequestContext(request,{'form':form,
                                                                'title': 'partnershiptrophy',
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
        # need to add only the tees of the course in question
        self.course = Tournament.objects.get(pk=self.tourn).course
        self.fields['tee'].choices=[(x.id,x) for x in self.course.tee_set.all()]

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
#practice round
class Practiceroundform(ModelForm):
	def __init__(self,club, *args, **kwargs):
		super(Practiceroundform, self).__init__(*args, **kwargs)
		self.club = club
		
		self.fields['member'].queryset= Member.objects.filter(player__homeclub__shortname=self.club)
	class Meta:
		model = Practiceround
		exclude = ('accepted',)



@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addpracticeround(request,club,id=None):
    """
    Function to add/edit practiceround.
    """

    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Practiceround.objects.get(pk=id)
        if instance.accepted:
            return HttpResponseRedirect('/message/%s/' %('NO'))
        edit = True
    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/managepracticerounds/%s/' % club)
        form = Practiceroundform(club,request.POST,instance=instance)
        if form.is_valid():
            fm = form.save(commit=False)
            fm.accepted = False
            fm.save()
            if edit:
                #tee might have changed so redo the pscores if any
                if fm.pscore_set.all().count()>0:
                    for score in fm.pscore_set.all():
                        num = score.hole.number
                        newhole = Hole.objects.get(tee=fm.tee,number=num)
                        score.hole=newhole
                        score.save()
        if 'repeat' in request.POST.keys():
            return HttpResponseRedirect('/addpracticeround/%s/' % club )
        else:
            return HttpResponseRedirect('/managepracticerounds/%s/' % club)
    else:
        form = Practiceroundform(club,instance=instance)

    return render_to_response("web/additem.html",
                              context_instance=RequestContext(request,{'form':form,
                                                                'title': 'practiceround',
                                                                'edit': edit,
                                                                'club':club,
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

        self.fields['hole'].choices=[(x,) for x in range(1,19) if x not in ap]
        self.fields['fourballs'].initial= dick['fourball']
        self.fields['threeballs'].initial= dick['threeball']
        self.fields['twoballs'].initial= dick['twoball']
        self.fields['singles'].initial= dick['single']


    class Meta:
        model = Teeoff
        exclude = ('tournament',)



@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addteeoff(request,drw,id=None):
    """
    Function to add/edit teeoff.
    """
    draw = Draw.objects.get(pk=drw)
    trn = Tournament.objects.get(draw=draw)
    tourn = Tournament.objects.get(pk=trn.id)
    if tourn.closed:
        return HttpResponseRedirect('/message/%s/' %('NO'))
    players = Matchentry.objects.filter(tournament=trn).order_by('?')
    msg = ''
    drawover = False
    ply = len(players)
    teeoffs = draw.teeoff_set.all()
    groups,over = divmod(ply,draw.groupsize)
    dick ={'draw':draw}
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
        msg = "There are %d groups of %d including one  group of size %d" % (groups+1,draw.groupsize,over)
    if draw.groupsize == 3:
        if groups == 0:
            if over == 2:
                dick['twoball'] = 1
            if over == 1:
                dick['single'] = 1
        else:
            dick['fourball'] = over
            dick['threeball'] = groups - dick['fourball']
        msg = "There are %d groups of %d including %d fourballs" % (groups,draw.groupsize,over)
    if draw.groupsize == 2:
        dick['threeball'] = over
        dick['twoball'] = groups
        msg = "There are %d groups of %d including %d threeball" % (groups,draw.groupsize,over)
    for t in teeoffs:
        used = t.fourballs*4 + t.threeballs*3 + t.twoballs*2 + t.singles
        ply = ply-used

        if ply:
            groups,over = divmod(ply,draw.groupsize)

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
                msg = "There are %d groups of %d including one  group of size %d" % (groups+1,draw.groupsize,over)
            if draw.groupsize == 3:
                if groups == 0:
                    if over == 2:
                        dick['twoball'] = 1
                    if over == 1:
                        dick['single'] = 1
                else:
                    dick['fourball'] = over
                    dick['threeball'] = groups - dick['fourball']
                msg = "There are %d groups of %d including %d fourballs" % (groups,draw.groupsize,over)
            if draw.groupsize == 2:
                dick['threeball'] = over
                dick['twoball'] = groups
                msg = "There are %d groups of %d including %d threeball" % (groups,draw.groupsize,over)
        else:
            msg = "All players have been allotted"
            drawover = True
            form = ''

    if request.POST:
        if 'cancel' in request.POST.keys():
            return HttpResponseRedirect('/adddraw/%s/' % trn.id)
        form = Teeoffform(dick,request.POST)
        if form.is_valid():
            fm = form.save(commit=False)
            fm.draw_id = drw
            fm.save()

        return HttpResponseRedirect('/adddraw/%s/' % trn.id)
    else:
        form = Teeoffform(dick)

    return render_to_response("web/addteeoff.html",
                              context_instance=RequestContext(request,{'form':form,
                                                                    'title': 'teeoff',
                                                                    'msg': msg,
                                                                    'draw': draw,
                                                                    'drawover': drawover,
                                                                    }))

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def deletematchentry(request,id):
    entry = Matchentry.objects.get(pk=id)
    tourn = entry.tournament.id
    trn = entry.tournament
    if trn.closed:
        return HttpResponseRedirect('/message/%s/' %('NO'))
    if request.POST:
        if 'delete' in request.POST.keys():
            entry.delete()
        return HttpResponseRedirect('/manageentries/%s/' %tourn)
    else:
        return render_to_response("web/confirm.html",
                              context_instance=RequestContext(request,{'obj':entry,

                                                                }))

def deletepracticeround(request,sel,club):
    obj = ''
    for x in sel:
        prnd = Practiceround.objects.get(pk=int(x))
        obj = obj + ' '+str(prnd)

    if request.POST:
        if 'remove' in request.POST.keys():
            for x in sel:
                prnd = Practiceround.objects.get(pk=int(x))
                for sc in prnd.pscore_set.all():
                    sc.delete()
                prnd.delete()
            return HttpResponseRedirect('/managepracticerounds/%s/' % club)
        else:
            return render_to_response("web/confirm.html",
                                  context_instance=RequestContext(request,{'obj':obj}))

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def managehandicaps(request):
    """get all players and display their latest handicaps"""
    cr = Player.objects.all()
    return render_to_response('web/managehandicaps.html',
                        context_instance=RequestContext(request,
                          {'cr': cr}))

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def managetournaments(request):
    """get all players and display their latest handicaps"""
    cr = Tournament.objects.filter(closed=False)
    return render_to_response('web/managetournaments.html',
                        context_instance=RequestContext(request,
                          {'cr': cr}))

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def managetrophies(request,trn):
    """add and get results for trophies"""
    tourn = Tournament.objects.get(pk=trn)
    cr = Trophy.objects.filter(tournament=trn)
    return render_to_response('web/managetrophies.html',
                        context_instance=RequestContext(request,
                          {'cr': cr,
                          'tourn': tourn}))
                          
@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def managepartnershiptrophies(request,trn):
    """add and get results for trophies"""
    tourn = Tournament.objects.get(pk=trn)
    cr = Partnershiptrophy.objects.filter(tournament=trn)
    return render_to_response('web/managepartnershiptrophies.html',
                        context_instance=RequestContext(request,
                          {'cr': cr,
                          'tourn': tourn}))

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def manageentries(request,trn):
    """match players to tournaments"""
    entries = Matchentry.objects.filter(tournament=trn)
    tourn = Tournament.objects.get(pk=trn)
    return render_to_response('web/manageentries.html',
                        context_instance=RequestContext(request,
                          {'entries': entries,
                          'tourn': tourn}))

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def managepracticerounds(request,club):
    """match players to tournaments"""
    entries = Practiceround.objects.filter(
		accepted=False).filter(member__player__homeclub__shortname=club).order_by('-rounddate')
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
                prnd.accepted=True
                prnd.save()
        if 'remove' and 'sel' in request.POST.keys():
            dels = request.POST.getlist('sel')
            deletepracticeround(request,dels,club)
    return render_to_response('web/managepracticerounds.html',
                        context_instance=RequestContext(request,
                          {'entries': entries,
                          'club':club}))

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def managescores(request,trn):
    """match players to tournaments"""
    entries = Matchentry.objects.filter(tournament=trn)
    tourn = Tournament.objects.get(pk=trn)
    tee = tourn.course.tee_set.all()[0]
    return render_to_response('web/managescores.html',
                        context_instance=RequestContext(request,
                          {'entries': entries,
                          'tourn': tourn,
                          'tee':tee}))

def leaderboard(request,trn):
    """match players to tournaments"""
    tourn = Tournament.objects.get(pk=trn)
    trps = Trophy.objects.filter(tournament=tourn)
    results = []
    for trp in trps:
        res = getresults(trp)
        results.append((trp,res))
    return render_to_response('web/leaderboard.html',
                        context_instance=RequestContext(request,
                          {'results': results,
                          'tourn':tourn,
                          }))
                          
def cumulleaderboard(request,trn,rnd):
    """match players to tournaments"""
    tourn = Tournament.objects.get(pk=trn)
    trps = Trophy.objects.filter(tournament=tourn)
    results = []
    for trp in trps:
        res = getcumresults(trp.id,rnd)
        results.append((trp,res))
    return render_to_response('web/cumulleaderboard.html',
                        context_instance=RequestContext(request,
                          {'results': results,
                          'tourn':tourn,
                          }))
                          
def partnerleaderboard(request,trn):
    """match players to tournaments"""
    tourn = Tournament.objects.get(pk=trn)
    trps = Partnershiptrophy.objects.filter(tournament=tourn)
    results = []
    for trp in trps:
        res = getpartnerresults(trp)[:10]
        results.append((trp,res))
    return render_to_response('web/leaderboard.html',
                        context_instance=RequestContext(request,
                          {'results': results,
                          'tourn':tourn,
                          }))



def getresults(trph):
    """results of a trophy"""
    tourn = trph.tournament.id
    # get players within the handicap range:
    entries = Matchentry.objects.filter(tournament=tourn)
    # get handicap limits
    trophyentries = []
    for entry in entries:
        if not entry.scored():
            continue
        if entry.getcoursehandicap() in range(trph.handicapmin,trph.handicapmax+1):
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
            elif trph.format in ['A','B','C','D','E','F','AB','BG','CG']:
				res = entry.getcatmedal(trph.format)
            if res and 'DQ' not in res and len(res) == 21:
                trophyentries.append((entry.player,res),)
    if trph.format in ['MR','GM','A','B','C','D','E','F','AB','BG','CG']:
        trophyentries.sort(cmp = scorecomp)
    else:
        trophyentries.sort(cmp = scorecomp,reverse=True)
    return trophyentries

def showresults(request,trp):
    """results of a trophy"""
    trph = Trophy.objects.get(pk=trp)
    trophyentries = getresults(trph)
    tee = trph.tournament.course.tee_set.all()[0]
    return render_to_response('web/showresults.html',
                        context_instance=RequestContext(request,
                          {
                          'trph': trph,
                          'trophyentries': trophyentries,
                          'tee':tee}))
                          
def displayresult(request,trp,rnd):
    """results of a trophy round"""
    
    trph = Trophy.objects.get(pk=trp)
    trophyentries = getrresults(trph,rnd)
    tee = trph.tournament.course.tee_set.all()[0]
    return render_to_response('web/showresults.html',
                        context_instance=RequestContext(request,
                          {
                          'trph': trph,
                          'trophyentries': trophyentries,
                          'tee':tee}))
                          
def showrresults(request,rnd):
    """results of a trophy"""
    round = Round.objects.get(pk=rnd)
    trophies = Trophy.objects.filter(tournament=round.tournament)
    return render_to_response('web/showrresults.html',
                        context_instance=RequestContext(request,
                          {
                          'round': round,
                          'trophies': trophies,
                          }))
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
		if not entry.member1.scored():
			continue
		if trph.format == 'SG':
			res = entry.getgrossscramble()
		if trph.format == 'GR':
			res = entry.getgrossscores()
		if entry.member1.getcoursehandicap() in range(trph.handicapmin,trph.handicapmax+1):
			
			if trph.format == 'SC':
				res = entry.getnettscramble()
			if trph.format == 'NT':
				res=entry.getscores()
			if res:
				trophyentries.append((entry,res),)	
	if trph.format in ['SC','SG']:   
		trophyentries.sort(cmp = scorecomp)
	if trph.format in ['GR','NT']:   
		trophyentries.sort(cmp = scorecomp,reverse=True)
	return trophyentries

def showpartnerresults(request,trp):
    """results of a trophy"""
    trph = Partnershiptrophy.objects.get(pk=trp)
    trophyentries = getpartnerresults(trph)
    tee = trph.tournament.course.tee_set.all()[0]
    return render_to_response('web/showpartnerresults.html',
                        context_instance=RequestContext(request,
                          {
                          'trph': trph,
                          'trophyentries': trophyentries,
                          'tee':tee}))

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
                players.append({'sno':sno,'player':ment.pop()})
                sno += 1
            groups['starttime']= stme
            groups['players'] = players
            teebox['groups'].append(groups)
            stme = addtime(stme,draw.interval)
        #now get the range
        if draw.groupsize == 4:
            if t.fourballs:
                for x in range(t.fourballs):
                    groups = {}
                    players = []
                    for y in range(4):
                        players.append({'sno':sno,'player':ment.pop()})
                        sno += 1
                    groups['starttime']= stme
                    groups['players'] = players
                    teebox['groups'].append(groups)
                    stme = addtime(stme,draw.interval)
        if draw.groupsize == 3:
            if t.threeballs:
                for x in range(t.threeballs):
                    players = []
                    groups = {}
                    for y in range(3):
                        players.append({'sno':sno,'player':ment.pop()})
                        sno += 1
                    groups['starttime']= stme
                    groups['players'] = players
                    teebox['groups'].append(groups)
                    stme = addtime(stme,draw.interval)
            if t.fourballs:
                for x in range(t.fourballs):
                    players = []
                    groups = {}
                    for y in range(4):
                        players.append({'sno':sno,'player':ment.pop()})
                        sno += 1
                    groups['starttime']= stme
                    groups['players'] = players
                    teebox['groups'].append(groups)
                    stme = addtime(stme,draw.interval)
        if draw.groupsize == 2:
            for x in range(t.twoballs - t.threeballs):
                groups = {}
                players = []
                for y in range(2):
                    players.append({'sno':sno,'player':ment.pop()})
                    sno += 1
                groups['starttime']= stme
                groups['players'] = players
                stme = addtime(stme,draw.interval)
                if t.threeballs:
                    for x in range(t.threeballs):
                        groups = {}
                        players = []
                        for y in range(3):
                            players.append({'sno':sno,'player':ment.pop()})
                            sno += 1
                        groups['starttime']= stime
                        groups['players'] = players
                        stme = addtime(stme,draw.interval)
        drawlist.append([teebox])
    return drawlist



def showdraw(request,drw):
    drawlist = getdrawlist(drw)
    if request.POST:
        if 'accept' in request.POST.keys():
            draw = Draw.objects.get(pk=drw)
            flname = draw.getfile()
            fullname = os.path.join(settings.MEDIA_ROOT,'draws',flname)
            fl = open(fullname,'w')
            fld = flatdraw(drawlist)
            cPickle.dump(fld,fl)
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
                        fld.append([ply['sno'],d['hole'],x['starttime'],ply['player']])

    return fld

def exchangeplayers(fld,x,y):
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
    def __init__(self,request,fld,*args,**kwargs):
        super(Adjustdrawform,self).__init__(*args,**kwargs)
        self.fld = fld
        self.request = request
        self.fields['players'].choices = [(s[0],"%s %s %s " % (s[1],s[2],s[3].player)) for s in self.fld]
    players = forms.MultipleChoiceField(choices=(),required=False, widget=forms.CheckboxSelectMultiple)

    def clean_players(self):
        data = self.cleaned_data['players']
        if 'adjust' in self.request.POST.keys() and len(data) != 2:
            raise forms.ValidationError("Please select exactly 2 players")

        return self.cleaned_data['players']

def adjustdraw(request,drw):
    draw = Draw.objects.get(pk=drw)
    flname = draw.getfile()
    fullname = os.path.join(settings.MEDIA_ROOT,'draws',flname)
    fl = open(fullname,'r')
    fld = cPickle.load(fl)
    fl.close()
    if request.method == 'POST':
        form = Adjustdrawform(request,fld,request.POST)
        if form.is_valid():
            fm = form.cleaned_data
            if 'adjust' in request.POST.keys() and 'players' in request.POST.keys():
                a,b = fm['players']
                fld = exchangeplayers(fld,a,b)
                fl = open(fullname,'w')
                cPickle.dump(fld,fl)
                fl.close()
                return HttpResponseRedirect("/adjustdraw/%s/" % drw)
            else: # 'ok' in request.POST.keys():
                return HttpResponseRedirect("/finaldraw/%s/" % drw)

    else:
        form = Adjustdrawform(request,fld)
    return render_to_response('web/adjustdraw.html',
                        context_instance=RequestContext(request,
                          {
                          'form': form,
                          }))

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def finaldraw(request,drw):
    """a pretty display of the draw"""
    draw = Draw.objects.get(pk=drw)
    tourn = Tournament.objects.get(pk=draw.tournament.id)
    trophies = tourn.trophy_set.all()
    startdate = tourn.startdate
    troph = ''
    for tr in trophies:
        troph = troph+tr.name+' '+tr.get_format_display()+' '+str(tr.handicapmin)+' to '+ str(tr.handicapmax)+'<br/>'
    flname = draw.getfile()
    fullname = os.path.join(settings.MEDIA_ROOT,'draws',flname)
    fl = open(fullname,'r')
    fld = cPickle.load(fl)
    fl.close()
    display = []
    hole = ''
    tme = ''
    for s in fld:
        if hole != str(s[1]):
            display.append("Teebox: %s" %s[1])
            hole = str(s[1])
        if tme != str(s[2]):
            display.append("Time: %s" %str(s[2]))
            tme = str(s[2])
        display.append("%s %s %s" %(s[0],s[3].player,s[3].getcoursehandicap()))


    return render_to_response('web/finaldraw.html',
                        context_instance=RequestContext(request,
                          {'display': display,
                          'troph': troph,
                          'startdate':startdate}))

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
    for h in range(1,19):
        hd[h] = {}
        hd[h]['score'] = 0
        hd[h]['score 0-9'] = 0
        hd[h]['score 10-18'] = 0
        hd[h]['score 19-30'] = 0
        hd[h]['partot'] = 0
    if not trn:
        scores = Score.objects.all()
    else:
        scores = Score.objects.filter(matchentry__tournament = trn)
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
    for k,v in hd.items():
        hdness = round(v['score 0-9']*1.0/v['partot'],4)
        slr['0-9'].append([k,hdness])
        hdness = round(v['score 10-18']*1.0/v['partot'],4)
        slr['10-18'].append([k,hdness])
        hdness = round(v['score 19-30']*1.0/v['partot'],4)
        slr['19-30'].append([k,hdness])
        hdness = round(v['score']*1.0/v['partot'],4)
        slr['all'].append([k,hdness])
    slr['all'].sort(cmp = hdcmp)
    slr['0-9'].sort(cmp = hdcmp)
    slr['10-18'].sort(cmp = hdcmp)
    slr['19-30'].sort(cmp = hdcmp)
    return {'slr': slr,'sd': sd}

def closealltournaments():
	tourns = Tournament.objects.filter(closed=False)
	for tourn in tourns:
		closetournament(tourn.id)
	return 1

def closetournament(trn):
    tourn = Tournament.objects.get(pk=trn)
    mentries = tourn.matchentry_set.all()
    members = Member.objects.values_list('player',flat=True)
    for mentry in mentries:
        #if it is a member, get esc score and add to scoring record
        if mentry.player.id in members and mentry.scored():
            mem=Member.objects.get(player=mentry.player)
            esc = mentry.getesctotal()
            sc = Scoringrecord.objects.create(
                                        score=esc,
                                        member=mem,
                                        scoredate=mentry.tournament.startdate,
                                        scoretype='T',
                                        courserating=mentry.tee.courserating,
                                        sloperating=mentry.tee.sloperating,
                                        tee=mentry.tee)

    #save trophy results
    for trp in tourn.trophy_set.all():
        res = getresults(trp)
        flname = trp.getfile()
        fullname = os.path.join(settings.MEDIA_ROOT,'draws',flname)
        fl = open(fullname,'w')
        cPickle.dump(res,fl)
        fl.close()
    #get stats and save them too
    res = statistics(trn)
    flname = tourn.getfile()
    fullname = os.path.join(settings.MEDIA_ROOT,'draws',flname)
    fl = open(fullname,'w')
    cPickle.dump(res,fl)
    fl.close()
    #get cumulative stats and save
    res = statistics()
    flname = 'cumulative'
    fullname = os.path.join(settings.MEDIA_ROOT,'draws',flname)
    fl = open(fullname,'w')
    cPickle.dump(res,fl)
    fl.close()
    tourn.closed = True
    tourn.save()
    return 1

def displaytournaments(request):
    tourns = Tournament.objects.filter(closed=True)
    flname = 'cumulative'
    fullname = os.path.join(settings.MEDIA_ROOT,'draws',flname)
    fl = open(fullname,'r')
    stats = cPickle.load(fl)
    fl.close()
    data = []
    hls = stats['slr']['all']
    for x in hls:
        data.append([x[0],x[1]*10])
    ticks =[]
    for x in range(1,19):
        ticks.append([x,str(x)])
    data.sort(cmp = holecomp)
    data = [data]
    return render_to_response('web/displaytournaments.html',
                        context_instance=RequestContext(request,
                          {'tourns': tourns,
                          'stats': stats,
                          'data': data,
                          'ticks':ticks,
                          }))

def tournamentfull(request,trn):
    tourn = Tournament.objects.get(pk=trn)
    results = []
    for trp in tourn.trophy_set.all():
        flname = trp.getfile()
        fullname = os.path.join(settings.MEDIA_ROOT,'draws',flname)
        fl = open(fullname,'r')
        res = cPickle.load(fl)
        results.append([trp,res])
        fl.close()
    flname = tourn.getfile()
    fullname = os.path.join(settings.MEDIA_ROOT,'draws',flname)
    fl = open(fullname,'r')
    stats = cPickle.load(fl)
    fl.close()
    return render_to_response('web/tournamentfull.html',
                        context_instance=RequestContext(request,
                          {'results':results,
                          'stats':stats
                          }))

def calculatehandicap(request):
    #get member and most recent scoring records
	membs = Member.objects.all()
	hlist = []
	for memb in membs:
		srec = memb.scoringrecord_set.filter(
		scoredate__gt=datetime.datetime.now()+datetime.timedelta(days=-365)).order_by('-scoredate')[:20]
		#get differentials
		diffs = []
		for sr in srec:
			diff = round((sr.score - sr.courserating)*113/sr.sloperating,1)
			diffs.append((sr,diff))
		if len(diffs) < 5:
			continue
		diffs.sort(cmp=diffcomp)
		x = len(diffs)
		diffs = diffs[:DIFFERENTIALS[x]]
		tot = 0
		for x in diffs:
			tot += x[1]
		hindex = int(9.6*tot/len(diffs))/10.0
		chand = int(round(hindex*memb.player.tee.sloperating/113))
		coimb = int(round(hindex*131/113))
		cut = 0
		if memb.scoringrecord_set.filter(scoretype='T').filter(
				scoredate__gt=datetime.datetime.now()+datetime.timedelta(days=-365)).count()>=2:
			tscores = memb.scoringrecord_set.filter(scoretype='T').filter(
					scoredate__gt=datetime.datetime.now()+datetime.timedelta(days=-365)).order_by('score')
			x = tscores[1]
			cutdiff = round((x.score - x.courserating)*113/x.sloperating,1)
			cut = hindex - cutdiff
		hlist.append((memb,hindex,chand,coimb,cut))
		try:
			x = currenthandicap.objects.get(member=memb)
			x.handicap = str(hindex)
			x.save()
		except:
			x = currenthandicap.objects.create(member=memb,handicap=str(hindex))
			
		#pickle and save

	handlist = {'date':datetime.datetime.now(),'hlist':hlist}
	flname = "handicaplist%s%s%s" %('ogc',
										datetime.datetime.now().year,
										datetime.datetime.now().month
										)
	fullname = os.path.join(settings.MEDIA_ROOT,'draws',flname)
	fl = open(fullname,'w')
	cPickle.dump(handlist,fl)
	fl.close()
	return render_to_response('web/handicaplist.html',
						context_instance=RequestContext(request,
						  {'handlist':handlist,}))

def displayhandicap(request):
	flname = "handicaplist%s%s%s" %('ogc',
										datetime.datetime.now().year,
										datetime.datetime.now().month
										)
	fullname = os.path.join(settings.MEDIA_ROOT,'draws',flname)
	print fullname
	handlist = {}
	try:
		fl = open(fullname,'r')
		handlist = cPickle.load(fl)
		
		fl.close()
	except:
		pass
	

	return render_to_response('web/handicaplist.html',
						context_instance=RequestContext(request,
						  {'handlist':handlist,}))

def scoringrecord(request,ply):
    """displays a members scoring record"""
    memb = Member.objects.get(pk=ply)
    srec = memb.scoringrecord_set.filter(
        scoredate__gt=datetime.datetime.now()+datetime.timedelta(days=-365)).order_by('-scoredate')[:20]
        #get differentials
    diffs = []
    tdiffs = []
    for sr in srec:
        diff = round((sr.score - sr.courserating)*113/sr.sloperating,1)
        diffs.append((sr,diff))
    diffs.sort(cmp=diffcomp)
    if memb.scoringrecord_set.filter(scoretype='T').filter(
                scoredate__gt=datetime.datetime.now()+datetime.timedelta(days=-365)).count()>=2:
        tscores = memb.scoringrecord_set.filter(scoretype='T').filter(
                scoredate__gt=datetime.datetime.now()+datetime.timedelta(days=-365)).order_by('score')

        for ts in tscores:
            diff = round((ts.score - ts.tee.courserating)*113/ts.tee.sloperating,1)
            tdiffs.append((ts.score,diff))
    return render_to_response('web/scoringrecord.html',
                        context_instance=RequestContext(request,
                          {'diffs':diffs,
                          'memb':memb,
                          'tdiffs':tdiffs}))


def showcards(request,mem):
    """members 20 most recent cards"""
    memb=Member.objects.get(pk=mem)
    entries = Practiceround.objects.filter(member=mem).filter(
        rounddate__gt=datetime.datetime.now()+datetime.timedelta(days=-365)).order_by('-rounddate')[:20]

    return render_to_response('web/showcards.html',
                        context_instance=RequestContext(request,
                          {'entries': entries,
                          'memb':memb}))

#teams stuff
#manageteamtrophies
@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def manageteamtrophy(request,tournid):
    """Displays all team trophies for open tournaments"""
    cr = Teamtrophy.objects.filter(tournament__id=tournid)
    tourn = Tournament.objects.get(pk=tournid)
    return render_to_response('web/manageteamtrophies.html',
                        context_instance=RequestContext(request,
                          {'cr': cr,
                          'tourn':tourn}))


#add/edit teamtrophies
class Teamtrophyform(ModelForm):
    def __init__(self, tournid, *args, **kwargs):
        super(Teamtrophyform, self).__init__(*args, **kwargs)
        self.fields['tournament'].queryset = Tournament.objects.filter(id=int(tournid))
    class Meta:
        model = Teamtrophy

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addteamtrophy(request,tournid,id=None):
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
        form = Teamtrophyform(tournid,request.POST,instance=instance)
        if form.is_valid():
            f=form.save()
            if 'save' in request.POST.keys():
                return HttpResponseRedirect('/manageteamtrophy/%d/' % int(tournid))
            else:
                return HttpResponseRedirect('/addteamtrophy/%d/' % int(tournid))
    else:
        form = Teamtrophyform(tournid,instance=instance)
    return render_to_response('web/additem.html',
                        context_instance=RequestContext(request,
                          {'form': form,
                          'title': 'teamtrophy',
                          'edit': edit}))

#add/edit teams
@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def manageteams(request,trophid):
    """Displays all team trophies for open tournaments"""
    cr = Team.objects.filter(teamtrophy__id=trophid)
    troph = Teamtrophy.objects.get(pk=trophid)
    return render_to_response('web/manageteams.html',
                        context_instance=RequestContext(request,
                          {'cr': cr,
                          'troph':troph}))

class Teamform(ModelForm):
    def __init__(self, trophid,id, *args, **kwargs):

        super(Teamform, self).__init__(*args, **kwargs)
        ttrophy = Teamtrophy.objects.get(pk=int(trophid))
        tourn = ttrophy.tournament
        y = Matchentry.objects.filter(tournament=tourn).order_by('player__last_name')
        self.fields['teamtrophy'].queryset = Teamtrophy.objects.filter(id=int(trophid))
        if id:
            teem = Team.objects.get(pk=int(id))
            z = teem.members.all()
            self.fields['members'].choices = [(x.id,x.player) for x in y if (len(x.team_set.all()) == 0 or x in z)]
        else:
            self.fields['members'].choices = [(x.id,x.player) for x in y if len(x.team_set.all()) == 0]
    class Meta:
        model = Team
        

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addteam(request,trophid,id=None):
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
            return HttpResponseRedirect('/manageteams/%d' %int(trophid))
        form = Teamform(trophid,id,request.POST,instance=instance)
        if form.is_valid():
            f=form.save()
            if 'save' in request.POST.keys():
                return HttpResponseRedirect('/manageteams/%d' %int(trophid))
            else:
                return HttpResponseRedirect('/addteam/%d/' % int(trophid))
    else:
        form = Teamform(trophid,id,instance=instance)
    return render_to_response('web/additem.html',
                        context_instance=RequestContext(request,
                          {'form': form,
                          'title': 'team',
                          'edit': edit}))

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def deleteteam(request,id):
    """deletes a team"""

    tm = Team.objects.get(pk=id)
    cr = Team.objects.filter(teamtrophy=tm.teamtrophy)
    troph = Teamtrophy.objects.get(pk=tm.teamtrophy.id)
    tm.delete()
    return render_to_response('web/manageteams.html',
                        context_instance=RequestContext(request,
                          {'cr': cr,
                          'troph':troph}))
                          
#Partner
@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def managepartners(request,trn):
    """match players to tournaments"""
    entries = Partner.objects.filter(tournament=trn)
    tourn = Tournament.objects.get(pk=trn)
    return render_to_response('web/managepartnerships.html',
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
        self.fields['member1'].choices=[(x.id,x.player) for x in Matchentry.objects.filter(tournament__id=self.tourn) if x not in ap]
        self.fields['member2'].choices=[(x.id,x.player) for x in Matchentry.objects.filter(tournament__id=self.tourn) if x not in ap]
        # need to add only the tees of the course in question

    class Meta:
        model = Partner
        exclude = ('tournament',)



@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addpartner(request,tourn,id=None):
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
            return HttpResponseRedirect('/managepartners/%s/' %tourn)
        form = Partnerform(tourn,request.POST,instance=instance)
        if form.is_valid():
            fm = form.save(commit=False)

            fm.tournament_id = tourn
            fm.save()
        if 'repeat' in request.POST.keys():
            return HttpResponseRedirect('/addpartner/%s/' %tourn)
        else:
            return HttpResponseRedirect('/managepartners/%s/' %tourn)
    else:
        form = Partnerform(tourn,instance=instance)

    return render_to_response("web/additem.html",
                              context_instance=RequestContext(request,{'form':form,
                                                                'title': 'partner',
                                                                'edit': edit,
                                                                }))

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def deletepartner(request,id):
    """deletes a partner"""

    tm = Partner.objects.get(pk=id)
    cr = Partner.objects.filter(teamtrophy=tm.teamtrophy)
    troph = Partnertrophy.objects.get(pk=tm.teamtrophy.id)
    tm.delete()
    return render_to_response('web/managepartners.html',
                        context_instance=RequestContext(request,
                          {'cr': cr,
                          'troph':troph}))

def results(request,id):
    """deletes a team"""

    tt = Teamtrophy.objects.get(pk=id)
    tourn = tt.tournament.id
    return render_to_response('web/results.html',
                        context_instance=RequestContext(request,
                          {'tt': tt,
                          'tourn':tourn}))

#rounds

#add round
class Roundform(ModelForm):

    class Meta:
        model = Round
        exclude = ('tournament',)



@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addround(request,trn,id=None):
    """
    Function to add/edit round.
    """
    tourn = Tournament.objects.get(pk=trn)
    if tourn.closed:
        return HttpResponseRedirect('/message/%s/' %('NO'))
    edit = False
    if not id:
        id = None
        instance = None
    else:
        instance = Round.objects.get(pk=id)
        edit = True
    if request.POST:
        form = Roundform(request.POST,instance=instance)
        if form.is_valid():
            fm = form.save(commit = False)
            fm.tournament=tourn
            fm.save()
            return HttpResponseRedirect('/managetrophies/%s/' % trn)
    else:
        form = Roundform(instance=instance)

    return render_to_response("web/additem.html",
                              context_instance=RequestContext(request,{'form':form,
                                                                'title': 'round',
                                                                'edit': edit,
                                                                'tourn':tourn,
                                                                }))
                                                                
@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def managerounds(request,trn):
    """add and get results for trophies"""
    tourn = Tournament.objects.get(pk=trn)
    cr = Round.objects.filter(tournament=trn)
    return render_to_response('web/managerounds.html',
                        context_instance=RequestContext(request,
                          {'cr': cr,
                          'tourn': tourn}))
                          
@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def generaterounds(request,trn):
	"""add and get results for trophies"""
	tourn = Tournament.objects.get(pk=trn)
	if tourn.rounds == 1:
		return
	else:
		for rn in range(2,tourn.rounds+1):
			newround = Round.objects.create(tournament=tourn,
						startdate=tourn.startdate+datetime.timedelta(days=rn-1),
						num = rn)
		ments = tourn.matchentry_set.all()
		for rn in range(2,tourn.rounds+1):
			for ment in ments:
				newment = Matchentry.objects.create(tournament=ment.tournament,
													player=ment.player,
													tee = ment.tee,
													category=ment.category,
													round=rn)
													
	return HttpResponseRedirect('/managerounds/%s/' % trn)

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def managerscores(request,rnd):
    """match players to tournaments"""
    round = Round.objects.get(pk=rnd)
    tourn = round.tournament
    num = round.num
    entries = Matchentry.objects.filter(tournament=tourn,round=num)
    tee = tourn.course.tee_set.all()[0]
    return render_to_response('web/managerscores.html',
                        context_instance=RequestContext(request,
                          {'entries': entries,
                          'tourn': tourn,
                          'tee':tee,
                          'round':round}))
                          
@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/login/")
def addrscores(request,rnd,matchentry):
    """
    Function to add/edit scores.
    """
    mentry = Matchentry.objects.get(pk=matchentry)
    if mentry.tournament.closed:
        return HttpResponseRedirect('/message/%s/' %('NO'))
    id = mentry.tee_id
    tee = Tee.objects.get(pk=id)
    data = {}
    scores = Score.objects.filter(matchentry=mentry)
    for score in scores:
        data[score.hole.number]=score.score
    if request.POST:
        pst = request.POST.copy()
        for num in range(1,19):
            if str(num) in pst:
                if pst[str(num)] == '':
                    pst[str(num)] = 0
                hle,created = Score.objects.get_or_create(matchentry=mentry,
                    hole=Hole.objects.get(tee=tee,number=num))
            if created or hle.score != pst[str(num)]:
 #           fm = hle.save(commit=False)
                hle.score=pst[str(num)]
                hle.save()
        if 'repeat' in request.POST.keys():
            return HttpResponseRedirect('/addrscores/%s/' % id)
        else:
            return HttpResponseRedirect('/managerscores/%s/' %rnd)
    else:
        form =Addscoresform(id,data)

    return render_to_response("web/addscores.html",
                              context_instance=RequestContext(request,{'form':form,
                                                                'mentry': mentry,
                                                                
                                                                }))


def rleaderboard(request,trn,rnd):
    """match players to tournaments"""
    tourn = Tournament.objects.get(pk=trn)
    trps = Trophy.objects.filter(tournament=tourn)
    results = []
    for trp in trps:
        res = getrresults(trp,rnd)
        results.append((trp,res))
    return render_to_response('web/rleaderboard.html',
                        context_instance=RequestContext(request,
                          {'results': results,
                          'tourn':tourn,
                          }))
                          
def getrresults(trph,rnd):
    """results of a trophy"""
    tourn = trph.tournament.id
    round = Round.objects.get(pk=rnd)
    num = round.num
    # get players within the handicap range:
    entries = Matchentry.objects.filter(tournament=tourn,round=num)
    # get handicap limits
    trophyentries = []
    for entry in entries:
        if not entry.scored():
            continue
        if entry.getcoursehandicap() in range(trph.handicapmin,trph.handicapmax+1):
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
            elif trph.format in ['A','B','C','D','AB','BG','CG']:
				res = entry.getcatmedal(trph.format)
            if res and 'DQ' not in res and len(res) == 21:
                trophyentries.append((entry.player,res),)
    if trph.format in ['MR','GM','A','B','C','E','F','D','AB','BG','CG']:
        trophyentries.sort(cmp = scorecomp)
    else:
        trophyentries.sort(cmp = scorecomp,reverse=True)
    return trophyentries

def getcumresults(trp,rnd):
	"""results of a trophy"""
	trph = Trophy.objects.get(pk=trp)
	tourn = trph.tournament.id
	
	cumstat = {}
	mes = getrresults(trph,rnd)
	for x in mes:
		cumstat[x[0].last_name]=0
	res = getresults(trph)
	cs = []
	for x in res:
		if cumstat.has_key(x[0].last_name):
			if cumstat[x[0].last_name]==0:
				cumstat[x[0].last_name] = x[1][20]
			else:
				cumstat[x[0].last_name] += x[1][20]
	for k,v in cumstat.items():
		cs.append((k,v))
	cs.sort(cmp=cumsort)
	
	return cs
			




