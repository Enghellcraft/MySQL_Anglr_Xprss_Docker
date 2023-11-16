-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empresa` (
  `id_empresa` INT NOT NULL,
  `razon_social` VARCHAR(45) NULL,
  `domicilio` VARCHAR(45) NULL,
  PRIMARY KEY (`id_empresa`),
  UNIQUE INDEX `id_repositor_UNIQUE` (`id_empresa` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO `Empresa` (`id_empresa`, `razon_social`, `domicilio`) VALUES
(1, 'Productos Alimenticios S.A.', 'Calle Principal 123'),
(2, 'Bebidas Refrescantes Inc.', 'Avenida Central 456'),
(3, 'Distribución de Lácteos S.L.', 'Calle de los Lácteos 789'),
(4, 'Snacks Saludables Ltda.', 'Avenida de los Snacks 101');


-- -----------------------------------------------------
-- Table `mydb`.`Repositor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Repositor` (
  `id_repositor` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `id_empresa` INT NOT NULL,
  PRIMARY KEY (`id_repositor`),
  UNIQUE INDEX `id_repositor_UNIQUE` (`id_repositor` ASC) VISIBLE,
  INDEX `fk_Repositor_Empresa1_idx` (`id_empresa` ASC) VISIBLE,
  CONSTRAINT `id_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `mydb`.`Empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Repositor` (`id_repositor`, `nombre`, `id_empresa`) VALUES
