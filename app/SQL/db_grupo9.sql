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
  `razon_social` VARCHAR(45) NOT NULL,
  `domicilio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_empresa`),
  UNIQUE INDEX `id_repositor_UNIQUE` (`id_empresa` ASC))
ENGINE = InnoDB;

INSERT INTO `Empresa` (`id_empresa`, `razon_social`, `domicilio`) VALUES
(1, 'Supermercado XYZ', 'Avenida Principal 123'),
(2, 'Bebidas Refrescantes Inc.', 'Calle Central 456'),
(3, 'Distribución de Lácteos S.L.', 'Calle de los Lácteos 789'),
(4, 'Snacks Saludables Ltda.', 'Avenida de los Snacks 101'),
(5, 'Frutas y Verduras S.A.', 'Calle de las Frutas 567'),
(6, 'Carnicería El Gaucho', 'Ruta 8 Km 90'),
(7, 'Panadería La Espiga', 'Avenida del Pan 234'),
(8, 'Electrohogar Express', 'Esquina Tecnológica 789'),
(9, 'Librería Papel y Tinta', 'Libros 101'),
(10, 'Tienda de Ropa Elegante', 'Moda 202');


-- -----------------------------------------------------
-- Table `mydb`.`Repositor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Repositor` (
  `id_repositor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `id_empresa` INT NOT NULL,
  PRIMARY KEY (`id_repositor`),
  UNIQUE INDEX `id_repositor_UNIQUE` (`id_repositor` ASC),
  INDEX `fk_Repositor_Empresa1_idx` (`id_empresa` ASC),
  CONSTRAINT `id_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `mydb`.`Empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Repositor` (`id_repositor`, `nombre`, `id_empresa`) VALUES
(1, 'Laura Fernández', 1),
(2, 'Juan Pérez', 2),
(3, 'María Rodríguez', 1),
(4, 'Carlos Gómez', 3),
(5, 'Alejandra Nava', 3),
(6, 'Martín López', 4),
(7, 'Lucía Ramírez', 2),
(8, 'Pedro González', 1),
(9, 'Ana Martínez', 4),
(10, 'Javier Suárez', 5),
(11, 'Verónica Castro', 6),
(12, 'Diego Velázquez', 7),
(13, 'Silvia Medina', 8),
(14, 'Raúl Torres', 9),
(15, 'Cecilia Duarte', 10);
-- -----------------------------------------------------
-- Table `mydb`.`Sector`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sector` (
  `id_sector` INT NOT NULL,
  `desc_sector` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_sector`),
  UNIQUE INDEX `id_gondola_UNIQUE` (`id_sector` ASC))
ENGINE = InnoDB;

