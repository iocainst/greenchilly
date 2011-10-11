from django.db import models
from django.utils.translation import gettext as _
from django.db.models import Avg, Max, Min, Count
from django.core.exceptions import ValidationError

import datetime

def initialscores():
    scrs = []
    for x in range(21):
            scrs.append(0)
    return scrs

# Create your models here.



class Tempreg(models.Model):
    username = models.CharField(_("User Name"),max_length=30,unique=True)
    email = models.EmailField(_("Email Address"),unique=True)
    date = models.DateField(_("Date"),default=datetime.datetime.now,editable=False)
    code = models.CharField(_("Code"),max_length=100,blank=True,null=True,
                                                    editable=False,default='123')

    def __unicode__(self):
           return _(u"%(username)s %(email)s")\
           %{'username': self.username,'email': self.email}

TEECOLOURS = (
            ('RD',_('Red')),
            ('BL',_('Black')),
            ('WT',_('White')),
            ('BU',_('Blue')),
            ('YL',_('Yellow')),
            )
            
PARTNERTYPES = (
            ('GR',_('Gross bestball bogey')),
            ('NT',_('Nett bestball bogey')),
            ('MR',_('Gross bestball medal round')),
            ('MT',_('Nett bestball medal round')),
            ('SC',_('Nett scramble')),
            ('SG',_('Gross scramble')),
            ('CS',_('Combined stableford')),
            ('GC',_('Gross combined stableford')),
            
            )
PARTNER3TYPES = (
            ('G3',_('Gross')),
            ('N3',_('Nett')),
           
            )
JUNIORCATS = (
            ('A','A'),
            ('B','B'),
            ('C','C'),
            ('D','D'),
            ('E','A&B girls'),
            ('F','C girls'),
            
            )

MATCHTYPES = (
            ('MR','Medal Round'),
            ('GM','Gross Medal Round'),
            ('ST','Stableford'),
            ('AG','Against Bogey'),
            ('GS','Gross Stableford'),
            ('GG','Gross Bogey'),
            ('MB','Modified Bogey'),
            ('GB','Gross Modified Bogey'),
            ('VL','Dr Velappan'),
            ('A','A'),
            ('B','B'),
            ('C','C'),
            ('D','D'),
            ('AB','A & B'),
            ('BG','A & B girls'),
            ('CG','C girls'),
            )

HANDICAPTYPES = (
            ('L','Local handicap'),
            ('M','Modified by the Committee'),
            ('N','Nine hole'),
            ('NL','Nine hole local'),
            ('R','Automatically reduced'),
            ('SL','Short Course'),
            ('WD','Withdrawn'),
            )

SCORETYPES = (
            ('N','Normal'),
            ('A','Away'),
            ('AI','Away Internet'),
            ('P','Penalty'),
            ('T','Tournament'),
            ('TI','Tournament Internet'),
            ('C','Combined nines'),
            )


class Course(models.Model):
    """
        Basic data for a course
        """
    name = models.CharField(_("Course name"),max_length=100,unique=True)
    shortname = models.CharField(_("Short name"),max_length=100)
    description = models.TextField(_("Description"),blank=True,null=True)
    usga = models.BooleanField(_("usga handicap index"),default=False)
    def __unicode__(self):
        return u"%s: %s" %(self.shortname,self.name)
        
class Homeclub(models.Model):
    """This model is designed to have softcoded details that are now hardcoded"""
    course = models.OneToOneField(Course,verbose_name=_("Course"))
    def __unicode__(self):
        return u"%s" %(self.course.shortname)

class Tee(models.Model):
    """various tee types - championship, ladies, gents etc
        """
    course = models.ForeignKey(Course,verbose_name=_("Course"))
    colour = models.CharField(_("Tee colour"),max_length=2,choices=TEECOLOURS)
    description=models.CharField(_("Description"),max_length=100)
    sloperating = models.IntegerField(_("Slope Rating"))
    courserating = models.DecimalField(max_digits=4,decimal_places=1,
                                        verbose_name=_("Course Rating"))
    def get_yardage(self):
        yards = 0
        holes = self.hole_set.all()
        for hl in holes:
            yards = yards + hl.yardage
        return yards

    def get_par(self):
        par = 0
        holes = self.hole_set.all()
        for hl in holes:
            par = par + hl.par
        return par

    def get_holes(self):
        par = 0
        holes = self.hole_set.all()
        return len(holes)

    class Meta:
        unique_together = ("course", "colour")

    def __unicode__(self):
        return u"%s: %s" %(self.course.shortname,self.get_colour_display())

