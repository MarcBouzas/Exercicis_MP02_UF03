use videoclub;
drop function if exists act12;

delimiter //
create function act12(codi_peli smallint unsigned)
  returns varchar (30)
  deterministic
begin
  declare nomcognom varchar(30);

  select nom_actor
    into nomcognom
  from ACTORS
  inner join ACTORS_PELLICULES on ACTORS.id_actor = ACTORS_PELLICULES.id_actor
  where id_peli = codi_peli
  limit 1;

  return nomcognom;
end//
delimiter ;

select titol_peli Titol, act12(2) "Nom actor principal"
from PELLICULES
where id_peli = 2;