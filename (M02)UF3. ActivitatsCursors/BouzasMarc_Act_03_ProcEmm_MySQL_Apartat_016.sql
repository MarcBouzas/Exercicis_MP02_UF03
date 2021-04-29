alter table SOCIS add (
  nvisualitzacio smallint unsigned not null
);

USE videoclub;
DELIMITER //

DROP TRIGGER IF EXISTS act16_trigger_1;
CREATE TRIGGER act16_trigger_1 
  AFTER INSERT ON VISUALITZACIONS
  FOR EACH ROW
    BEGIN 
      declare pa_id_soci varchar(10);
      declare pa_qtat_visualitzacions smallint unsigned;

      set pa_id_soci = new.id.soci;

      select count(*)
      into pa_qtat_visualitzacions
      from VISUALITZACIONS
      where id_soci = pa_id_soci;
      
    update socis 
      set nvisualitzacio = pa_qtat_visualitzacions
      where id_soci = pa_id_soci;

    END//
DELIMITER ;