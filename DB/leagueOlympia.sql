-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema olympiadb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `olympiadb` ;

-- -----------------------------------------------------
-- Schema olympiadb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `olympiadb` DEFAULT CHARACTER SET utf8 ;
USE `olympiadb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `enabled` TINYINT NOT NULL,
  `role` VARCHAR(45) NULL,
  `photo` VARCHAR(2000) NULL,
  `about_me` VARCHAR(2000) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `created_date` DATETIME NULL,
  `updated_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `country` ;

CREATE TABLE IF NOT EXISTS `country` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) NULL,
  `flag` VARCHAR(2000) NULL,
  `about` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `athlete`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `athlete` ;

CREATE TABLE IF NOT EXISTS `athlete` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `country` VARCHAR(5) NULL,
  `photo` VARCHAR(2000) NULL,
  `date_of_birth` DATE NULL,
  `country_id` INT NOT NULL,
  `social_media_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_athletes_countries1_idx` (`country_id` ASC),
  CONSTRAINT `fk_athletes_countries1`
    FOREIGN KEY (`country_id`)
    REFERENCES `country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `league`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `league` ;

CREATE TABLE IF NOT EXISTS `league` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(65) NULL,
  `photo` VARCHAR(2000) NULL,
  `bets_enabled` TINYINT NULL,
  `user_id` INT NOT NULL,
  `buy_in` DECIMAL(6,2) NULL,
  `side_wager` TEXT NULL,
  `created_date` DATETIME NULL,
  `updated_date` DATETIME NULL,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_league_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_league_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `team` ;

CREATE TABLE IF NOT EXISTS `team` (
  `user_id` INT NOT NULL,
  `league_id` INT NOT NULL,
  `name` VARCHAR(75) NULL,
  `photo` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  `created_date` DATETIME NULL,
  `updated_date` DATETIME NULL,
  `enabled` TINYINT NULL,
  INDEX `fk_team_user1_idx` (`user_id` ASC),
  INDEX `fk_team_league1_idx` (`league_id` ASC),
  PRIMARY KEY (`user_id`, `league_id`),
  CONSTRAINT `fk_team_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_league1`
    FOREIGN KEY (`league_id`)
    REFERENCES `league` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `league_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `league_comment` ;

CREATE TABLE IF NOT EXISTS `league_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `comment_text` TEXT NULL,
  `date_posted` DATETIME NULL,
  `league_id` INT NOT NULL,
  `reply_to_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_user1_idx` (`user_id` ASC),
  INDEX `fk_comments_league1_idx` (`league_id` ASC),
  INDEX `fk_league_comment_league_comment1_idx` (`reply_to_id` ASC),
  CONSTRAINT `fk_comments_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_league1`
    FOREIGN KEY (`league_id`)
    REFERENCES `league` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_league_comment_league_comment1`
    FOREIGN KEY (`reply_to_id`)
    REFERENCES `league_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `olympiad_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `olympiad_category` ;

CREATE TABLE IF NOT EXISTS `olympiad_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `olympiad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `olympiad` ;

CREATE TABLE IF NOT EXISTS `olympiad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(75) NULL,
  `year` INT NULL,
  `country_id` INT NOT NULL,
  `opening_date` DATE NULL,
  `closing_date` DATE NULL,
  `logo` VARCHAR(2000) NULL,
  `host_city` VARCHAR(200) NULL,
  `category_id` INT NOT NULL,
  `website_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_olympiad_country1_idx` (`country_id` ASC),
  INDEX `fk_olympiad_olympiad_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_olympiad_country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_olympiad_olympiad_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `olympiad_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sport` ;

CREATE TABLE IF NOT EXISTS `sport` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `description` TEXT NULL,
  `picture_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sport_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sport_event` ;

CREATE TABLE IF NOT EXISTS `sport_event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `venue` VARCHAR(200) NULL,
  `location_latitude` VARCHAR(2000) NULL,
  `location_longitude` VARCHAR(2000) NULL,
  `olympiad_id` INT NOT NULL,
  `sport_id` INT NOT NULL,
  `completed` TINYINT NULL,
  `event_completion_date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sport_olympiad1_idx` (`olympiad_id` ASC),
  INDEX `fk_sport_event_sport1_idx` (`sport_id` ASC),
  CONSTRAINT `fk_sport_olympiad1`
    FOREIGN KEY (`olympiad_id`)
    REFERENCES `olympiad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sport_event_sport1`
    FOREIGN KEY (`sport_id`)
    REFERENCES `sport` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `athlete_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `athlete_event` ;

