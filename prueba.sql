CREATE TABLE IF NOT EXISTS `Daianaolivera1`.`Customers` (
  `custormers_id` INT NOT NULL,
  `name` VARCHAR(70) NULL,
  `address` VARCHAR(100) NULL,
  `credit limit` DECIMAL(10) NULL,
  `websites` VARCHAR(45) NULL,
  UNIQUE INDEX `custormers_id_UNIQUE` (`custormers_id` ASC) VISIBLE,
  PRIMARY KEY (`custormers_id`))
ENGINE = InnoDB;