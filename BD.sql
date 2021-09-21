SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `hoteleria` DEFAULT CHARACTER SET utf8 ;
USE `hoteleria` ;

-- -----------------------------------------------------
-- Table `hoteleria`.`Piso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`tbl_piso` (
  `PK_id_piso` INT NOT NULL,
  `cantidad_habitaciones_piso` INT NULL DEFAULT NULL,
  `descripcion_piso` VARCHAR(200) NULL DEFAULT NULL,
  `estado_piso` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_piso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `hoteleria`.`horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`tbl_horario` (
  `PK_id_horario` INT NOT NULL,
  `entrada_horario` VARCHAR(10) NULL DEFAULT NULL,
  `salida_horario` VARCHAR(10) NULL DEFAULT NULL,
  `horas_extras_horario` INT NULL DEFAULT NULL,
  `descripcion_horario` VARCHAR(200) NULL DEFAULT NULL,
  `estado_horario` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_horario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `hoteleria`.`ama_de_llaves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`tbl_ama_de_llave` (
  `PK_id_ama_de_llave` INT NOT NULL,
  `nombre_ama_de_llave` VARCHAR(45) NULL DEFAULT NULL,
  `apellido_ama_de_llave` VARCHAR(45) NULL DEFAULT NULL,
  `piso_ama_de_llave` INT NULL DEFAULT NULL,
  `horario_ama_de_llave` INT NULL DEFAULT NULL,
  `descripcion_ama_de_llave` VARCHAR(200) NULL DEFAULT NULL,
  `estado_ama_de_llave` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_ama_de_llave`),
  FOREIGN KEY (`piso_ama_de_llave`) REFERENCES `tbl_piso`(`PK_id_piso`),
  FOREIGN KEY (`horario_ama_de_llave`) REFERENCES `tbl_horario`(`PK_id_horario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `hoteleria`.`impuesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`tbl_impuesto` (
  `PK_id_impuesto` INT NOT NULL,
  `nombre_impuesto` VARCHAR(45) NULL DEFAULT NULL,
  `valor_impuesto` DECIMAL NULL DEFAULT NULL,
  `descripcion_impuesto` VARCHAR(200) NULL DEFAULT NULL,
  `estado_impuesto` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_impuesto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `hoteleria`.`tbl_metodo_de_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`tbl_metodo_de_pago` (
  `PK_id_metodo` INT NOT NULL,
  `nombre_metodo` VARCHAR(50) NULL DEFAULT NULL,
  `descripcion_metodo` VARCHAR(100) NULL DEFAULT NULL,
  `estado_metodo` TINYINT NULL DEFAULT NULL,
   PRIMARY KEY (`PK_id_metodo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `tbl_metodo_de_pago` (`PK_id_metodo`, `nombre_metodo`, `descripcion_metodo`, `estado_metodo`) VALUES ('1', 'Tarjeta', 'Pago con tarjeta', '1');
INSERT INTO `tbl_metodo_de_pago` (`PK_id_metodo`, `nombre_metodo`, `descripcion_metodo`, `estado_metodo`) VALUES ('2', 'Efectivo', 'Pago en efectivo', '1');
INSERT INTO `tbl_metodo_de_pago` (`PK_id_metodo`, `nombre_metodo`, `descripcion_metodo`, `estado_metodo`) VALUES ('3', 'Criptomoneda Ethereum', 'Fase beta del método de prueba con CriptoMoneda Ethereum', '0');
INSERT INTO `tbl_metodo_de_pago` (`PK_id_metodo`, `nombre_metodo`, `descripcion_metodo`, `estado_metodo`) VALUES ('4', 'PAYPAL', 'Forma de pago PayPal a nuestra cuenta en brasil', '0');
INSERT INTO `tbl_metodo_de_pago` (`PK_id_metodo`, `nombre_metodo`, `descripcion_metodo`, `estado_metodo`) VALUES ('5', 'MovilPay', 'Pago en fase alpha para pagar mediante el celular.', '0');

-- -----------------------------------------------------
-- Table `hoteleria`.`tbl_servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`tbl_servicio` (
 `PK_id_servicio` INT NOT NULL,
  `nombre_servicio` VARCHAR(50) NULL DEFAULT NULL,
  `descripcion_servicio` VARCHAR(100) NULL DEFAULT NULL,
  `precio_servicio` INT NOT NULL,
  `tipo_servicio` TINYINT NOT NULL,
  `estado_servicio` TINYINT NOT NULL,
  PRIMARY KEY (`PK_id_servicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `hoteleria`.`tbl_servicio` (`PK_id_servicio`, `nombre_servicio`, `descripcion_servicio`, `precio_servicio`, `tipo_servicio`, `estado_servicio`) VALUES ('1', 'Internet', '50mg', '150', '1', '1');
INSERT INTO `hoteleria`.`tbl_servicio` (`PK_id_servicio`, `nombre_servicio`, `descripcion_servicio`, `precio_servicio`, `tipo_servicio`, `estado_servicio`) VALUES ('2', 'Niñera', 'Cuido de niños', '250', '1', '1');
INSERT INTO `hoteleria`.`tbl_servicio` (`PK_id_servicio`, `nombre_servicio`, `descripcion_servicio`, `precio_servicio`, `tipo_servicio`, `estado_servicio`) VALUES ('3', 'Paseo en bote', 'Espectuaculo en bote', '375', '1', '1');
INSERT INTO `tbl_servicio` (`PK_id_servicio`, `nombre_servicio`, `descripcion_servicio`, `precio_servicio`, `tipo_servicio`, `estado_servicio`) VALUES ('4', 'SPA', 'SPA para un máximo de 10 personas', '500', '1', '2');
INSERT INTO `tbl_servicio` (`PK_id_servicio`, `nombre_servicio`, `descripcion_servicio`, `precio_servicio`, `tipo_servicio`, `estado_servicio`) VALUES ('5', 'Sector para Fumadores', 'Amplio sector para personas puedan fumar tranquilamente sin molestar a otras personas', '150', '2', '1');

-- -----------------------------------------------------
-- Table `hoteleria`.`tbl_mantenimiento_habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`tbl_mantenimiento_habitaciones` (
  `PK_id_habitacion` INT NOT NULL,
  `precio_habitacion` int(45) NULL DEFAULT NULL,
  `piso_habitaciones` INT NULL DEFAULT NULL,
  `estado_habitacion` INT NULL DEFAULT NULL,
  `estado_limpieza` INT NULL DEFAULT NULL,
  `tipo_de_habitacion` VARCHAR(20) NULL DEFAULT NULL,
  `cantidad_maxima_pers` INT(5) null DEFAULT NULL,
  PRIMARY KEY (`PK_id_habitacion`),
  FOREIGN KEY (`piso_habitaciones`) REFERENCES `tbl_piso_hotel`(`PK_numero_piso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `hoteleria`.`tbl_mantenimiento_habitaciones` (`PK_id_habitacion`, `precio_habitacion`, `piso_habitaciones`, `estado_habitacion`,`estado_limpieza`, `tipo_de_habitacion`,`cantidad_maxima_pers`) VALUES ('1', '250', '1', '1','1', 'Familiar', '4');
INSERT INTO `hoteleria`.`tbl_mantenimiento_habitaciones` (`PK_id_habitacion`, `precio_habitacion`, `piso_habitaciones`, `estado_habitacion`,`estado_limpieza`, `tipo_de_habitacion`,`cantidad_maxima_pers`) VALUES ('2', '250', '1', '1','1', 'Individual', '1');
INSERT INTO `hoteleria`.`tbl_mantenimiento_habitaciones` (`PK_id_habitacion`, `precio_habitacion`, `piso_habitaciones`, `estado_habitacion`,`estado_limpieza`, `tipo_de_habitacion`,`cantidad_maxima_pers`) VALUES ('3', '250', '1', '1','1', 'Familiar', '4');
INSERT INTO `hoteleria`.`tbl_mantenimiento_habitaciones` (`PK_id_habitacion`, `precio_habitacion`, `piso_habitaciones`, `estado_habitacion`,`estado_limpieza`, `tipo_de_habitacion`,`cantidad_maxima_pers`) VALUES ('4', '250', '1', '1','1', 'Individual','1');
INSERT INTO `hoteleria`.`tbl_mantenimiento_habitaciones` (`PK_id_habitacion`, `precio_habitacion`, `piso_habitaciones`, `estado_habitacion`,`estado_limpieza`, `tipo_de_habitacion`,`cantidad_maxima_pers`) VALUES ('5', '250', '1', '1','1', 'Familiar','4');

-- -----------------------------------------------------
-- Table `hoteleria`.`tbl_huespedes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`tbl_huesped` (
  `PK_no_identificacion` INT NOT NULL,
  `nombre_huesped` VARCHAR(50) NULL DEFAULT NULL,
  `apellido_huesped` VARCHAR(100) NULL DEFAULT NULL,
  `nacionalidad_huesped` VARCHAR(100) NULL DEFAULT NULL,
  `direccion_huesped` VARCHAR(100) NULL DEFAULT NULL,
  `sexo_huesped` VARCHAR(5) NULL DEFAULT NULL,
  `telefono_huesped` INT DEFAULT NULL,
  `cumpleaños_huesped` date NULL DEFAULT NULL,
   PRIMARY KEY (`PK_no_identificacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `hoteleria`.`tbl_huesped` (`PK_no_identificacion`, `nombre_huesped`, `apellido_huesped`, `nacionalidad_huesped`, `direccion_huesped`, `sexo_huesped`, `telefono_huesped`, `cumpleaños_huesped`) VALUES ('1', 'Alberto', 'Suarez', 'Mexicano', '12 calle', 'M', '12345678', '2000-6-28');
INSERT INTO `hoteleria`.`tbl_huesped` (`PK_no_identificacion`, `nombre_huesped`, `apellido_huesped`, `nacionalidad_huesped`, `direccion_huesped`, `sexo_huesped`, `telefono_huesped`, `cumpleaños_huesped`) VALUES ('12', 'Luis Carlos', 'Chavez', 'Chino', '13 calle', 'M', '87654321', '2000-6-28');
INSERT INTO `hoteleria`.`tbl_huesped` (`PK_no_identificacion`, `nombre_huesped`, `apellido_huesped`, `nacionalidad_huesped`, `direccion_huesped`, `sexo_huesped`, `telefono_huesped`, `cumpleaños_huesped`) VALUES ('123', 'Leonel', 'Gomez', 'Keniano', '14 calle', 'M', '123456789', '2000-6-28');
INSERT INTO `hoteleria`.`tbl_huesped` (`PK_no_identificacion`, `nombre_huesped`, `apellido_huesped`, `nacionalidad_huesped`, `direccion_huesped`, `sexo_huesped`, `telefono_huesped`, `cumpleaños_huesped`) VALUES ('1234', 'Jefferson', 'Dominguez', 'Mexicano', '15 calle', 'M', '612345678', '2000-6-28');
INSERT INTO `hoteleria`.`tbl_huesped` (`PK_no_identificacion`, `nombre_huesped`, `apellido_huesped`, `nacionalidad_huesped`, `direccion_huesped`, `sexo_huesped`, `telefono_huesped`, `cumpleaños_huesped`) VALUES ('12345', 'Gerson', 'Davila', 'Español', '16 calle', 'M', '1234585678', '2000-6-28');

-- -----------------------------------------------------
-- Table `hoteleria`.`tbl_menu_restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`tbl_menu_restaurante` (
  `PK_codigo_correlativo` INT NOT NULL AUTO_INCREMENT,
  `nombre_plato` VARCHAR(100) NULL DEFAULT NULL,
  `nombre_ingrediente` VARCHAR(100) NULL DEFAULT NULL,
  `cantidad_ingrediente` INT DEFAULT NULL,
  `medida_ingrediente` VARCHAR(100) NULL DEFAULT NULL,
   PRIMARY KEY (`PK_codigo_correlativo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `hoteleria`.`tbl_menu_restaurante` (`PK_codigo_correlativo`, `nombre_plato`, `nombre_ingrediente`, `cantidad_ingrediente`, `medida_ingrediente`) VALUES ('1', 'pizza', 'tomate', '1', 'libra');
INSERT INTO `hoteleria`.`tbl_menu_restaurante` (`PK_codigo_correlativo`, `nombre_plato`, `nombre_ingrediente`, `cantidad_ingrediente`, `medida_ingrediente`) VALUES ('12', 'pizza', 'queso', '1', 'libra');
INSERT INTO `hoteleria`.`tbl_menu_restaurante` (`PK_codigo_correlativo`, `nombre_plato`, `nombre_ingrediente`, `cantidad_ingrediente`, `medida_ingrediente`) VALUES ('123', 'pizza', 'jamon', '1', 'libra');
INSERT INTO `hoteleria`.`tbl_menu_restaurante` (`PK_codigo_correlativo`, `nombre_plato`, `nombre_ingrediente`, `cantidad_ingrediente`, `medida_ingrediente`) VALUES ('1234', 'pizza', 'piña', '1', 'libra');
INSERT INTO `hoteleria`.`tbl_menu_restaurante` (`PK_codigo_correlativo`, `nombre_plato`, `nombre_ingrediente`, `cantidad_ingrediente`, `medida_ingrediente`) VALUES ('12345', 'Pasta', 'queso', '1', 'libra');