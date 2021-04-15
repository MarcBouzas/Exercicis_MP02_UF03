USE videoclub;
DROP PROCEDURE IF EXISTS act8;
DELIMITER //
CREATE PROCEDURE act8()

BEGIN
	DECLARE final INT DEFAULT FALSE;
	DECLARE rend VARCHAR(15);
	DECLARE titol VARCHAR(40);
	DECLARE recap BIGINT DEFAULT 0;
	DECLARE press BIGINT DEFAULT 0;
   
	DECLARE elcursor cursor for

	SELECT titol_peli, recaudacio_peli, presspost_peli
	FROM PELLICULES;

	DECLARE continue handler for not found SET final = 1;
	open elcursor;
	elbucle:loop
		fetch elcursor into titol, recap, press;
      
		IF final = 1 then
			leave elbucle;
		END IF;
      
		IF (press < recap) then
			SET rend = "Deficitari";
		ELSEIF (recap < press*2) then
			SET rend = "Suficient";
		ELSE
			SET rend = "Bona";
		END IF;

	SELECT titol, rend;
   
	END loop elbucle; 

	close elcursor;
END//

DELIMITER ;

call act8();