CREATE DATABASE IngSoftware;
USE IngSoftware;

CREATE TABLE persona (
	id INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (id),
	identificacion VARCHAR(20),
	nombre VARCHAR(25),
	apellido VARCHAR(25),
	correoElectronico VARCHAR(25),
	celular VARCHAR(15),
	telefono VARCHAR(15),
	clave VARCHAR(25),
	nivel INT NOT NULL
);


INSERT INTO persona(identificacion,nombre,apellido,correoElectronico,celular,telefono,clave,nivel) VALUES (
	'1073526483','Luis','Reyes','luisre@gmail.com','3134157489','8233408','12345',1);
INSERT INTO persona(identificacion,nombre,apellido,correoElectronico,celular,telefono,clave,nivel) VALUES (
	'79400790','Juan','Vargas','Juanvar@gmail.com','3185478974','8745179','12345',2);

-----------------------------------------------------------------------------------------------------------

CREATE TABLE EmpresaVigilancia (
	NitEmpresa INT NOT NULL,
	PRIMARY KEY (NitEmpresa),
	razonSocial VARCHAR(50),
	direccion VARCHAR(25),
	numeroTelefonico VARCHAR(25),
	celular VARCHAR(25),
	EstadoServicio BOOL
);

INSERT INTO EmpresaVigilancia (NitEmpresa,razonSocial,direccion,numeroTelefonico,celular,EstadoServicio) VALUES(
	'101','Seguridad para todos los residentes...!','Carrera 12 # 32-54','7412221','135748972',0);
INSERT INTO EmpresaVigilancia (NitEmpresa,razonSocial,direccion,numeroTelefonico,celular,EstadoServicio) VALUES(
	'104','Comunicado urgente entre vecinos','Carrera 12 # 32-54','7412221','135748972',1);
--------------------------------------------------------------------------------------------------------------

CREATE TABLE TrabajadorEmpresaVigilancia(
	Cedula INT NOT NULL,
	Nombre VARCHAR(50), 
	Apellido VARCHAR(50),
	Direcciones VARCHAR(50), 
	Telefono VARCHAR(25), 
	celulares VARCHAR(25),
	Estado BOOL,
	NitDeEmpresa INT NOT NULL
);

INSERT INTO TrabajadorEmpresaVigilancia VALUES(
	123456,'Roberto','Gonzales','Carrera 8 num 11','7821212','315457895',0,101), (
	654321,'Carlos','Ramirez','Calle 6 numero 9','1111111','314312457',1,104), (
	654123,'Pedro','Suarez','Calle 5 numero 8','7846574','3144507920',1,101), (
	789456,'Luius','Guillermo','Calle 13 numero 5-66','6784578','3188846047',0,101);


---------------------------------------------------------------------------------------------------------------

CREATE TABLE EmpresaAseo (
	NitEmpresa INT NOT NULL,
	PRIMARY KEY (NitEmpresa),
	razonSocial VARCHAR(50),
	direccion VARCHAR(25),
	numeroTelefonico VARCHAR(25),
	celular VARCHAR(25),
	EstadoServicio BOOL	
);

INSERT INTO EmpresaAseo VALUES(
	'1','Aseo en el conjunto','Carrera 18 # 31-43','7845718','135748972',0);
INSERT INTO EmpresaAseo VALUES(
	'2','Aseo tema de importancia!!','Carrera 4 # 12-12','7412221','3133133131',1);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE TrabajadorEmpresaAseo(
	Cedula INT NOT NULL,
	PRIMARY KEY (Cedula), 
	Nombre VARCHAR(50), 
	Apellido VARCHAR(50),
	Direcciones VARCHAR(50), 
	Telefono VARCHAR(25), 
	celulares VARCHAR(25),
	Estado BOOL,
	NitdeEmpresa INT NOT NULL
);

INSERT INTO TrabajadorEmpresaAseo VALUES(
	1073526478,'Juan','Gonzales','Carrera 5 num 13 a 25','784417','3158744578',0,2), (
	107352678,'Pedro','Ramirez','Calle 5 numero 8','00000','3147418745',1,2), (
	107378945,'Carlos','Cifuentes','Calle 18 # 89-44','87459874','31031031031',1,1), (
	79400854,'Robin','Pedraza','Calle 6 numero 1-44','9874567','1234567',0,2);

---------------------------------------------------------------------------------------------------------------
CREATE TABLE CarteleraSocial(
	cod INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (cod),
	NombreCartelerasocial VARCHAR(250),
	ContenidoCartelerasocial VARCHAR(250)
);

INSERT INTO CarteleraSocial (NombreCartelerasocial, ContenidoCartelerasocial)VALUES('Informacion a todos los residentes','Para todos los residentes del conjunto se brindara una nueva funcionalidad...!');

---------------------------------------------------------------------------------------------------------------

CREATE TABLE Informe(
	codigopdf INT NOT NULL AUTO_INCREMENT,
  	PRIMARY KEY (codigopdf),
        nombrepdf VARCHAR(50),
	archivopdf mediumblob
);

INSERT INTO Informe(nombrepdf,archivopdf) values ('Residentes',NULL);
---------------------------------------------------------------------------------------------------------------

CREATE TABLE Noticia(
	Identificador INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (Identificador),
	NombreNoticia VARCHAR(50),
	ContenidoNoticia VARCHAR(250)
);

INSERT INTO Noticia (nombrenoticia,contenidonoticia) VALUES ('Alarma a los residentes','Posible delincuencia en el parqueadero del conjunto');
---------------------------------------------------------------------------------------------------------------

CREATE TABLE Evento(
	Identificador INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (Identificador),
	NombreEvento VARCHAR(50),
	ContenidoEvento VARCHAR(250),
	FechaEvento DATE
);

INSERT INTO Evento (NombreEvento,ContenidoEvento,FechaEvento) VALUES ('Concierto','Se invita a todos los residentes a nuestro concierto el dia ','2012-06-07');
---------------------------------------------------------------------------------------------------------------

ALTER TABLE TrabajadorEmpresaAseo ADD CONSTRAINT traba_1 FOREIGN KEY (NitDeEmpresa) REFERENCES EmpresaAseo(NitEmpresa);
ALTER TABLE TrabajadorEmpresaVigilancia ADD CONSTRAINT traba_2 FOREIGN KEY (NitDeEmpresa) REFERENCES EmpresaVigilancia(NitEmpresa);


SELECT nitempresa,cedula,nombre,apellido,direcciones,telefono,celulares,estado FROM EmpresaAseo INNER JOIN TrabajadorEmpresaAseo ON EmpresaAseo.nitempresa = TrabajadorEmpresaAseo.NitDeEmpresa WHERE NitEmpresa =1;
SELECT nitempresa,cedula,nombre,apellido,direcciones,telefono,celulares,estado FROM EmpresaVigilancia INNER JOIN TrabajadorEmpresaVigilancia ON EmpresaVigilancia.nitempresa = TrabajadorEmpresaVigilancia.NitDeEmpresa WHERE NitEmpresa =101;








