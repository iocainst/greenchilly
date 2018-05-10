from django.db import models
from django.utils.translation import gettext as _
from django.db.models import Avg, Max, Min, Count
from django.core.exceptions import ValidationError

import datetime

def initscoredict(player):
    """returns a dict of the players scores"""
    scd = {}
    scd['player'] = player
    scd['scores'] = {}
    scd['front'] = 0
    scd['back'] = 0
    scd['total'] = 0
    return scd


def getnines(scd):
    for hl, sc in scd['scores'].items():
        if hl <= 9:
            scd['front'] += sc['sc']
        else:
            scd['back'] += sc['sc']
    scd['total'] = scd['front'] + scd['back']
    return scd


def getcolour(score, par):
    """par green, bogey white, birdie blue, eagle yellow, double grey, 3 and more red"""
    if score == 0:
        return "#f34639"
    df = score - par
    if df == -2:
        clr = "#08d0f4"
    elif df == -1:
        clr = "#0fbff9"
    elif df == 0:
        clr = "#08f47c"
    elif df == 1:
        clr = "#fbba0a"
    elif df == 2:
        clr = "#f84d0a"
    elif df < -2 and score != 0:
        clr = "white"
    else:
        clr = "red"
    return clr


def getstrokes(hcp, score):
    """given a score and handicap gets strokes"""
    if score.score == 0:
        strokes = 0
        return strokes
    if hcp >= score.hole.strokeindex + 18:
        strokes = 2
    elif hcp >= score.hole.strokeindex:
        strokes = 1
    elif hcp <= score.hole.strokeindex - 19:
        strokes = -1
        #negative handicap so strokes minus
    else:
        strokes = 0
    return strokes

# Create your models here.



class Tempreg(models.Model):
    username = models.CharField(_("User Name"), max_length=30, unique=True)
    email = models.EmailField(_("Email Address"), unique=True)
    date = models.DateField(_("Date"), default=datetime.datetime.now, editable=False)
    code = models.CharField(_("Code"), max_length=100, blank=True, null=True,
        editable=False, default='123')

    def __unicode__(self):
        return _(u"%(username)s %(email)s")\
        % {'username': self.username, 'email': self.email}

TEECOLOURS = (
    ('RD', _('Red')),
    ('BL', _('Black')),
    ('WT', _('White')),
    ('BU', _('Blue')),
    ('YL', _('Yellow')),
    )

PARTNERTYPES = (
    ('GR', _('Gross bestball bogey')),
    ('NT', _('Nett bestball bogey')),
    ('MR', _('Gross bestball medal round')),
    ('MT', _('Nett bestball medal round')),
    ('SC', _('Nett scramble')),
    ('SG', _('Gross scramble')),
    ('CS', _('Combined stableford')),
    ('GC', _('Gross combined stableford')),
    ('NS', _('Nett Switch')),
    ('GS', _('Gross Switch')),
    ('NM', _('Nett Multiply')),
    ('GM', _('Gross Multiply')),
    ('SX', _('Nett scramble stableford - 50%')),
    ('SY', _('Nett scramble stableford - 40%')),
    ('SZ', _('Nett scramble stableford - 30%')),
    ('XS', _('Gross scramble stableford')),
    )

PARTNER3TYPES = (
    ('G3', _('Gross')),
    ('N3', _('Nett')),

    )
TEAMTYPES = (
    ('GG', _('GKD Gross')),
    ('GN', _('GKD Nett')),
    ('CG', _('Combined stableford Gross')),
    ('CN', _('Combined stableford Nett')),
    ('MG', _('Combined medal round Gross')),
    ('MN', _('Combined medal round Nett')),

    )
JUNIORCATS = (
    ('A', 'A'),
    ('B', 'B'),
    ('C', 'C'),
    ('D', 'D'),
    ('E', 'A&B girls'),
    ('F', 'C girls'),

    )

MATCHTYPES = (
    ('MR', 'Medal Round'),
    ('GM', 'Gross Medal Round'),
    ('ST', 'Stableford'),
    ('AD', 'Addleford'),
    ('AG', 'Against Bogey'),
    ('GS', 'Gross Stableford'),
    ('GG', 'Gross Bogey'),
    ('MB', 'Modified Bogey'),
    ('GB', 'Gross Modified Bogey'),
    ('VL', 'Dr Velappan'),
    ('A', 'A'),
    ('B', 'B'),
    ('C', 'C'),
    ('D', 'D'),
    ('AB', 'A & B'),
    ('BG', 'A & B girls'),
    ('CG', 'C girls'),
    )

HANDICAPTYPES = (
    ('L', 'Local handicap'),
    ('M', 'Modified by the Committee'),
    ('N', 'Nine hole'),
    ('NL', 'Nine hole local'),
    ('R', 'Automatically reduced'),
    ('SL', 'Short Course'),
    ('WD', 'Withdrawn'),
    )

SCORETYPES = (
    ('N', 'Normal'),
    ('A', 'Away'),
    ('AI', 'Away Internet'),
    ('P', 'Penalty'),
    ('T', 'Tournament'),
    ('TI', 'Tournament Internet'),
    ('C', 'Combined nines'),
    )
TOURNAMENT_KINDS = (
    ('IN', 'Individual'),
    ('PT', 'Partnership'),
    ('TM', 'Team'),
    ('P3', '3 ball Partnership'),
    )


class Course(models.Model):
    """
        Basic data for a course
        """
    name = models.CharField(_("Course name"), max_length=100, unique=True)
    shortname = models.CharField(_("Short name"), max_length=100)
    description = models.TextField(_("Description"), blank=True, null=True)
    usga = models.BooleanField(_("usga handicap index"), default=False)

    def __unicode__(self):
        return u"%s: %s" % (self.shortname, self.name)


class Homeclub(models.Model):
    """This model is designed to have softcoded details that are now hardcoded"""
    course = models.OneToOneField(Course, verbose_name=_("Course"))

    def __unicode__(self):
        return u"%s" % self.course.shortname


