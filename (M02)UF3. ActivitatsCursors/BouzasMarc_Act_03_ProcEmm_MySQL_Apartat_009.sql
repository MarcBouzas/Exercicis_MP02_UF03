use videoclub;
drop procedure if exists act9;
delimiter //
create procedure act9()

begin
  declare nomact varchar(30);
  declare edatact smallint;
  declare sexeact varchar(45);
  declare paper varchar(30);
  declare final int default 0;

  declare cursorAct9 cursor for
    select nom_actor,year(curdate()) - anynaix_actor,sexe_actor
	from ACTORS;
  declare CONTINUE HANDLER FOR NOT FOUND SET final = 1;

  open cursorAct9;
  bucle:loop
    fetch cursorAct9 into nomact,edatact,sexeact;
	  if final = 1 then
	    leave bucle;
	  end if;
	  if sexeact = "home" then
        if edatact <15 then
          set paper = "nen";
        elseif edatact >16 and edatact <25 then
          set paper = "home adolescent";
        elseif edatact >25 and edatact <40 then
          set paper = "home adult";
        elseif edatact >40 and edatact <60 then
          set paper = "home madur";
        elseif edatact <61 then
          set paper = "home gran";
        end if;
          
      elseif sexeact = "dona" then
        if edatact <15 then
          set paper = "nena";
        elseif edatact >16 and edatact <25 then
          set paper = "dona adolescent";
        elseif edatact >25 and edatact <40 then
          set paper = "dona adulta";
        elseif edatact >40 and edatact <60 then
          set paper = "dona madura";
        elseif edatact <61 then
          set paper = "dona gran";
        end if;
      end if;
      select nomact,edatact,sexeact,paper;
    end loop bucle;
    close cursorAct9;
end//

delimiter ;

call act9();