from django.db import models
from django.utils.translation import gettext as _
from django.db.models import Avg, Max, Min, Count
from django.core.exceptions import ValidationError

import datetime




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
            ('RD','Red'),
            ('BL','Black'),
            ('WT','White'),
            ('BU','Blue'),
            ('YL','Yellow'),
            )

MATCHTYPES = (
            ('MR','Medal Round'),
            ('GM','Gross Medal Round'),
            ('ST','Stableford'),
            ('AG','Against Bogey'),
            ('GS','Gross Stableford'),
            ('GG','Gross Bogey'),
            ('MS','Modified Stable'),
            )

class Course(models.Model):
    """
        Basic data for a course
        """
    name = models.CharField(_("Course name"),max_length=100,unique=True)
    shortname = models.CharField(_("Short name"),max_length=100)
    description = models.TextField(_("Description"),blank=True,null=True)

    def __unicode__(self):
        return u"%s: %s" %(self.shortname,self.name)

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
        return u"%s: %s" %(self.course,self.get_colour_display())

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
    def __unicode__(self):
        return u"%s %s: rounds: %s closed:%s" %(self.course,self.startdate,self.rounds,self.closed)

class Trophy(models.Model):
    """Date, name, format, days, handicap"""
    tournament = models.ForeignKey(Tournament,verbose_name=_("Tournament"))
    name = models.CharField(_("Trophy Name"),max_length=100)
    format = models.CharField(_("Format"),max_length=2,choices=MATCHTYPES)
    handicapmax = models.IntegerField(_("Handicap max"))
    handicapmin = models.IntegerField(_("Handicap min"))

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
    class Meta:
        unique_together = ('first_name','last_name')
    def latesthandicap(self):
        try:
            latestdate = self.handicap_set.all().aggregate(Max('valto'))
            return Handicap.objects.get(player=self,valto=latestdate['valto__max'])
        except:
            return 0


    def __unicode__(self):
        return u"%s %s" %(self.first_name, self.last_name)

class Handicap(models.Model):
    """just name and handicap index - how to handle validity?"""
    player = models.ForeignKey(Player,verbose_name=_("Player"))
    handicap = models.DecimalField(_("Handicap index"),max_digits=3, decimal_places=1)
    valfrom = models.DateField(_("Valid from"))
    valto = models.DateField(_("Valid to"))
    class Meta:
        unique_together = ('player','valto')


    def __unicode__(self):
        return u"%s %s %s %s" %(self.player,self.handicap,self.valfrom,self.valto)


class Draw(models.Model):
    """how many tee-off holes, size of group, interval, starttime
        one draw per day. Have to cater for ranked draw and VIPs"""
    tournament = models.ForeignKey(Tournament,verbose_name=_("Tournament Name"))
    day = models.IntegerField(_("Tournament Day Number"),default=1)
    groupsize = models.IntegerField(_("Group Size"))
    interval = models.IntegerField(_("Interval between groups"))

    class Meta:
        unique_together = ("tournament", "day")

    def __unicode__(self):
        return u"%s: Day %d" %(self.tournament,self.day)

class Teeoff(models.Model):
    draw = models.ForeignKey(Draw,verbose_name=_("Draw"))
    hole = models.ForeignKey(Hole,verbose_name=_("Starting hole"))
    starttime = models.TimeField(_("Starting time"))
    nogroups = models.IntegerField(_("no of groups"))
    priority = models.IntegerField(_("Priority"))
    class Meta:
        unique_together = ("draw", "hole")
        ordering = ['priority']

    def __unicode__(self):
        return u"%s: hole %s" %(self.draw,self.hole)