class Tee(models.Model):
    """various tee types - championship, ladies, gents etc
        """
    course = models.ForeignKey(Course, verbose_name=_("Course"))
    colour = models.CharField(_("Tee colour"), max_length=2, choices=TEECOLOURS)
    description = models.CharField(_("Description"), max_length=100)
    sloperating = models.IntegerField(_("Slope Rating"))
    courserating = models.DecimalField(max_digits=4, decimal_places=1,
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
        ordering = ['id']

    def __unicode__(self):
        return u"%s: %s" % (self.course.shortname, self.get_colour_display())


class Hole(models.Model):
    """hole, tee colour, yardage, par and stroke index"""
    tee = models.ForeignKey(Tee, verbose_name=_("Tee"))
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
        return u"%s: par=%d, strokeindex=%d" % (self.tee, self.par, self.strokeindex)


class Tournament(models.Model):
    """Date, name, format, days, handicap"""
    startdate = models.DateField(_("Start Date"), unique=True)
    rounds = models.IntegerField(_("Number of rounds"))
    course = models.ForeignKey(Course, verbose_name=_("Course"))
    closed = models.BooleanField(_("Results Declared"), default=False)
    kind = models.CharField(_("Type of tournament"), max_length=2, choices=TOURNAMENT_KINDS)


    def getfile(self):
        return "tournament%s" % (str(self.startdate))

    def ispartner(self):
        return self.partnershiptrophy_set.all().count() > 0

    def isteam(self):
        return self.teamtrophy_set.all().count() > 0

    def hasrounds(self):
        for rnd in self.round_set.all():
            if rnd.num > 1:
                return True
        return False

    def __unicode__(self):
        return u"%s %s" % (self.course, self.startdate)


class Round(models.Model):
    """Date, name, format, days, handicap"""
    startdate = models.DateField(_("Start Date"))
    tournament = models.ForeignKey(Tournament, verbose_name="Tournament")
    num = models.IntegerField("Round number")

    class Meta:
        unique_together = ("tournament", "num")
        ordering = ['num']

    def __unicode__(self):
        return u"%s %s %s" % (self.num, self.startdate, self.tournament)


class Trophy(models.Model):
    """Date, name, format, days, handicap"""
    tournament = models.ForeignKey(Tournament, verbose_name=_("Tournament"))
    name = models.CharField(_("Trophy Name"), max_length=100)
    format = models.CharField(_("Format"), max_length=2, choices=MATCHTYPES)
    handicapmax = models.IntegerField(_("Handicap max"))
    handicapmin = models.IntegerField(_("Handicap min"))

    def getfile(self):
        return "trophy%s%s" % (str(self.tournament.startdate), str(self.name))

    class Meta:
        unique_together = ("name", "tournament")

    def multisort(self, x, y):
        return x[1]['grandtotal'] - y[1]['grandtotal']

    def getmultiround(self):
        """this is supposed to get the results of a multiround tournament
            only medal round for now"""
        #get the players and put them in an dictionary
        lastround = 1
        entries = self.tournament.matchentry_set.all()
        scd = {}
        for ent in entries:
            if ent.round == 1:
                scd[ent.player] = {}
                #now get the  round results
        for ent in entries:
            if ent.player in scd.keys():
                if self.format == 'GM':
                    mr = ent.getgrossmr()
                if self.format == 'MR':
                    if self.handicapmax >= ent.getcoursehandicap() >= self.handicapmin:
                        mr = ent.getnettmr()
                    else:
                        mr = ['DQ']
                if mr != ['DQ']:
                    if mr['scores'] != {}:
                        if ent.round > lastround:
                            lastround = ent.round
                        scd[ent.player][ent.round] = {}
                        scd[ent.player][ent.round]['scores'] = mr['scores']
                        scd[ent.player][ent.round]['front'] = mr['front']
                        scd[ent.player][ent.round]['back'] = mr['back']
                        scd[ent.player][ent.round]['total'] = mr['total']
                    else:
                        scd.pop(ent.player)
                else:
                    scd.pop(ent.player)
        for k in scd.keys():
            scd[k]['grandtotal'] = 0
            for rn in range(1, lastround + 1):
                scd[k]['grandtotal'] += scd[k][rn]['total']
        results = []
        for k, v in scd.items():
            results.append((k, v))
        results.sort(cmp=self.multisort)
        return (lastround, results)


    def __unicode__(self):
        return u"%s: %s" % (self.name, self.tournament)


class Partnershiptrophy(models.Model):
    """Date, name, format, days, handicap"""
    tournament = models.ForeignKey(Tournament, verbose_name=_("Tournament"))
    name = models.CharField(_("Trophy Name"), max_length=100)
    format = models.CharField(_("Format"), max_length=2, choices=PARTNERTYPES)
    handicapmax = models.IntegerField(_("Handicap max"))
    handicapmin = models.IntegerField(_("Handicap min"))

    def getfile(self):
        return "trophy%s%s" % (str(self.tournament.startdate), str(self.name))

    class Meta:
        unique_together = ("name", "tournament")

    def __unicode__(self):
        return u"%s: %s" % (self.name, self.tournament)


class Partnership3trophy(models.Model):
    """Date, name, format, days, handicap"""
    tournament = models.ForeignKey(Tournament, verbose_name=_("Tournament"))
    name = models.CharField(_("Trophy Name"), max_length=100)
    format = models.CharField(_("Format"), max_length=2, choices=PARTNER3TYPES)
    handicapmax = models.IntegerField(_("Handicap max"))
    handicapmin = models.IntegerField(_("Handicap min"))

    def getfile(self):
        return "trophy%s%s" % (str(self.tournament.startdate), str(self.name))

    class Meta:
        unique_together = ("name", "tournament")

    def __unicode__(self):
        return u"%s: %s" % (self.name, self.tournament)


class Player(models.Model):
    """just name, home club and tee"""
    first_name = models.CharField(_("First Name or initials"), max_length=100)
    last_name = models.CharField(_("Last Name"), max_length=100)
    homeclub = models.ForeignKey(Course, verbose_name=_("Home Course"))
    tee = models.ForeignKey(Tee, verbose_name=_("Tee"))
    photo = models.ImageField(_("Photo"), upload_to='photos/', blank=True, null=True)
    membno = models.CharField(_("Membership number"), max_length=20, blank=True, null=True)

    def clean(self):
        try:
            ln = Player.objects.get(last_name__iequal=self.last_name, first_name__iequal=self.first_name)
            if ln:
                raise ValidationError(_("This player exists"))
        except:
            self.first_name = self.first_name.lower()
            self.last_name = self.last_name.lower()


    class Meta:
        unique_together = ('first_name', 'last_name')
        ordering = ['last_name']

    def latesthandicap(self):
        try:
            latestdate = self.handicap_set.all().aggregate(Max('valto'))
            return Handicap.objects.get(player=self, valto=latestdate['valto__max'])
        except:
            return None

    def is_member(self):
        ret = False
        if self.member_set.all().count() > 0:
            ret = True
        return ret


    def __unicode__(self):
        return u"%s %s" % (self.last_name.capitalize(), self.first_name.capitalize())


class Handicap(models.Model):
    """just name and handicap index - how to handle validity?"""
    player = models.ForeignKey(Player, verbose_name=_("Player"))
    handicap = models.DecimalField(_("Handicap index"), max_digits=3, decimal_places=1)
    valfrom = models.DateField(_("Valid from"))
    valto = models.DateField(_("Valid to"))

    class Meta:
        unique_together = ('player', 'valto')

    def clean(self):
        if self.valfrom >= self.valto:
            raise ValidationError(_("from date should be less than to date"))


    def __unicode__(self):
        return u"%s %s %s %s" % (self.player, self.handicap, self.valfrom, self.valto)


class Draw(models.Model):
    """how many tee-off holes, size of group, interval, starttime
        one draw per day. Have to cater for ranked draw and VIPs"""
    tournament = models.ForeignKey(Tournament, verbose_name=_("Tournament Name"))
    day = models.IntegerField(_("Tournament Day Number"), default=1)
    groupsize = models.IntegerField(_("Group Size"))
    interval = models.IntegerField(_("Interval between groups"))
    done = models.BooleanField(_("Done"), default=False)
    drawlist = models.FileField(_("Draw file"), upload_to='draws/', blank=True, null=True)

    class Meta:
        unique_together = ("tournament", "day")

    def getfile(self):
        return "draw%s%s" % (str(self.tournament.startdate), str(self.day))

    def __unicode__(self):
        return u"%s: Day %d" % (self.tournament, self.day)


class Teeoff(models.Model):
    draw = models.ForeignKey(Draw, verbose_name=_("Draw"))
    hole = models.IntegerField(_("Starting hole"))
    starttime = models.TimeField(_("Starting time"))
    fourballs = models.IntegerField(_("No of fourballs"), blank=True, null=True)
    threeballs = models.IntegerField(_("No of threeballs"), blank=True, null=True)
    twoballs = models.IntegerField(_("No of twoballs"), blank=True, null=True)
    singles = models.IntegerField(_("No of singles"), blank=True, null=True)
    priority = models.IntegerField(_("Priority"))

    class Meta:
        unique_together = ("draw", "hole", "starttime")
        ordering = ['priority']

    def __unicode__(self):
        return u"%s: hole %s" % (self.draw, self.hole)


class Matchentry(models.Model):
    tournament = models.ForeignKey(Tournament, verbose_name=_("Tournament"))
    player = models.ForeignKey(Player, verbose_name=_("Player"))
    tee = models.ForeignKey(Tee, verbose_name=_("Tee"))
    category = models.CharField("category", max_length=1, choices=JUNIORCATS, blank=True, null=True)
    round = models.IntegerField("Round", default=1)

    class Meta:
        unique_together = ("tournament", "player", "round")
        ordering = ('player',)

    def getscores(self):
        scd = initscoredict(self.player)
        for score in self.matchentries.all():
            scd['scores'][score.hole.number] = {'sc': score.score, 'clr': ''}
        scd = getnines(scd)
        return scd

    def scored(self):
        scd = False
        sc = self.matchentries.all()
        for s in sc:
            if s.score > 0:
                scd = True
                return scd
        return scd

    def dqed(self):
        scd = False
        sc = self.matchentries.all()
        for s in sc:
            if s.score == 0:
                scd = True
                return scd
        return scd

    def getcoursehandicap(self):
        """the formula is: handicapindex*sloperating/113 and rounded"""
        hindex = 0
        if self.player.is_member():
            try:
                memb = self.player.member_set.all()[0]
                hindex = memb.currenthandicap_set.all()[0].handicap
            except:
                pass
        else:
            handicaps = self.player.handicap_set.all()
            if len(handicaps) == 0:
                pass
            else:
                for handicap in handicaps:
                    if handicap.valfrom <= self.tournament.startdate <= handicap.valto:
                        hindex = handicap.handicap

        srating = self.tee.sloperating
        chand = int(round(hindex * srating / 113))
        if chand > 30:
            chand = 30
        return chand

    def getcurrenthandicap(self):
        return self.getcoursehandicap()

    def getcurhandicap(self):
        """this is for calculating esc scores only"""
        try:
            handicap = self.member.currenthandicap_set.all()[0].handicap
        except:
            handicap = 36.4
        srating = self.tee.sloperating
        chandicap = int(round((handicap * srating) / 113))
        return chandicap

    def getescstrokes(self, hcp, score):
        """given a score and handicap gets strokes"""
        if hcp >= score.hole.strokeindex + 18:
            strokes = 2
        elif hcp >= score.hole.strokeindex:
            strokes = 1
        elif hcp <= score.hole.strokeindex - 19:
            strokes = -1
        else:
            strokes = 0
        return strokes

    def getesctotal(self):
        hcp = self.getcurhandicap()
        total = 0
        for score in self.matchentries.all():
            sc = score.score
            if sc == 0:
                sc = score.hole.par + self.getescstrokes(hcp, score)
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
                if sc > score.hole.par + 2:
                    sc = score.hole.par + 2
            total += sc
        return total

    def getcatmedal(self, cat):
        go = False
        if cat == 'AB':
            go = self.category == 'A' or self.category == 'B'
        elif cat == 'BG':
            go = self.category == 'E'
        elif cat == 'CG':
            go = self.category == 'F'
        else:
            go = self.category == cat
        if go:
            scd = initscoredict(self.player)
            for score in self.matchentries.all():
                if score.score == 0:
                    scd = ['DQ']
                    return scd
                sc = score.score
                clr = getcolour(score.score, score.hole.par)
                scd['scores'][score.hole.number] = {'sc': sc, 'clr': clr}
            scd = getnines(scd)
        return scd

    def getgrossmr(self):
        scd = initscoredict(self.player)
        for score in self.matchentries.all():
            if score.score == 0:
                scd = ['DQ']
                return scd
            sc = score.score
            clr = getcolour(score.score, score.hole.par)
            scd['scores'][score.hole.number] = {'sc': sc, 'clr': clr}
        scd = getnines(scd)
        return scd

    def getgrossmrwithround(self):
        """this gives round scores"""
        scd = self.getgrossmr()
        return {'scd': scd, 'round': self.round}

    def getgrossmrndq(self):
        scd = initscoredict(self.player)
        for score in self.matchentries.all():
            sc = score.score
            clr = getcolour(score.score, score.hole.par)
            scd['scores'][score.hole.number] = {'sc': sc, 'clr': clr}
        scd = getnines(scd)
        return scd


    def stablefordscoring(self, score, par):
        if score == 0 or score >= par + 2:
            points = 0
        else:
            points = par + 2 - score
        clr = getcolour(score, par)
        return {'sc': points, 'clr': clr}

    def bogeyscoring(self, score, par):
        if score == 0 or score > par:
            points = -1
        elif score < par:
            points = 1
        else:
            points = 0
        clr = getcolour(score, par)
        return {'sc': points, 'clr': clr}

    def modbogeyscoring(self, score, par):
        if score == 0 or score - par < -3:
            points = -3
        else:
            points = par - score
        clr = getcolour(score, par)
        return {'sc': points, 'clr': clr}

    def getgrossstableford(self):
        scd = initscoredict(self.player)
        for score in self.matchentries.all():
            points = self.stablefordscoring(score.score, score.hole.par)
            scd['scores'][score.hole.number] = points
        scd = getnines(scd)
        return scd

    def getgrossbogey(self):
        scd = initscoredict(self.player)
        for score in self.matchentries.all():
            points = self.bogeyscoring(score.score, score.hole.par)
            scd['scores'][score.hole.number] = points
        scd = getnines(scd)
        return scd

    def getgrossmodbogey(self):
        scd = initscoredict(self.player)
        for score in self.matchentries.all():
            points = self.modbogeyscoring(score.score, score.hole.par)
            scd['scores'][score.hole.number] = points
        scd = getnines(scd)
        return scd

    def getnettmr(self):
        scd = initscoredict(self.player)
        hcp = self.getcoursehandicap()
        for score in self.matchentries.all():
            if score.score == 0:
                scrs = ['DQ']
                return scrs
            strokes = getstrokes(hcp, score)
            sc = score.score - strokes
            clr = getcolour(sc, score.hole.par)
            scd['scores'][score.hole.number] = {'sc': sc, 'clr': clr}
        scd = getnines(scd)
        return scd

    def getnett24mr(self):
        scd = initscoredict(self.player)
        hcp = self.getcoursehandicap()
        if hcp > 24:
            hcp = 24
        for score in self.matchentries.all():
            if score.score == 0:
                scrs = ['DQ']
                return scrs
            strokes = getstrokes(hcp, score)
            sc = score.score - strokes
            clr = getcolour(sc, score.hole.par)
            scd['scores'][score.hole.number] = {'sc': sc, 'clr': clr}
        scd = getnines(scd)
        return scd

    def getnettmrwithround(self):
        """this gives round scores"""
        scd = self.getnettmr()
        return {'scd': scd, 'round': self.round}

    def getnettmrndq(self):
        scd = initscoredict(self.player)
        hcap = self.getcoursehandicap()
        for score in self.matchentries.all():
            sc = 0
            strokes = getstrokes(hcap, score)
            if score.score > 0:
                sc = score.score - strokes
            else:
                sc = 0
            clr = getcolour(sc, score.hole.par)
            scd['scores'][score.hole.number] = {'sc': sc, 'clr': clr}
        scd = getnines(scd)
        return scd

    def getnett24mrndq(self):
        scd = initscoredict(self.player)
        hcap = self.getcoursehandicap()
        if hcap > 24:
            hcap = 24
        for score in self.matchentries.all():
            sc = 0
            strokes = getstrokes(hcap, score)
            if score.score > 0:
                sc = score.score - strokes
            else:
                sc = 0
            clr = getcolour(sc, score.hole.par)
            scd['scores'][score.hole.number] = {'sc': sc, 'clr': clr}
        scd = getnines(scd)
        return scd

    def getnettstableford(self):
        scd = initscoredict(self.player)
        hcap = self.getcoursehandicap()
        for score in self.matchentries.all():
            strokes = getstrokes(hcap, score)
            sc = score.score - strokes
            points = self.stablefordscoring(sc, score.hole.par)
            scd['scores'][score.hole.number] = points
        scd = getnines(scd)
        return scd

    def getaddleford(self):
        """player starts with 80% of his handicap and adds that to the
           gross stableford score"""
        scd = self.getgrossstableford()
        hcap = self.getcoursehandicap()
        scd['total'] = scd['total'] + int(round(hcap * 80.0 / 100))
        return scd

    def get24stableford(self):
        hcap = self.getcoursehandicap()
        if hcap > 24:
            hcap = 24
        scd = initscoredict(self.player)
        for score in self.matchentries.all():
            strokes = getstrokes(hcap, score)
            sc = score.score - strokes
            points = self.stablefordscoring(sc, score.hole.par)
            scd['scores'][score.hole.number] = points
        scd = getnines(scd)
        return scd

    def getnettbogey(self):
        scd = initscoredict(self.player)
        hcap = self.getcoursehandicap()
        for score in self.matchentries.all():
            strokes = getstrokes(hcap, score)
            sc = score.score - strokes
            points = self.bogeyscoring(sc, score.hole.par)
            scd['scores'][score.hole.number] = points
        scd = getnines(scd)
        return scd

    def getnett24bogey(self):
        hcap = self.getcoursehandicap()
        if hcap > 24:
            hcap = 24
        scd = initscoredict(self.player)
        for score in self.matchentries.all():
            strokes = getstrokes(hcap, score)
            sc = score.score - strokes
            points = self.bogeyscoring(sc, score.hole.par)
            scd['scores'][score.hole.number] = points
        scd = getnines(scd)
        return scd

    def getnettmodbogey(self):
        hcap = self.getcoursehandicap()
        scd = initscoredict(self.player)
        for score in self.matchentries.all():
            strokes = getstrokes(hcap, score)
            sc = score.score - strokes
            points = self.modbogeyscoring(sc, score.hole.par)
            scd['scores'][score.hole.number] = points
        scd = getnines(scd)
        return scd

    def velappan(self):
        hcap = self.getcoursehandicap()
        if hcap > 24:
            hcap = 24
        scd = initscoredict(self.player)
        for score in self.matchentries.all():
            strokes = getstrokes(hcap, score)
            sc = score.score - strokes
            points = self.modbogeyscoring(sc, score.hole.par)
            scd['scores'][score.hole.number] = points
        scd = getnines(scd)
        return scd

    def __unicode__(self):
        return u"%s: %s" % (self.player, self.tournament)


class Trophyentry(models.Model):
    """where trophy has limited number of participants like seniors"""
    matchentry = models.ForeignKey(Matchentry, verbose_name=_("Match entry"),
        related_name=_("mentries"))
    trophy = models.ForeignKey(Trophy, verbose_name=_("Trophy"),
        related_name=_("trophies"))

    def __unicode__(self):
        return u"%s: %s" % (self.player, self.tournament)


class Score(models.Model):
    matchentry = models.ForeignKey(Matchentry, verbose_name=_("Match entry"),
        related_name=_("matchentries"))
    hole = models.ForeignKey(Hole, verbose_name=_("Hole"))
    score = models.IntegerField(_("Score"), blank=True, null=True, default=0)

    class Meta:
        unique_together = ("matchentry", "hole")


    def __unicode__(self):
        return u"%s: score %s" % (self.matchentry, self.score)


class Member(models.Model):
    player = models.ForeignKey(Player, verbose_name=_("Member"), unique=True)
    hide = models.BooleanField("Hide", default = True)

    def has_scores(self):
        return self.scoringrecord_set.all().count() > 0

    def tscores(self):
        return self.scoringrecord_set.filter(scoretype='T').count() > 0

    def currenthandicap(self):
        return self.currenthandicap_set.all()[0]

    def membsr(self):
        sr = self.player.tee.sloperating
        return sr

    class Meta:
        ordering = ['player']

    def __unicode__(self):
        return u"%s" % (self.player)


class Practiceround(models.Model):
    rounddate = models.DateField(_("Date"))
    member = models.ForeignKey(Member, verbose_name=_("Member"))
    tee = models.ForeignKey(Tee, verbose_name=_("Tee"))
    marker = models.CharField(_("Marker"), max_length=150)
    scoretype = models.CharField(_("Score type"), max_length=2, choices=SCORETYPES)
    accepted = models.BooleanField(_("Accepted"), default=False)

    class Meta:
        unique_together = ("rounddate", "member")

    def clean(self):
        """do not allow duplication of scoring records"""
        for sr in self.member.scoringrecord_set.all():
            if sr.scoredate == self.rounddate:
                raise ValidationError('Scoring record for this date and member exists.')

    def getcoursehandicap(self):
        """the formula is: handicapindex*sloperating/113 and rounded"""
        try:
            handicap = self.member.currenthandicap_set.all()[0].handicap
        except:
            handicap = 36.4
        srating = self.tee.sloperating
        chandicap = int(round((handicap * srating) / 113))
        return chandicap

    def getnines(self, scd):
        for hl, sc in scd['scores'].items():
            if hl <= 9:
                scd['front'] += sc
            else:
                scd['back'] += sc
        scd['total'] = scd['front'] + scd['back']
        return scd

    def getscores(self):
        scd = initscoredict(self.member.player)
        for score in self.pscore_set.all():
            scd['scores'][score.hole.number] = score.score
        scd = self.getnines(scd)
        return scd

    def getstrokes(self, hcp, score):
        """given a score and handicap gets strokes"""
        if hcp >= score.hole.strokeindex + 18:
            strokes = 2
        elif hcp >= score.hole.strokeindex:
            strokes = 1
        elif hcp <= score.hole.strokeindex - 19:
            strokes = -1
        else:
            strokes = 0
        return strokes

    def getescscores(self):
        backnine = 0
        hcp = self.getcoursehandicap()
        scd = initscoredict(self.member.player)
        for score in self.pscore_set.all():
            sc = score.score
            if sc == 0:
                sc = score.hole.par + getstrokes(hcp, score)
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
                if sc > score.hole.par + 2:
                    sc = score.hole.par + 2
            scd['scores'][score.hole.number] = sc
        scd = self.getnines(scd)
        return scd

    def getesctotal(self):
        return self.getescscores()['total']

    def __unicode__(self):
        return u"%s: date %s" % (self.member, self.rounddate)


class Pscore(models.Model):
    practiceround = models.ForeignKey(Practiceround, verbose_name=_("Practice round"))
    hole = models.ForeignKey(Hole, verbose_name=_("Hole"))
    score = models.IntegerField(_("Score"), blank=True, null=True, default=0)

    class Meta:
        unique_together = ("practiceround", "hole")


    def __unicode__(self):
        return u"%s: score %s" % (self.practiceround, self.score)


class Scoringrecord(models.Model):
    scoredate = models.DateField(_("Date"))
    member = models.ForeignKey(Member, verbose_name=_("Member"))
    tee = models.ForeignKey(Tee, verbose_name=_("Tee"))
    score = models.IntegerField(_("Score"))
    scoretype = models.CharField(_("Score type"), max_length=2, choices=SCORETYPES)
    sloperating = models.IntegerField(_("Slope rating"))
    courserating = models.DecimalField(_("Course rating"), max_digits=3, decimal_places=1)

    class Meta:
        unique_together = ("member", "scoredate")

    def __unicode__(self):
        return u"%s: score %s %s" % (self.member, self.score, self.scoredate)


class Teamtrophy(models.Model):
    name = models.CharField(_("Team Trophy"), max_length=150, unique=True)
    tournament = models.ForeignKey(Tournament, verbose_name=_("Tournament"))
    handlimit = models.PositiveIntegerField(_("Max Handicap"))
    best = models.PositiveIntegerField(_("No of best scores"))
    format = models.CharField(_("Format"), max_length=3, choices=TEAMTYPES)

    def __unicode__(self):
        return u"%s" % (self.name)


class Team(models.Model):
    """format is stableford max 24 strokes or GKD"""
    name = models.CharField(_("Team Name"), max_length=150, unique=True)
    members = models.ManyToManyField(Matchentry, verbose_name=_("Matchentry"))
    tournament = models.ForeignKey(Tournament, verbose_name=_("Tournament"))

    def hdcmp(self, x, y):
        z = y[1] - x[1]
        return z

    def gkdcmp(self, x, y):
        z = x[1] - y[1]
        return z

    def best(self):
        return self.tournament.teamtrophy_set.all()[0].best

    def getscores(self):
        scores = []
        for entry in self.members.all():
            total = entry.get24stableford()['total']
            if total != 0:
                scores.append((entry, total, entry.player.last_name))
        scores.sort(cmp=self.hdcmp)
        tot = 0
        best = self.best()
        for score in scores[:self.best()]:
            tot += score[1]
        scors = ','.join(["%s %s" % (x[2], x[1]) for x in scores])
        return {'scores': scors, 'total': tot, 'name': self.name}

    def getgrossscores(self):
        scores = []
        for entry in self.members.all():
            total = entry.getgrossstableford()['total']
            if total != 0:
                scores.append((entry, total, entry.player.last_name))
        scores.sort(cmp=self.hdcmp)
        tot = 0
        best = self.best()
        for score in scores[:self.best()]:
            tot += score[1]
        scors = ','.join(["%s %s" % (x[2], x[1]) for x in scores])
        return {'scores': scors, 'total': tot, 'name': self.name}

    def gkdscores(self):
        """best three of 4 where at least one should be in the other category"""

        def allsame(scorelist):
            if (scorelist[0][0] <= 15 and scorelist[1][0] <= 15 and scorelist[2][0] <= 15) or\
               (scorelist[0][0] > 15 and scorelist[1][0] > 15 and scorelist[2][0] > 15):
                return True
            return False

        ply = "%s" % (self.name)
        scorelist = []
        for entry in self.members.all():
            scores = entry.getnett24mr()
            if 'DQ' in scores:
                return ['DQ']
            if scores['scores'] != {} and scores['total'] != 0:
                scorelist.append((entry.getcoursehandicap(), scores['total'], entry.player.last_name))
        if scorelist == []:
            return ['DQ']
        if len(scorelist) == 4 and\
           ((scorelist[0][0] <= 15 and scorelist[1][0] <= 15 and scorelist[2][0] <= 15 and scorelist[3][0] <= 15) or
            (scorelist[0][0] > 15 and scorelist[1][0] > 15 and scorelist[2][0] > 15 and scorelist[3][0] > 15)):
            return ['DQ']
        if len(scorelist) < 3:
            return ['DQ']
        elif len(scorelist) == 3 and allsame(scorelist):
            return ['DQ']
        scorelist.sort(cmp=self.gkdcmp)
        if allsame(scorelist[:3]):
            total = scorelist[0][1] + scorelist[1][1] + scorelist[3][1]
        else:
            total = scorelist[0][1] + scorelist[1][1] + scorelist[2][1]
        scors = ','.join(["%s %s" % (x[2], x[1]) for x in scorelist])
        return {'total': total, 'name': ply, 'scores': scors}

    def medalscores(self):
        """best of the total"""
        ply = "%s" % (self.name)
        scorelist = []
        for entry in self.members.all():
            scores = entry.getnettmr()
            if 'DQ' in scores:
                continue
            elif scores['scores'] != {} and scores['total'] != 0:
                scorelist.append((entry.getcoursehandicap(), scores['total'], entry.player.last_name))
        if len(scorelist) < self.best():
            return ['DQ']
        scorelist.sort(cmp=self.gkdcmp)
        total = 0
        for t in scorelist[:self.best()]:
            total += t[1]
        scors = ','.join(["%s %s" % (x[2], x[1]) for x in scorelist])
        return {'total': total, 'name': ply, 'scores': scors}

    def medalgrossscores(self):
        """best of the total gross"""
        ply = "%s" % (self.name)
        scorelist = []
        for entry in self.members.all():
            scores = entry.getgrossmr()
            if 'DQ' in scores:
                continue
            elif scores['scores'] != {} and scores['total'] != 0:
                scorelist.append((entry.getcoursehandicap(), scores['total'], entry.player.last_name))
        if len(scorelist) < self.best():
            return ['DQ']
        scorelist.sort(cmp=self.gkdcmp)
        total = 0
        for t in scorelist[:self.best()]:
            total += t[1]
        scors = ','.join(["%s %s" % (x[2], x[1]) for x in scorelist])
        return {'total': total, 'name': ply, 'scores': scors}

    def gkdscorehelper(self, scorelist):
        """ Gets best three of 4 scores where at least one should be in other category"""
        def allsame(sclst):
            if (sclst[0][0] <= 15 and sclst[1][0] <= 15 and sclst[2][0] <= 15) or\
               (sclst[0][0] > 15 and sclst[1][0] > 15 and sclst[2][0] > 15):
                return True
            return False
        if len(scorelist) == 4 and\
           ((scorelist[0][0] <= 15 and scorelist[1][0] <= 15 and scorelist[2][0] <= 15 and scorelist[3][0] <= 15) or
            (scorelist[0][0] > 15 and scorelist[1][0] > 15 and scorelist[2][0] > 15 and scorelist[3][0] > 15)):
            return ['DQ']
        if len(scorelist) < 3:
            return ['DQ']
        elif len(scorelist) == 3 and allsame(scorelist):
            return ['DQ']
        scorelist.sort(cmp=self.gkdcmp)
        if allsame(scorelist[:3]):
            total = scorelist[0][1] + scorelist[1][1] + scorelist[3][1]
        else:
            total = scorelist[0][1] + scorelist[1][1] + scorelist[2][1]
        scors = ','.join(["%s %s" % (x[2], x[1]) for x in scorelist])
        return {'total':total, 'scores':scors } 
          
    def gkdgrossscores(self):
        """best three of 4 gross"""
        ply = "%s" % (self.name)
        scorelist = []
        for entry in self.members.all():
            scores = entry.getgrossmr()
            if 'DQ' in scores:
                return ['DQ']
            if scores['scores'] != {} and scores['total'] != 0:
                scorelist.append((entry.getcoursehandicap(), scores['total'], entry.player.last_name))
        if len(scorelist) < 3:
            return ['DQ']
        schelp = self.gkdscorehelper()
        if 'DQ' in schelp:
            return ['DQ']
        return {'total': schelp['total'], 'name': ply, 'scores': schelp['scores']}


    def __unicode__(self):
        return u"%s %s" % (self.name, self.tournament)

def stablefordspoints(score, par,hcap):
    score = score.score - getstrokes(hcap,score)
    if score == 0 or score >= par + 2:
        points = 0
    else:
        points = par + 2 - score
    return points


class Partner(models.Model):
    """scramble, bogey, combined stableford and medal round
        check if one partner does not turn up"""
    member1 = models.ForeignKey(Matchentry, verbose_name=_("Partner 1"), related_name='p1')
    member2 = models.ForeignKey(Matchentry, verbose_name=_("Partner 2"), related_name='p2')
    tournament = models.ForeignKey(Tournament, verbose_name=_("Tournament"))


    def getnettscramble(self):
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        hcap1 = int(self.member1.getcoursehandicap())
        hcap2 = int(self.member2.getcoursehandicap())
        hcap = int(round((hcap1 + hcap2 * 1.0) * 50 / 100))
        for score in self.member1.matchentries.all():
            if score.score == 0:
                return ['DQ']
            strokes = getstrokes(hcap, score)
            sc = score.score - strokes
            clr = getcolour(sc, score.hole.par)
            scd['scores'][score.hole.number] = {'sc': sc, 'clr': clr}
        scd = getnines(scd)
        return scd

    def getnettscramble_stableford_50(self):
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        hcap1 = int(self.member1.getcoursehandicap())
        hcap2 = int(self.member2.getcoursehandicap())
        hcap = int(round((hcap1 + hcap2 ) * 50 / 100))
        for score in self.member1.matchentries.all():
            if score.score == 0:
                return ['DQ']
            sc = stablefordspoints(score, score.par, hcap)
            clr = getcolour(sc, score.hole.par)
            scd['scores'][score.hole.number] = {'sc': sc, 'clr': clr}
        scd = getnines(scd)
        return scd

    def getnettscramble_stableford_40(self):
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        hcap1 = int(self.member1.getcoursehandicap())
        hcap2 = int(self.member2.getcoursehandicap())
        hcap = int(round((hcap1 + hcap2) * 40 / 100))
        for score in self.member1.matchentries.all():
            if score.score == 0:
                return ['DQ']
            sc = stablefordspoints(score, score.par, hcap)
            clr = getcolour(sc, score.hole.par)
            scd['scores'][score.hole.number] = {'sc': sc, 'clr': clr}
        scd = getnines(scd)
        return scd

    def getnettscramble_stableford_30(self):
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        hcap1 = int(self.member1.getcoursehandicap())
        hcap2 = int(self.member2.getcoursehandicap())
        hcap = int(round((hcap1 + hcap2) * 30 / 100))
        for score in self.member1.matchentries.all():
            if score.score == 0:
                return ['DQ']
            sc = stablefordspoints(score, score.hole.par, hcap)
            clr = getcolour(sc, score.hole.par)
            scd['scores'][score.hole.number] = {'sc': sc, 'clr': clr}

        scd = getnines(scd)
        return scd


    def getgrossscramble(self):
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        for score in self.member1.matchentries.all():
            if score.score == 0:
                return ['DQ']
            sc = score.score
            clr = getcolour(sc, score.hole.par)
            scd['scores'][score.hole.number] = {'sc': sc, 'clr': clr}
        scd = getnines(scd)
        return scd

    def getgrossscramble_stableford(self):
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        for score in self.member1.matchentries.all():
            if score.score == 0:
                return ['DQ']
            sc = stablefordspoints(score, score.par, 0)
            clr = getcolour(sc, score.hole.par)
            scd['scores'][score.hole.number] = {'sc': sc, 'clr': clr}
        scd = getnines(scd)
        return scd

    def getnettswitch(self):
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        hcap1 = int(self.member1.getcoursehandicap())
        hcap2 = int(self.member2.getcoursehandicap())
        hcap = int(round((hcap1 + hcap2 * 1.0) * 50 / 100))
        for x in range(1, 19):
            score1 = self.member1.matchentries.get(hole__number=x)
            pt1 = stablefordspoints(score1,score1.hole.par,hcap)
            score2 = self.member2.matchentries.get(hole__number=x)
            pt2 = stablefordspoints(score2,score2.hole.par,hcap)
            sc = pt1+pt2
            clr = ''
            scd['scores'][x] = {'sc': sc, 'clr': clr}
        scd = getnines(scd)
        return scd

    def getgrossswitch(self):
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        for x in range(1, 19):
            score1 = self.member1.matchentries.get(hole__number=x)
            pt1 = stablefordspoints(score1,score1.hole.par,0)
            score2 = self.member2.matchentries.get(hole__number=x)
            pt2 = stablefordspoints(score2,score2.hole.par,0)
            sc = pt1+pt2
            clr = ''
            scd['scores'][x] = {'sc': sc, 'clr': clr}
        scd = getnines(scd)
        return scd


    def getscores(self):
        """this is nett best ball bogey"""
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        s1 = self.member1.getnettbogey()
        s2 = self.member2.getnettbogey()
        for x in range(1, 19):
            y = max(s1['scores'][x], s2['scores'][x], key=lambda a: a['sc'])
            scd['scores'][x] = y
        scd = getnines(scd)
        return scd

    def getgrossscores(self):
        """gross best ball bogey"""
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        s1 = self.member1.getgrossbogey()
        s2 = self.member2.getgrossbogey()
        for x in range(1, 19):
            y = max(s1['scores'][x], s2['scores'][x], key=lambda a: a['sc'])
            scd['scores'][x] = y
        scd = getnines(scd)
        return scd

    def getscoresmr(self):
        """best ball medal nett"""
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        s1 = self.member1.getnettmrndq()
        s2 = self.member2.getnettmrndq()
        for x in range(19):
            if s1['scores'][x]['sc'] == 0 and s2['scores'][x]['sc'] == 0:
                return ['DQ']
        for x in range(1, 19):
            if s1['scores'][x]['sc'] == 0:
                y = s2[x]
            elif s2['scores'][x]['sc'] == 0:
                y = s1[x]
            else:
                y = min(s1['scores'][x], s2['scores'][x], key=lambda a: a['sc'])
            scd['scores'][x] = y
        scd = getnines(scd)
        return scd

    def getgrossscoresmr(self):
        """best ball medal round gross"""
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        s1 = self.member1.getgrossmrndq()
        s2 = self.member2.getgrossmrndq()
        for x in range(19):
            if s1['scores'][x]['sc'] == 0 and s2['scores'][x]['sc'] == 0:
                return ['DQ']
        for x in range(1, 19):
            if s1['scores'][x]['sc'] == 0:
                y = s2[x]
            elif s2['scores'][x]['sc'] == 0:
                y = s1[x]
            else:
                y = min(s1['scores'][x], s2['scores'][x], key=lambda a: a['sc'])
            scd['scores'][x] = y
        scd = getnines(scd)
        return scd

    def getnettmultiply(self):
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        s1 = self.member1.getnettstableford()
        s2 = self.member2.getnettstableford()
        for x in range(1, 19):
            y = s1['scores'][x]['sc'] * s2['scores'][x]['sc']
            scd['scores'][x] = {'sc': y}
        scd = getnines(scd)
        return scd

    def getgrossmultiply(self):
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        s1 = self.member1.getgrossstableford()
        s2 = self.member2.getgrossstableford()
        for x in range(1, 19):
            y = s1['scores'][x]['sc'] * s2['scores'][x]['sc']
            scd['scores'][x] = {'sc': y}
        scd = getnines(scd)
        return scd
    def getcombinedstableford(self):
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        s1 = self.member1.getnettstableford()
        s2 = self.member2.getnettstableford()
        for x in range(1, 19):
            y = s1['scores'][x]['sc'] + s2['scores'][x]['sc']
            scd['scores'][x] = {'sc': y}
        scd = getnines(scd)
        return scd

    def getgrosscombinedstableford(self):
        ply = "%s & %s" % (self.member1.player, self.member2.player)
        scd = initscoredict(ply)
        s1 = self.member1.getgrossstableford()
        s2 = self.member2.getgrossstableford()
        for x in range(1, 19):
            y = s1['scores'][x]['sc'] + s2['scores'][x]['sc']
            scd['scores'][x] = {'sc': y}
        scd = getnines(scd)
        return scd


    def __unicode__(self):
        return u"%s & %s" % (self.member1.player, self.member2.player)


class Partner3(models.Model):
    """format is currently short-circuited best 2 balls stableford
    we have to cater to the fact that one or more partner may not 
    turn up or finish the round."""
    member1 = models.ForeignKey(Matchentry, verbose_name=_("Partner3 1"), related_name='p31')
    member2 = models.ForeignKey(Matchentry, verbose_name=_("Partner3 2"), related_name='p32')
    member3 = models.ForeignKey(Matchentry, verbose_name=_("Partner3 3"), related_name='p33')
    tournament = models.ForeignKey(Tournament, verbose_name=_("Tournament"))


    def getscores(self):
        ply = "%s, %s & %s" % (self.member1.player, self.member2.player, self.member3.player)
        scd = initscoredict(ply)
        s1 = self.member1.get24stableford()
        s2 = self.member2.get24stableford()
        s3 = self.member3.get24stableford()
        for x in range(1, 19):
            allscores = []
            try:
                if s1:
                    allscores.append(s1['scores'][x]['sc'])
            except:
                pass
            try:
                if s2:
                    allscores.append(s2['scores'][x]['sc'])
            except:
                pass
            try:
                if s3:
                    allscores.append(s3['scores'][x]['sc'])
            except:
                pass
            if len(allscores) == 3:
                scd['scores'][x] = {'sc': sum(sorted(allscores)[1:3])}
            else:
                scd['scores'][x] = {'sc': sum(allscores)}
        scd = getnines(scd)
        return scd

    def getgrossscores(self):
        ply = "%s, %s & %s" % (self.member1.player, self.member2.player, self.member3.player)
        scd = initscoredict(ply)
        s1 = self.member1.getgrossstableford()
        s2 = self.member2.getgrossstableford()
        s3 = self.member3.getgrossstableford()
        frontnine = 0
        backnine = 0
        for x in range(1, 19):
            allscores = []
            try:
                if s1:
                    allscores.append(s1['scores'][x]['sc'])
            except:
                pass
            try:
                if s2:
                    allscores.append(s2['scores'][x]['sc'])
            except:
                pass
            try:
                if s3:
                    allscores.append(s3['scores'][x]['sc'])
            except:
                pass
            if len(allscores) == 3:
                scd['scores'][x] = {'sc': sum(sorted(allscores)[1:3])}
            else:
                scd['scores'][x] = {'sc': sum(allscores)}
        scd = getnines(scd)
        return scd

    def __unicode__(self):
        return u"%s, %s & %s" % (self.member1.player, self.member2.player, self.member3.player)


class currenthandicap(models.Model):
    member = models.ForeignKey(Member, verbose_name="Member", unique=True)
    handicap = models.DecimalField(_("Handicap index"), max_digits=3, decimal_places=1)
    handicaptype = models.CharField(_("Handicap type"), max_length=2, choices=HANDICAPTYPES, default=_("L"))

    def __unicode__(self):
        return u"%s: %s %s" % (self.member.player, self.handicap, self.handicaptype)


class Monthhandicap(models.Model):
    member = models.ForeignKey(Member, verbose_name="Member", unique=True)
    handicap = models.DecimalField(_("Handicap index"), max_digits=3, decimal_places=1)
    handicaptype = models.CharField(_("Handicap type"), max_length=2, choices=HANDICAPTYPES, default=_("L"))
    month = models.DateField(_("Date"))

    def __unicode__(self):
        return u"%s: %s %s" % (self.member.player, self.handicap, self.handicaptype)


class Membergroup(models.Model):
    name = models.CharField(_("Name"), max_length=50)
    members = models.ManyToManyField(Member, verbose_name=_("Members"))

    def __unicode__(self):
        return u"%s" % (self.name)

