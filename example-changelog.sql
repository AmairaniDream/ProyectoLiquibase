--liquibase formatted sql

--changeset Alejandro:1 labels:example-label context:example-context
--comment: example comment
create table person (
    id int primary key auto_increment not null,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
)
--rollback DROP TABLE person;

--changeset Alejandro
--comment: Creacion de la tabla Cursos
CREATE TABLE IF NOT EXISTS Cursos (
    ID_Curso INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    ID_Instructor INT,
    Descripcion VARCHAR(50),
    Estado VARCHAR(50)
);

--changeset Alejandro
--comment: Creacion de la tabla Materiales
CREATE TABLE IF NOT EXISTS Materiales (
    ID_Material INT PRIMARY KEY AUTO_INCREMENT,
    ID_Curso INT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(50),
    FPublicacion DATE,
    URL VARCHAR(250)
);

--changeset Alejadnro
--comment: Creacion de las llaves foraneas ID_Instructor en tabla cursos y ID_Curso en tabla metariales
ALTER TABLE Materiales
ADD CONSTRAINT FK_Materiales_Cursos
FOREIGN KEY (ID_Curso) REFERENCES cursos(ID_Curso);

ALTER TABLE Cursos
ADD CONSTRAINT FK_Cursos_Asignacion
FOREIGN KEY (ID_Instructor) REFERENCES asignacion(ID_Instructor);

--rollback DROP TABLE company;

--changeset other.dev:3 labels:example-label context:example-context
--comment: example comment
alter table person add column country varchar(2)
--rollback ALTER TABLE person DROP COLUMN country;

