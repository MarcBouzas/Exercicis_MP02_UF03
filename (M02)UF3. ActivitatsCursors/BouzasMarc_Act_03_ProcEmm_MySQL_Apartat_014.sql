USE videoclub;
DELIMITER //
DROP TRIGGER IF EXISTS act14_trigger_1;
DROP TRIGGER IF EXISTS act14_trigger_2;

CREATE TRIGGER act14_trigger_1 
  BEFORE INSERT ON PELLICULES
    FOR EACH ROW 
      BEGIN 
        SET NEW.titol_peli = upper(new.titol_peli);
          END//
CREATE TRIGGER act14_trigger_2 
  BEFORE UPDATE ON PELLICULES
    FOR EACH ROW 
      BEGIN 
        SET NEW.titol_peli = upper(new.titol_peli);
          END//	
        
DELIMITER ;
SELECT id_peli, titol_peli
FROM PELLICULES
WHERE id_peli = 1;

UPDATE PELLICULES
SET any_peli=2003
WHERE id_peli = 2;