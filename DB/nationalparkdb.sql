-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema nationalparksdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `nationalparksdb` ;

-- -----------------------------------------------------
-- Schema nationalparksdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nationalparksdb` DEFAULT CHARACTER SET utf8 ;
USE `nationalparksdb` ;

-- -----------------------------------------------------
-- Table `national_park`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `national_park` ;

CREATE TABLE IF NOT EXISTS `national_park` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `state_abbrev_location` VARCHAR(2) NULL,
  `visited` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS nationalparksuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'nationalparksuser'@'localhost' IDENTIFIED BY 'nationalparks';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'nationalparksuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `national_park`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`) VALUES (1, 'Rocky Mountain', 'CO', NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`) VALUES (2, 'Yellowstone', 'WY', NULL);

COMMIT;

