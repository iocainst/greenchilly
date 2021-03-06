from django.contrib import admin
from web.models import *

class Partneradmin(admin.ModelAdmin):
    list_display = ['member1', 'member2', 'tournament']


class Tournamentadmin(admin.ModelAdmin):
    list_display = ['startdate', 'kind', 'closed']


class Playeradmin(admin.ModelAdmin):
    list_display = ['last_name', 'first_name', 'homeclub']


class Memberadmin(admin.ModelAdmin):
    list_display = ['player', 'has_scores', 'tscores']


class Practiceroundadmin(admin.ModelAdmin):
    list_display = ['member', 'rounddate', 'marker', 'getesctotal']
    search_fields = ['member__player__last_name']


class Scoringrecordadmin(admin.ModelAdmin):
    list_display = ['member', 'scoredate', 'score']
    search_fields = ['member__player__last_name']
    list_filter = ('scoretype',)


class Membergroupadmin(admin.ModelAdmin):
    filter_horizontal = ['members']

admin.site.register(Course)
admin.site.register(Tournament, Tournamentadmin)
admin.site.register(Player, Playeradmin)
admin.site.register(Hole)
admin.site.register(Tee)
admin.site.register(Draw)
admin.site.register(Teeoff)
admin.site.register(Matchentry)
admin.site.register(Score)
admin.site.register(Handicap)
admin.site.register(Pscore)
admin.site.register(Practiceround, Practiceroundadmin)
admin.site.register(Member, Memberadmin)
admin.site.register(Scoringrecord, Scoringrecordadmin)
admin.site.register(Trophy)
admin.site.register(Teamtrophy)
admin.site.register(Team)
admin.site.register(Round)
admin.site.register(Homeclub)
admin.site.register(currenthandicap)
admin.site.register(Membergroup, Membergroupadmin)
admin.site.register(Partner, Partneradmin)
