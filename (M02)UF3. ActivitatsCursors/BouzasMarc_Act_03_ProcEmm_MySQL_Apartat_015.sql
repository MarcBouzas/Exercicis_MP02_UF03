USE videoclub;
DELIMITER //
DROP TRIGGER IF EXISTS act15_trigger_1;

CREATE TRIGGER act15_trigger_1 
  AFTER INSERT ON VISUALITZACIONS
  FOR EACH ROW
    BEGIN 
      DECLARE paCodiPeli smallint unsigned;
    set paCodiPeli = new.id_peli;
      UPDATE PELLICULES
        SET recaudacio_peli = recaudacio_peli + 2
        WHERE id_peli = new.id_peli;
END//
DELIMITER ;

INSERT INTO VISUALITZACIONS
   VALUES ("00:00:01",2,111);
   
SELECT titol_peli,recaudacio_peli
FROM PELLICULES
WHERE id_peli = 2;
