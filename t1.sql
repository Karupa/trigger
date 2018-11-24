                   TRIGGER


create table t1 (id int primary key); --this is the main table


create table t1_log(id int not null,  --loge table
                    logdate date);


create or replace function t1LogEntry()   --function for log entry
returns trigger as
$$
begin
   insert into t1_log values(NEW.id,now());
   return NEW


end;
$$
language plpgsql;




create trigger t1_log_trigger before insert on t1   --creating trigger
for each row execute PROCEDURE t1LogEntry();

===============================================================
--backup table
create table backup_log(id int not null,
			logdate date);
--creating trigger for backup table

create trigger t1_backup_trigger before delete on t1
for each row execute PROCEDURE t1BupEntry();


--function for backup
create or replace function t1BupEntry()
returns trigger as
$$
begin
  insert into backup_log values(old.id,now());
  return old;
end;
$$
language plpgsql;

