CREATE SCHEMA `blog` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `blog`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `blog`.`etiquetas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_etiqueta` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `blog`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(30) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `nickname` VARCHAR(40) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC));

CREATE TABLE `blog`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(130) NOT NULL,
  `fecha_publicacion` TIMESTAMP NULL,
  `contenido` TEXT NOT NULL,
  `estatus` CHAR(8) NULL DEFAULT 'activo',
  `usuario_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `blog`.`posts` 
ADD INDEX `posts_usuarios_idx` (`usuario_id` ASC);
;
ALTER TABLE `blog`.`posts` 
ADD CONSTRAINT `posts_usuarios`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `blog`.`usuarios` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `blog`.`posts` 
ADD INDEX `posts_categorias_idx` (`categoria_id` ASC) VISIBLE;
;
ALTER TABLE `blog`.`posts` 
ADD CONSTRAINT `posts_categorias`
  FOREIGN KEY (`categoria_id`)
  REFERENCES `blog`.`categorias` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `blog`.`comentarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cuerpo_comentario` TEXT NOT NULL,
  `usuario_id` INT NOT NULL,
  `posts_id` INT NOT NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `blog`.`comentarios` 
ADD INDEX `comentarios_usuarios_idx` (`usuario_id` ASC) VISIBLE;
;
ALTER TABLE `blog`.`comentarios` 
ADD CONSTRAINT `comentarios_usuarios`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `blog`.`usuarios` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `blog`.`comentarios` 
ADD INDEX `comentarios_posts_idx` (`posts_id` ASC) VISIBLE;
;
ALTER TABLE `blog`.`comentarios` 
ADD CONSTRAINT `comentarios_posts`
  FOREIGN KEY (`posts_id`)
  REFERENCES `blog`.`posts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `blog`.`posts_etiquetas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `etiqueta_id` INT NOT NULL,
  `posts_id` INT NOT NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `blog`.`posts_etiquetas` 
ADD INDEX `postsetiquetas_post_idx` (`posts_id` ASC) VISIBLE;
;
ALTER TABLE `blog`.`posts_etiquetas` 
ADD CONSTRAINT `postsetiquetas_post`
  FOREIGN KEY (`posts_id`)
  REFERENCES `blog`.`posts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `blog`.`posts_etiquetas` 
ADD INDEX `postsetiquetas_etiquetas_idx` (`etiqueta_id` ASC) VISIBLE;
;
ALTER TABLE `blog`.`posts_etiquetas` 
ADD CONSTRAINT `postsetiquetas_etiquetas`
  FOREIGN KEY (`etiqueta_id`)
  REFERENCES `blog`.`etiquetas` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;