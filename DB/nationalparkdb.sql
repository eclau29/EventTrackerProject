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
  `comment` TEXT NULL,
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
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (1, 'Rocky Mountain', 'CO', 1, 'Need to go back!');
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (2, 'Yellowstone', 'WY', 1, 'saw bison, elk, coyotes...but no moose');
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (3, 'Acadia', 'ME', 1, 'Bay of Fundy');
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (4, 'Arches', 'UT', 1, 'must see a sunrise or take pictures at night');
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (5, 'Badlands', 'SD', 0, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (6, 'Carlsbad Caverns', 'NM', 0, '117 caves!');
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (7, 'Channel Islands', 'CA', 0, 'island foxes!');
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (8, 'Denali', 'AK', 0, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (9, 'Joshua Tree', 'CA', 0, 'old trees');
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (10, 'Mesa Verde', 'CO', 1, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (11, 'Grand Teton', 'WY', 1, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (12, 'Glacier', 'MT', 1, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (13, 'Great Sand Dunes', 'CO', 0, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (14, 'Kings Canyon', 'CA', 0, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (15, 'Mount Rainier', 'WA', 0, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (16, 'North Cascades', 'WA', 0, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (17, 'Olympic', 'WA', 0, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (18, 'Petrified Forest', 'AZ', 0, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (19, 'Redwood', 'CA', 0, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (20, 'Saguaro', 'AZ', 0, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (21, 'Sequoia', 'CA', 0, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (22, 'Shenandoah', 'VA', 0, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (23, 'Wind Cave', 'SD', 0, 'boxwork & frostwork formations');
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (24, 'Yosemite', 'CA', 0, NULL);
INSERT INTO `national_park` (`id`, `name`, `state_abbrev_location`, `visited`, `comment`) VALUES (25, 'Zion', 'UT', 0, NULL);

COMMIT;

