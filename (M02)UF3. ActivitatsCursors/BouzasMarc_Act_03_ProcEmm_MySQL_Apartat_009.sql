USE videoclub;
DROP PROCEDURE IF EXISTS activitat9;
DELIMITER //
CREATE PROCEDURE activitat9()

BEGIN
	DECLARE titol VARCHAR(40);
	DECLARE rend VARCHAR(15);
	DECLARE final INT DEFAULT FALSE;
	DECALRE recap BIGINT DEFAULT 0;
	DECALRE press BIGINT DEFAULT 0;
   
	DECLARE elcursor cursor for
	SELECT titol_peli, recaudacio_peli, presspost_peli
	FROM PELLICULES;

	DECLARE continue handler for not found set final = 1;
	OPEN elcursor;
	elbucle:loop
		fetch elcursor into titol, recap, press;
	IF final = 1 then
		leave elbucle;
	END IF;
      
	IF(recap<press) then
		SET rend = "Deficitari";
	ELSEIF(recap <press*2) then
		SET rend = "Suficient";
	ELSE
		SET rend = "Bona";
	END IF;
      
	SELECT titol, rend;
   
	END loop elbucle; 
	CLOSE elcursor;
END

DELIMITER;

CALL activitat9();