class Hole(models.Model):
    """hole, tee colour, yardage, par and stroke index"""
    tee = models.ForeignKey(Tee,verbose_name=_("Tee"))
    number = models.IntegerField(_("Hole Number"))
    par = models.IntegerField(_("Par"))
    strokeindex = models.IntegerField(_("Stroke Index"))
    yardage = models.IntegerField(_("Yardage"))

    class Meta:
        unique_together = ("tee", "number")
        ordering = ['number']
    #need to validate that stroke index is not duplicated
    #def clean(self):
        #for hle in self.tee.hole_set.all():
            #if hle.strokeindex == self.strokeindex and hle != self:
                #raise ValidationError(_("Duplicate stroke index same as %s") %hle.number)

    def __unicode__(self):
        return u"%s: par=%d, strokeindex=%d" %(self.tee,self.par,self.strokeindex)


class Tournament(models.Model):
    """Date, name, format, days, handicap"""
    startdate = models.DateField(_("Start Date"),unique=True)
    rounds = models.IntegerField(_("Number of rounds"))
    course = models.ForeignKey(Course,verbose_name=_("Course"))
    closed = models.BooleanField(_("Results Declared"),default=False)
    def associated(self):
        if self.maintournament.all().count() > 0:
            return self.maintournament.all()[0]
        else:
            return None
    def has_associated(self):
        return self.maintournament.all().count() > 0
    def getfile(self):
        return "tournament%s" % (str(self.startdate))
    def ispartner(self):
        return self.partnershiptrophy_set.all().count() > 0
    def isteam(self):
        return self.teamtrophy_set.all().count() > 0
    def __unicode__(self):
        return u"%s %s" %(self.course,self.startdate)

class Associated(models.Model):
    """
    a class to hold associated tournaments on the same day to avoid duplicate
    data entry
    """
    tournament = models.ForeignKey(Tournament,verbose_name=_('Tournament'),
                                   related_name='maintournament')
    associated = models.ForeignKey('Round',verbose_name=_('Associated Tournament round'),
                                   related_name='associatedtournament')

    class Meta:
        unique_together = ('tournament','associated')
        
    def __unicode__(self):
        return u'%s %s' %(self.tournament,self.associated)
        
class Round(models.Model):
    """Date, name, format, days, handicap"""
    startdate = models.DateField(_("Start Date"))
    tournament = models.ForeignKey(Tournament,verbose_name="Tournament")
    num = models.IntegerField("Round number")
    class Meta:
        unique_together = ("tournament", "num")
        ordering = ['num']
    
    def __unicode__(self):
        return u"%s %s %s" %(self.num,self.startdate,self.tournament)

class Trophy(models.Model):
    """Date, name, format, days, handicap"""
    tournament = models.ForeignKey(Tournament,verbose_name=_("Tournament"))
    name = models.CharField(_("Trophy Name"),max_length=100)
    format = models.CharField(_("Format"),max_length=2,choices=MATCHTYPES)
    handicapmax = models.IntegerField(_("Handicap max"))
    handicapmin = models.IntegerField(_("Handicap min"))
    def getfile(self):
        return "trophy%s%s" % (str(self.tournament.startdate),str(self.name))
    class Meta:
        unique_together = ("name", "tournament")

    def __unicode__(self):
        return u"%s: %s" %(self.name,self.tournament)
        

        
class Partnershiptrophy(models.Model):
    """Date, name, format, days, handicap"""
    tournament = models.ForeignKey(Tournament,verbose_name=_("Tournament"))
    name = models.CharField(_("Trophy Name"),max_length=100)
    format = models.CharField(_("Format"),max_length=2,choices=PARTNERTYPES)
    handicapmax = models.IntegerField(_("Handicap max"))
    handicapmin = models.IntegerField(_("Handicap min"))
    def getfile(self):
        return "trophy%s%s" % (str(self.tournament.startdate),str(self.name))
    class Meta:
        unique_together = ("name", "tournament")

    def __unicode__(self):
        return u"%s: %s" %(self.name,self.tournament)
class Partnership3trophy(models.Model):
    """Date, name, format, days, handicap"""
    tournament = models.ForeignKey(Tournament,verbose_name=_("Tournament"))
    name = models.CharField(_("Trophy Name"),max_length=100)
    format = models.CharField(_("Format"),max_length=2,choices=PARTNER3TYPES)
    handicapmax = models.IntegerField(_("Handicap max"))
    handicapmin = models.IntegerField(_("Handicap min"))
    def getfile(self):
        return "trophy%s%s" % (str(self.tournament.startdate),str(self.name))
    class Meta:
        unique_together = ("name", "tournament")

    def __unicode__(self):
        return u"%s: %s" %(self.name,self.tournament)

