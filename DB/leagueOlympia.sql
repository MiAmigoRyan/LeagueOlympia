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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `photo`, `about_me`, `first_name`, `last_name`, `created_date`, `updated_date`) VALUES (1, 'admin', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 1, 'admin', 'https://user-images.githubusercontent.com/35910158/35493994-36e2c50e-04d9-11e8-8b38-890caea01850.png', 'Key holder to everything', 'admin', 'admin', '2023-06-10 10:10:01', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `photo`, `about_me`, `first_name`, `last_name`, `created_date`, `updated_date`) VALUES (2, 'swilliams', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 1, 'user', 'https://media.licdn.com/dms/image/C4E03AQFQ7JSnspYZsA/profile-displayphoto-shrink_400_400/0/1519858891638?e=1692835200&v=beta&t=I6Ic_Bh1lm8IQPJ56p4WCr3Slfvvhr2tvSTUpZNEUvE', 'Java Full-Stack Developer Bootcamp - Student', 'Spencer', 'Williams', '2023-06-10 10:10:01', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `photo`, `about_me`, `first_name`, `last_name`, `created_date`, `updated_date`) VALUES (3, 'rarment', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 1, 'user', 'https://media.licdn.com/dms/image/D5635AQGZl4AjDk1aHQ/profile-framedphoto-shrink_400_400/0/1686241196156?e=1688083200&v=beta&t=ZF7XYJzVyA6S32wfyRSCeuYrL01ALqyAIYm7NXUBOqc', 'Java Full Stack Developer Bootcamp Graduate', 'Ryan', 'Arment', '2023-06-10 10:10:01', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `photo`, `about_me`, `first_name`, `last_name`, `created_date`, `updated_date`) VALUES (4, 'nspeidell', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 1, 'user', 'https://media.licdn.com/dms/image/D5603AQFnfnstIRLQPg/profile-displayphoto-shrink_400_400/0/1683219317851?e=1692835200&v=beta&t=VUA49CILVzrUfBvaK8uHhbHr25GdvzAFNhnN3zBEkZI', 'USMC Veteran || Java Full Stack Developer Bootcamp Graduate || Network Engineer', 'Nick', 'Speidell', '2023-06-10 10:10:01', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `photo`, `about_me`, `first_name`, `last_name`, `created_date`, `updated_date`) VALUES (5, 'bpitt', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 1, 'user', 'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcRD6T83PeNAkCcAnKJKunvl-0aBAmFlb82K8wbcBeXMUWeDIQzsgslxJ3BsgZ3G42rQX7HGn-DEXShar9Q', 'William Bradley \"Brad\" Pitt is an American actor and film producer. He is the recipient of various accolades, including two Academy Awards, two British Academy Film Awards, two Golden Globe Awards, and a Primetime Emmy Award.', 'Brad', 'Pitt', '2023-06-10 10:10:01', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `photo`, `about_me`, `first_name`, `last_name`, `created_date`, `updated_date`) VALUES (6, 'scombs', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 1, 'user', 'https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcQeyNtAUp9o6cWgFY4mtVZwzVB-bHIxd4MZr_uJ5ui23u2OTfym3D1U7x9g91oq_gBur0wSRkWSx4fdC_0', 'Sean Love Combs also known by his stage names Puff Daddy, P. Diddy, or Diddy, is an American rapper, actor, record producer, and record executive.', 'Sean', 'Combs', '2023-06-10 10:10:01', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `photo`, `about_me`, `first_name`, `last_name`, `created_date`, `updated_date`) VALUES (7, 'thanks', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 1, 'user', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-bt7_ZKFMU8UOOjlq-GYF5P0iNJVuqz9HuDI3GkLmLXDfifpy', 'Thomas Jeffrey Hanks is an American actor and filmmaker. Known for both his comedic and dramatic roles, he is one of the most popular and recognizable film stars worldwide, and is regarded as an American cultural icon', 'Tom', 'Hanks', '2023-06-10 10:10:01', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `photo`, `about_me`, `first_name`, `last_name`, `created_date`, `updated_date`) VALUES (8, 'pcruz', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 1, 'user', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR8mpsWEHM6AIGhXldEE6ALRrg9BfR0iDgoODZ6IBqnNlU-OnUM', 'Penélope Cruz Sánchez is a Spanish actress. Known for her roles in films of several genres, particularly those in the Spanish language, she has received various accolades, including an Academy Award', 'Penelope', 'Cruz', '2023-06-10 10:10:01', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `photo`, `about_me`, `first_name`, `last_name`, `created_date`, `updated_date`) VALUES (9, 'rdowney', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 1, 'user', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkVmVmWfVJi7OJAa_QH25SmK-nG54D9ExShXogFCQVGQjrvlEh', 'Robert John Downey Jr. is an American actor and producer. His career has been characterized by critical and popular success in his youth, followed by a period of substance abuse and legal troubles, before a resurgence of commercial success later in his career.', 'Robert', 'Downey Jr.', '2023-06-10 10:10:01', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `photo`, `about_me`, `first_name`, `last_name`, `created_date`, `updated_date`) VALUES (10, 'dwashington', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 1, 'user', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_pblA7fqQVXQi0LcacK3DTMVcle7kDo8F-2w74OANdGqodpcy', 'Denzel Hayes Washington Jr. is an American actor, producer and director. In a career spanning over four decades, Washington has received numerous accolades, including a Tony Award, two Academy Awards, three Golden Globe Awards and two Silver Bears.', 'Denzel', 'Washington', '2023-06-10 10:10:01', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `country`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `country` (`id`, `name`, `flag`, `about`) VALUES (1, 'United States of America', 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png', 'The United States of America has sent many athletes to the celebration of the Olympic Games, starting with the first modern Olympics held in 1896. The United States has sent athletes to every Olympic Games with the exception of the 1980 Summer Olympics, during which it led a boycott in protest of the Soviet Union\'s invasion of Afghanistan. The United States Olympic & Paralympic Committee (USOPC) is the National Olympic Committee for the United States.\n\nAmerican athletes have won a total of 2,629 medals (1,060 of them gold) at the Summer Olympic Games, and another 330 (113 of them gold) at the Winter Olympic Games. This makes the United States the most prolific medal-winning nation in the history of the Olympics. The United States remains one of the only major teams in the world to receive no government funding.');
INSERT INTO `country` (`id`, `name`, `flag`, `about`) VALUES (2, 'China', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/440px-Flag_of_the_People%27s_Republic_of_China.svg.png', 'The People\'s Republic of China (PRC) was the host nation at the 2022 Winter Olympics in Beijing which took place from 4 to 20 February 2022.[1][2] China sent its largest ever contingent delegation of 387 personnel to the games, of which 176 were athletes.[3][4]\n\nZhao Dan and Gao Tingyu were the country\'s flag bearers during the opening ceremony.[5] Meanwhile, Xu Mengtao and Gao Tingyu were the closing ceremony flagbearers.[6][7]');
INSERT INTO `country` (`id`, `name`, `flag`, `about`) VALUES (3, 'Austria', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_Austria.svg/440px-Flag_of_Austria.svg.png', 'Austria competed at the 2022 Winter Olympics in Beijing, China, from 4 to 20 February 2022.[1][2]\n\nJulia Dujmovits and Benjamin Maier were the country\'s flagbearer during the opening ceremony.[3] Meanwhile alpine skiers Katharina Liensberger and Johannes Strolz were the flagbearer during the closing ceremony.');
INSERT INTO `country` (`id`, `name`, `flag`, `about`) VALUES (4, 'France', 'https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/440px-Flag_of_France.svg.png', 'France competed at the 2022 Winter Olympics in Beijing, China, from 4 to 20 February 2022.[1]\n\nOn January 26, 2022, freestyle skier Kevin Rolland and alpine skier Tessa Worley were announced as the French flagbearers during the opening ceremony.[2] Biathlete Quentin Fillon Maillet was the flagbearer during the closing ceremony.[3]');
INSERT INTO `country` (`id`, `name`, `flag`, `about`) VALUES (5, 'Germany', 'https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Flag_of_Germany.svg/440px-Flag_of_Germany.svg.png', 'Athletes from Germany (GER) have appeared in only 20 of the 22 editions of the Winter Olympic Games as they were not invited to two events after the World Wars, in 1924 and 1948. Germany hosted the 1936 Winter Olympics in Garmisch-Partenkirchen and had been selected to host in 1940 again.\n\nThe nation appeared 11 times as a single country (IOC code GER), before World War II and again after German reunification in 1990. Three times, from 1956 to 1964, German athletes from the separate states in West and East competed as a United Team of Germany, which is currently listed by the IOC as EUA, not GER.\n\nDue to partition under occupation that resulted in three post-war German states, German athletes took part seven times for the contemporary states they lived in, in 1952, and from 1968 to 1988. The all-time results of German athletes are thus divided among the designations GER, EUA, FRG, GDR and also SAA (the Saarland only took part in the 1952 Summer games and won no medal).\n\nIncluding the Winter Games of 2014, German athletes have won 377 medals : 136 gold, 135 silver and 106 bronze. The IOC currently splits these results among four codes, even though only the East German Democratic Republic (GDR) from 1968 to 1988 had sent a separate team to compete against the team of the German NOC that represented Germany (GER) since 1896.');
INSERT INTO `country` (`id`, `name`, `flag`, `about`) VALUES (6, 'ROC', 'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcRZlozXWjm8WTEtv781KHfg4uanmd-t165wVkvX7k2vb1PtlDuPMyr7DJZqxS74jv0ucMGtaJaRuYpTnjERH-YrCQzp27cn', 'Russian athletes competed at the 2022 Winter Olympics in Beijing, China, from 4 to 20 February 2022. On 9 December 2019, the World Anti-Doping Agency (WADA) banned Russia from all international sport for four years, after it was found that data provided by the Russian Anti-Doping Agency had been manipulated by Russian authorities with a goal of protecting athletes involved in its state-sponsored doping scheme. As at the 2018 Winter Olympics, WADA has allowed individual cleared Russian athletes to compete neutrally under the title of \"Russian Olympic Committee\".');
INSERT INTO `country` (`id`, `name`, `flag`, `about`) VALUES (7, 'Netherlands', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/440px-Flag_of_the_Netherlands.svg.png', 'The Netherlands competed at the 2022 Winter Olympics in Beijing, China, from 4 to 20 February 2022.[1][2]\n\nThe Netherlands won eight gold medals at these Games, matching their gold medal hauls from 2014 and 2018, although the total number of medals won decreased from 24 in 2014 to 20 in 2018 and 17 in 2022.\n\nSpeed skater Irene Schouten was the flagbearer during the closing ceremony.[3]');
INSERT INTO `country` (`id`, `name`, `flag`, `about`) VALUES (8, 'Norway', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Norway.svg/440px-Flag_of_Norway.svg.png', 'Norway competed at the 2022 Winter Olympics in Beijing, China, from 4 to 20 February 2022.[1][2] The Norwegian team consisted of 84 athletes.[3] Kjetil Jansrud and Kristin Skaslien were the country\'s flagbearers during the opening ceremony.[4] Biathlete Marte Olsbu Røiseland was the flag bearer during the closing ceremony.[5]\n\nThree days before the closing ceremony, Norway won its 14th gold medal, thus matching its record performance of 2018, as well as Canada\'s 2010 and Germany\'s 2018 results. Norway won its 15th gold medal on 18 February, thus breaking the record. This should be seen in light of the ongoing medal inflation, e.g., from 16 gold medals in 1924 to 109 in 2022. However, Norway also holds the medal inflation-adjusted records: in 1936, Norwegian athletes won 41% of all events (7 out of 17), in 1928, 43% (6 out of 14). As of 20 February 2022, this percentage for the 2022 Games stands at ~14%.');
INSERT INTO `country` (`id`, `name`, `flag`, `about`) VALUES (9, 'Sweden', 'https://upload.wikimedia.org/wikipedia/en/thumb/4/4c/Flag_of_Sweden.svg/440px-Flag_of_Sweden.svg.png', 'Sweden competed at the 2022 Winter Olympics in Beijing, China, from 4 to 20 February 2022.[1][2]\n\nOliwer Magnusson and Emma Nordin were the country\'s flagbearers during the opening ceremony.[3] Meanwhile biathlete Elvira Öberg was the flagbearer during the closing ceremony.[4]\n\nWith eight gold medals and 18 medals in total, this was Sweden\'s most successful Winter Olympics of all time in terms of both gold and total number of medals, beating the previous records set in 2018 and 2014, respectively. It marked the first time Sweden won medals in six different sports at the Winter Games, and they managed to win gold medals in these sports. Additionally, the country won its first (and second) gold medal in freestyle skiing, first gold medals in speed skating since 1988, and became the first country to win medals in all three events in curling at the same Winter Olympics.');
INSERT INTO `country` (`id`, `name`, `flag`, `about`) VALUES (10, 'Switzerland', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Switzerland.svg/440px-Flag_of_Switzerland.svg.png', 'Switzerland competed at the 2022 Winter Olympics in Beijing, China, from 4 to 20 February 2022.[1][2]\n\nAlpine skier Wendy Holdener and hockey player Andres Ambühl were selected as the Swiss flagbearers during the opening ceremony[3][4] Meanwhile freestyle skier Ryan Regez was the flagbearer during the closing ceremony.[5]\n\nSwitzerland competed at the 2022 Winter Olympics in Beijing, China, from 4 to 20 February 2022.[1][2]\n\nAlpine skier Wendy Holdener and hockey player Andres Ambühl were selected as the Swiss flagbearers during the opening ceremony[3][4] Meanwhile freestyle skier Ryan Regez was the flagbearer during the closing ceremony.[5]\n\nSwitzerland competed at the 2022 Winter Olympics in Beijing, China, from 4 to 20 February 2022.[1][2]\n\nAlpine skier Wendy Holdener and hockey player Andres Ambühl were selected as the Swiss flagbearers during the opening ceremony[3][4] Meanwhile freestyle skier Ryan Regez was the flagbearer during the closing ceremony.[5]\n\n');
INSERT INTO `country` (`id`, `name`, `flag`, `about`) VALUES (11, 'South Korea', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/250px-Flag_of_South_Korea.svg.png', 'South Korea, officially the Republic of Korea,[c] is a country in East Asia. It constitutes the southern part of the Korean Peninsula and borders North Korea along the Korean Demilitarized Zone.[d] The country\'s western border is formed by the Yellow Sea, while its eastern border is defined by the Sea of Japan. South Korea claims to be the sole legitimate government of the entire peninsula and adjacent islands. It has a population of 51.96 million, of which roughly half live in the Seoul Capital Area, the fourth most populous metropolitan area in the world. Other major cities include Incheon, Busan, and Daegu.');
INSERT INTO `country` (`id`, `name`, `flag`, `about`) VALUES (12, 'Italy', 'https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/250px-Flag_of_Italy.svg.png', 'Italy (Italian: Italia [iˈtaːlja] (listen)), officially the Italian Republic[a][11][12] or the Republic of Italy,[13][14] is a country in Southern[15][16][17] and Western[18][note 1] Europe. Located in the middle of the Mediterranean Sea, it consists of a peninsula delimited by the Alps and surrounded by several islands; its territory largely coincides with the homonymous geographical region.[19] Italy shares land borders with France, Switzerland, Austria, Slovenia and the enclaved microstates of Vatican City and San Marino. It has a territorial exclave in Switzerland, Campione, and some islands in the African Plate. Italy covers an area of 301,230 km2 (116,310 sq mi), with a population of about 60 million.[20] It is the third-most populous member state of the European Union, the sixth-most populous country in Europe, and the tenth-largest country in the continent by land area. Italy\'s capital and largest city is Rome.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `athlete`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (1, 'Drew', 'Helleson', 'https://assets.ngin.com/attachments/profiles/d946-170188409/USA_HELLESON-Drew.JPG', '2001/03/26', 1, 'https://www.instagram.com/drewhelleson4/?hl=en');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (2, 'Lucas', ' Wallmark', 'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcQVlZ6RnaUlPkwHYii793-hi0kTabo49L6YfDTvJnUJGPNgzgDDmYx4ba7u_So5yVKauz3AnybDN-A3h3g', '1995/09/05', 9, 'https://www.quanthockey.com/hockey-stats/en/profile.php?player=13748');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (3, 'Dominik', 'Kahun', 'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQlxl0-XoG2otV_B0CdlNUQ1gAcVepEDiFzZ7I7st2vCm-9Zd-PraFmNw0q_2p3D0gt3rbOhnJp9LXAGJ4', '1995/07/02', 5, 'https://www.quanthockey.com/hockey-stats/en/profile.php?player=17341');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (4, 'Mikaela', 'Shiffrin', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Sportler_des_Jahres_%C3%96sterreich_2016_red_carpet_Mikaela_Shiffrin_5.jpg/440px-Sportler_des_Jahres_%C3%96sterreich_2016_red_carpet_Mikaela_Shiffrin_5.jpg', '1995/03/13', 1, 'https://en.wikipedia.org/wiki/Mikaela_Shiffrin');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (5, 'Wendy', 'Holdener', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Wendy_Holdener_2019.png/420px-Wendy_Holdener_2019.png', '1993/05/12', 10, 'https://en.wikipedia.org/wiki/Wendy_Holdener');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (6, 'Lena', 'Durr', 'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcTwvWth0w7xsx8UGCFyLsXDG-3WpiOW7mxVHoQVobldl4qG7P1UOV-TYm6_srvqluvY-fIfLC0UrSUgRdo', '1991/08/04', 5, 'https://en.wikipedia.org/wiki/Lena_D%C3%BCrr');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (7, 'Maksim', 'Andrianov', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/2021-02-14_IBSF_World_Championships_Bobsleigh_and_Skeleton_Altenberg_1DX_5828_by_Stepro.jpg/440px-2021-02-14_IBSF_World_Championships_Bobsleigh_and_Skeleton_Altenberg_1DX_5828_by_Stepro.jpg', '1988/02/27', 6, 'https://en.wikipedia.org/wiki/Maksim_Andrianov');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (8, 'Benjamin', 'Maier', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Benjamin_Maier_-_Team_Austria_Winter_Olympics_2014.jpg/440px-Benjamin_Maier_-_Team_Austria_Winter_Olympics_2014.jpg', '1994/04/19', 3, 'https://en.wikipedia.org/wiki/Benjamin_Maier');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (9, 'Li', 'Chunjian', 'https://d2a3o6pzho379u.cloudfront.net/136937.jpg', '1996/04/03', 2, 'https://en.wikipedia.org/wiki/Li_Chunjian');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (10, 'Nils', 'van der Poel', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Nils_van_der_Poel_in_2022.jpg/440px-Nils_van_der_Poel_in_2022.jpg', '1996/04/25', 9, 'https://en.wikipedia.org/wiki/Nils_van_der_Poel');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (11, 'Silje', 'Opseth', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/20150207_Skispringen_Hinzenbach_4242.jpg/440px-20150207_Skispringen_Hinzenbach_4242.jpg', '1999/04/28', 8, 'https://en.wikipedia.org/wiki/Silje_Opseth');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (12, 'Lisa', 'Eder', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/20190225_FIS_NWC_Seefeld_Training_Ladies_SJ_HS109_Lisa_Eder_850_3968.jpg/440px-20190225_FIS_NWC_Seefeld_Training_Ladies_SJ_HS109_Lisa_Eder_850_3968.jpg', '2001/08/12', 3, 'https://en.wikipedia.org/wiki/Lisa_Eder');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (13, 'Joséphine', 'Pagnier', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/20190227_Seefeld_SJ_5957.jpg/440px-20190227_Seefeld_SJ_5957.jpg', '2002/06/04', 4, 'https://en.wikipedia.org/wiki/Jos%C3%A9phine_Pagnier');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (14, 'Jan', 'Scherrer', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Jan_Scherrer_%E2%80%93_20th_Leysin_Nescaf%C3%A9_Champs%2C_8th_-_13th_February_2011_%2832%29.jpg/440px-Jan_Scherrer_%E2%80%93_20th_Leysin_Nescaf%C3%A9_Champs%2C_8th_-_13th_February_2011_%2832%29.jpg', '1994/07/11', 10, 'https://en.wikipedia.org/wiki/Jan_Scherrer');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (15, 'Shaun', 'White', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Shaunsito_lindo.jpg/440px-Shaunsito_lindo.jpg', '1986/09/03', 1, 'https://en.wikipedia.org/wiki/Shaun_White');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (16, 'Louie', 'Vito', 'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcTREit3Xqs6yX_Hx7Te9a-VeUdzQCFFYHKMUEtiCUvQLh0WL257_eQmvUTjDGTJm6NRpqi-7pLuMJv9G28', '1988/03/20', 12, 'https://en.wikipedia.org/wiki/Louie_Vito');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (17, 'Huang', 'Xuechen', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Open_Make_Up_For_Ever_2013_-_Huang_Xuechen.jpg/440px-Open_Make_Up_For_Ever_2013_-_Huang_Xuechen.jpg', '1990/02/05', 2, 'https://en.wikipedia.org/wiki/Huang_Xuechen');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (18, 'Linda', 'Cerruti', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Open_Make_Up_For_Ever_2013_-_Solo_technical_routine_-_02.jpg/440px-Open_Make_Up_For_Ever_2013_-_Solo_technical_routine_-_02.jpg', '1993/10/07', 12, 'https://en.wikipedia.org/wiki/Linda_Cerruti');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (19, 'Anna- Maria', 'Alexandri', 'https://upload.wikimedia.org/wikipedia/commons/c/c1/20160717_Olympiaeinkleidung_AT_2232_%28cropped_Anna-Maria_Alexandri%29.jpg', '1997/09/15', 3, 'https://en.wikipedia.org/wiki/Anna-Maria_Alexandri');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (20, 'An', 'San', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/AnSanMarieClaireKorea2021.png/440px-AnSanMarieClaireKorea2021.png', '2001/02/27', 11, 'https://en.wikipedia.org/wiki/An_San');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (21, 'Casey', 'Kaufhold', 'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcTRjCULFaCmzSMyT3h3OoHDFcCIiZpG8TSgPUJ7Yr8i9LRrhlH4Hsqfi9FBC1quYlUIQw7Chdg3sxYJeeU', '2004/03/06', 1, 'https://en.wikipedia.org/wiki/Casey_Kaufhold');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (22, 'Gabriela', 'Schloesser', 'https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcRRoXPZwmmu9dGfg12ren3L_IoW4WrEnSHKzXtOzQgjM2MxwuzHh1nrWEo8ULea70d8ptdBP_ZxDqsDzNM', '1994/02/18', 7, 'https://en.wikipedia.org/wiki/Gabriela_Schloesser');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (23, 'Cao', 'Yuan', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Cao_Yuan_at_the_Rio_Olympics.jpg/440px-Cao_Yuan_at_the_Rio_Olympics.jpg', '1995/02/07', 2, 'https://en.wikipedia.org/wiki/Cao_Yuan');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (24, 'Aleksandr', 'Bondar', 'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcRTr2sOFoRS786jRvM4E-c-CLC-4w6CC2raK63r6rQVny14zaendlSSZRvb4caJ-lWbr4u9-j8S5gcqwEY', '1993/10/25', 6, 'https://en.wikipedia.org/wiki/Aleksandr_Bondar_(diver)');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (25, 'Kim', 'Yeong-taek', 'https://i.mydramalist.com/En6Op_5f.jpg', '2001/08/08', 11, 'https://en.wikipedia.org/wiki/Kim_Yeong-taek');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (26, 'Kevin', 'Durant', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Kevin_Durant_%28Wizards_v._Warriors%2C_1-24-2019%29_%28cropped%29.jpg/440px-Kevin_Durant_%28Wizards_v._Warriors%2C_1-24-2019%29_%28cropped%29.jpg', '1988/09/29', 1, 'https://en.wikipedia.org/wiki/Kevin_Durant');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (27, 'Sylvain', 'Francisco', 'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcQxH9PSf1rkuFBgAxEur5q5qyCWPom0wqtbRFu2ydk23_wz42Ru4TTzoMC9Y2FAI86ltZoiU56SHtOpPKA', '1997/10/10', 4, 'https://en.wikipedia.org/wiki/Sylvain_Francisco');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (28, 'Zhou', 'Qi', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/ZhouQi2017.png/440px-ZhouQi2017.png', '1996/01/16', 2, 'https://en.wikipedia.org/wiki/Zhou_Qi');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (29, 'Kim', 'Jung-hwan', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Kim_Jung-hwan_2015_WCh_SMS-EQ_t145753.jpg/280px-Kim_Jung-hwan_2015_WCh_SMS-EQ_t145753.jpg', '1983/09/02', 11, 'https://en.wikipedia.org/wiki/Kim_Jung-hwan_(fencer)');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (30, 'Luigi', 'Samele', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Dolniceanu_v_Samele_2013_Fencing_WCH_SMS-IN_t160217.jpg/440px-Dolniceanu_v_Samele_2013_Fencing_WCH_SMS-IN_t160217.jpg', '1987/07/25', 12, 'https://en.wikipedia.org/wiki/Luigi_Samele_(fencer)');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (31, 'Andrew', 'Mackiewicz', 'https://cdn1.sportngin.com/attachments/photo/8ad9-160307419/AUG_4154_large.jpg', '1995/12/12', 1, 'https://en.wikipedia.org/wiki/Andrew_Mackiewicz');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (32, 'Simone', 'Biles', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Simone_Biles_Rio_2016e.jpg/440px-Simone_Biles_Rio_2016e.jpg', '1997/03/14', 1, 'https://en.wikipedia.org/wiki/Simone_Biles');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (33, 'Yeo', ' Seo-jeong', 'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcSdV3pP9-mbiH5Q9qBWF9f5b7pr08FWkhwm_cyhjRmQ1OZ7jsrIEwUngLQkNqdJ87x_PSlRul2fEZ3QUEM', '2002/02/20', 11, 'https://en.wikipedia.org/wiki/Yeo_Seo-jeong');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (34, 'Lilia', 'Akhaimova', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Lilia_Akhaimova_2021cr.jpg/440px-Lilia_Akhaimova_2021cr.jpg', '1997/03/17', 6, 'https://en.wikipedia.org/wiki/Lilia_Akhaimova');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (35, 'Federico', 'Burdisso', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Federico_Burdisso_%2804%29_%28cropped%29.jpg/440px-Federico_Burdisso_%2804%29_%28cropped%29.jpg', '2001/09/20', 12, 'https://en.wikipedia.org/wiki/Federico_Burdisso');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (36, 'Gunner', 'Bentz', 'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcQmh2oAa4zo5gq4eF3SpTuCvEhde4tC_Z68nEW8H76bMdVKtn5Pqn1rEaYOQOp50SSw761LuC4cAnDJ10A', '1996/01/03', 1, 'https://en.wikipedia.org/wiki/Gunnar_Bentz');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (37, 'Noe', 'Ponti', 'https://swimswam.com/wp-content/uploads/2019/07/20190703_GSca_KA05637.jpg', '2001/06/01', 10, 'https://en.wikipedia.org/wiki/No%C3%A8_Ponti');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (38, 'Jessica', 'Pilz', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/CISM2017_250217_115026.jpg/440px-CISM2017_250217_115026.jpg', '1996/11/26', 3, 'https://en.wikipedia.org/wiki/Jessica_Pilz');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (39, 'Anouck', 'Jaubert', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Climbing_World_Championships_2018_Speed_Eighth-finals_%28BT0A5905%29.jpg/440px-Climbing_World_Championships_2018_Speed_Eighth-finals_%28BT0A5905%29.jpg', '1994/01/27', 4, 'https://en.wikipedia.org/wiki/Anouck_Jaubert');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (40, 'Viktoriia', 'Meshkova', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/2020-11-28_-_IFSC_Euros_-_Combined_W-S_-_Photo_059.jpg/440px-2020-11-28_-_IFSC_Euros_-_Combined_W-S_-_Photo_059.jpg', '2000/09/20', 6, 'https://en.wikipedia.org/wiki/Viktoriia_Meshkova');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (41, 'Aleksandr', 'Baichik', 'https://c8.alamy.com/compes/2gh0n88/tokio-2020-juegos-paralimpicos-voleibol-sentido-partido-medalla-de-oro-masculino-comite-paralimpico-ruso-contra-iran-makuhari-messe-hall-a-chiba-japon-4-de-septiembre-de-2021-aleksandr-baichik-del-comite-paralimpico-ruso-y-aleksandr-savichev-del-comite-paralimpico-ruso-en-accion-reuters-issei-kato-2gh0n88.jpg', '1982/04/15', 6, 'https://en.wikipedia.org/wiki/Aleksandr_Baichik');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (42, 'Jurgen', 'Schrapp', 'https://www.teamdeutschland-paralympics.de/fileadmin/_processed_/a/0/csm_Schrapp_Juergen_815cdebaad.jpg', '1974/02/23', 5, 'https://www.linkedin.com/posts/juergen-schrapp-80529514b_bayersupplierday2021-bayerprocurement-bayer-activity-6866384800354189312-Zk_-/');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (43, 'Stefan', 'Jansson', 'https://www.paralympic.org/sites/default/files/styles/image_crop_16_9_800_450/public/images/180730095636982_stefan%2Bjonsson%2B2_kevin%2Bbogetti-smith.jpg?itok=_dIj0xuM', '1970/05/20', 9, 'https://www.paralympic.org/stefan-jansson');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (44, 'Jiansen', 'Wei', 'https://www.paralympic.org/sites/default/files/styles/image_crop_16_9_800_450/public/images/180605095318194_Wei%2BJiansen%2B-%2BNPC%2BChina.jpg?h=4233ef75&itok=ycQCjrgu', '1999/12/26', 2, 'https://www.paralympic.org/jiansen-wei');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (45, 'Abderrazak', 'Hattab', 'https://www.paralympic.org/sites/default/files/styles/image_crop_16_9_800_450/public/images/180605091912811_Abderrazak%2BHattab%2B-%2BGetty%2BImages.jpg?itok=cL46iAh-', '1995/04/22', 3, 'https://www.paralympic.org/abderrazak-hattab');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (46, 'Antonio', 'Martin', 'https://www.paralympic.org/sites/default/files/styles/image_crop_16_9_800_450/public/images/180507145525676_Gaitan%2BSpain.jpg?itok=OXUtug_E', '1997/05/04', 8, 'https://www.paralympic.org/antonio-martin-gaitan');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (47, 'Brad', 'Hudspeth', 'https://usawr.org/wp-content/uploads/2023/06/Hudspeth-1x1-72-dpi-8916.jpg', '1989/11/12', 1, 'https://usawr.org/player/brad-hudspeth/');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (48, 'Chuck ', 'Aoki', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQOWP4DKHdvQcL4Xu_a25L9HwjEzCYQKnZAQXfZSxEar7ZWBnkH', '1981/03/25', 4, 'https://www.paralympic.org/news/seven-wheelchair-rugby-stars-named-ones-watch');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (49, 'Thomas', 'Hjert', 'https://www.paralympic.org/sites/default/files/styles/image_crop_16_9_800_450/public/images/170104122009760_Tomas%2BHjert_Wheelchair%2Brugby_GettyImages-607367620.jpg?itok=VuvSEQrH', '1983/05/22', 9, 'https://www.paralympic.org/tomas-hjert');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (50, 'Merle', 'Frabel', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/2021-10-24_Deutsche_Meisterschaften_im_Rennrodeln_Altenberg_2021_%28Einsitzer_der_Frauen%29_by_Sandro_Halank%E2%80%93043.jpg/440px-2021-10-24_Deutsche_Meisterschaften_im_Rennrodeln_Altenberg_2021_%28Einsitzer_der_Frauen%29_by_Sandro_Halank%E2%80%93043.jpg', '2003/06/11', 5, 'https://en.wikipedia.org/wiki/Merle_Fr%C3%A4bel');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (51, 'Diana', 'Loginova', 'https://img.olympicchannel.com/images/image/private/t_16-9_760/f_auto/primary/jkqmb8kmcltbq9apuvqg', '2003/07/15', 6, 'https://olympics.com/en/athletes/diana-loginova');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (52, 'Madeleine', 'Egle', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/2018-11-22_Madeleine_Egle_by_Sandro_Halank.jpg/440px-2018-11-22_Madeleine_Egle_by_Sandro_Halank.jpg', '1998/08/21', 3, 'https://en.wikipedia.org/wiki/Madeleine_Egle');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (53, 'You', 'Young', 'https://upload.wikimedia.org/wikipedia/commons/9/92/You_Young_at_the_2019_Skate_Canada_-_Awarding_ceremony.jpg', '2004/05/27', 11, 'https://en.wikipedia.org/wiki/You_Young');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (54, 'Kseniia', 'Sinitsyna', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/2020-01-11_Women%27s_Single_Figure_Skating_Short_Program_%282020_Winter_Youth_Olympics%29_by_Sandro_Halank%E2%80%93507.jpg/440px-2020-01-11_Women%27s_Single_Figure_Skating_Short_Program_%282020_Winter_Youth_Olympics%29_by_Sandro_Halank%E2%80%93507.jpg', '2004/08/05', 6, 'https://en.wikipedia.org/wiki/Kseniia_Sinitsyna');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (55, 'Anna', 'Frolova', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/BO2I1664_edited.jpg/300px-BO2I1664_edited.jpg', '2005/08/07', 6, 'https://en.wikipedia.org/wiki/Anna_Frolova');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (56, 'Chana', 'Beitone', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/2020-01-10_Curling_at_the_2020_Winter_Youth_Olympics_%E2%80%93_Mixed_Team_%E2%80%93_Round_Robin_%E2%80%93_Session_2_%E2%80%93_France_vs._Great_Britain_%28Martin_Rulsch%29_36.jpg/440px-2020-01-10_Curling_at_the_2020_Winter_Youth_Olympics_%E2%80%93_Mixed_Team_%E2%80%93_Round_Robin_%E2%80%93_Session_2_%E2%80%93_France_vs._Great_Britain_%28Martin_Rulsch%29_36.jpg', '2003/09/13', 4, 'https://www.wikidata.org/wiki/Q81901801');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (57, 'Nikolai', 'Lysakov', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2020-01-22_Curling_at_the_2020_Winter_Youth_Olympics_%E2%80%93_Mixed_Doubles_%E2%80%93_Gold_Medal_Game_%28Martin_Rulsch%29_011.jpg/460px-2020-01-22_Curling_at_the_2020_Winter_Youth_Olympics_%E2%80%93_Mixed_Doubles_%E2%80%93_Gold_Medal_Game_%28Martin_Rulsch%29_011.jpg', '2003/03/27', 6, 'https://www.olympedia.org/athletes/139077');
INSERT INTO `athlete` (`id`, `first_name`, `last_name`, `photo`, `date_of_birth`, `country_id`, `social_media_url`) VALUES (58, 'Pei', 'Junhang', 'https://c8.alamy.com/comp/2AMTCWC/champery-14th-jan-2020-zhai-zhixin-l-and-pei-junhang-of-china-compete-during-the-mixed-team-group-b-session-15-of-curling-between-china-and-denmark-at-the-3rd-winter-youth-olympic-games-at-champery-curling-arena-switzerland-on-jan-14-2020-credit-bai-xueqixinhuaalamy-live-news-2AMTCWC.jpg', '2003/06/10', 2, 'https://en.wikipedia.org/wiki/Pei_Junhang');

COMMIT;


-- -----------------------------------------------------
-- Data for table `league`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `league` (`id`, `name`, `photo`, `bets_enabled`, `user_id`, `buy_in`, `side_wager`, `created_date`, `updated_date`, `enabled`) VALUES (1, 'golden dreams', 'https://static.wikia.nocookie.net/disney/images/4/42/Wfmt-2-web.jpg/revision/latest?cb=20130329031159', 1, 1, 1, '1', '2000-01-12 12:12:12', '2001-01-12 12:12:12', 1);
INSERT INTO `league` (`id`, `name`, `photo`, `bets_enabled`, `user_id`, `buy_in`, `side_wager`, `created_date`, `updated_date`, `enabled`) VALUES (2, 'Global Unity ', 'https://stillmed.olympics.com/media/Images/OlympicOrg/News/2020/09/18/2020-09-18-peace-thumbnail-2.jpg?interpolation=lanczos-none&fit=around|1060:600&crop=1060:600;*,*', 1, 1, 1, '1', '2000-01-12 12:12:12', '2001-01-12 12:12:12', 1);
INSERT INTO `league` (`id`, `name`, `photo`, `bets_enabled`, `user_id`, `buy_in`, `side_wager`, `created_date`, `updated_date`, `enabled`) VALUES (3, 'Stellar Champions Circuit', 'https://ca-times.brightspotcdn.com/dims4/default/41d4c11/2147483647/strip/true/crop/4655x3103+0+0/resize/2000x1333!/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F98%2F6c%2F1c64b592429880d39284ee8002ee%2F910451-la-sp-winter-oly-ga-15015.jpg', 1, 1, 1, '0', '2000-01-12 12:12:12', '2001-01-12 12:12:12', 1);
INSERT INTO `league` (`id`, `name`, `photo`, `bets_enabled`, `user_id`, `buy_in`, `side_wager`, `created_date`, `updated_date`, `enabled`) VALUES (4, 'Grand Olympiad Alliance', 'https://assets.nautil.us/nautilus-vertical/abstractions-a-619.jpeg?q=65&auto=format&w=1600&ar=3:1&fit=crop', 1, 1, 0, '1', '2000-01-12 12:12:12', '2001-01-12 12:12:12', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `team`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `team` (`user_id`, `league_id`, `name`, `photo`, `description`, `created_date`, `updated_date`, `enabled`) VALUES (2, 1, 'Michigan Mullets', 'https://media.alaskapublic.org/wp-content/uploads/2022/12/mullet.jpg', 'unique blend of ruggedness and flair. Hailing from the state of Michigan, known for its beautiful landscapes and outdoor enthusiasts, the Michigan Mullets embody a spirit of adventure and individuality. With their distinctive hairstyle as their trademark, these athletes exude confidence and a touch of eccentricity.', '2018-01-12 12:12:12', '2021-01-12 12:12:12', 1);
INSERT INTO `team` (`user_id`, `league_id`, `name`, `photo`, `description`, `created_date`, `updated_date`, `enabled`) VALUES (3, 1, 'Longmont Legionaire', 'https://static.wikia.nocookie.net/travian/images/c/c0/Legionnaire.jpg/revision/latest?cb=20111211172105&path-prefix=en', 'This team represents the epitome of strength, discipline, and unwavering dedication. Hailing from the city of Longmont, they embody the spirit of a proud and noble legion.', '2018-01-12 12:12:12', '2021-01-12 12:12:12', 1);
INSERT INTO `team` (`user_id`, `league_id`, `name`, `photo`, `description`, `created_date`, `updated_date`, `enabled`) VALUES (4, 1, 'Berthoud Bottlers', 'https://i1.sndcdn.com/avatars-000333530636-cw9yw0-t500x500.jpg', 'This team embodies the spirit of craftsmanship, tradition, and a touch of whimsy. Hailing from the town of Berthoud, known for its rich history in bottling and beverage production, the Berthoud Bottlers bring a unique charm to the world of sports.', '2018-01-12 12:12:12', '2021-01-12 12:12:12', 1);
INSERT INTO `team` (`user_id`, `league_id`, `name`, `photo`, `description`, `created_date`, `updated_date`, `enabled`) VALUES (5, 2, 'Mystic Medallions', 'https://www.stonetiledepot.com/wp-content/uploads/2012/primages/MD00073.webp', 'A team of extraordinary athletes who possess mystical abilities. They draw upon ancient powers and enchantments, infusing their performances with awe-inspiring magic and captivating the audience with their otherworldly talents.', '2018-01-12 12:12:12', '2021-01-12 12:12:12', 1);
INSERT INTO `team` (`user_id`, `league_id`, `name`, `photo`, `description`, `created_date`, `updated_date`, `enabled`) VALUES (6, 2, 'Celestial Champions', 'https://static.wikia.nocookie.net/dont-starve-game/images/2/2c/Celestial_Champion_Phase_1.png/revision/latest?cb=20210416152944', 'A team of celestial beings who descend from the heavens to compete in the Olympic games. With their ethereal grace and celestial strength, they demonstrate unparalleled skill and breathtaking athleticism, leaving spectators in awe of their divine performances.', '2018-01-12 12:12:12', '2021-01-12 12:12:12', 1);
INSERT INTO `team` (`user_id`, `league_id`, `name`, `photo`, `description`, `created_date`, `updated_date`, `enabled`) VALUES (7, 3, 'Elemental Titans', 'https://as1.ftcdn.net/v2/jpg/01/80/55/70/1000_F_180557075_mUqtUQKDdtr1TYFvpjEBEcN0RYXR4Bxh.jpg', 'A team whose members embody the forces of nature. Each athlete represents an elemental power - earth, fire, water, or air - and showcases their mastery over these elements through incredible feats of athleticism, demonstrating the raw power and beauty of nature.', '2018-01-12 12:12:12', '2021-01-12 12:12:12', 1);
INSERT INTO `team` (`user_id`, `league_id`, `name`, `photo`, `description`, `created_date`, `updated_date`, `enabled`) VALUES (8, 3, 'Astral Aces', 'https://ship-photo-roster.com/images/photos/thumbs/75/7529983dce_l.jpg', 'A team comprised of cosmic athletes who excel in interstellar events. These stellar competitors navigate through space and time, defying gravity and pushing the boundaries of human potential, as they vie for astronomical achievements on the grandest stage.', '2018-01-12 12:12:12', '2021-01-12 12:12:12', 1);
INSERT INTO `team` (`user_id`, `league_id`, `name`, `photo`, `description`, `created_date`, `updated_date`, `enabled`) VALUES (9, 4, 'Mythical Marauders', 'https://static.wikia.nocookie.net/treasure-x/images/a/a2/Myth_mauler_dragon.png/revision/latest/smart/width/250/height/250?cb=20200107035425', 'A team of legendary creatures and mythical beings who have joined forces to compete in the Olympics. From fearsome dragons to swift unicorns and cunning griffins, they showcase their mythical strengths and skills, bringing to life the tales of old in the realm of sports.', '2018-01-12 12:12:12', '2021-01-12 12:12:12', 1);
INSERT INTO `team` (`user_id`, `league_id`, `name`, `photo`, `description`, `created_date`, `updated_date`, `enabled`) VALUES (10, 4, 'Arcane All-Stars', 'https://pbs.twimg.com/media/FOYYVhpVUAEOD8H.jpg:large', 'This team is a gathering of extraordinary individuals who possess a deep connection to the mystical arts. Each member of the Arcane All Stars is a master of arcane knowledge and harnesses magical energies to excel in their respective sports.', '2018-01-12 12:12:12', '2021-01-12 12:12:12', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `league_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `league_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `league_id`, `reply_to_id`) VALUES (2, 2, 'I look forward to taking all your money', '2021-01-12 12:12:12', 1, NULL);
INSERT INTO `league_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `league_id`, `reply_to_id`) VALUES (3, 5, 'Remember guys its not about winning its about having fun', '2021-01-12 12:12:12', 2, NULL);
INSERT INTO `league_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `league_id`, `reply_to_id`) VALUES (4, 7, 'Pretty sure you should all just give me your money', '2021-01-12 12:12:12', 3, NULL);
INSERT INTO `league_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `league_id`, `reply_to_id`) VALUES (5, 9, 'Looks lie i signed up for the rookies league', '2021-01-12 12:12:12', 4, NULL);
INSERT INTO `league_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `league_id`, `reply_to_id`) VALUES (6, 3, 'Not if i have anything to do with it', '2021-02-12 12:12:12', 1, 2);
INSERT INTO `league_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `league_id`, `reply_to_id`) VALUES (7, 6, 'Sounds like a losing attitude', '2021-02-12 12:12:12', 2, 3);
INSERT INTO `league_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `league_id`, `reply_to_id`) VALUES (8, 8, 'Ill let you count it when i win', '2021-02-12 12:12:12', 3, 4);
INSERT INTO `league_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `league_id`, `reply_to_id`) VALUES (9, 10, 'Do you even know what the olympics are', '2021-02-12 12:12:12', 4, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `olympiad_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `olympiad_category` (`id`, `name`, `description`) VALUES (1, 'Winter Olympics', 'The Winter Olympic Games is a major international multi-sport event held once every four years for sports practiced on snow and ice. The first Winter Olympic Games, the 1924 Winter Olympics, were held in Chamonix, France');
INSERT INTO `olympiad_category` (`id`, `name`, `description`) VALUES (2, 'Summer Olympics', 'The Summer Olympic Games, also known as the Games of the Olympiad, and often referred to as the Summer Olympics, is a major international multi-sport event normally held once every four years. The inaugural Games took place in 1896 in Athens, Greece, and the most recent Games were held in 2021 in Tokyo, Japan');
INSERT INTO `olympiad_category` (`id`, `name`, `description`) VALUES (3, 'Youth Olympic Games', 'An elite sporting event, the Youth Olympic Games bring together athletes (ages 15-18) from more than 200 countries around the world for a summer and winter programme.');
INSERT INTO `olympiad_category` (`id`, `name`, `description`) VALUES (4, 'Paralympics', 'The Paralympic Games provide a platform for Para athletes with a diverse range of impairments to showcase their outstanding abilities to millions of spectators and billions of TV viewers.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `olympiad`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `olympiad` (`id`, `title`, `year`, `country_id`, `opening_date`, `closing_date`, `logo`, `host_city`, `category_id`, `website_url`) VALUES (1, 'Beijing Winter Olympics', 2022, 2, '2022-01-12 12:12:12', '2022-01-28 12:12:12', 'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcSSceTu3sGboZ5N4byC_yYwSKKazJPk6-bLAIqvRSPZdtsE6fhAaupmDlnoq7hUJqQISRzmXX3GnB-PHLJMI2RJTucZM16Q', 'Beijing', 1, 'https://olympics.com/en/olympic-games/beijing-2022');
INSERT INTO `olympiad` (`id`, `title`, `year`, `country_id`, `opening_date`, `closing_date`, `logo`, `host_city`, `category_id`, `website_url`) VALUES (2, 'Summer  Olympics', 2024, 4, '2024-07-26 12:12:12', '2024-08-11 12:12:12', 'https://img.olympicchannel.com/images/image/private/t_s_w338/f_auto/primary/gpo3co3bpkqsikyznrns', 'Paris', 2, 'https://olympics.com/en/olympic-games/paris-2024');
INSERT INTO `olympiad` (`id`, `title`, `year`, `country_id`, `opening_date`, `closing_date`, `logo`, `host_city`, `category_id`, `website_url`) VALUES (3, 'Italy Winter Olympics', 2026, 12, '2026-02-06 12:12:12', '2026-02-22 12:12:12', 'https://upload.wikimedia.org/wikipedia/en/thumb/6/60/2026_Winter_Olympics_logo.png/420px-2026_Winter_Olympics_logo.png', 'Milan', 1, 'https://milanocortina2026.olympics.com/en/');
INSERT INTO `olympiad` (`id`, `title`, `year`, `country_id`, `opening_date`, `closing_date`, `logo`, `host_city`, `category_id`, `website_url`) VALUES (4, 'Summer Olympics', 2028, 1, '2028-07-14 12:12:12', '2028-07-30 12:12:12', 'https://img.olympicchannel.com/images/image/private/t_s_w338/f_auto/primary/sd6gix7qvjwbtn9zlrlb', 'Los Angeles', 2, 'https://la28.org/');
INSERT INTO `olympiad` (`id`, `title`, `year`, `country_id`, `opening_date`, `closing_date`, `logo`, `host_city`, `category_id`, `website_url`) VALUES (5, 'Winter Oympics', 2018, 11, '2018-02-08 12:12:12', '2018-02-25 12:12:12', 'https://img.olympicchannel.com/images/image/private/w_300/f_auto/primary/waiixcg4qhnqq4fdifua', 'PyeongChang', 1, 'https://olympics.com/en/olympic-games/pyeongchang-2018');
INSERT INTO `olympiad` (`id`, `title`, `year`, `country_id`, `opening_date`, `closing_date`, `logo`, `host_city`, `category_id`, `website_url`) VALUES (6, 'Youth Olympic Games ', 2024, 11, '2024-01-19 12:12:12', '2024-02-01 12:12:12', 'https://img.olympicchannel.com/images/image/private/t_s_w1920/t_s_16_9_g_auto/f_auto/primary/yaqschjucuuoubjs809h', 'Gangwon', 3, 'https://olympics.com/en/gangwon-2024/');
INSERT INTO `olympiad` (`id`, `title`, `year`, `country_id`, `opening_date`, `closing_date`, `logo`, `host_city`, `category_id`, `website_url`) VALUES (7, 'Paralympic Games', 2026, 12, '2024-03-06 12:12:12', '2024-03-15 12:12:12', 'https://www.paralympic.org/sites/default/files/2021-04/Milano-Cortina%202026%20header.jpg', 'Milan', 4, 'https://www.paralympic.org/milano-cortina-2026');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sport`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (1, 'Ice Hockey Men', 'Ice hockey (or simply hockey) is a team sport played on ice skates, usually on an ice skating rink with lines and markings specific to the sport. It belongs to a family of sports called hockey. In ice hockey, two opposing teams use ice hockey sticks to control, advance, and shoot a closed, vulcanized, rubber disc called a \"puck\" into the other team\'s goal. Each goal is worth one point. The team which scores the most goals is declared the winner. In a formal game, each team has six skaters on the ice at a time, barring any penalties, one of whom is the goaltender. Ice hockey is a full contact sport, and is considered to be one of the more physically demanding team sports', 'https://ca-times.brightspotcdn.com/dims4/default/84bc017/2147483647/strip/false/crop/3609x2030+0+617/resize/1200x675!/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F71%2F1a%2F0aa1d5874e519e4978079a925c12%2Fhttps-delivery-gettyimages.com%2Fdownloads%2F1450115423');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (2, 'Alpine Skiing Slalom Women', 'Alpine skiing, or downhill skiing, is the pastime of sliding down snow-covered slopes on skis with fixed-heel bindings, unlike other types of skiing (cross-country, Telemark, or ski jumping), which use skis with free-heel bindings. Whether for recreation or for sport, it is typically practiced at ski resorts, which provide such services as ski lifts, artificial snow making, snow grooming, restaurants, and ski patrol.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Ski_Famille_-_Family_Ski_Holidays.jpg/600px-Ski_Famille_-_Family_Ski_Holidays.jpg');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (3, 'Bobsleigh Four-Man', 'Bobsleigh or Bobsled is a team winter sport that involves making timed runs down narrow, twisting, banked, iced tracks in a gravity-powered sleigh. International bobsleigh competitions are governed by the International Bobsleigh and Skeleton Federation, also known as FIBT from the French Fédération Internationale de Bobsleigh et de Tobogganing. National competitions are often governed by bodies such as the United States Bobsled and Skeleton Federation, Bobsleigh Canada Skeleton, and the German Bobsleigh, Luge, and Skeleton Federation.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/USA_I_in_heat_1_of_2_man_bobsleigh_at_2010_Winter_Olympics_2010-02-20.jpg/600px-USA_I_in_heat_1_of_2_man_bobsleigh_at_2010_Winter_Olympics_2010-02-20.jpg');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (4, 'Speed Skating 10000m Men', 'Speed skating is a competitive form of ice skating in which the competitors race each other in travelling a certain distance on skates. Types of speed skating are long track speed skating, short track speed skating, and marathon speed skating. In the Olympic Games, long-track speed skating is usually referred to as just \"speed skating\", while short-track speed skating is known as \"short track\".[1] The International Skating Union (ISU), the governing body of competitive ice sports, refers to long track as \"speed skating\" and short track as \"short track skating\".', 'Speed skating is a competitive form of ice skating in which the competitors race each other in travelling a certain distance on skates. Types of speed skating are long track speed skating, short track speed skating, and marathon speed skating. In the Olympic Games, long-track speed skating is usually referred to as just \"speed skating\", while short-track speed skating is known as \"short track\".[1] The International Skating Union (ISU), the governing body of competitive ice sports, refers to long track as \"speed skating\" and short track as \"short track skating\".');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (5, 'Ski Jumping Normal Hill Women', 'Ski jumping is a winter sport in which competitors aim to achieve the farthest jump after sliding down on their skis from a specially designed curved ramp. Along with jump length, competitor\'s aerial style and other factors also affect the final score. Ski jumping was first contested in Norway in the late 19th century, and later spread through Europe and North America in the early 20th century. Along with cross-country skiing, it constitutes the traditional group of Nordic skiing disciplines.[1]', 'Ski jumping is a winter sport in which competitors aim to achieve the farthest jump after sliding down on their skis from a specially designed curved ramp. Along with jump length, competitor\'s aerial style and other factors also affect the final score. Ski jumping was first contested in Norway in the late 19th century, and later spread through Europe and North America in the early 20th century. Along with cross-country skiing, it constitutes the traditional group of Nordic skiing disciplines.');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (6, 'Snowboarding Half Pipe Men', 'Snowboarding is a recreational and competitive activity that involves descending a snow-covered surface while standing on a snowboard that is almost always attached to a rider\'s feet. It features in the Winter Olympic Games and Winter Paralympic Games.\n\nSnowboarding was developed in the United States, inspired by skateboarding, sledding, surfing, and skiing. It became popular around the world, and was introduced as a Winter Olympic Sport at Nagano in 1998[1] and featured in the Winter Paralympics at Sochi in 2014.[2] As of 2015, its popularity (as measured by equipment sales) in the United States peaked in 2007 and has been in a decline since.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Snowboarding.jpg/500px-Snowboarding.jpg');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (7, 'Artistic swimming Duet Women', 'Artistic swimming (formerly synchronized swimming) competitions at the 2024 Summer Olympics in Paris, France are scheduled to run between 5 and 10 August at the Paris Aquatics Centre.[1][2] Unlike in the previous edition, the number of swimmers competing across two events at these Games has been reduced from 104 to 96.\n\nSeveral significant changes are instituted in the artistic swimming program for Paris 2024 to reinforce gender equality and vast diversity among the nations in the qualifying process. On October 7, 2022, FINA favored nearly 99 percent of the votes to amend the artistic swimming rules between 2022 and 2025, such as the composition of an eight-member team and a maximum number of two males in the team', 'https://upload.wikimedia.org/wikipedia/en/thumb/5/5e/Artistic_swimming_%E2%80%93_Paris_2024.svg/300px-Artistic_swimming_%E2%80%93_Paris_2024.svg.png');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (8, 'Archery Individual Recurve Women', 'The archery competitions at the 2024 Summer Olympics in Paris are scheduled to run over a seven-day period, from 25 July to 4 August, at Les Invalides.[1][2] 128 archers (64 for each gender) will compete across five events, with the successful mixed team recurve returning to the Olympic program for the second time.\n\nThe archery competitions at the 2024 Summer Olympics in Paris are scheduled to run over a seven-day period, from 25 July to 4 August, at Les Invalides.[1][2] 128 archers (64 for each gender) will compete across five events, with the successful mixed team recurve returning to the Olympic program for the second time.\n\n', 'https://upload.wikimedia.org/wikipedia/en/thumb/c/cd/Archery_%E2%80%93_Paris_2024.svg/300px-Archery_%E2%80%93_Paris_2024.svg.png');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (9, 'Diving 10m Men', 'The diving competitions at the 2024 Summer Olympics in Paris are scheduled to run from 27 July to 10 August 2024 at the Paris Aquatics Centre.[1][2] A total of 136 divers, with an equal distribution between men and women, will compete across eight medal events (four per gender in both individual and synchronized) at these Games, the exact same amount as Tokyo 2020', 'https://upload.wikimedia.org/wikipedia/en/thumb/0/0e/Diving_%E2%80%93_Paris_2024.svg/300px-Diving_%E2%80%93_Paris_2024.svg.png');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (10, 'Basketball Men', 'Basketball at the 2024 Summer Olympics in Paris, France will be held from 27 July to 11 August 2024.[1] Preliminary 5-on-5 basketball matches will occur at Pierre Mauroy Stadium in Lille, with the final phase staged at the Bercy Arena in Paris.[2][3] Retaining its position in the program, the 3×3 competitions will be played at Place de la Concorde.', 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a8/Basketball_%E2%80%93_Paris_2024.svg/300px-Basketball_%E2%80%93_Paris_2024.svg.png');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (11, ' Fencing Individual Sabre', 'The fencing competitions at the 2024 Summer Olympics in Paris are scheduled to run from 27 July to 4 August at the Grand Palais strip.[1][2] A total of 212 fencers, with an equal distribution between men and women, will compete across twelve medal events at the Games. For the second straight time, Paris 2024 will witness both men and women fence against each other in the individual and team events held in all three weapons (foil, épée, and sabre)', 'https://upload.wikimedia.org/wikipedia/en/thumb/6/6b/Fencing_%E2%80%93_Paris_2024.svg/300px-Fencing_%E2%80%93_Paris_2024.svg.png');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (12, 'Gymnastics Vault Women', 'Gymnastics at the 2024 Summer Olympics in Paris will be contested in three categories: artistic gymnastics, rhythmic gymnastics and trampolining. The artistic (27 July to 5 August) and trampoline (2 August) events will occur at the Bercy Arena, with the rhythmic events staged at Porte de La Chapelle Arena from 8 to 10 August', 'https://upload.wikimedia.org/wikipedia/en/thumb/4/4b/Gymnastics_%28artistic%29_%E2%80%93_Paris_2024.svg/200px-Gymnastics_%28artistic%29_%E2%80%93_Paris_2024.svg.png');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (13, 'Swimming 200m Butterfly Men', 'The swimming competitions at the 2024 Summer Olympics in Paris are scheduled to run from 27 July to 9 August 2024. Pool events (27 July to 4 August) will occur at the Paris La Défense Arena, with the two-day marathon swimming (8 to 9 August) staged at Pont Alexandre III through the Seine River.', 'https://upload.wikimedia.org/wikipedia/en/thumb/f/f9/Swimming_%E2%80%93_Paris_2024.svg/300px-Swimming_%E2%80%93_Paris_2024.svg.png');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (14, 'Sport Climbing Bouldering Women', 'Sport climbing competitions at the 2024 Summer Olympics are scheduled to run from 5 to 10 August at Le Bourget Sport Climbing Venue in Saint-Denis, returning to the program for the second time since the sport\'s official debut three years earlier in Tokyo 2020.[1] The total number of medal events will double from two in the previous edition, separating the boulder-and-lead tandem from the speed format.[2] Furthermore, Paris 2024 will witness a significant rise in the number of sport climbers competing contrary to Tokyo 2020, expanding the roster size from 40 to 68', 'https://upload.wikimedia.org/wikipedia/en/thumb/e/e6/Sport_climbing_%E2%80%93_Paris_2024.svg/300px-Sport_climbing_%E2%80%93_Paris_2024.svg.png');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (15, 'Sitting Volleyball', 'Sitting volleyball is a form of volleyball for athletes with a disability. As opposed to standing volleyball, sitting volleyball players must sit on the floor to play.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Volleyball_-_Paralympic_pictogram.svg/300px-Volleyball_-_Paralympic_pictogram.svg.png');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (16, 'Blind Football', 'Football 5-a-side,[1] more commonly known as blind football or blind soccer, is a variation of association football designed for players who are blind or visually impaired. It is currently a Paralympic sport, and the International Blind Sports Association (IBSA) also organizes a World Championship', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Football_5-a-side_pictogram_%28Paralympics%29.svg/300px-Football_5-a-side_pictogram_%28Paralympics%29.svg.png');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (17, 'Wheelchair Rugby', 'Wheelchair rugby (originally murderball, and known as quad rugby in the United States) is a team sport for athletes with a disability. It is practised in over twenty-five countries around the world and is a summer Paralympic sport.\n\nThe US name is based on the requirement that all wheelchair rugby players need to have disabilities that include at least some loss of function in at least three limbs. Although most have spinal cord injuries, players may also qualify through multiple amputations, neurological disorders or other medical conditions. Players are assigned a functional level in points, and each team is limited to fielding a team with a total of eight points.\n\nWheelchair rugby is played indoors on a hardwood court, and physical contact between wheelchairs is an integral part of the game. The rules include elements from wheelchair basketball, ice hockey, handball and rugby union.\n\nThe sport is governed by the International Wheelchair Rugby Federation (IWRF) which was established in 1993.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Wheelchair_rugby_-_Paralympic_pictogram.svg/300px-Wheelchair_rugby_-_Paralympic_pictogram.svg.png');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (18, ' Youth Luge Double Open Women', 'A luge /luːʒ/ is a small one- or two-person sled on which one sleds supine (face-up) and feet-first. A luger begins seated, propelling themselves initially from handles on either side of the start ramp, then steers by using the calf muscles to flex the sled\'s runners or by exerting opposite shoulder pressure to the pod. Racing sleds weigh 21–25 kg (46–55 lb) for singles and 25–30 kg (55–66 lb) for doubles.[1] Luge is also the name of an Olympic sport that employs that sled and technique', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/D%C3%A9part_d%27un_lugeur.jpg/500px-D%C3%A9part_d%27un_lugeur.jpg');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (19, 'Youth Figure Skating Ladies', 'Figure skating is a sport in which individuals, pairs, or groups perform on figure skates on ice. It was the first winter sport to be included in the Olympic Games, when contested at the 1908 Olympics in London.[1] The Olympic disciplines are men\'s singles, women\'s singles,[note 1] pair skating, and ice dance; the four individual disciplines are also combined into a team event, first included in the Winter Olympics in 2014. The non-Olympic disciplines include synchronized skating, Theater on Ice, and four skating. From intermediate through senior-level competition, skaters generally perform two programs (the short program and the free skate), which, depending on the discipline, may include spins, jumps, moves in the field, lifts, throw jumps, death spirals, and other elements or moves.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Carolina_Kostner_at_2013_Italian_Figure_Skating_Championships.jpg/440px-Carolina_Kostner_at_2013_Italian_Figure_Skating_Championships.jpg');
INSERT INTO `sport` (`id`, `name`, `description`, `picture_url`) VALUES (20, 'Youth Curling Mixed Doubles', 'Curling is a sport in which players slide stones on a sheet of ice toward a target area which is segmented into four concentric circles. It is related to bowls, boules and shuffleboard. Two teams, each with four players, take turns sliding heavy, polished granite stones, also called rocks, across the ice curling sheet toward the house, a circular target marked on the ice.[2] Each team has eight stones, with each player throwing two. The purpose is to accumulate the highest score for a game; points are scored for the stones resting closest to the centre of the house at the conclusion of each end, which is completed when both teams have thrown all of their stones once. A game usually consists of eight or ten ends.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Brier_045.jpg/600px-Brier_045.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sport_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (1, 'Wukesong Arena', '39.909989', '116.274664', 1, 1, 1, '2018-02-06 12:12:12');
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (2, 'anqing National Alpine Ski Centre', '40.908528', '115.802567', 1, 2, 1, '2018-02-11 12:12:12');
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (3, 'Yanqing National Sliding Centre', '40.520536', '115.780856', 1, 3, 1, '2018-02-05 12:12:12');
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (4, 'Beijing National Speed Skating Oval', '40.015892', '116.371414', 1, 4, 1, '2018-02-08 12:12:12');
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (5, 'anqing National Alpine Ski Centre', '40.908528', '115.802567', 1, 5, 1, '2018-02-09 12:12:12');
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (6, 'anqing National Alpine Ski Centre', '40.908528', '115.802567', 1, 6, 1, '2018-02-12 12:12:12');
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (7, 'Paris La Défense Arena', '48.895844', '2.230203', 2, 7, 0, NULL);
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (8, 'Les Invalides', '48.855', '2.3125', 2, 8, 0, NULL);
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (9, 'Paris La Défense Arena', '48.895844', '2.230203', 2, 9, 0, NULL);
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (10, 'Accor Arena', '48.838611', '2.378611', 2, 10, 0, NULL);
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (11, 'Grand Palais', '48.866111', '2.3125', 2, 11, 0, NULL);
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (12, 'Porte de La Chapelle Arena', '48.898055', '2.344143', 2, 12, 0, NULL);
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (13, 'Paris La Défense Arena', '48.895844', '2.230203', 2, 13, 0, NULL);
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (14, 'Le Bourget', '48.9353', '2.4256', 2, 14, 0, NULL);
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (15, 'Parc des Princes', '48.841389', '2.253056', 3, 16, 0, NULL);
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (16, 'Wukesong Arena', '39.909989', '116.274664', 3, 15, 0, NULL);
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (17, 'Wukesong Arena', '39.909989', '116.274664', 3, 17, 0, NULL);
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (18, 'Wukesong Arena', '39.909989', '116.274664', 4, 18, 0, NULL);
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (19, 'Wukesong Arena', '39.909989', '116.274664', 4, 19, 0, NULL);
INSERT INTO `sport_event` (`id`, `venue`, `location_latitude`, `location_longitude`, `olympiad_id`, `sport_id`, `completed`, `event_completion_date`) VALUES (20, 'Wukesong Arena', '39.909989', '116.274664', 4, 20, 0, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `athlete_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (1, 1, 1, 'Close game', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (2, 1, 2, 'They fought hard', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (3, 1, 3, 'Lucky to be on the podium', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (4, 2, 1, 'Very fast', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (5, 2, 2, 'Won by .2ms', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (6, 2, 3, 'Cinderalla Story here', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (7, 3, 3, 'Wide gap to win 3rd', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (8, 3, 2, 'Tripped and almost lost 2nd', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (9, 3, 1, 'This was a strong win', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (10, 4, 1, 'Won by a mile', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (11, 4, 3, 'Lucky to be in the event after an off season injury', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (12, 4, 2, 'Close one', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (13, 5, 1, 'Considering how cold it was this was a great win', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (14, 5, 3, 'Great finish', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (15, 5, 2, 'Three way finish could have gone any direction', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (16, 6, 3, 'This guy is amazing, look forward to him next round', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (17, 6, 2, 'So close to the gold', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (18, 6, 1, 'Obvious win with a trick never been done before', 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (19, 7, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (20, 7, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (21, 7, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (22, 8, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (23, 8, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (24, 8, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (25, 9, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (26, 9, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (27, 9, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (28, 10, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (29, 10, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (30, 10, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (31, 11, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (32, 11, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (33, 11, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (34, 12, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (35, 12, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (36, 12, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (37, 13, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (38, 13, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (39, 13, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (40, 14, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (41, 14, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (42, 14, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (43, 15, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (44, 15, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (45, 15, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (46, 16, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (47, 16, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (48, 16, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (49, 17, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (50, 17, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (51, 17, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (52, 18, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (53, 18, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (54, 18, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (55, 19, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (56, 19, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (57, 19, NULL, NULL, 1);
INSERT INTO `athlete_event` (`athlete_id`, `sport_event_id`, `finish_result`, `remarks`, `enabled`) VALUES (58, 20, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `league_has_sport_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (1, 1);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (2, 1);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (3, 1);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (4, 1);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (5, 1);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (6, 1);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (7, 2);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (8, 2);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (9, 2);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (10, 2);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (11, 2);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (12, 2);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (13, 2);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (14, 2);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (1, 3);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (7, 3);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (15, 3);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (2, 4);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (8, 4);
INSERT INTO `league_has_sport_event` (`sport_event_id`, `league_id`) VALUES (16, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `team_has_athlete_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (2, 1, 1, 1);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (2, 1, 4, 2);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (2, 1, 7, 3);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (2, 1, 10, 4);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (2, 1, 13, 5);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (3, 1, 2, 1);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (3, 1, 5, 2);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (3, 1, 8, 3);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (3, 1, 11, 4);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (4, 1, 3, 1);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (4, 1, 6, 2);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (4, 1, 9, 3);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (4, 1, 12, 4);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (3, 1, 14, 5);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (4, 1, 15, 5);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (5, 2, 16, 6);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (6, 2, 17, 6);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (5, 2, 19, 7);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (6, 2, 20, 7);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (5, 2, 22, 8);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (6, 2, 23, 8);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (5, 2, 25, 9);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (6, 2, 26, 9);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (5, 2, 28, 10);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (6, 2, 29, 10);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (7, 3, 31, 11);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (8, 3, 32, 11);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (7, 3, 34, 12);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (8, 3, 35, 12);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (7, 3, 37, 13);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (8, 3, 38, 13);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (7, 3, 40, 14);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (8, 3, 41, 14);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (7, 3, 43, 15);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (8, 3, 44, 15);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (9, 4, 46, 16);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (10, 4, 47, 16);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (9, 4, 49, 17);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (10, 4, 50, 17);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (9, 4, 52, 18);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (10, 4, 53, 18);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (9, 4, 55, 19);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (10, 4, 56, 19);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (9, 4, 58, 20);
INSERT INTO `team_has_athlete_event` (`team_user_id`, `team_league_id`, `athlete_event_athlete_id`, `athlete_event_sport_id`) VALUES (10, 4, 58, 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `athlete_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (2, 2, 'Champion pedigree', '2021-01-06 12:12:12', NULL, 1);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (3, 4, 'Real challenger here', '2021-01-06 12:12:12', NULL, 2);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (4, 5, 'I dont think shes capable of winning gold', '2021-01-06 12:12:12', NULL, 3);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (5, 3, 'Has an injury they arent talking about', '2021-01-06 12:12:12', NULL, 4);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (6, 6, 'Injured, dont put your money here', '2021-01-06 12:12:12', NULL, 5);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (7, 10, 'Young but very aggessive', '2021-01-06 12:12:12', NULL, 6);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (8, 2, 'Attitude gets in the way ', '2021-01-06 12:12:12', NULL, 7);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (9, 9, 'Doesnt perform well in intense environments', '2021-01-06 12:12:12', NULL, 8);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (10, 7, 'Following in dads footsteps, this family knows what to do', '2021-01-06 12:12:12', NULL, 9);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (11, 8, 'Doesnt take it seriously.  Cant see a medal here', '2021-01-06 12:12:12', NULL, 10);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (12, 4, 'Silver at best', '2021-01-06 12:12:12', NULL, 11);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (13, 5, 'Watched the championships.  Might have a chance here', '2021-01-06 12:12:12', NULL, 12);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (14, 4, 'Too old.  Dont waste the pick', '2021-01-06 12:12:12', NULL, 13);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (15, 3, 'Too immature.  Not gonna hold up on event day', '2021-01-06 12:12:12', NULL, 14);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (16, 2, 'Was also a sprinter.  Watch.', '2021-01-06 12:12:12', NULL, 15);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (17, 2, 'Sleeper here.  Easy money', '2021-01-06 12:12:12', NULL, 16);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (18, 9, 'I see gold in her future', '2021-01-06 12:12:12', NULL, 17);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (19, 8, 'Great athlete', '2021-01-06 12:12:12', NULL, 18);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (20, 7, 'Not even sure why shes here', '2021-01-06 12:12:12', NULL, 19);
INSERT INTO `athlete_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `athlete_id`) VALUES (21, 6, 'not impressed with tthe trials', '2021-01-06 12:12:12', NULL, 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sport_event_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (2, 3, 'Snow has been heavy here, could slow the down', '2023-01-12 12:12:12', NULL, 2);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (3, 5, 'very cold this time of year.  Might be hard for athletes', '2019-05-12 12:12:12', NULL, 3);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (4, 6, 'Beautiful brand new venue', '2018-01-12 12:12:12', NULL, 4);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (5, 8, 'This event always has the best fi', '2022-10-12 12:12:12', NULL, 5);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (6, 2, 'Compitition has been close in prelims, going to be a great event', '2021-01-12 12:12:12', NULL, 6);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (7, 7, 'Americans are stron in this event', '2020-04-12 12:12:12', NULL, 7);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (8, 2, 'This venue holds a lot of people', '2023-05-12 12:12:12', NULL, 8);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (9, 4, 'Athletes arent the best ive seen for this event', '2021-01-12 12:12:12', NULL, 9);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (10, 4, 'I got tickets to this one, cant wait', '2022-01-12 12:12:12', NULL, 10);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (11, 3, 'Great event cnt wait to see it', '2021-01-12 12:12:12', NULL, 11);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (12, 5, 'Wish i could go.  heard it was going to be a good field', '2021-01-12 12:12:12', NULL, 12);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (13, 8, 'Im not too interested in this event.  Not even sure why its in the olympics', '2021-01-12 12:12:12', NULL, 13);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (14, 6, 'Americans the clear favorite here', '2021-01-12 12:12:12', NULL, 14);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (15, 7, 'The pole leader had to drop out of this one', '2021-01-12 12:12:12', NULL, 15);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (16, 6, 'Venue is falling aprt, got to be demoralizing for the athletes', '2021-01-12 12:12:12', NULL, 16);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (17, 2, 'Some strong entries this year', '2021-01-12 12:12:12', NULL, 17);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (18, 3, 'Glad to see al these athletes enetered', '2021-01-12 12:12:12', NULL, 18);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (19, 5, 'This event is tougher than it looks', '2019-01-12 12:12:12', NULL, 19);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (20, 1, 'Brand new stadium for this ecent.  Glad they are putting the money here', '2022-01-12 12:12:12', NULL, 20);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (21, 4, 'Theres a clear favorite here', '2019-01-12 12:12:12', 12, 12);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (22, 9, 'This venue has great ice', '2019-01-12 12:12:12', NULL, 1);
INSERT INTO `sport_event_comment` (`id`, `user_id`, `comment_text`, `date_posted`, `reply_to_id`, `sport_event_id`) VALUES (23, 2, 'Youre an idiot,  these guys are all great.', '2022-01-12 12:12:12', 13, 13);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_bought_in`
-- -----------------------------------------------------
START TRANSACTION;
USE `olympiadb`;
INSERT INTO `user_has_bought_in` (`user_id`, `league_id`) VALUES (3, 1);
INSERT INTO `user_has_bought_in` (`user_id`, `league_id`) VALUES (4, 1);
INSERT INTO `user_has_bought_in` (`user_id`, `league_id`) VALUES (5, 2);
INSERT INTO `user_has_bought_in` (`user_id`, `league_id`) VALUES (6, 2);
INSERT INTO `user_has_bought_in` (`user_id`, `league_id`) VALUES (7, 3);
INSERT INTO `user_has_bought_in` (`user_id`, `league_id`) VALUES (8, 3);
INSERT INTO `user_has_bought_in` (`user_id`, `league_id`) VALUES (9, 4);
INSERT INTO `user_has_bought_in` (`user_id`, `league_id`) VALUES (10, 4);

COMMIT;

