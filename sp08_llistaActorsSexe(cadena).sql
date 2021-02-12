use videoclub;

DELIMITER //

DROP PROCEDURE IF EXISTS sp08_llistaActorsSexe //

CREATE PROCEDURE sp08_llistaActorsSexe(
IN pi_sexeActor varchar(6))

BEGIN

SELECT nom_actor
FROM ACTORS
WHERE sexe_actor=pi_sexeActor;

END //

DELIMITER ;
