USE videoclub;
DROP FUNCTION IF EXISTS act11;

DELIMITER //
CREATE FUNCTION act11(codiPeli SMALLINT UNSIGNED)
	RETURNS SMALLINT UNSIGNED
	DETERMINISTIC
BEGIN
	DECLARE quantiatExemplars SMALLINT UNSIGNED;

	SELECT	COUNT(*)
		INTO quantiatExemplars
	FROM	EXEMPLARS
	WHERE	id_peli = peCodiPeli;

	RETURN quantiatExemplars;
END//
DELIMITER ;

SELECT  titol_peli Titol, act11(1) "Quantitat exemplars"
FROM    PELLICULES
WHERE   id_peli = 1;