class Player(models.Model):
    """just name, home club and tee"""
    first_name = models.CharField(_("First Name or initials"),max_length=100)
    last_name = models.CharField(_("Last Name"),max_length=100)
    homeclub = models.ForeignKey(Course,verbose_name=_("Home Course"))
    tee = models.ForeignKey(Tee,verbose_name=_("Tee"))
    photo = models.ImageField(_("Photo"),upload_to='photos/',blank=True,null=True)
    def clean(self):
        
        try:
            ln = Player.objects.get(last_name__iequal=self.last_name,first_name__iequal=self.first_name)
            if ln:
                raise ValidationError(_("This player exists"))
        except:
            self.first_name = self.first_name.lower()
            self.last_name = self.last_name.lower()
            
        

    class Meta:
        unique_together = ('first_name','last_name')
        ordering = ['last_name']
    def latesthandicap(self):
        try:
            latestdate = self.handicap_set.all().aggregate(Max('valto'))
            return Handicap.objects.get(player=self,valto=latestdate['valto__max'])
        except:
            return None


    def __unicode__(self):
        return u"%s %s" %(self.last_name.capitalize(),self.first_name.capitalize())

class Handicap(models.Model):
    """just name and handicap index - how to handle validity?"""
    player = models.ForeignKey(Player,verbose_name=_("Player"))
    handicap = models.DecimalField(_("Handicap index"),max_digits=3, decimal_places=1)
    valfrom = models.DateField(_("Valid from"))
    valto = models.DateField(_("Valid to"))
    class Meta:
        unique_together = ('player','valto')

    def clean(self):

        if self.valfrom >= self.valto:
            raise ValidationError(_("from date should be less than to date"))


    def __unicode__(self):
        return u"%s %s %s %s" %(self.player,self.handicap,self.valfrom,self.valto)


class Draw(models.Model):
    """how many tee-off holes, size of group, interval, starttime
        one draw per day. Have to cater for ranked draw and VIPs"""
    tournament = models.ForeignKey(Tournament,verbose_name=_("Tournament Name"))
    day = models.IntegerField(_("Tournament Day Number"),default=1)
    groupsize = models.IntegerField(_("Group Size"))
    interval = models.IntegerField(_("Interval between groups"))
    done = models.BooleanField(_("Done"),default=False)
    drawlist = models.FileField(_("Draw file"),upload_to='draws/',blank=True,null=True)

    class Meta:
        unique_together = ("tournament", "day")

    def getfile(self):
        return "draw%s%s" % (str(self.tournament.startdate),str(self.day))

    def __unicode__(self):
        return u"%s: Day %d" %(self.tournament,self.day)

class Teeoff(models.Model):
    draw = models.ForeignKey(Draw,verbose_name=_("Draw"))
    hole = models.IntegerField(_("Starting hole"))
    starttime = models.TimeField(_("Starting time"))
    fourballs = models.IntegerField(_("No of fourballs"),blank=True,null=True)
    threeballs = models.IntegerField(_("No of threeballs"),blank=True,null=True)
    twoballs = models.IntegerField(_("No of twoballs"),blank=True,null=True)
    singles = models.IntegerField(_("No of singles"),blank=True,null=True)
    priority = models.IntegerField(_("Priority"))
    class Meta:
        unique_together = ("draw", "hole","starttime")
        ordering = ['priority']

    def __unicode__(self):
        return u"%s: hole %s" %(self.draw,self.hole)

