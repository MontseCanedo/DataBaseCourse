
CREATE TABLE people(
person_id int,
last_name varchar(255),
first_name varchar(255),
address varchar(255),
city varchar(255)
);

SELECT * FROM cursobd.v_people;Apply changes to cursoBD

Apply changes to people

SELECT * FROM cursobd.people LIMIT 0, 1000

create view `v_people` as select * from cursobd.people

use `cursobd`

create or replace view `v_people` as select * from cursobd.people

SELECT * FROM cursobd.v_people LIMIT 0, 1000

alter table `cursobd`.`people` add column `date_of_birth` datetime null after `city`

SELECT * FROM cursobd.people LIMIT 0, 1000

alter table `cursobd`.`people` drop column `date_of_birth`

SELECT * FROM cursobd.people LIMIT 0, 1000

--////esta sección se añade solo para pruebas visuales con la BD////--

-- insert into `cursobd`.`people` (`person_id`, `last_name`, `first_name`, `address`, `city`)
-- 	values ("1","Canedo","Montserrat","Wigger778","La Paz");

-- SELECT * FROM cursobd.people LIMIT 0, 1000

-- insert into `cursobd`.`people` (`person_id`, `last_name`, `first_name`, `address`, `city`)
-- 	values ("2","Canedo","Alejandra","Wigger778","La Paz"),
-- 	("3","Guevara","Carla","Av.Bolivar","Trinidad"),
-- 	("4","Gutiérrez","Yolanda","Wigger778","La Paz"),
-- 	("5","Condori","Luciana","Wigger778","La Paz"),
-- 	("6","Condori","Israel","Wigger778","La Paz"),
-- 	("7","Blacutt","Mauricio","Av.Bolivar","Trinidad"),
-- 	("8","Frank","Roy","Av.Busch","La Paz");

--////***********************************************************////--

SELECT * FROM cursobd.people LIMIT 0, 1000

SELECT * FROM cursobd.v_people LIMIT 0, 1000

DROP TABLE `cursobd`.`people`;

DROP DATABASE `cursobd`;