alter table PELLICULES add(
  qtatVisualComp smallint unsigned not null,
  qtatVisualParc smallint unsigned not null
);

USE videoclub;
DELIMITER //

DROP TRIGGER IF EXISTS act17_trigger_1;
CREATE TRIGGER act17_trigger_1 
  AFTER INSERT ON VISUALITZACIONS
  FOR EACH ROW
    BEGIN 
      declare visualCompletes smallint unsigned;
      declare visualParcials smallint unsigned;
      
      select count(*)
      into visualCompletes
      from VISUALITZACIONS
      where temps is null and id_peli = new.id_peli;

      select count(*)
      into visualParcials
      from VISUALITZACIONS
      where temps is not null and id_peli = new.id_peli;

      update PELLICULES
      set qtatVisualComp = visualCompletes,
      qtatVisualParc = visualParcials
      where id_peli = new.id_peli;

    END//
DELIMITER ;