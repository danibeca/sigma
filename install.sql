
drop table if exists `co_sec_permission_list` ;
drop table if exists `co_sec_operation` ;
drop table if exists `co_sec_resource` ;

drop table if exists `co_sec_role_menu` ;
drop table if exists `co_sec_menu_option` ;

drop table if exists `co_sec_user_role_list` ;
drop table if exists `co_sec_role` ;
drop table if exists `co_sec_user` ;



-- -----------------------------------------------------
-- Table `OKAZO`.`co_sec_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OKAZO`.`co_sec_user` ;

CREATE TABLE IF NOT EXISTS `OKAZO`.`co_sec_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(70) NOT NULL,
  `remember_token` VARCHAR(70) NULL,
  `name` VARCHAR(150) NULL,
  `activation_code` VARCHAR(50) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NULL,
  `confirmed` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `email_UNIQUE` ON `OKAZO`.`co_sec_user` (`email` ASC);


-- -----------------------------------------------------
-- Table `OKAZO`.`co_sec_user_role_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OKAZO`.`co_sec_user_role_list` ;

CREATE TABLE IF NOT EXISTS `OKAZO`.`co_sec_user_role_list` (
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  CONSTRAINT `fk_NT_SEC_USER_ROLE_LIST_NT_SEC_USER1`
    FOREIGN KEY (`user_id`)
    REFERENCES `OKAZO`.`co_sec_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_NT_SEC_USER_ROLE_LIST_NT_SEC_USER3_idx` ON `OKAZO`.`co_sec_user_role_list` (`user_id` ASC);


-- -----------------------------------------------------
-- Table `OKAZO`.`co_sec_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OKAZO`.`co_sec_role` ;

CREATE TABLE IF NOT EXISTS `OKAZO`.`co_sec_role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `role_name_UNIQUE` ON `OKAZO`.`co_sec_role` (`name` ASC);


-- -----------------------------------------------------
-- Table `OKAZO`.`co_sec_menu_option`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OKAZO`.`co_sec_menu_option` ;

CREATE TABLE IF NOT EXISTS `OKAZO`.`co_sec_menu_option` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `route` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OKAZO`.`co_sec_role_menu_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OKAZO`.`co_sec_role_menu` ;

CREATE TABLE IF NOT EXISTS `OKAZO`.`co_sec_role_menu` (
  `role_id` INT NOT NULL,
  `option_id` INT NOT NULL,
  `option_root` INT NULL,
  PRIMARY KEY (`role_id`, `option_id`),
  CONSTRAINT `fk_NT_SEC_ROLE_PERMISION_LIST_NT_SEC_ROLE1`
    FOREIGN KEY (`role_id`)
    REFERENCES `OKAZO`.`co_sec_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CO_SEC_ROLE_PERMISION_LIST_CO_SEC_PERMISSION1`
    FOREIGN KEY (`option_id`)
    REFERENCES `OKAZO`.`co_sec_menu_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_NT_SEC_ROLE_PERMISION_LIST_NT_SEC_ROLE1_idx` ON `OKAZO`.`co_sec_role_menu` (`role_id` ASC);

CREATE INDEX `fk_CO_SEC_ROLE_PERMISION_LIST_CO_SEC_PERMISSION1_idx` ON `OKAZO`.`co_sec_role_menu` (`option_id` ASC);


-- -----------------------------------------------------
-- Table `OKAZO`.`co_sec_operation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OKAZO`.`co_sec_operation` ;

CREATE TABLE IF NOT EXISTS `OKAZO`.`co_sec_operation` (
  `operation_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`operation_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OKAZO`.`co_sec_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OKAZO`.`co_sec_resource` ;

CREATE TABLE IF NOT EXISTS `OKAZO`.`co_sec_resource` (
  `resource_id` INT NOT NULL,
  `name` VARCHAR(40) NULL,
  PRIMARY KEY (`resource_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OKAZO`.`co_sec_permission_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OKAZO`.`co_sec_permission_list` ;

CREATE TABLE IF NOT EXISTS `OKAZO`.`co_sec_permission_list` (
  `role_id` INT NOT NULL,
  `operation_id` INT NOT NULL,
  `resource_id` INT NOT NULL,
  PRIMARY KEY (`resource_id`, `operation_id`, `role_id`),
  CONSTRAINT `fk_CO_SEC_PERMISSION_LIST_CO_SEC_ROLE1`
    FOREIGN KEY (`role_id`)
    REFERENCES `OKAZO`.`co_sec_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CO_SEC_PERMISSION_LIST_CO_SEC_OPERATION1`
    FOREIGN KEY (`operation_id`)
    REFERENCES `OKAZO`.`co_sec_operation` (`operation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CO_SEC_PERMISSION_LIST_CO_SEC_RESOURCE1`
    FOREIGN KEY (`resource_id`)
    REFERENCES `OKAZO`.`co_sec_resource` (`resource_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_CO_SEC_PERMISSION_LIST_CO_SEC_ROLE1_idx` ON `OKAZO`.`co_sec_permission_list` (`role_id` ASC);

CREATE INDEX `fk_CO_SEC_PERMISSION_LIST_CO_SEC_OPERATION1_idx` ON `OKAZO`.`co_sec_permission_list` (`operation_id` ASC);

CREATE INDEX `fk_CO_SEC_PERMISSION_LIST_CO_SEC_RESOURCE1_idx` ON `OKAZO`.`co_sec_permission_list` (`resource_id` ASC);



-- ---------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------

INSERT INTO `co_sec_user` (`id`,`email`,`password`,`remember_token`,`name`,`activation_code`,`created_at`,`updated_at`) VALUES
 (1,'lloploup@gmail.com','$2y$10$LibrviznnFF.ISp/mfbOa.gKNRHLRx5QCXGP9tRArB8POenfbCRbK',NULL,'Daniel Betancur','asdasdasd','2014-10-07 21:19:14','2014-10-07 21:19:14');

insert into `co_sec_menu_option` (`id`,`name`,`route`) values
 (1,'Usuarios','#'),
 (2,'Crear usuario','view/create-user'),
 (3,'Recycling','view/recycling'),
 (4,'Informes','view/report'),
 (5,'Informes','#'),
 (6,'Informe por usuario','view/report/user'),
 (7,'Informe general','view/report/general');

insert into `co_sec_role` (`id`,`name`) values
 (1,'Administrador'),
 (2,'Operador'),
 (3,'Cliente');
 


 insert into `co_sec_role_menu` (`role_id`,`option_id`,`option_root`) values
 (1,1,null),
 (1,2,1),
 (1,3,null),
 (1,5,null),
 (1,6,5),
 (1,7,5),
 (2,1,null),
 (2,2,1),
 (2,3,null),
 (2,5,null),
 (2,6,5),
 (2,7,5),
 (3,4,null);


 insert into `co_sec_user_role_list` (`user_id`,`role_id`) values
 (1,1);