(1, 'Denise Mabel Martin', 1),
(2, 'Juan Segundo Texeira Pasquali', 2),
(3, 'Franco Polesel', 1),
(4, 'Lucas Cejas', 3),
(5, 'Alejandro Daniel Nava', 3);
-- -----------------------------------------------------
-- Table `mydb`.`Sector`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sector` (
  `id_sector` INT NOT NULL,
  `desc_sector` VARCHAR(45) NULL,
  PRIMARY KEY (`id_sector`),
  UNIQUE INDEX `id_gondola_UNIQUE` (`id_sector` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO `Sector` (`id_sector`, `desc_sector`) VALUES
(1, 'Gaseosas'),
(2, 'Snacks'),
(3, 'Pastas'),
(4, 'Lácteos');
-- -----------------------------------------------------
-- Table `mydb`.`Gondola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gondola` (
  `id_gondola` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `id_sector` INT NOT NULL,
  PRIMARY KEY (`id_gondola`),
  UNIQUE INDEX `id_gondola_UNIQUE` (`id_gondola` ASC) VISIBLE,
  INDEX `fk_Gondola_Sector1_idx` (`id_sector` ASC) VISIBLE,
  CONSTRAINT `id_sector`
    FOREIGN KEY (`id_sector`)
    REFERENCES `mydb`.`Sector` (`id_sector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Gondola` (`id_gondola`, `nombre`, `id_sector`) VALUES
(1, 'Góndola 1', 1),
(2, 'Góndola 2', 2),
(3, 'Góndola 3', 1),
(4, 'Góndola 4', 3);
-- -----------------------------------------------------
-- Table `mydb`.`Flia_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Flia_Producto` (
  `id_fila` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id_fila`),
  UNIQUE INDEX `id_producto_UNIQUE` (`id_fila` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO `Flia_Producto` (`id_fila`, `nombre`) VALUES
(1, 'Familia de Productos 1'),
(2, 'Familia de Productos 2'),
(3, 'Familia de Productos 3'),
(4, 'Familia de Productos 4');
-- -----------------------------------------------------
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producto` (
  `id_producto` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `id_producto_reemplazo` INT NULL,
  `Flia_Producto_id_fila` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE INDEX `id_producto_UNIQUE` (`id_producto` ASC) VISIBLE,
  INDEX `fk_Producto_Flia_Producto1_idx` (`Flia_Producto_id_fila` ASC) VISIBLE,
  CONSTRAINT `id_fila`
    FOREIGN KEY (`Flia_Producto_id_fila`)
    REFERENCES `mydb`.`Flia_Producto` (`id_fila`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Producto` (`id_producto`, `nombre`, `descripcion`, `id_producto_reemplazo`, `Flia_Producto_id_fila`) VALUES
(1, 'Producto 1', 'Descripción del Producto 1', 4, 1),
(2, 'Producto 2', 'Descripción del Producto 2', 3, 2),
(3, 'Producto 3', 'Descripción del Producto 3', 1, 3),
(4, 'Producto 4', 'Descripción del Producto 4', 2, 4);
-- -----------------------------------------------------
-- Table `mydb`.`Presentacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Presentacion` (
  `id_presentacion` INT NOT NULL,
  `desc_presentacion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_presentacion`),
  UNIQUE INDEX `id_presentacion_UNIQUE` (`id_presentacion` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO `Presentacion` (`id_presentacion`, `desc_presentacion`) VALUES
(1, 'Presentación 1'),
(2, 'Presentación 2'),
(3, 'Presentación 3'),
(4, 'Presentación 4');
-- -----------------------------------------------------
-- Table `mydb`.`Gondola_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gondola_Producto` (
  `id_producto` INT NOT NULL,
  `id_gondola` INT NOT NULL,
  `Presentacion_id_presentacion` INT NOT NULL,
  PRIMARY KEY (`id_producto`, `id_gondola`),
  INDEX `fk_Gondola_has_Producto_Producto1_idx` (`id_producto` ASC) VISIBLE,
  INDEX `fk_Gondola_has_Producto_Gondola1_idx` (`id_gondola` ASC) VISIBLE,
  INDEX `fk_Gondola_Producto_Presentacion1_idx` (`Presentacion_id_presentacion` ASC) VISIBLE,
  CONSTRAINT `id_gondola`
    FOREIGN KEY (`id_gondola`)
    REFERENCES `mydb`.`Gondola` (`id_gondola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_producto`
    FOREIGN KEY (`id_producto`)
    REFERENCES `mydb`.`Producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gondola_Producto_Presentacion1`
    FOREIGN KEY (`Presentacion_id_presentacion`)
    REFERENCES `mydb`.`Presentacion` (`id_presentacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Gondola_Producto` (`id_producto`, `id_gondola`, `Presentacion_id_presentacion`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);
-- -----------------------------------------------------
-- Table `mydb`.`Gondola_Producto_Repositor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gondola_Producto_Repositor` (
  `id_producto` INT NOT NULL,
  `id_gondola` INT NOT NULL,
  `id_repositor` INT NOT NULL,
  `fecha` VARCHAR(45) NULL,
  `cantidad` INT NULL,
  PRIMARY KEY (`id_producto`, `id_gondola`),
  INDEX `fk_Gondola_Producto_has_Repositor_Repositor1_idx` (`id_repositor` ASC) VISIBLE,
  INDEX `fk_Gondola_Producto_has_Repositor_Gondola_Producto1_idx` (`id_producto` ASC, `id_gondola` ASC) VISIBLE,
  CONSTRAINT `id_gondola_producto`
    FOREIGN KEY (`id_producto` , `id_gondola`)
    REFERENCES `mydb`.`Gondola_Producto` (`id_producto` , `id_gondola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_resitor`
    FOREIGN KEY (`id_repositor`)
    REFERENCES `mydb`.`Repositor` (`id_repositor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Gondola_Producto_Repositor` (`id_producto`, `id_gondola`, `id_repositor`, `fecha`, `cantidad`) VALUES
(1, 1, 1, '2023-11-01', 1),
(2, 2, 2, '2023-11-02', 2),
(3, 3, 3, '2023-11-03', 3),
(4, 4, 4, '2023-11-04', 4);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SELECT gp.id_producto, p.nombre, g.nombre AS nombreGondola, pres.desc_presentacion FROM Gondola_Producto AS gp INNER JOIN producto AS p on gp.id_producto = p.id_producto INNER JOIN gondola AS g on gp.id_gondola = g.id_gondola INNER JOIN presentacion AS pres on gp.Presentacion_id_presentacion = pres.id_presentacion
