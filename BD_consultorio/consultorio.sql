create schema `consultorio` default character set utf8;


create table `consultorio`.`analisis`(
`id` INT not null auto_increment,
`cantidad` INT not null,
`importancia` char,
`nombre` varchar(15),
primary key (`id`)
);

create table `consultorio`.`doctores`(
`id_doc` INT not null auto_increment,
`nombre` varchar(25),
`apellido` varchar(25),
`especialidad` char,
primary key (`id_doc`)
);


create table `consultorio`.`tratamiento`(
`id_tratamiento` INT not null auto_increment,
`nombre` varchar(30),
`especialidad` varchar(15),
primary key (`id_tratamiento`)
);

create table `consultorio`.`pacientes`(
`id` INT not null auto_increment,
`nombre` varchar(25),
`apellido` varchar(25),
`edad` int,
`direccion` varchar(30),
`telefono` char(8),
primary key (`id`)
);

ALTER TABLE `consultorio`.`tratamiento` 
ADD COLUMN `id_doc` INT NOT NULL AFTER `especialidad`;

ALTER TABLE `consultorio`.`tratamiento` 
DROP COLUMN `id_doc`;

ALTER TABLE `consultorio`.`pacientes` 
ADD COLUMN `id_doc` INT NOT NULL AFTER `telefono`;

alter table `consultorio`.`pacientes`
add index `pacientes_doctores_idx` (`id_doc` ASC);
;
alter table `consultorio`.`pacientes`
add constraint `pacientes_doctores`
	foreign key (`id_doc`)
    references `consultorio`.`doctores` (`id_doc`)
    on delete no action
    on update no action;

create table `consultorio`.`analisis_pacientes`(
`id` INT not null auto_increment,
`id_paciente` int not null,
`id_analisis` int not null,
primary key (`id`)
);

alter table `consultorio`.`analisis_pacientes`
add index `analisispacientes_pacientes_idx` (`id_paciente` asc);
;
alter table `consultorio`.`analisis_pacientes`
add constraint `analisispacientes_pacientes`
	foreign key (`id_paciente`)
    references `consultorio`.`pacientes` (`id`)
    on delete cascade
    on update cascade;

alter table `consultorio`.`analisis_pacientes`
add index `analisispacientes_analisis_idx` (`id_analisis` asc);
;
alter table `consultorio`.`analisis_pacientes`
add constraint `analisispacientes_analisis`
	foreign key (`id_analisis`)
    references `consultorio`.`analisis` (`id`)
    on delete cascade
    on update cascade;

 create table `consultorio`.`historia_clinica`(
`id_paciente` int not null,
`fecha` date,
`precio` int not null
);