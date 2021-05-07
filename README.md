# Correcció exercicis

Revisió dels exercicis de la **unitat formativa 3** del **mòdul professional 2**.

|Enunciat|Fitxer|Comentari|Nota|
|--------|------|---------|----|
|**Enunciat 9**|?????|?????|?????|
|**Enunciat 11**|?????|?????|?????|
|**Enunciat 12**|?????|?????|?????|
|**Enunciat 13**|?????|?????|?????|


# Exemple de correcció

Cal que ompliu el fitxer **```README.md```** del vostre repositori amb la següent informació per a cadascun dels enunciats.

# **Enunciat 8**:

## Emprant l’**activitat 6**, dissenya un cursor que llisti els mateixos camps per a totes les pel·lícules.

**1. Enllaç al fitxer**

[Act08.sql](https://github.com/joanpardogine/exercicis_mp02_uf03/blob/master/Cursors/Act08.sql)

**2. Contingut del fitxer**

```sql
use videoclub;
drop procedure if exists act8;
delimiter //
create procedure act8()
begin
   declare recaptat bigint default 0;
   declare pressu bigint default 0;
   declare titol varchar(40);
   declare rendibilitat varchar(15);
   declare final int default false;
   
   declare elcursor cursor for
      select titol_peli, recaudacio_peli, pressupost_peli
      from PELLICULES;

   declare continue handler for not found set final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into titol, recaptat, pressu;
      
      if final = 1 then
         leave elbucle;
      end if;
      
      if (pressu>recaptat) then
         set rendibilitat = "Deficitari";
      elseif (pressu*2 > recaptat) then
         set rendibilitat = "Suficient";
      else
         set rendibilitat = "Bona";
      end if;
      
      select titol, rendibilitat;
   
   end loop elbucle; 
   close elcursor;
end//

delimiter ;

-- call act8();
```

**3. Sortida de la creació del procediment**
```sql
mysql> use videoclub;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> drop procedure if exists act8;
Query OK, 0 rows affected (1.69 sec)

mysql> delimiter //
mysql> create procedure act8()
    -> begin
    ->    declare recaptat bigint default 0;
    ->    declare pressu bigint default 0;
    ->    declare titol varchar(40);
    ->    declare rendibilitat varchar(15);
    ->    declare final int default false;
    ->    
    ->    declare elcursor cursor for
    ->       select titol_peli, recaudacio_peli, pressupost_peli
    ->       from PELLICULES;
    -> 
    ->    declare continue handler for not found set final = 1;
    ->    open elcursor;
    ->    elbucle:loop
    ->       fetch elcursor into titol, recaptat, pressu;
    ->       
    ->       if final = 1 then
    ->          leave elbucle;
    ->       end if;
    ->       
    ->       if (pressu>recaptat) then
    ->          set rendibilitat = "Deficitari";
    ->       elseif (pressu*2 > recaptat) then
    ->          set rendibilitat = "Suficient";
    ->       else
    ->          set rendibilitat = "Bona";
    ->       end if;
    ->       
    ->       select titol, rendibilitat;
    ->    
    ->    end loop elbucle; 
    ->    close elcursor;
    -> end//
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> delimiter ;
mysql> 
```

**4. Sortida de l'execució del procediment**
```sql
mysql> call act8();
+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| LA BUSQUEDA | Suficient    |
+-------------+--------------+
1 row in set (0.00 sec)

+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| LA TERMINAL | Bona         |
+-------------+--------------+
1 row in set (0.00 sec)

+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| Mar adentro | Bona         |
+-------------+--------------+
1 row in set (0.00 sec)

+-----------+--------------+
| titol     | rendibilitat |
+-----------+--------------+
| Colateral | Bona         |
+-----------+--------------+
1 row in set (0.00 sec)

+--------------------+--------------+
| titol              | rendibilitat |
+--------------------+--------------+
| Los 4 fantásticos  | Suficient    |
+--------------------+--------------+
1 row in set (0.00 sec)

+----------+--------------+
| titol    | rendibilitat |
+----------+--------------+
| Sin City | Suficient    |
+----------+--------------+
1 row in set (0.00 sec)

+----------+--------------+
| titol    | rendibilitat |
+----------+--------------+
| IRON MAN | Bona         |
+----------+--------------+
1 row in set (0.00 sec)

+----------------+--------------+
| titol          | rendibilitat |
+----------------+--------------+
| Los Vengadores | Bona         |
+----------------+--------------+
1 row in set (0.00 sec)

+----------------------------------+--------------+
| titol                            | rendibilitat |
+----------------------------------+--------------+
| Los Vengadores: La era de Ultron | Bona         |
+----------------------------------+--------------+
1 row in set (0.00 sec)

+----------------------------------+--------------+
| titol                            | rendibilitat |
+----------------------------------+--------------+
| La busqueda 2: El diario secreto | Bona         |
+----------------------------------+--------------+
1 row in set (0.00 sec)

+------------+--------------+
| titol      | rendibilitat |
+------------+--------------+
| IRON MAN 2 | Bona         |
+------------+--------------+
1 row in set (0.00 sec)

+------------+--------------+
| titol      | rendibilitat |
+------------+--------------+
| Iron Man 3 | Bona         |
+------------+--------------+
1 row in set (0.00 sec)

+---------------------------------------+--------------+
| titol                                 | rendibilitat |
+---------------------------------------+--------------+
| Capitán América: El primer vengador   | Bona         |
+---------------------------------------+--------------+
1 row in set (0.00 sec)

+-------------------------------------------+--------------+
| titol                                     | rendibilitat |
+-------------------------------------------+--------------+
| Capitán América: El Soldado de Invierno   | Bona         |
+-------------------------------------------+--------------+
1 row in set (0.01 sec)

+------------------------------+--------------+
| titol                        | rendibilitat |
+------------------------------+--------------+
| Capitán América: Civil War   | Bona         |
+------------------------------+--------------+
1 row in set (0.01 sec)

+-------+--------------+
| titol | rendibilitat |
+-------+--------------+
| Joker | Deficitari   |
+-------+--------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)
```

---

# **Enunciat 9**:

## Emprant l’**activitat 7**, dissenya un cursor que llisti els mateixos camps per a tots els intèrprets.

**1. Enllaç al fitxer**
[act9.sql](https://github.com/MarcBouzas/Exercicis_MP02_UF03/blob/2f6ead06e452bf3f5e8b356214a8d368816aaf79/(M02)UF3.%20ActivitatsCursors/BouzasMarc_Act_03_ProcEmm_MySQL_Apartat_009.sql)
**2. Contingut del fitxer**
```sql
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
```

**3. Sortida de la creació del procediment**
```sql
   mysql>    use videoclub;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> drop procedure if exists act9;
Query OK, 0 rows affected, 3 warnings (0.01 sec)

mysql> delimiter //
mysql> create procedure act9()
    ->
    -> begin
    ->   declare nomact varchar(30);
    ->   declare edatact smallint;
    ->   declare sexeact varchar(45);
    ->   declare paper varchar(30);
    ->   declare final int default 0;
    ->
    ->   declare cursorAct9 cursor for
    ->     select nom_actor,year(curdate()) - anynaix_actor,sexe_actor
    -> from ACTORS;
    ->   declare CONTINUE HANDLER FOR NOT FOUND SET final = 1;
    ->
    ->   open cursorAct9;
    ->   bucle:loop
    ->     fetch cursorAct9 into nomact,edatact,sexeact;
    ->   if final = 1 then
    ->     leave bucle;
    ->   end if;
    ->   if sexeact = "home" then
    ->         if edatact <15 then
    ->           set paper = "nen";
    ->         elseif edatact >16 and edatact <25 then
    ->           set paper = "home adolescent";
    ->         elseif edatact >25 and edatact <40 then
    ->           set paper = "home adult";
    ->         elseif edatact >40 and edatact <60 then
    ->           set paper = "home madur";
    ->         elseif edatact <61 then
    ->           set paper = "home gran";
    ->         end if;
    ->
    ->       elseif sexeact = "dona" then
    ->         if edatact <15 then
    ->           set paper = "nena";
    ->         elseif edatact >16 and edatact <25 then
    ->           set paper = "dona adolescent";
    ->         elseif edatact >25 and edatact <40 then
    ->           set paper = "dona adulta";
    ->         elseif edatact >40 and edatact <60 then
    ->           set paper = "dona madura";
    ->         elseif edatact <61 then
    ->           set paper = "dona gran";
    ->         end if;
    ->       end if;
    ->       select nomact,edatact,sexeact,paper;
    ->     end loop bucle;
    ->     close cursorAct9;
    -> end//
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> delimiter ;

```

**4. Sortida de l'execució del procediment**
```sql
   mysql> call act9();
+--------------+---------+---------+------------+
| nomact       | edatact | sexeact | paper      |
+--------------+---------+---------+------------+
| Nicolas Cage |      57 | home    | home madur |
+--------------+---------+---------+------------+
1 row in set (0.01 sec)

+--------------+---------+---------+-------------+
| nomact       | edatact | sexeact | paper       |
+--------------+---------+---------+-------------+
| Diane Kruger |      45 | dona    | dona madura |
+--------------+---------+---------+-------------+
1 row in set (0.01 sec)

+-----------+---------+---------+-------------+
| nomact    | edatact | sexeact | paper       |
+-----------+---------+---------+-------------+
| Tom Hanks |      65 | home    | dona madura |
+-----------+---------+---------+-------------+
1 row in set (0.01 sec)

+----------------------+---------+---------+-------------+
| nomact               | edatact | sexeact | paper       |
+----------------------+---------+---------+-------------+
| Catherine Zeta-Jones |      52 | dona    | dona madura |
+----------------------+---------+---------+-------------+
1 row in set (0.01 sec)

+---------------+---------+---------+------------+
| nomact        | edatact | sexeact | paper      |
+---------------+---------+---------+------------+
| Javier Bardem |      52 | home    | home madur |
+---------------+---------+---------+------------+
1 row in set (0.01 sec)

+------------+---------+---------+------------+
| nomact     | edatact | sexeact | paper      |
+------------+---------+---------+------------+
| Tom Cruise |      59 | home    | home madur |
+------------+---------+---------+------------+
1 row in set (0.01 sec)

+------------+---------+---------+------------+
| nomact     | edatact | sexeact | paper      |
+------------+---------+---------+------------+
| Jamie Foxx |      54 | home    | home madur |
+------------+---------+---------+------------+
1 row in set (0.01 sec)

+--------------+---------+---------+-----------+
| nomact       | edatact | sexeact | paper     |
+--------------+---------+---------+-----------+
| Jessica Alba |      40 | dona    | dona gran |
+--------------+---------+---------+-----------+
1 row in set (0.01 sec)

+---------------+---------+---------+------------+
| nomact        | edatact | sexeact | paper      |
+---------------+---------+---------+------------+
| Ioan Gruffudd |      48 | home    | home madur |
+---------------+---------+---------+------------+
1 row in set (0.01 sec)

+-------------------+---------+---------+------------+
| nomact            | edatact | sexeact | paper      |
+-------------------+---------+---------+------------+
| Robert Downey Jr. |      56 | home    | home madur |
+-------------------+---------+---------+------------+
1 row in set (0.01 sec)

+-----------------+---------+---------+-------------+
| nomact          | edatact | sexeact | paper       |
+-----------------+---------+---------+-------------+
| Gwyneth Paltrow |      49 | dona    | dona madura |
+-----------------+---------+---------+-------------+
1 row in set (0.01 sec)

+-----------------+---------+---------+------------+
| nomact          | edatact | sexeact | paper      |
+-----------------+---------+---------+------------+
| Chris Hemsworth |      38 | home    | home adult |
+-----------------+---------+---------+------------+
1 row in set (0.01 sec)

+--------------+---------+---------+------------+
| nomact       | edatact | sexeact | paper      |
+--------------+---------+---------+------------+
| Mark Ruffalo |      54 | home    | home madur |
+--------------+---------+---------+------------+
1 row in set (0.01 sec)

+-------------+---------+---------+-----------+
| nomact      | edatact | sexeact | paper     |
+-------------+---------+---------+-----------+
| Chris Evans |      40 | home    | home gran |
+-------------+---------+---------+-----------+
1 row in set (0.01 sec)

+--------------------+---------+---------+-------------+
| nomact             | edatact | sexeact | paper       |
+--------------------+---------+---------+-------------+
| Scarlett Johansson |      37 | dona    | dona adulta |
+--------------------+---------+---------+-------------+
1 row in set (0.01 sec)

+---------------+---------+---------+-----------+
| nomact        | edatact | sexeact | paper     |
+---------------+---------+---------+-----------+
| Jeremy Renner |      40 | home    | home gran |
+---------------+---------+---------+-----------+
1 row in set (0.01 sec)

+--------------+---------+---------+-----------+
| nomact       | edatact | sexeact | paper     |
+--------------+---------+---------+-----------+
| James Spader |      61 | home    | home gran |
+--------------+---------+---------+-----------+
1 row in set (0.01 sec)

+-----------------+---------+---------+------------+
| nomact          | edatact | sexeact | paper      |
+-----------------+---------+---------+------------+
| Michael Chiklis |      52 | home    | home madur |
+-----------------+---------+---------+------------+
1 row in set (0.02 sec)

+---------------+---------+---------+-------------+
| nomact        | edatact | sexeact | paper       |
+---------------+---------+---------+-------------+
| Hayley Atwell |      39 | dona    | dona adulta |
+---------------+---------+---------+-------------+
1 row in set (0.02 sec)

+----------------+---------+---------+------------+
| nomact         | edatact | sexeact | paper      |
+----------------+---------+---------+------------+
| Sebastian Stan |      39 | home    | home adult |
+----------------+---------+---------+------------+
1 row in set (0.02 sec)

+----------+---------+---------+------------+
| nomact   | edatact | sexeact | paper      |
+----------+---------+---------+------------+
| Tim Hill |     271 | Home    | home adult |
+----------+---------+---------+------------+
1 row in set (0.02 sec)

+-------------+---------+---------+------------+
| nomact      | edatact | sexeact | paper      |
+-------------+---------+---------+------------+
| Scott Frank |      34 | Home    | home adult |
+-------------+---------+---------+------------+
1 row in set (0.02 sec)

+------------+---------+---------+------------+
| nomact     | edatact | sexeact | paper      |
+------------+---------+---------+------------+
| Walt Dohrn |      31 | Home    | home adult |
+------------+---------+---------+------------+
1 row in set (0.02 sec)

Query OK, 0 rows affected (0.02 sec)

mysql>

```

---

# **Enunciat 11**:

## Dissenya una funció que rebent un codi de pel·lícula torni el nombre d’usuaris que l’han vist.<br>Utilitza aquesta funció per llistar el títol de la pel·lícula i el nom de l’usuari.

**1. Enllaç al fitxer**

**2. Contingut del fitxer**
```sql
   <El codi del vostre fitxer>
```

**3. Sortida de la creació del procediment**
```sql
   <La sortida de la creació del vostre procediment>
```

**4. Sortida de l'execució del procediment**
```sql
   <La sortida de l'execució del vostre procediment>
```

---

# **Enunciat 12**:

## Dissenya una funció que rebi el codi d’una pel·lícula i torni el nom i cognoms del seu actor principal.<br>Utilitza aquesta funció per llistar el títol de la pel·lícula i el nom i cognoms del seu actor principal.

**1. Enllaç al fitxer**

**2. Contingut del fitxer**
```sql
   <El codi del vostre fitxer>
```

**3. Sortida de la creació del procediment**
```sql
   <La sortida de la creació del vostre procediment>
```

**4. Sortida de l'execució del procediment**
```sql
   <La sortida de l'execució del vostre procediment>
```

---

# **Enunciat 13**:

## Fes una funció que torni el codi de pel·lícula que més ha recaptat.<br>Emprant la funció anterior i la funció de l’**activitat 12**, llista el títol, actor principal i recaptació de la pel·lícula que més ha recaptat.

**1. Enllaç al fitxer**

**2. Contingut del fitxer**
```sql
   <El codi del vostre fitxer>
```

**3. Sortida de la creació del procediment**
```sql
   <La sortida de la creació del vostre procediment>
```

**4. Sortida de l'execució del procediment**
```sql
   <La sortida de l'execució del vostre procediment>
```

---

