-- INSERT

insert into `cursobd`.`people`
(`last_name`,
`first_name`,
`address`,
`city`)
values ("Arteaga","Alejandro","Mallasa 1","La Paz"),
("Muruchi","Alvaro","El Alto","La Paz");

-- UPDATE

update `cursobd`.`people`
set last_name = "Gutiérrez", city = "Cochabamba"
where person_id = 1;

update `cursobd`.`people`
set first_name = "None"
where city = "Cochabamba"; -- No lo ejecuta porque es potencialmente muy peligroso para la BD

-- DELETE

delete from people
where person_id = 10;

-- SELECT

select first_name, last_name
from people;