class Matchentry(models.Model):
    tournament = models.ForeignKey(Tournament,verbose_name=_("Tournament"))
    player = models.ForeignKey(Player,verbose_name=_("Player"))
    tee = models.ForeignKey(Tee,verbose_name=_("Tee"))
    category = models.CharField("category",max_length=1,choices=JUNIORCATS,blank=True,null=True)
    round = models.IntegerField("Round",default=1)
    class Meta:
        unique_together = ("tournament", "player","round")
        ordering = ('player',)
    def scored(self):
        scd = False
        sc = self.matchentries.all()
        for s in sc:
            if s.score > 0:
                scd = True
                continue
        return scd
    def dqed(self):
        scd = False
        sc = self.matchentries.all()
        for s in sc:
            if s.score == 0:
                scd = True
                continue
        return scd

    def getcoursehandicap(self):
        """the formula is: handicapindex*sloperating/113 and rounded"""
        handicaps = self.player.handicap_set.all()
        hindex = 0
        if len(handicaps) == 0:
            pass
        else:
            for handicap in handicaps:
                if handicap.valfrom <= self.tournament.startdate <= handicap.valto:
                    hindex = handicap.handicap
        if hindex:
            srating = self.tee.sloperating
            return int(round(hindex*srating/113))
            
        else:
            return hindex

    def getcurrenthandicap(self):
        return self.getcoursehandicap()
            
    def getcurhandicap(self):
        """this is for calculating esc scores only"""
        try:
            handicap = self.member.currenthandicap_set.all()[0].handicap
        except:
            handicap = 36.4
        srating = self.tee.sloperating
        chandicap = int(round((handicap*srating)/113))
        return chandicap
    def getroundtotal(self):
        """for multiround tournaments"""
        scorelist = self.matchentries.all()
        scoretot = {self.round:0}
        for score in scorelist:
            if score.score == 0:
                return{self.round:0}
            scoretot[self.round] = scoretot[self.round] + score.score
        return scoretot
        
    def getstrokes(self,hcp,score):
        """given a score and handicap gets strokes"""
        if hcp >= score.hole.strokeindex + 18:
                    strokes =  2
        elif hcp >= score.hole.strokeindex:
            strokes =  1
        else:
            strokes = 0
        return strokes 
        
    def scrdisp(self,scrs,score,sc,frontnine,backnine):
        if score.hole.number <= 9:
            frontnine += sc
            scrs[score.hole.number-1]=sc
        else:
            backnine += sc
            scrs[score.hole.number]=sc
        return (scrs,frontnine,backnine)

    def getnines(self,scrs,frontnine,backnine):
        tot = frontnine+backnine
        scrs[9]=frontnine
        scrs[19] = backnine
        scrs[20]=tot
        return scrs
        
    def initialise(self):
        scorelist = self.matchentries.all()
        frontnine = 0
        backnine = 0
        scrs = initialscores()
        return (scrs,scorelist,frontnine,backnine)

    def getesctotal(self):
        scrs,scorelist,frontnine,backnine = self.initialise()
        hcp = self.getcurhandicap()
        for score in scorelist:
            sc = score.score
            if sc == 0:
                if hcp >= score.hole.strokeindex + 18:
                    sc = score.hole.par + 2
                elif hcp >= score.hole.strokeindex:
                    sc = score.hole.par + 1
                else:
                    sc = score.hole.par
            if hcp >= 40:
                if sc > 10:
                    sc = 10
            elif hcp >= 30:
                if sc > 9:
                    sc = 9
            elif hcp >= 20:
                if sc > 8:
                    sc = 8
            elif hcp >= 10:
                if sc > 7:
                    sc = 7
            else:
                if sc > score.hole.par+2:
                    sc = score.hole.par + 2
            if score.hole.number <= 9:
                frontnine += sc
            else:
                backnine += sc
        tot = frontnine+backnine
        return tot

    def getscores(self):
        scrs,scorelist,frontnine,backnine = self.initialise()
        for score in scorelist:
            sc = score.score
            scrs,frontnine,backnine = self.scrdisp(scrs,score,sc,frontnine,backnine)
        scrs = self.getnines(scrs,frontnine,backnine)
        return scrs
        
    def getcatmedal(self,cat):
        go = False
        if cat == 'AB':
            go = self.category=='A' or self.category=='B'
        elif cat == 'BG':
            go = self.category=='E'
        elif cat == 'CG':
            go = self.category=='F'
        else :
            go = self.category==cat
        if go:
            scrs,scorelist,frontnine,backnine = self.initialise()
            for score in scorelist:
                if score.score == 0:
                    scrs = ['DQ']
                    continue
                sc = score.score
                scrs,frontnine,backnine = self.scrdisp(scrs,score,sc,frontnine,backnine)
            scrs = self.getnines(scrs,frontnine,backnine)
            return scrs
            
    def getgrossmr(self):
        scrs,scorelist,frontnine,backnine = self.initialise()
        for score in scorelist:
            if score.score == 0:
                scrs = ['DQ']
                continue
            sc = score.score
            scrs,frontnine,backnine = self.scrdisp(scrs,score,sc,frontnine,backnine)
        scrs = self.getnines(scrs,frontnine,backnine)
        return scrs
    def getgrossmrndq(self):
        scrs,scorelist,frontnine,backnine = self.initialise()
        for score in scorelist:
            sc = score.score
            scrs,frontnine,backnine = self.scrdisp(scrs,score,sc,frontnine,backnine)
        scrs = self.getnines(scrs,frontnine,backnine)
        return scrs

    def stablefordscoring(self,score,par):
        if score == 0 or score >= par + 2:
            points = 0
        else:
            points = par + 2 - score
        return points
        
    def bogeyscoring(self,score,par):
        if score == 0 or score > par:
            points = -1
        elif score < par:
            points = 1
        else:
            points = 0
        return points
        
    def modbogeyscoring(self,score,par):
        if score == 0 or score - par < -3:
            points = -3
        else:
            points = par - score
        return points
        
    def getgrossstableford(self):
        scrs,scorelist,frontnine,backnine = self.initialise()
        for score in scorelist:
            points = self.stablefordscoring(score.score,score.hole.par)
            scrs,frontnine,backnine = self.scrdisp(scrs,score,frontnine,backnine)
        scrs = getnines(scrs,frontnine,backnine)
        return scrs

    def getgrossbogey(self):
        scrs,scorelist,frontnine,backnine = self.initialise()
        for score in scorelist:
            points = self.stablefordscoring(score.score,score.hole.par)
            scrs,frontnine,backnine = self.scrdisp(scrs,score,points,frontnine,backnine)
        scrs = getnines(scrs,frontnine,backnine)
        return scrs

    def getgrossmodbogey(self):
        scrs,scorelist,frontnine,backnine = self.initialise()
        for score in scorelist:
            points = self.modbogeyscoring(score.score,score.hole.par)
            scrs,frontnine,backnine = self.scrdisp(scrs,score,points,frontnine,backnine)
        scrs = getnines(scrs,frontnine,backnine)
        return scrs

    def getnettmr(self):
        scrs,scorelist,frontnine,backnine = self.initialise()
        hcap = self.getcoursehandicap()
        for score in scorelist:
            if score.score == 0:
                scrs = ['DQ']
                continue
            strokes = self.getstrokes(hcp,score)
            sc = score.score -strokes
            scrs,frontnine,backnine = self.scrdisp(scrs,score,sc,frontnine,backnine)
        scrs = self.getnines(scrs,frontnine,backnine)
        return scrs
    def getnettmrndq(self):
        scrs,scorelist,frontnine,backnine = self.initialise()
        hcap = self.getcoursehandicap()
        for score in scorelist:
            sc=0
            strokes = self.getstrokes(hcap,score)
            if score.score > 0:
                sc = score.score -strokes
            else:
                sc = 0
            scrs,frontnine,backnine = self.scrdisp(scrs,score,sc,frontnine,backnine)
        scrs = self.getnines(scrs,frontnine,backnine)
        return scrs

    def getnettstableford(self):
        scrs,scorelist,frontnine,backnine = self.initialise()
        hcap = self.getcoursehandicap()
        for score in scorelist:
            strokes = self.getstrokes(hcap,score)
            sc = score.score - strokes
            points = self.stablefordscoring(sc,score.hole.par)
            scrs,frontnine,backnine = self.scrdisp(scrs,score,points,frontnine,backnine)
        scrs = self.getnines(scrs,frontnine,backnine)
        return scrs

    def get24stableford(self):
        hcap = self.getcoursehandicap()
        if hcap > 24:
            hcap = 24
        scrs,scorelist,frontnine,backnine = self.initialise()
        for score in scorelist:
            strokes = self.getstrokes(hcap,score)
            sc = score.score - strokes
            points = self.stablefordscoring(sc,score.hole.par)
            scrs,frontnine,backnine = self.scrdisp(scrs,score,points,frontnine,backnine)
        scrs = self.getnines(scrs,frontnine,backnine)
        return scrs

    def getnettbogey(self):
        scrs,scorelist,frontnine,backnine = self.initialise()
        hcap = self.getcoursehandicap()
        for score in scorelist:
            strokes = self.getstrokes(hcap,score)
            sc = score.score - strokes
            points = self.bogeyscoring(sc,score.hole.par)
            scrs,frontnine,backnine = self.scrdisp(scrs,score,points,frontnine,backnine)
        scrs = self.getnines(scrs,frontnine,backnine)
        return scrs
        
    def getnett24bogey(self):
        hcap = self.getcoursehandicap()
        if hcap > 24:
            hcap = 24
        scrs,scorelist,frontnine,backnine = self.initialise()
        for score in scorelist:
            strokes = self.getstrokes(hcap,score)
            sc = score.score - strokes
            points = self.bogeyscoring(sc,score.hole.par)
            scrs,frontnine,backnine = self.scrdisp(scrs,score,points,frontnine,backnine)
        scrs = self.getnines(scrs,frontnine,backnine)
        return scrs

    def getnettmodbogey(self):
        hcap = self.getcoursehandicap()
        scrs,scorelist,frontnine,backnine = self.initialise()
        for score in scorelist:
            strokes = self.getstrokes(hcap,score)
            sc = score.score - strokes
            points = self.modbogeyscoring(sc,score.hole.par)
            scrs,frontnine,backnine = self.scrdisp(scrs,score,points,frontnine,backnine)
        scrs = self.getnines(scrs,frontnine,backnine)
        return scrs

    def velappan(self):
        hcap = self.getcoursehandicap()
        if hcap > 24:
            hcap = 24
        scrs,scorelist,frontnine,backnine = self.initialise()
        for score in scorelist:
            strokes = self.getstrokes(hcap,score)
            sc = score.score - strokes
            points = self.modbogeyscoring(sc,score.hole.par)
            scrs,frontnine,backnine = self.scrdisp(scrs,score,points,frontnine,backnine)
        scrs = self.getnines(scrs,frontnine,backnine)
        return scrs

    def __unicode__(self):
        return u"%s: %s" %(self.player,self.tournament)
		