INSERT INTO `Sector` (`id_sector`, `desc_sector`) VALUES
(1, 'Bebidas'),
(2, 'Snacks'),
(3, 'Pastas'),
(4, 'Lácteos'),
(5, 'Frutas y Verduras'),
(6, 'Carnicería'),
(7, 'Panadería'),
(8, 'Electrodomésticos'),
(9, 'Libros'),
(10, 'Ropa');
-- -----------------------------------------------------
-- Table `mydb`.`Gondola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gondola` (
  `id_gondola` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `id_sector` INT NOT NULL,
  PRIMARY KEY (`id_gondola`),
  UNIQUE INDEX `id_gondola_UNIQUE` (`id_gondola` ASC),
  INDEX `fk_Gondola_Sector1_idx` (`id_sector` ASC),
  CONSTRAINT `id_sector`
    FOREIGN KEY (`id_sector`)
    REFERENCES `mydb`.`Sector` (`id_sector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Gondola` (`id_gondola`, `nombre`, `id_sector`) VALUES
(1, 'Bebidas 1', 1),
(2, 'Snacks 1', 2),
(3, 'Pastas 1', 3),
(4, 'Lácteos 1', 4),
(5, 'Frutas y Verduras 1', 5),
(6, 'Carnicería 1', 6),
(7, 'Panadería 1', 7),
(8, 'Electrodomésticos 1', 8),
(9, 'Libros 1', 9),
(10, 'Ropa 1', 10);
-- -----------------------------------------------------
-- Table `mydb`.`Flia_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Flia_Producto` (
  `id_fila` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_fila`),
  UNIQUE INDEX `id_producto_UNIQUE` (`id_fila` ASC))
ENGINE = InnoDB;

INSERT INTO `Flia_Producto` (`id_fila`, `nombre`) VALUES
(1, 'Bebidas Variadas'),
(2, 'Snacks Salados'),
(3, 'Pastas Secas'),
(4, 'Productos Lácteos'),
(5, 'Frutas Frescas'),
(6, 'Cortes de Carne'),
(7, 'Panadería Artesanal'),
(8, 'Electrodomésticos'),
(9, 'Libros Variados'),
(10, 'Ropa Elegante');
-- -----------------------------------------------------
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producto` (
  `id_producto` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `id_producto_reemplazo` INT NOT NULL,
  `Flia_Producto_id_fila` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE INDEX `id_producto_UNIQUE` (`id_producto` ASC),
  INDEX `fk_Producto_Flia_Producto1_idx` (`Flia_Producto_id_fila` ASC),
  CONSTRAINT `id_fila`
    FOREIGN KEY (`Flia_Producto_id_fila`)
    REFERENCES `mydb`.`Flia_Producto` (`id_fila`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Producto` (`id_producto`, `nombre`, `descripcion`, `id_producto_reemplazo`, `Flia_Producto_id_fila`) VALUES
(1, 'Gaseosa Cola', 'Gaseosa cola de 2 litros', 1, 1),
(2, 'Papas Fritas', 'Papas fritas sabor original', 2, 2),
(3, 'Fideos Spaghetti', 'Fideos spaghetti de 500g', 2, 3),
(4, 'Leche Entera', 'Leche entera en envase de 1 litro', 2, 4),
(5, 'Manzanas', 'Manzanas rojas frescas', 1, 5),
(6, 'Asado de Tira', 'Corte de carne vacuna, kg', 3, 6),
(7, 'Pan Integral', 'Pan integral artesanal', 3, 7),
(8, 'Licuadora', 'Licuadora eléctrica, 800W', 3, 8),
(9, 'Novela Romántica', 'Libro de romance contemporáneo', 3, 9),
(10, 'Vestido Elegante', 'Vestido de noche para ocasiones especiales', 3, 10),
(11, 'Agua Mineral', 'Agua mineral sin gas, 1.5L', 1, 1),
(12, 'Tortilla Chips', 'Snack de tortilla chips, 200g', 1, 2),
(13, 'Penne Rigate', 'Pasta penne rigate, 1kg', 1, 3),
(14, 'Yogur Natural', 'Yogur natural sin azúcar, 500g', 1, 4),
(15, 'Naranjas', 'Naranjas frescas de Valencia', 1, 5);
-- -----------------------------------------------------
-- Table `mydb`.`Presentacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Presentacion` (
  `id_presentacion` INT NOT NULL,
  `desc_presentacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_presentacion`),
  UNIQUE INDEX `id_presentacion_UNIQUE` (`id_presentacion` ASC))
ENGINE = InnoDB;

INSERT INTO `Presentacion` (`id_presentacion`, `desc_presentacion`) VALUES
(1, 'Botella 2L'),
(2, 'Bolsa 150g'),
(3, 'Paquete 500g'),
(4, 'Tetra Pak 1L'),
(5, 'Unidad'),
(6, 'Kilogramo'),
(7, 'Unidad'),
(8, 'Unidad'),
(9, 'Unidad'),
(10, 'Unidad');
-- -----------------------------------------------------
-- Table `mydb`.`Gondola_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gondola_Producto` (
  `id_producto` INT NOT NULL,
  `id_gondola` INT NOT NULL,
  `Presentacion_id_presentacion` INT NOT NULL,
  PRIMARY KEY (`id_producto`, `id_gondola`),
  INDEX `fk_Gondola_has_Producto_Producto1_idx` (`id_producto` ASC),
  INDEX `fk_Gondola_has_Producto_Gondola1_idx` (`id_gondola` ASC),
  INDEX `fk_Gondola_Producto_Presentacion1_idx` (`Presentacion_id_presentacion` ASC),
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
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 1, 1),
(12, 2, 2),
(13, 3, 3),
(14, 4, 4),
(15, 5, 5);
-- -----------------------------------------------------
-- Table `mydb`.`Gondola_Producto_Repositor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gondola_Producto_Repositor` (
  `id_producto` INT NOT NULL,
  `id_gondola` INT NOT NULL,
  `id_repositor` INT NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`id_producto`, `id_gondola`),
  INDEX `fk_Gondola_Producto_has_Repositor_Repositor1_idx` (`id_repositor` ASC),
  INDEX `fk_Gondola_Producto_has_Repositor_Gondola_Producto1_idx` (`id_producto` ASC, `id_gondola` ASC),
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
(1, 1, 1, '2023-11-01', 5),
(2, 2, 2, '2023-11-02', 8),
(3, 3, 3, '2023-11-03', 10),
(4, 4, 4, '2023-11-04', 12),
(5, 5, 5, '2023-11-05', 15),
(6, 6, 6, '2023-11-06', 7),
(7, 7, 7, '2023-11-07', 20),
(8, 8, 8, '2023-11-08', 3),
(9, 9, 9, '2023-11-09', 6),
(10, 10, 10, '2023-11-10', 10),
(11, 1, 1, '2023-11-01', 3),
(12, 2, 2, '2023-11-02', 6),
(13, 3, 3, '2023-11-03', 9),
(14, 4, 4, '2023-11-04', 12),
(15, 5, 5, '2023-11-05', 5);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;