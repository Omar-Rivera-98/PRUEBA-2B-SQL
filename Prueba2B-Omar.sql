/*Script Base de Datos*/
CREATE DATABASE ejemplo2B
GO
USE ejemplo2B
GO
/*Script Creacion de tablas*/
CREATE TABLE Especialidad(
idEspecialidad int identity (1,1) PRIMARY KEY,
nombreEspecialidad VARCHAR (25) not null);

GO
/*Script Creacion de tablas*/
CREATE TABLE Grado(
idGrado int identity (1,1) primary key,
nombreGrado VARCHAR (25) not null);

GO

/*Script Creacion de tablas*/
CREATE TABLE Estudiante(
idEstudiante int identity (100,1) primary key,
nombreEstudiante VARCHAR (25) not null,
apellido VARCHAR (25),
carnet int unique,
edad int not null,
id_Especialidad int,
id_Grado int,
foreign key (id_Grado) references Grado (idGrado),
foreign key (id_Especialidad) references Especialidad(idEspecialidad));
/*Seleccion*/
select * from Grado
select * from Estudiante
select * from Especialidad
/*Inserccion de datos*/
insert into Especialidad values
('Software'),
('Diseño'),
('Arquitectura'),
('Contabilidad'),
('Electromecanica'),
('Renovables'),
('Automotriz'),
('Electronica')
/*Inserccion de datos*/
insert into Grado values
('1º Año'),
('2º Año'),
('3º Año')
/*Inserccion de datos*/
insert into Estudiante values
('Omar Ernesto','Rivera Hernandez','20240600',16,1,1),
('Luis Edgardo','Soriano Rivas','20220011',16,1,1),
('Rosemberg Astul','Ramos','20240100',16,1,1),
('Chelsea Mariana','Mejia Martinez','20241012',16,1,1)
/*Renombramiento de columnas*/
Exec sp_rename 'Estudiante.nombre', 'nombreEstudiante','COLUMN';
Exec sp_rename 'Estudiante.Grado', 'nombreGrado','COLUMN';
/*Seleccion*/
SELECT nombreEstudiante AS Nombre_Estudiante,apellido,edad,
nombreEspecialidad AS Especialidad, nombreGrado AS Grado
from Estudiante AS E
JOIN
Especialidad ON E.id_Especialidad = Especialidad.idEspecialidad
JOIN 
Grado AS G ON E.id_Grado=G.idGrado