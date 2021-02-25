USE videoclub;
CREATE TABLE VISUALITZACIONS(
	temps time,
	id_peli smallint unsigned not null,
	id_soci varchar (10) not null,
	PRIMARY KEY (id_peli,id_soci),
	FOREIGN KEY (id_peli) REFERENCES PELLICULES (id_peli),
	FOREIGN KEY (id_soci) REFERENCES SOCIS (id_soci));

INSERT INTO VISUALITZACIONS(temps,id_peli,id_soci)
VALUES ('00:00:01','1','111'),
	('05:00:02','2','112'),
	('01:00:03','3','113'),
	('01:00:04','4','111'),
	('01:00:05','5','112'),
	('00:04:06','6','113'),
	('00:07:01','7','111'),
	('01:00:01','8','112'),
	('08:00:01','9','113'),
	('00:10:01','10','111'),
	('00:00:01','11','112'),
	('09:04:01','12','113'),
	('02:00:11','13','111'),
	('03:00:41','14','112'),
	('04:00:21','15','113');

