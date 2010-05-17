begin;
alter table web_matchentry drop constraint web_matchentry_tournament_id_key;
alter table web_matchentry add column "round" integer;
update web_matchentry set round = 1;
alter table web_matchentry alter column round set not null;
alter table web_matchentry add constraint "web_matchentry_tournament_player_round_key" unique ("tournament_id", "player_id", "round");
end;
