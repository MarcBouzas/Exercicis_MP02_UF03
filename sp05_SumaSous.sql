
USE empresa//

DELIMITER //

DROP PROCEDURE IF EXISTS sp_05_sumasous//

CREATE PROCEDURE sp_05_sumasous()

  BEGIN

    DECLARE suma float;
    DECLARE sumafutura float DEFAULT 0;

    SET suma = 0;


    SELECT SUM(SOU_TREB)  INTO suma
    FROM TREBALLADORS;

    SELECT  CONCAT("Suma de sous actuals: ",
                   suma) 
            AS Actual;

    SET @sumafutura = suma * 1.03;

    SELECT  CONCAT("Suma de sous amb l'augment: ",
                   @sumafutura)
            AS Futur;
  END //

DELIMITER ;