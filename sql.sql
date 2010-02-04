BEGIN;

alter table "web_matchentry" add column "tee_id" integer REFERENCES "web_tee" ("id") DEFERRABLE INITIALLY DEFERRED;
update "web_matchentry" set tee_id = 1;

end;
