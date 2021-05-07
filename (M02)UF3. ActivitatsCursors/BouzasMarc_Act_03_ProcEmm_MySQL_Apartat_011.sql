use videoclub;
drop function if exists act11;

delimiter //
create function act11(codiPeli SMALLINT UNSIGNED)
  returns smallint unsigned
  deterministic
begin
 declare quantitatExemplars smallint unsigned;

  select  COUNT(*)
    into quantitatExemplars
  from  PRESTECS
  WHERE	id_peli = codipeli;

  return quantitatExemplars;
end//
delimiter ;

SELECT titol_peli, act11(2) "Visualitzacions dels Usuaris",nom_soci
FROM PELLICULES, PRESTECS
INNER JOIN SOCIS ON PRESTECS.id_soci = SOCIS.id_soci
WHERE PRESTECS.id_peli = 2 AND PELLICULES.id_peli = 2;