class Trophyentry(models.Model):
	"""where trophy has limited number of participants like seniors"""
	matchentry = models.ForeignKey(Matchentry,verbose_name=_("Match entry"),
					related_name=_("mentries"))
	trophy = models.ForeignKey(Trophy,verbose_name=_("Trophy"),
					related_name=_("trophies"))
				   
	def __unicode__(self):
		return u"%s: %s" %(self.player,self.tournament)


class Score(models.Model):
    matchentry = models.ForeignKey(Matchentry,verbose_name=_("Match entry"),
                    related_name=_("matchentries"))
    hole = models.ForeignKey(Hole,verbose_name=_("Hole"))
    score = models.IntegerField(_("Score"),blank=True,null=True,default=0)

    class Meta:
        unique_together = ("matchentry", "hole")


    def __unicode__(self):
        return u"%s: score %s" %(self.matchentry,self.score)

class Member(models.Model):
    player = models.ForeignKey(Player,verbose_name=_("Member"),unique=True)
    
    def has_scores(self):
        return self.scoringrecord_set.all().count() >0
    def tscores(self):
        return self.scoringrecord_set.filter(scoretype='T').count() >0
    def membsr(self):
        sr = self.player.tee.sloperating
        return sr
        
    class Meta:
        ordering = ['player']
    def __unicode__(self):
        return u"%s" %(self.player)

