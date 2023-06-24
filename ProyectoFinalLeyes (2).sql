CREATE database IF NOT EXISTS `ProyectoFinal`;
USE `ProyectoFinal`;

CREATE TABLE IF NOT EXISTS `ProyectoFinal`.`Categoria_Norma` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `Categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ProyectoFinal`.`Tipo_Normativa` (
  `idTipo_Normativa` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(100) NULL,
  PRIMARY KEY (`idTipo_Normativa`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ProyectoFinal`.`Organo_Publico` (
  `idOrganos` INT NOT NULL AUTO_INCREMENT,
  `Organos_Legislativos` VARCHAR(55) NOT NULL,
  `ambito_Aplicacion` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idOrganos`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ProyectoFinal`.`Descripcion` (
  `idDescripcion` INT NOT NULL AUTO_INCREMENT,
  `Descripcion_Norma` VARCHAR(120) NULL,
  `Palabras_Claves` VARCHAR(45) NULL,
  PRIMARY KEY (`idDescripcion`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ProyectoFinal`.`Normativa` (
  `idNormativa` INT NOT NULL AUTO_INCREMENT,
  `Numero_Normativa`INT NULL,
  `idCategoria` INT NOT NULL,
  `idTipo_Normativa` INT NOT NULL,
  `idOrganos` INT NOT NULL,
  `idDescripcion` INT NOT NULL,
  PRIMARY KEY (`idNormativa`, `idTipo_Normativa`, `idOrganos`, `idCategoria`, `idDescripcion`),
INDEX `idCategoria_idx` (`idCategoria` ASC) VISIBLE,
  INDEX `fk_Normativa_Tipo_Normativa1_idx` (`idTipo_Normativa` ASC) VISIBLE,
  INDEX `idOrganos_idx` (`idOrganos` ASC) VISIBLE,
  INDEX `idDescripcion_idx` (`idDescripcion` ASC) VISIBLE,
  CONSTRAINT `idCategoria`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `ProyectoFinal`.`Categoria_Norma` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Normativa_Tipo_Normativa1`
    FOREIGN KEY (`idTipo_Normativa`)
    REFERENCES `ProyectoFinal`.`Tipo_Normativa` (`idTipo_Normativa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idOrganos`
    FOREIGN KEY (`idOrganos`)
    REFERENCES `ProyectoFinal`.`Organo_Publico` (`idOrganos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idDescripcion`
    FOREIGN KEY (`idDescripcion`)
    REFERENCES `ProyectoFinal`.`Descripcion` (`idDescripcion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into Categoria_Norma (Categoria) values ('Laboral'),('Penal'),('Derecho Informático'),('Civil'),('Procesal');
insert into Tipo_Normativa (Tipo) values ('Ley'), ('Decreto'), ('Resolución'), ('Informes');
insert into organo_publico (Organos_Legislativos,ambito_Aplicacion) value ('Honorable Congreso de la Nación','Nación'), ('Legislatura de la Provincia de Córdoba','Provincia'),('El Sen. Y Cám. de Dip. de la Prov. de Cba.', 'Provincia');
INSERT INTO Descripcion ( Descripcion_Norma, Palabras_Claves) VALUES ('Ley de Contrato de Trabajo.Regula las relaciones laborales de los trabajadores bajo relación de dependencia', 'Trabajo - Condiciones laborales - Gremio');
INSERT INTO Descripcion ( Descripcion_Norma, Palabras_Claves) VALUES ('La ley de Teletrabajo. Modifica la ley de Contrato de Trabajo.Regula los der.yoblig. cuando la rel. lab. es a distancia.', 'Teletrabajo - Trabajo remoto - A distancia');
INSERT INTO Descripcion ( Descripcion_Norma, Palabras_Claves) VALUES ('Ley de Ejercicio Profesional de la Informática en Córdoba. Regulación y matriculación del Ejer. prof. de la Informática', 'Informatica - matriculación - Córdoba');
INSERT INTO Normativa ( Numero_Normativa, idCategoria, idTipo_Normativa, idOrganos, idDescripcion) VALUES (20744, 1, 1, 1, 1);
INSERT INTO Normativa ( Numero_Normativa, idCategoria, idTipo_Normativa, idOrganos, idDescripcion) VALUES (27555, 1, 1, 1, 2);
INSERT INTO Normativa ( Numero_Normativa, idCategoria, idTipo_Normativa, idOrganos, idDescripcion) VALUES (20744, 3, 1, 3, 3);