use videoclub;
drop function if exists act13;

delimiter //
create function act13()
  returns smallint unsigned
  deterministic
begin
  declare codi_peli smallint unsigned; 

  select id_peli 
    into codi_peli 
  from PELLICULES
  where recaudacio_peli = (
    select max(recaudacio_peli)
    from PELLICULES);

    return codi_peli;
end//
delimiter ;

select titol_peli Titol, act12(act13()) Actor,recaudacio_peli Recaudacio
from PELLICULES
WHERE id_peli = act13(); 