class Practiceround(models.Model):
    rounddate = models.DateField(_("Date"))
    member = models.ForeignKey(Member,verbose_name=_("Member"))
    tee = models.ForeignKey(Tee,verbose_name=_("Tee"))
    marker = models.CharField(_("Marker"),max_length=150)
    scoretype = models.CharField(_("Score type"),max_length=2,choices=SCORETYPES)
    accepted = models.BooleanField(_("Accepted"),default=False)
    class Meta:
        unique_together = ("rounddate", "member")
    def getcoursehandicap(self):
        """the formula is: handicapindex*sloperating/113 and rounded"""
        try:
            handicap = self.member.currenthandicap_set.all()[0].handicap
        except:
            handicap = 36.4
        srating = self.tee.sloperating
        chandicap = int(round((handicap*srating)/113))
        return chandicap


    def getscores(self):
        scorelist = self.pscore_set.all()
        frontnine = 0
        backnine = 0
        scrs = initialscores()
        for score in scorelist:
            if score.hole.number <= 9:
                frontnine += score.score
                scrs[score.hole.number-1]=score.score
            else:
                backnine += score.score
                scrs[score.hole.number]=score.score
        tot = frontnine+backnine
        scrs[9]=frontnine
        scrs[19] = backnine
        scrs[20]=tot
        return scrs

    def getescscores(self):
        scorelist = self.pscore_set.all()
        frontnine = 0
        backnine = 0
        hcp = self.getcoursehandicap()
        scrs = initialscores()
        for score in scorelist:
            sc = score.score
            if sc == 0:
                if hcp >= score.hole.strokeindex + 18:
                    sc = score.hole.par + 2
                elif hcp >= score.hole.strokeindex:
                    sc = score.hole.par + 1
                else:
                    sc = score.hole.par
            if hcp >= 40:
                if sc > 10:
                    sc = 10
            elif hcp >= 30:
                if sc > 9:
                    sc = 9
            elif hcp >= 20:
                if sc > 8:
                    sc = 8
            elif hcp >= 10:
                if sc > 7:
                    sc = 7
            else:
                if sc > score.hole.par+2:
                    sc = score.hole.par + 2
            if score.hole.number <= 9:
                frontnine += sc
                scrs[score.hole.number-1]=sc
            else:
                backnine += sc
                scrs[score.hole.number]=sc
        tot = frontnine+backnine
        scrs[9]=frontnine
        scrs[19] = backnine
        scrs[20]=tot
        return scrs

    def getesctotal(self):
        scorelist = self.pscore_set.all()
        frontnine = 0
        backnine = 0
        hcp = self.getcoursehandicap()
        for score in scorelist:
            sc = score.score
            if sc == 0:
                if hcp >= score.hole.strokeindex + 18:
                    sc = score.hole.par + 2
                elif hcp >= score.hole.strokeindex:
                    sc = score.hole.par + 1
                else:
                    sc = score.hole.par
            if hcp >= 40:
                if sc > 10:
                    sc = 10
            elif hcp >= 30:
                if sc > 9:
                    sc = 9
            elif hcp >= 20:
                if sc > 8:
                    sc = 8
            elif hcp >= 10:
                if sc > 7:
                    sc = 7
            else:
                if sc > score.hole.par+2:
                    sc = score.hole.par + 2
            if score.hole.number <= 9:
                frontnine += sc
            else:
                backnine += sc
        tot = frontnine+backnine
        return tot

    def __unicode__(self):
        return u"%s: date %s" %(self.member,self.rounddate)

class Pscore(models.Model):
    practiceround = models.ForeignKey(Practiceround,verbose_name=_("Practice round"))
    hole = models.ForeignKey(Hole,verbose_name=_("Hole"))
    score = models.IntegerField(_("Score"),blank=True,null=True,default=0)

    class Meta:
        unique_together = ("practiceround", "hole")



    def __unicode__(self):
        return u"%s: score %s" %(self.practiceround,self.score)

