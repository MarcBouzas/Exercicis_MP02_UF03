
USE videoclub;

DELIMITER //


DROP PROCEDURE IF EXISTS exercici_1_llistaActors//

CREATE PROCEDURE exercici_1_llistaActors()

  BEGIN


    SELECT nom_actor Nom, anynaix_actor "Any naix."
    FROM   ACTORS
    WHERE  sexe_actor="home";

  END//

DELIMITER ;