begin;
alter table web_currenthandicap add column handicaptype varchar(2);
update web_currenthandicap set handicaptype = 'N';
alter table web_currenthandicap alter column handicaptype set not null;
commit;