class Scoringrecord(models.Model):
    scoredate = models.DateField(_("Date"))
    member = models.ForeignKey(Member,verbose_name=_("Member"))
    tee = models.ForeignKey(Tee,verbose_name=_("Tee"))
    score = models.IntegerField(_("Score"))
    scoretype = models.CharField(_("Score type"),max_length=2,choices=SCORETYPES)
    sloperating = models.IntegerField(_("Slope rating"))
    courserating = models.DecimalField(_("Course rating"),max_digits=3,decimal_places=1)
    
    class Meta:
        unique_together = ("member", "scoredate")

    def __unicode__(self):
        return u"%s: score %s %s" %(self.member,self.score,self.scoredate)

class Teamtrophy(models.Model):
    name = models.CharField(_("Team Trophy"),max_length=150,unique=True)
    tournament = models.ForeignKey(Tournament,verbose_name=_("Tournament"))
    handlimit = models.PositiveIntegerField(_("Max Handicap"))
    best = models.PositiveIntegerField(_("No of best scores"))
    format = models.CharField(_("Format"),max_length=2,choices=MATCHTYPES)
    def hdcmp(self,x,y):
        z = y['total'] - x['total']
        return z

    def rankinglist(self):
        rlist = []
        for teem in self.team_set.all():
            rlist.append(teem.getscores())
        rlist.sort(cmp=self.hdcmp)
        return rlist
    def __unicode__(self):
        return u"%s" %(self.name)

class Team(models.Model):
    """format is currently short-circuited to stableford max 24 strokes"""
    name = models.CharField(_("Team Name"),max_length=150,unique=True)
    members = models.ManyToManyField(Matchentry,verbose_name=_("Matchentry"))
    teamtrophy = models.ForeignKey(Teamtrophy,verbose_name=_("Trophy"))

    def hdcmp(self,x,y):
        z = y[1][20] - x[1][20]
        return z

    def getscores(self):
        scores = []
        for entry in self.members.all():
            scores.append((entry,entry.get24stableford()))
        scores.sort(cmp = self.hdcmp)
        scores = scores[:self.teamtrophy.best]
        tot = 0
        for score in scores:
            tot += score[1][20]
        return {'scores':scores,'total':tot,'name':self.name}

    def __unicode__(self):
        return u"%s %s" %(self.name,self.teamtrophy)
        
class Partner(models.Model):
    """format is currently short-circuited bestball bogey"""
    member1 = models.ForeignKey(Matchentry,verbose_name=_("Partner 1"),related_name='p1')
    member2 = models.ForeignKey(Matchentry,verbose_name=_("Partner 2"),related_name='p2')
    tournament = models.ForeignKey(Tournament,verbose_name=_("Tournament"))

    def getnettscramble(self):
        hcap1 = int(self.member1.getcoursehandicap())

        hcap2 = int(self.member2.getcoursehandicap())

        hcap = int(round((hcap1+hcap2*1.0)*50/100))
        scorelist = self.member1.matchentries.all()
        frontnine = 0
        backnine = 0
        scrs=initialscores()
        for score in scorelist:
            if score.score == 0:
                scrs = ['DQ']
                continue
            strokes = 0
            points = 0
            if hcap >= score.hole.strokeindex:
                strokes = 1
            if hcap >= score.hole.strokeindex+18:
                strokes += 1
            points = score.score - strokes
            if score.hole.number <= 9:
                frontnine += points
                scrs[score.hole.number-1]=points
            else:
                backnine += points
                scrs[score.hole.number]=points
        tot = frontnine+backnine
        scrs[9]=frontnine
        scrs[19] = backnine
        scrs[20]=tot
        return scrs

    def getgrossscramble(self):
        return self.member1.getgrossmr()
    def getscores(self):
        scores = initialscores()
        s1 = self.member1.getnettbogey()
        s2 = self.member2.getnettbogey()
        frontnine = 0
        backnine = 0
        for x in range(9):
            y = max(s1[x],s2[x])
            scores[x] = y
            frontnine += y
        for x in range(10,19):
            y = max(s1[x],s2[x])
            scores[x] = y
            backnine += y
        scores[9] = frontnine
        scores[19] = backnine
        scores[20] = backnine+frontnine
        return scores
    def getgrossscores(self):
        scores = initialscores()
        s1 = self.member1.getgrossbogey()
        s2 = self.member2.getgrossbogey()
        frontnine = 0
        backnine = 0
        for x in range(9):
            y = max(s1[x],s2[x])
            scores[x] = y
            frontnine += y
        for x in range(10,19):
            y = max(s1[x],s2[x])
            scores[x] = y
            backnine += y
        scores[9] = frontnine
        scores[19] = backnine
        scores[20] = backnine+frontnine
        return scores
        
    def getscoresmr(self):
        scores = initialscores()
        s1 = self.member1.getnettmrndq()
        s2 = self.member2.getnettmrndq()
        frontnine = 0
        backnine = 0
        for x in range(19):
            if s1[x] == 0 and s2[x] == 0:
                scores = ['dq']
                return scores        
        for x in range(9):
            if s1[x] == 0:
                y = s2[x]
            elif s2[x] == 0:
                y = s1[x]
            else:
                y = min(s1[x],s2[x])
            scores[x] = y
            frontnine += y
        for x in range(10,19):
            if s1[x] == 0:
                y = s2[x]
            elif s2[x] == 0:
                y = s1[x]
            else:
                y = min(s1[x],s2[x])
            scores[x] = y
            backnine += y
        scores[9] = frontnine
        scores[19] = backnine
        scores[20] = backnine+frontnine
        return scores
    def getgrossscoresmr(self):
        scores = initialscores()
        s1 = self.member1.getgrossmrndq()
        s2 = self.member2.getgrossmrndq()
        frontnine = 0
        backnine = 0
        for x in range(19):
            if s1[x] == 0 and s2[x] == 0:
                scores = ['dq']
                print scores
                return scores
        for x in range(9):
            if s1[x] == 0:
                y = s2[x]
            elif s2[x] == 0:
                y = s1[x]
            else:
                y = min(s1[x],s2[x])
            scores[x] = y
            frontnine += y
        for x in range(10,19):
            if s1[x] == 0:
                y = s2[x]
            elif s2[x] == 0:
                y = s1[x]
            else:
                y = min(s1[x],s2[x])
            scores[x] = y
            backnine += y
        scores[9] = frontnine
        scores[19] = backnine
        scores[20] = backnine+frontnine
        return scores

    def getcombinedstableford(self):
        scores = initialscores()
        s1 = self.member1.getnettstableford()
        s2 = self.member2.getnettstableford()
        frontnine = 0
        backnine = 0
        for x in range(9):
            y = s1[x]+s2[x]
            scores[x] = y
            frontnine += y
        for x in range(10,19):
            y = s1[x]+s2[x]
            scores[x] = y
            backnine += y
        scores[9] = frontnine
        scores[19] = backnine
        scores[20] = backnine+frontnine
        return scores
    def getgrosscombinedstableford(self):
        scores = initialscores()
        s1 = self.member1.getgrossstableford()
        s2 = self.member2.getgrossstableford()
        frontnine = 0
        backnine = 0
        for x in range(9):
            y = s1[x]+s2[x]
            scores[x] = y
            frontnine += y
        for x in range(10,19):
            y = s1[x]+s2[x]
            scores[x] = y
            backnine += y
        scores[9] = frontnine
        scores[19] = backnine
        scores[20] = backnine+frontnine
        return scores


    def __unicode__(self):
        return u"%s & %s" %(self.member1.player,self.member2.player)
        
