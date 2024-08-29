--liquibase formatted sql 
--changeset AlbertoMontano:1
create table test1(
    id int primary key,
    name varchar(255)
);
-- rollback drop table test1;
--changeset AlbertoMontano:2
insert into test1(id, name) values (1, 'name 1');
-- changeset AlbertoMontano:3
insert into test1(id, name) values (2, 'name 2');
