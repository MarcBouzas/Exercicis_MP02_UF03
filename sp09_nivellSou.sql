DELIMITER //

USE empresa//

DROP PROCEDURE IF EXISTS sp09_nivellSou //

CREATE PROCEDURE sp09_nivellSou (
IN pi_coditreballador integer , OUT po_nivell varchar( 12 ))

BEGIN

DECLARE salari float DEFAULT 0 ;

SELECT SOU_TREB
INTO salari
FROM TREBALLADORS
WHERE CODI_TREB = pi_coditreballador ;

IF salari IS NULL THEN
SET po_nivell = " No existeix! ";

ELSE
IF salari < 1000 THEN
SET po_nivell = " Baix ";

ELSEIF salari < 2000 THEN
SET po_nivell = " Mitjà ";

ELSE
SET po_nivell = " Alt ";

END IF ;

END IF ;

END //

DELIMITER ;