class Partner3(models.Model):
    """format is currently short-circuited best 2 balls stableford"""
    member1 = models.ForeignKey(Matchentry,verbose_name=_("Partner3 1"),related_name='p31')
    member2 = models.ForeignKey(Matchentry,verbose_name=_("Partner3 2"),related_name='p32')
    member3 = models.ForeignKey(Matchentry,verbose_name=_("Partner3 3"),related_name='p33')
    tournament = models.ForeignKey(Tournament,verbose_name=_("Tournament"))


    def getscores(self):
        scores = initialscores()
        s1 = self.member1.get24stableford()
        s2 = self.member2.get24stableford()
        s3 = self.member3.get24stableford()
        frontnine = 0
        backnine = 0
        for x in range(9):
            lst = [s1[x],s2[x],s3[x]]
            lst.sort(reverse=True)
            y = lst[0]+lst[1]
            scores[x] = y
            frontnine += y
        for x in range(10,19):
            lst = [s1[x],s2[x],s3[x]]
            lst.sort(reverse=True)
            y = lst[0]+lst[1]
            scores[x] = y
            backnine += y
        scores[9] = frontnine
        scores[19] = backnine
        scores[20] = backnine+frontnine
        return scores
    def getgrossscores(self):
        scores = initialscores()
        s1 = self.member1.getgrossstableford()
        s2 = self.member2.getgrossstableford()
        s3 = self.member3.getgrossstableford()
        frontnine = 0
        backnine = 0
        for x in range(9):
            lst = [s1[x],s2[x],s3[x]]
            lst.sort(reverse=True)
            y = lst[0]+lst[1]
            scores[x] = y
            frontnine += y
        for x in range(10,19):
            lst = [s1[x],s2[x],s3[x]]
            lst.sort(reverse=True)
            y = lst[0]+lst[1]
            scores[x] = y
            backnine += y
        scores[9] = frontnine
        scores[19] = backnine
        scores[20] = backnine+frontnine
        return scores

    def __unicode__(self):
        return u"%s & %s & %s" %(self.member1.player,self.member2.player,self.member3.player)
        
class currenthandicap(models.Model):
    member = models.ForeignKey(Member, verbose_name="Member",unique=True)
    handicap = models.DecimalField(_("Handicap index"),max_digits=3, decimal_places=1)
    handicaptype = models.CharField(_("Handicap type"),max_length=2,choices=HANDICAPTYPES, default=_("N"))
    def __unicode__(self):
        return u"%s: %s %s" %(self.member.player,self.handicap,self.handicaptype)

