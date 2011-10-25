from django.conf.urls.defaults import *

urlpatterns = patterns('web.views',
    (r'^$', 'index'),
    (r'^home/$', 'index'),
    (r'^sorry/$', 'sorry'),
    (r'^adduser/(?P<code>\d+)/$', 'adduser'),
    (r'^edituser/$', 'edituser'),
    (r'^register/$', 'register'),
    (r'^calculatehandicap/$', 'calculatehandicap'),
    (r'^revisehandicap/$', 'revisehandicap'),
    (r'^displayhandicap/$', 'displayhandicap'),
    (r'^displayhandicaplist/$', 'getcurhandicaplist'),
    (r'^addcourse/((?P<id>\d+)/)?$', 'addcourse'),
    (r'^addmember/$', 'addmember'),
    (r'^closetournament/((?P<trn>\d+)/)?$', 'closetournament'),
    (r'^matchplay/(?P<tournid>\d+)/$', 'matchplay'),                       
    (r'^tournamentfull/((?P<trn>\d+)/)?$', 'tournamentfull'),
    (r'^regthank/(?P<id>\d+)/$', 'regthank'),
    (r'^showdraw/(?P<drw>\d+)/$', 'showdraw'),
    (r'^adjustdraw/(?P<drw>\d+)/$', 'adjustdraw'),
    (r'^calculatehandicap/(?P<mem>\d+)/$', 'calculatehandicap'),
    (r'^finaldraw/(?P<drw>\d+)/$', 'finaldraw'),
    (r'^addtee/(?P<courseid>\d+)/((?P<id>\d+)/)?$', 'addtee'),
    (r'^adddraw/(?P<tourn>\d+)/$', 'adddraw'),
    (r'^leaderboard/(?P<trn>\d+)/(?P<nextt>\d+)/$', 'leaderboard'),
    (r'^cumulleaderboard/(?P<trn>\d+)/(?P<rnd>\d+)/$', 'cumulleaderboard'),
    (r'^rleaderboard/(?P<trn>\d+)/(?P<rnd>\d+)/$', 'rleaderboard'),
    (r'^partnerleaderboard/(?P<trn>\d+)/$', 'partnerleaderboard'),
    (r'^partner3leaderboard/(?P<trn>\d+)/$', 'partner3leaderboard'),
    (r'^multileaderboard/(?P<trp>\d+)/$', 'multileaderboard'),               
    (r'^statistics/((?P<trn>\d+)/)?$', 'statistics'),
    (r'^addteeoff/(?P<drw>\d+)/((?P<id>\d+)/)?$', 'addteeoff'),
    (r'^addhole/(?P<teeid>\d+)/((?P<id>\d+)/)?$', 'addhole'),
    (r'^managecourses/$','managecourses'),
    (r'^manageleaderboards/$','manageleaderboards'),
    (r'^manageplayers/$','manageplayers'),
    (r'^displaytournaments/$','displaytournaments'),
    (r'^addplayer/((?P<id>\d+)/)?$', 'addplayer'),
    (r'^managehandicaps/$','managehandicaps'),
    (r'^addhandicap/(?P<plr>\d+)/((?P<id>\d+)/)?$', 'addhandicap'),
    (r'^addscores/((?P<matchentry>\d+)/)?$', 'addscores'),
    (r'^addrscores/(?P<rnd>\d+)/((?P<matchentry>\d+)/)?$', 'addrscores'),
    (r'^addpscores/((?P<prnd>\d+)/)?$', 'addpscores'),
    (r'^managetournaments/$','managetournaments'),
    (r'^managemembers/$','managemembers'),
    (r'^managepracticerounds/$','managepracticerounds'),
    (r'^addtournament/((?P<id>\d+)/)?$', 'addtournament'),
    (r'^deleteteam/(?P<id>\d+)/$', 'deleteteam'),
    (r'^deletepartner3/(?P<id>\d+)/$', 'deletepartner3'),
    (r'^deletepartner/(?P<id>\d+)/$', 'deletepartner'),                     
    (r'^results/(?P<id>\d+)/$', 'results'),
    (r'^addpracticeround/((?P<id>\d+)/)?$', 'addpracticeround'),
    (r'^manageentries/(?P<trn>\d+)/$','manageentries'),
    (r'^managescores/(?P<trn>\d+)/$','managescores'),
    (r'^managerscores/(?P<rnd>\d+)/$','managerscores'),
    (r'^managetrophies/(?P<trn>\d+)/$','managetrophies'),
    (r'^managerounds/(?P<trn>\d+)/$','managerounds'),
    (r'^generaterounds/(?P<trn>\d+)/$','generaterounds'),
    (r'^managepartnershiptrophies/(?P<trn>\d+)/$','managepartnershiptrophies'),
    (r'^managepartnership3trophies/(?P<trn>\d+)/$','managepartnership3trophies'),
    (r'^manageteamtrophy/(?P<tournid>\d+)/$','manageteamtrophy'),
    (r'^manageteams/(?P<trophid>\d+)/$','manageteams'),
    (r'^managepartners3/(?P<trn>\d+)/$','managepartners3'),
    (r'^managepartners/(?P<trn>\d+)/$','managepartners'),
    (r'^deletematchentry/(?P<id>\d+)/$','deletematchentry'),
    (r'^addmatchentry/(?P<tourn>\d+)/((?P<id>\d+)/)?$', 'addmatchentry'),
    (r'^addpartner/(?P<tourn>\d+)/((?P<id>\d+)/)?$', 'addpartner'),
    (r'^addpartner3/(?P<tourn>\d+)/((?P<id>\d+)/)?$', 'addpartner3'),
    (r'^addteamtrophy/(?P<tournid>\d+)/((?P<id>\d+)/)?$', 'addteamtrophy'),
    (r'^addteam/(?P<trophid>\d+)/((?P<id>\d+)/)?$', 'addteam'),
    (r'^addtrophy/(?P<trn>\d+)/((?P<id>\d+)/)?$', 'addtrophy'),
    (r'^addpartnershiptrophy/(?P<trn>\d+)/((?P<id>\d+)/)?$', 'addpartnershiptrophy'),
    (r'^addpartnership3trophy/(?P<trn>\d+)/((?P<id>\d+)/)?$', 'addpartnership3trophy'),
    (r'^showcourse/(?P<id>\d+)/$', 'showcourse'),
    (r'^showresults/(?P<trp>\d+)/$', 'showresults'),
    (r'^showpartnerresults/(?P<trp>\d+)/$', 'showpartnerresults'),
    (r'^showpartner3results/(?P<trp>\d+)/$', 'showpartner3results'),
    (r'^showtee/(?P<course>\d+)/(?P<id>\d+)/$', 'showtee'),
    (r'^showscores/(?P<matchentry>\d+)/$', 'showscores'),
    (r'^scoringrecord/(?P<ply>\d+)/$', 'scoringrecord'),
    (r'^showcards/(?P<mem>\d+)/$', 'showcards'),
    (r'^calindhand/$', 'calindhandicap'),
    (r'^getdups/$', 'getdups'),
    (r'^showrresults/(?P<rnd>\d+)/$', 'showrresults'),
    (r'^addassociated/(?P<tournid>\d+)/$', 'addassociated'),         
    (r'^displayresult/(?P<trp>\d+)/(?P<rnd>\d+)/$', 'displayresult'),
    )