CREATE TABLE IF NOT EXISTS `athlete_event` (
  `athlete_id` INT NOT NULL,
  `sport_event_id` INT NOT NULL,
  `finish_result` INT NULL,
  `remarks` TEXT NULL,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`athlete_id`, `sport_event_id`),
  INDEX `fk_athletes_has_event_event1_idx` (`sport_event_id` ASC),
  INDEX `fk_athletes_has_event_athletes1_idx` (`athlete_id` ASC),
  CONSTRAINT `fk_athletes_has_event_athletes1`
    FOREIGN KEY (`athlete_id`)
    REFERENCES `athlete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_athletes_has_event_event1`
    FOREIGN KEY (`sport_event_id`)
    REFERENCES `sport_event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `league_has_sport_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `league_has_sport_event` ;

CREATE TABLE IF NOT EXISTS `league_has_sport_event` (
  `sport_event_id` INT NOT NULL,
  `league_id` INT NOT NULL,
  PRIMARY KEY (`sport_event_id`, `league_id`),
  INDEX `fk_sport_has_league_league1_idx` (`league_id` ASC),
  INDEX `fk_sport_has_league_sport1_idx` (`sport_event_id` ASC),
  CONSTRAINT `fk_sport_has_league_sport1`
    FOREIGN KEY (`sport_event_id`)
    REFERENCES `sport_event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sport_has_league_league1`
    FOREIGN KEY (`league_id`)
    REFERENCES `league` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team_has_athlete_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `team_has_athlete_event` ;

CREATE TABLE IF NOT EXISTS `team_has_athlete_event` (
  `team_user_id` INT NOT NULL,
  `team_league_id` INT NOT NULL,
  `athlete_event_athlete_id` INT NOT NULL,
  `athlete_event_sport_id` INT NOT NULL,
  PRIMARY KEY (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`),
  INDEX `fk_team_has_athlete_event_athlete_event1_idx` (`athlete_event_athlete_id` ASC, `athlete_event_sport_id` ASC),
  INDEX `fk_team_has_athlete_event_team1_idx` (`team_user_id` ASC, `team_league_id` ASC),
  CONSTRAINT `fk_team_has_athlete_event_team1`
    FOREIGN KEY (`team_user_id` , `team_league_id`)
    REFERENCES `team` (`user_id` , `league_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_has_athlete_event_athlete_event1`
    FOREIGN KEY (`athlete_event_athlete_id` , `athlete_event_sport_id`)
    REFERENCES `athlete_event` (`athlete_id` , `sport_event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `athlete_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `athlete_comment` ;

CREATE TABLE IF NOT EXISTS `athlete_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `comment_text` TEXT NULL,
  `date_posted` DATETIME NULL,
  `reply_to_id` INT NULL,
  `athlete_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_user1_idx` (`user_id` ASC),
  INDEX `fk_athlete_comment_athlete_comment1_idx` (`reply_to_id` ASC),
  INDEX `fk_athlete_comment_athlete1_idx` (`athlete_id` ASC),
  CONSTRAINT `fk_comments_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_athlete_comment_athlete_comment1`
    FOREIGN KEY (`reply_to_id`)
    REFERENCES `athlete_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_athlete_comment_athlete1`
    FOREIGN KEY (`athlete_id`)
    REFERENCES `athlete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sport_event_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sport_event_comment` ;

CREATE TABLE IF NOT EXISTS `sport_event_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `comment_text` TEXT NULL,
  `date_posted` DATETIME NULL,
  `reply_to_id` INT NULL,
  `sport_event_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_user1_idx` (`user_id` ASC),
  INDEX `fk_athlete_comment_athlete_comment1_idx` (`reply_to_id` ASC),
  INDEX `fk_athlete_comment_copy1_sport_event1_idx` (`sport_event_id` ASC),
  CONSTRAINT `fk_comments_user100`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_athlete_comment_athlete_comment10`
    FOREIGN KEY (`reply_to_id`)
    REFERENCES `sport_event_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_athlete_comment_copy1_sport_event1`
    FOREIGN KEY (`sport_event_id`)
    REFERENCES `sport_event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_bought_in`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_bought_in` ;

CREATE TABLE IF NOT EXISTS `user_has_bought_in` (
  `user_id` INT NOT NULL,
  `league_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `league_id`),
  INDEX `fk_user_has_league_league1_idx` (`league_id` ASC),
  INDEX `fk_user_has_league_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_league_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_league_league1`
    FOREIGN KEY (`league_id`)
    REFERENCES `league` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS olympian;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'olympian' IDENTIFIED BY 'olympian';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'olympian';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `photo`, `about_me`, `first_name`, `last_name`, `created_date`, `updated_date`) VALUES (1, 'admin', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 1, 'admin', NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `country`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `country` (`id`, `name`, `flag`, `about`) VALUES (1, 'United States of America', 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png', 'The United States of America has sent many athletes to the celebration of the Olympic Games, starting with the first modern Olympics held in 1896. The United States has sent athletes to every Olympic Games with the exception of the 1980 Summer Olympics, during which it led a boycott in protest of the Soviet Union\'s invasion of Afghanistan. The United States Olympic & Paralympic Committee (USOPC) is the National Olympic Committee for the United States.\n\nAmerican athletes have won a total of 2,629 medals (1,060 of them gold) at the Summer Olympic Games, and another 330 (113 of them gold) at the Winter Olympic Games. This makes the United States the most prolific medal-winning nation in the history of the Olympics. The United States remains one of the only major teams in the world to receive no government funding.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `athlete`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `country`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (1, 'Drew', 'Helleson', 'USA', 'https://assets.ngin.com/attachments/profiles/d946-170188409/USA_HELLESON-Drew.JPG', '2001/03/26', 1, 'https://www.instagram.com/drewhelleson4/?hl=en');

COMMIT;


-- -----------------------------------------------------
-- Data for table `league`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `league` (`id`, `name`, `photo`, `bets_enabled`, `user_id`, `buy_in`, `side_wager`, `created_date`, `updated_date`, `enabled`) VALUES (1, 'golden dreams', 'https://static.wikia.nocookie.net/disney/images/4/42/Wfmt-2-web.jpg/revision/latest?cb=20130329031159', 1, 1, 1, '1', '2000-01-12 12:12:12', '2001-01-12 12:12:12', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `team`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `team` (`user_id`, `league_id`, `name`, `photo`, `description`, `created_date`, `updated_date`, `enabled`) VALUES (1, 1, 'Roadsters', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxnIrxQQ0r4tgKEkbhT31XYygHbJ0Zl-qnIcmwFu6R4DTpguGbVwN_JPblT2UigNW79kk&usqp=CAU', 'car lovers meet o', '2018-01-12 12:12:12', '2021-01-12 12:12:12', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `league_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `league_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `league_id`, `reply_to_id`) VALUES (1, 1, 'heavy hitters only here', '2021-01-12 12:12:12', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `olympiad_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `olympiad_category` (`id`, `name`, `description`) VALUES (1, 'winter', 'hosted in Denver, Colorado');

COMMIT;


-- -----------------------------------------------------
-- Data for table `olympiad`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `olympiad` (`id`, `title`, `year`, `country_id`, `opening_date`, `closing_date`, `logo`, `host_city`, `category_id`, `website_url`) VALUES (1, 'Winter Olympics', 2022, 1, '2022-01-12 12:12:12', '2022-01-28 12:12:12', 'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcSSceTu3sGboZ5N4byC_yYwSKKazJPk6-bLAIqvRSPZdtsE6fhAaupmDlnoq7hUJqQISRzmXX3GnB-PHLJMI2RJTucZM16Q', 'beijing', 1, 'https://olympics.com/en/olympic-games/beijing-2022');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sport`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (1, 'ice hockey', 'american rules', 'https://ca-times.brightspotcdn.com/dims4/default/84bc017/2147483647/strip/false/crop/3609x2030+0+617/resize/1200x675!/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F71%2F1a%2F0aa1d5874e519e4978079a925c12%2Fhttps-delivery-gettyimages.com%2Fdownloads%2F1450115423');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sport_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (1, 'hockey arena', '39.748920', '-105.008400', 1, 1, 1, '2010-01-12 12:12:12');

COMMIT;


-- -----------------------------------------------------
-- Data for table `athlete_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (1, 1, 1, 'brand new arena', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `league_has_sport_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `team_has_athlete_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (1, 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `athlete_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (1, 1, 'Drew is definitely going to be in the NHL', '2021-01-06 12:12:12', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sport_event_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (1, 1, 'Hockey is less violent in the olympics and they tend to score more points', '2021-01-12 12:12:12', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_bought_in`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `user_has_bought_in` (`user_id`, `league_id`) VALUES (1, 1);

COMMIT;

