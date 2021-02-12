
USE empresa;

DELIMITER //

DROP PROCEDURE IF EXISTS sp07_sumaSousDepartament//

CREATE PROCEDURE sp07_sumaSousDepartament(
     IN  pi_num_dept smallint, 
     OUT po_suma float)

  BEGIN

    SELECT SUM(SOU_TREB)
      INTO @po_suma
    FROM   TREBALLADORS
    WHERE  CODI_DEP_TREB=pi_num_dept;

  END //

DELIMITER ;