begin;
alter table web_scoringrecord add constraint un_con UNIQUE (member_id, scoredate);
commit;
