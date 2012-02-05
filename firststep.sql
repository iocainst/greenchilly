 
begin;
alter table web_team add column "tournament_id" integer references "web_tournament" ("id");
update web_team set tournament_id = (select tournament_id from web_teamtrophy where web_teamtrophy.id=web_team.teamtrophy_id);
alter table web_team alter column tournament_id set not null;
alter table web_team drop column teamtrophy_id;
end;
