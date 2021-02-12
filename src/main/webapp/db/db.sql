-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema recruiting`
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema recruiting
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `recruiting` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `recruiting` ;

-- -----------------------------------------------------
-- Table `recruiting`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recruiting`.`user` (
  `id_user` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `activation_code` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `role` INT(11) NULL DEFAULT NULL,
  `username` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `recruiting`.`candidate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recruiting`.`candidate` (
  `id_candidate` BIGINT(20) NOT NULL,
  `hr_email` VARCHAR(255) NULL DEFAULT NULL,
  `birthday` DATETIME(6) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `facebook_link` VARCHAR(255) NULL DEFAULT NULL,
  `gender` VARCHAR(255) NULL DEFAULT NULL,
  `linked_link` VARCHAR(255) NULL DEFAULT NULL,
  `mob_phone` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `photo` VARCHAR(255) NULL DEFAULT NULL,
  `session_code` VARCHAR(255) NULL DEFAULT NULL,
  `surname` VARCHAR(255) NULL DEFAULT NULL,
  `twitter_link` VARCHAR(255) NULL DEFAULT NULL,
  `id_user` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id_candidate`),
  CONSTRAINT `FKijeixigb97l0g0gtom8i1ev8e`
    FOREIGN KEY (`id_user`)
    REFERENCES `recruiting`.`user` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `UK_h58r42s4c6hess9d17xw9nbk4` ON `recruiting`.`candidate` (`id_user` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `recruiting`.`anketa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recruiting`.`anketa` (
  `id` BIGINT(20) NOT NULL,
  `question1` VARCHAR(255) NULL DEFAULT NULL,
  `question2` VARCHAR(255) NULL DEFAULT NULL,
  `question3` VARCHAR(255) NULL DEFAULT NULL,
  `question4` VARCHAR(255) NULL DEFAULT NULL,
  `question5` VARCHAR(255) NULL DEFAULT NULL,
  `question6` VARCHAR(255) NULL DEFAULT NULL,
  `question7` VARCHAR(255) NULL DEFAULT NULL,
  `question8` VARCHAR(255) NULL DEFAULT NULL,
  `resume` VARCHAR(255) NULL DEFAULT NULL,
  `review` VARCHAR(255) NULL DEFAULT NULL,
  `id_candidate` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK3s449ucmxi8nmpspvbqx17sy9`
    FOREIGN KEY (`id_candidate`)
    REFERENCES `recruiting`.`candidate` (`id_candidate`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `UK_m0geg34usuf538u0njrmxf16w` ON `recruiting`.`anketa` (`id_candidate` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `recruiting`.`organization_structure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recruiting`.`organization_structure` (
  `id_post` BIGINT(20) NOT NULL,
  `department` VARCHAR(255) NULL DEFAULT NULL,
  `post` VARCHAR(255) NULL DEFAULT NULL,
  `salary` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`id_post`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `recruiting`.`vacancy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recruiting`.`vacancy` (
  `id_vacancy` BIGINT(20) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `test_link` VARCHAR(255) NULL DEFAULT NULL,
  `id_post` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_vacancy`),
  CONSTRAINT `FKgppnxbnfafvm48k4vtfj5s8mw`
    FOREIGN KEY (`id_post`)
    REFERENCES `recruiting`.`organization_structure` (`id_post`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `FKgppnxbnfafvm48k4vtfj5s8mw` ON `recruiting`.`vacancy` (`id_post` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `recruiting`.`candidate_vacation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recruiting`.`candidate_vacation` (
  `id_candidate` BIGINT(20) NOT NULL,
  `id_vacation` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id_candidate`, `id_vacation`),
  CONSTRAINT `FK2vwfvn81ktcw3srl8ftc77qaq`
    FOREIGN KEY (`id_candidate`)
    REFERENCES `recruiting`.`candidate` (`id_candidate`),
  CONSTRAINT `FK6wbmyyp29mbt6n7lhtb98076l`
    FOREIGN KEY (`id_vacation`)
    REFERENCES `recruiting`.`vacancy` (`id_vacancy`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `FK6wbmyyp29mbt6n7lhtb98076l` ON `recruiting`.`candidate_vacation` (`id_vacation` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `recruiting`.`chat_message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recruiting`.`chat_message` (
  `id` BIGINT(20) NOT NULL,
  `message` VARCHAR(255) NULL DEFAULT NULL,
  `time` VARCHAR(255) NULL DEFAULT NULL,
  `user_from` BIGINT(20) NULL DEFAULT NULL,
  `user_to` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK1q9haqwwpfsdw8o7m4v720nxi`
    FOREIGN KEY (`user_to`)
    REFERENCES `recruiting`.`user` (`id_user`),
  CONSTRAINT `FKclv25nv60q62hb3ucugys6aa4`
    FOREIGN KEY (`user_from`)
    REFERENCES `recruiting`.`user` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `FKclv25nv60q62hb3ucugys6aa4` ON `recruiting`.`chat_message` (`user_from` ASC) VISIBLE;

CREATE INDEX `FK1q9haqwwpfsdw8o7m4v720nxi` ON `recruiting`.`chat_message` (`user_to` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `recruiting`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recruiting`.`employee` (
  `id_employee` BIGINT(20) NOT NULL,
  `birthday` DATETIME(6) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `facebook_link` VARCHAR(255) NULL DEFAULT NULL,
  `gender` VARCHAR(255) NULL DEFAULT NULL,
  `is_working` INT(11) NULL DEFAULT NULL,
  `linked_link` VARCHAR(255) NULL DEFAULT NULL,
  `mobphone` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `pasp_date` DATETIME(6) NULL DEFAULT NULL,
  `pasp_id` VARCHAR(14) NULL DEFAULT NULL,
  `pasp_num` VARCHAR(255) NULL DEFAULT NULL,
  `pasp_ser` VARCHAR(9) NULL DEFAULT NULL,
  `photo` VARCHAR(255) NULL DEFAULT NULL,
  `rate` DOUBLE NULL DEFAULT NULL,
  `surname` VARCHAR(255) NULL DEFAULT NULL,
  `twitter_link` VARCHAR(255) NULL DEFAULT NULL,
  `id_post` BIGINT(20) NULL DEFAULT NULL,
  `id_user` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_employee`),
  CONSTRAINT `FKdtvbvnxc0q7vsp1ev909vrtx6`
    FOREIGN KEY (`id_user`)
    REFERENCES `recruiting`.`user` (`id_user`),
  CONSTRAINT `FKr2uaaeysfdwf28l3pu3llfiao`
    FOREIGN KEY (`id_post`)
    REFERENCES `recruiting`.`organization_structure` (`id_post`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `UK_o9gex07wht6p49953tj4pv9va` ON `recruiting`.`employee` (`id_user` ASC) VISIBLE;

CREATE INDEX `FKr2uaaeysfdwf28l3pu3llfiao` ON `recruiting`.`employee` (`id_post` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `recruiting`.`raiting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recruiting`.`raiting` (
  `id_raiting` BIGINT(20) NOT NULL,
  `lang_scope` VARCHAR(255) NULL DEFAULT NULL,
  `social_scope` VARCHAR(255) NULL DEFAULT NULL,
  `tech_scope` VARCHAR(255) NULL DEFAULT NULL,
  `test_scope` DOUBLE NULL DEFAULT NULL,
  `id_candidate` BIGINT(20) NOT NULL,
  `id_vacancy` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_raiting`),
  CONSTRAINT `FKiknblcuktft9tsk4qv5rw5cqw`
    FOREIGN KEY (`id_vacancy`)
    REFERENCES `recruiting`.`vacancy` (`id_vacancy`),
  CONSTRAINT `FKq06v7bnibgq9dpuecg53x49ta`
    FOREIGN KEY (`id_candidate`)
    REFERENCES `recruiting`.`candidate` (`id_candidate`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `UK_p8l8av9qgaa968l7g3iowlgy7` ON `recruiting`.`raiting` (`id_candidate` ASC) VISIBLE;

CREATE INDEX `FKiknblcuktft9tsk4qv5rw5cqw` ON `recruiting`.`raiting` (`id_vacancy` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `recruiting`.`timetable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recruiting`.`timetable` (
  `id` BIGINT(20) NOT NULL,
  `color` VARCHAR(255) NULL DEFAULT NULL,
  `end_date` DATETIME(6) NULL DEFAULT NULL,
  `end_time` DATETIME(6) NULL DEFAULT NULL,
  `start_date` DATETIME(6) NULL DEFAULT NULL,
  `start_time` DATETIME(6) NULL DEFAULT NULL,
  `type` VARCHAR(255) NULL DEFAULT NULL,
  `url` VARCHAR(255) NULL DEFAULT NULL,
  `id_candidate` BIGINT(20) NULL DEFAULT NULL,
  `id_employee` BIGINT(20) NOT NULL,
  `id_vacancy` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK8csrnihclt9tc5tcve3ff8td2`
    FOREIGN KEY (`id_candidate`)
    REFERENCES `recruiting`.`candidate` (`id_candidate`),
  CONSTRAINT `FKdktstjyxpwqhlyhyocyr433ud`
    FOREIGN KEY (`id_employee`)
    REFERENCES `recruiting`.`employee` (`id_employee`),
  CONSTRAINT `FKipcp4wp2y3dq21lf4tw2o3eig`
    FOREIGN KEY (`id_vacancy`)
    REFERENCES `recruiting`.`vacancy` (`id_vacancy`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `FK8csrnihclt9tc5tcve3ff8td2` ON `recruiting`.`timetable` (`id_candidate` ASC) VISIBLE;

CREATE INDEX `FKdktstjyxpwqhlyhyocyr433ud` ON `recruiting`.`timetable` (`id_employee` ASC) VISIBLE;

CREATE INDEX `FKipcp4wp2y3dq21lf4tw2o3eig` ON `recruiting`.`timetable` (`id_vacancy` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