class Matchentry(models.Model):
    tournament = models.ForeignKey(Tournament,verbose_name=_("Tournament"))
    player = models.ForeignKey(Player,verbose_name=_("Player"))
    tee = models.ForeignKey(Tee,verbose_name=_("Tee"))
    class Meta:
        unique_together = ("tournament", "player")

    def getcoursehandicap(self):
        """the formula is: handicapindex*sloperating/113 and rounded"""
        handicaps = self.player.handicap_set.all()
        hindex = 0
        for handicap in handicaps:
            if handicap.valfrom <= self.tournament.startdate and handicap.valto >= self.tournament.startdate:
                hindex = handicap.handicap
        srating = self.tee.sloperating
        chandicap = int(round((hindex*srating)/113))
        return chandicap

    def getcurrenthandicap(self):
            handicaps = self.player.handicap_set.all()
            hindex = 0
            for handicap in handicaps:
                if handicap.valfrom <= self.tournament.startdate and handicap.valto >= self.tournament.startdate:
                    hindex = handicap.handicap
            return hindex

    def getscores(self):
        scorelist = self.matchentries.all()
        frontnine = 0
        backnine = 0
        scrs = []
        for score in scorelist:
            if score.hole.number <= 9:
                frontnine += score.score
            else:
                backnine += score.score
            scrs.append(score.score)
        tot = frontnine+backnine
        scrs.insert(9,frontnine)
        scrs.append(backnine)
        scrs.append(tot)
        return scrs
    def getgrossmr(self):
        scorelist = self.matchentries.all()
        frontnine = 0
        backnine = 0
        scrs = []
        for score in scorelist:
            if score.score == 0:
                scrs = ['DQ']
                continue
            if score.hole.number <= 9:
                frontnine += score.score
            else:
                backnine += score.score
            scrs.append(score.score)
        tot = frontnine+backnine
        scrs.insert(9,frontnine)
        scrs.append(backnine)
        scrs.append(tot)
        return scrs

    def getgrossstableford(self):
        scorelist = self.matchentries.all()
        frontnine = 0
        backnine = 0
        scrs = []
        for score in scorelist:
            points = 0
            if score.score == 0:
                points = 0
            else:
                if score.score == score.hole.par:
                    points = 2
                if score.score == score.hole.par+1:
                    points = 1
                if score.score == score.hole.par -1:
                    points = 3
                if score.score == score.hole.par -2:
                    points = 4
                if score.score == score.hole.par -3:
                    points = 4
            if score.hole.number <= 9:
                frontnine += points
            else:
                backnine += points
            scrs.append(points)
        tot = frontnine+backnine
        scrs.insert(9,frontnine)
        scrs.append(backnine)
        scrs.append(tot)
        return scrs

    def getgrossbogey(self):
        scorelist = self.matchentries.all()
        frontnine = 0
        backnine = 0
        scrs = []
        for score in scorelist:
            points = 0
            if score.score == 0:
                points = -1
            else:
                if score.score == score.hole.par:
                    points = 0
                if score.score > score.hole.par:
                    points = -1
                if score.score < score.hole.par:
                    points = 1

            if score.hole.number <= 9:
                frontnine += points
            else:
                backnine += points
            scrs.append(points)
        tot = frontnine+backnine
        scrs.insert(9,frontnine)
        scrs.append(backnine)
        scrs.append(tot)
        return scrs

    def getnettmr(self):
        scorelist = self.matchentries.all()
        hcap = self.getcoursehandicap()
        frontnine = 0
        backnine = 0
        scrs = []
        for score in scorelist:
            if score.score == 0:
                scrs = ['DQ']
                continue
            strokes = 0
            if hcap >= score.hole.strokeindex:
                strokes = 1
            if hcap >= score.hole.strokeindex+18:
                strokes += 1
            if score.hole.number <= 9:
                frontnine += score.score-strokes
            else:
                backnine += score.score-strokes
            scrs.append(score.score-strokes)
        tot = frontnine+backnine
        scrs.insert(9,frontnine)
        scrs.append(backnine)
        scrs.append(tot)
        return scrs

    def getnettstableford(self):
        scorelist = self.matchentries.all()
        hcap = self.getcoursehandicap()
        frontnine = 0
        backnine = 0
        scrs = []
        for score in scorelist:
            points = 0
            strokes = 0
            if hcap >= score.hole.strokeindex:
                strokes = 1
            if hcap >= score.hole.strokeindex+18:
                strokes += 1
            if score.score == 0:
                points = 0
            else:
                if score.score - strokes == score.hole.par:
                    points = 2
                if score.score - strokes == score.hole.par+1:
                    points = 1
                if score.score - strokes == score.hole.par -1:
                    points = 3
                if score.score - strokes == score.hole.par -2:
                    points = 4
                if score.score -strokes == score.hole.par -3:
                    points = 4
                if score.score -strokes == score.hole.par -4:
                    points = 5
                if score.score -strokes == score.hole.par -5:
                    points = 6
            if score.hole.number <= 9:
                frontnine += points
            else:
                backnine += points
            scrs.append(points)
        tot = frontnine+backnine
        scrs.insert(9,frontnine)
        scrs.append(backnine)
        scrs.append(tot)
        return scrs

    def getnettbogey(self):
        scorelist = self.matchentries.all()
        hcap = self.getcoursehandicap()
        frontnine = 0
        backnine = 0
        scrs = []
        for score in scorelist:
            points = 0
            strokes = 0
            if hcap >= score.hole.strokeindex:
                strokes = 1
            if hcap >= score.hole.strokeindex+18:
                strokes += 1
            if score.score == 0:
                points = -1
            else:
                if score.score - strokes == score.hole.par:
                    points = 0
                if score.score - strokes < score.hole.par:
                    points = 1
                if score.score - strokes > score.hole.par:
                    points = -1

            if score.hole.number <= 9:
                frontnine += points
            else:
                backnine += points
            scrs.append(points)
        tot = frontnine+backnine
        scrs.insert(9,frontnine)
        scrs.append(backnine)
        scrs.append(tot)
        return scrs

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

