from django.contrib import admin
from djangogolf.web.models import *
class Partneradmin(admin.ModelAdmin):
    list_display      = ['member1','member2','tournament']


admin.site.register(Course)
admin.site.register(Tournament)
admin.site.register(Player)
admin.site.register(Hole)
admin.site.register(Tee)
admin.site.register(Draw)
admin.site.register(Teeoff)
admin.site.register(Matchentry)
admin.site.register(Score)
admin.site.register(Handicap)
admin.site.register(Pscore)
admin.site.register(Practiceround)
admin.site.register(Member)
admin.site.register(Scoringrecord)
admin.site.register(Trophy)
admin.site.register(Teamtrophy)
admin.site.register(Team)
admin.site.register(Round)
admin.site.register(Partner,Partneradmin)

