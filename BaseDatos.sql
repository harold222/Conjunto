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
	nivel INT NOT NULL);


INSERT INTO persona(identificacion,nombre,apellido,correoElectronico,celular,telefono,clave,nivel) VALUES (
	'1073526483','Luis','Reyes','luisre@gmail.com','3134157489','8233408','12345',1);
INSERT INTO persona(identificacion,nombre,apellido,correoElectronico,celular,telefono,clave,nivel) VALUES (
	'79400790','Juan','Vargas','Juanvar@gmail.com','3185478974','8745179','12345',2);

-----------------------------------------------------------------------------------------------------------

CREATE TABLE EmpresaVigilancia (
	NitEmpresa INT NOT NULL,
	PRIMARY KEY (NitEmpresa),
	razonSocial VARCHAR(25),
	direccion VARCHAR(25),
	numeroTelefonico VARCHAR(25),
	celular VARCHAR(25),
	EstadoServicio BOOL);

INSERT INTO EmpresaVigilancia (NitEmpresa,razonSocial,direccion,numeroTelefonico,celular,EstadoServicio) VALUES(
	'101','Seguridad para todos los residentes...!','Carrera 12 # 32-54','7412221','135748972',0);
INSERT INTO EmpresaVigilancia (NitEmpresa,razonSocial,direccion,numeroTelefonico,celular,EstadoServicio) VALUES(
	'104','Comunicado urgente entre vecinos','Carrera 12 # 32-54','7412221','135748972',1);
