use videoclub;
drop procedure if exists act8;
delimiter //
create procedure act8()
begin
   declare recap bigint default 0;
   declare press bigint default 0;
   declare titol varchar(40);
   declare rend varchar(15);
   declare final int default false;
   
   declare elcursor cursor for
      select titol_peli, recaudacio_peli, presspost_peli
      from PELLICULES;

   declare continue handler for not found set final = 1;
   open elcursor;
   bucle:loop
      fetch elcursor into titol, recap, press;
      
      if final = 1 then
         leave bucle;
      end if;
      
      if (recap<press*2) then
         set rend = "Suficient";
      elseif (recap<press) then
	     set rend = "Deficitari";
      else
         set rend = "Be";
      end if;
      select titol, rend;
   
   end loop bucle; 
   close elcursor;
end//

delimiter ;

