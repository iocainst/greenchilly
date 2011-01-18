from django.contrib import admin
from djangogolf.web.models import *
class Partneradmin(admin.ModelAdmin):
    list_display      = ['member1','member2','tournament']
class Playeradmin(admin.ModelAdmin):
    list_display      = ['last_name','first_name','homeclub']
class Memberadmin(admin.ModelAdmin):
    list_display      = ['player','has_scores','tscores']


admin.site.register(Course)
admin.site.register(Tournament)
admin.site.register(Player,Playeradmin)
admin.site.register(Hole)
admin.site.register(Tee)
admin.site.register(Draw)
admin.site.register(Teeoff)
admin.site.register(Matchentry)
admin.site.register(Score)
admin.site.register(Handicap)
admin.site.register(Pscore)
admin.site.register(Practiceround)
admin.site.register(Member,Memberadmin)
admin.site.register(Scoringrecord)
admin.site.register(Trophy)
admin.site.register(Teamtrophy)
admin.site.register(Team)
admin.site.register(Round)
admin.site.register(Partner,Partneradmin)

