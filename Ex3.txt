
USE LLIBRERIA;

-- Modifiquem el delimitador de sentències a //
DELIMITER //

DROP PROCEDURE IF EXISTS sp02_Llibres_Autor//


CREATE PROCEDURE sp02_Llibres_Autor(
      IN  p_autor varchar(30))
  BEGIN

    SELECT TITOL, EDITORIAL, PREU
    FROM   LLIBRES
    WHERE  AUTOR = p_autor;

  END//

DELIMITER ;