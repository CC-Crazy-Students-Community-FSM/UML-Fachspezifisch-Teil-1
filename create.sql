CREATE TABLE IF NOT EXISTS `turnier`.`Spieler` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `spieler_id` INT(6) NOT NULL DEFAULT 0,
  `spieler_name` VARCHAR(45) NOT NULL DEFAULT 'no Name',
  `spieler_team` INT(6) NOT NULL DEFAULT 0,
  `spieler_status` INT(1) NOT NULL DEFAULT 1,
  `spieler_punkte` INT(6) NOT NULL DEFAULT 0,
  `spieler_körbe_2` INT(6) NOT NULL DEFAULT 0,
  `spieler_körbe_3` INT(6) NOT NULL DEFAULT 0,
  `spieler_fauls` INT(6) NOT NULL DEFAULT 0,
  `spieler_spiele` INT(6) NOT NULL DEFAULT 0,
  `Teams_id` INT NOT NULL,
  `Gruppen_id` INT NOT NULL,
  `Gruppen_Spiele_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Teams_id`, `Gruppen_id`, `Gruppen_Spiele_id`),
  UNIQUE INDEX `spieler_id_UNIQUE` (`spieler_id` ASC) VISIBLE,
  INDEX `fk_Spieler_Teams_idx` (`Teams_id` ASC) VISIBLE,
  INDEX `fk_Spieler_Gruppen1_idx` (`Gruppen_id` ASC, `Gruppen_Spiele_id` ASC) VISIBLE,
  CONSTRAINT `fk_Spieler_Teams`
    FOREIGN KEY (`Teams_id`)
    REFERENCES `turnier`.`Teams` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Spieler_Gruppen1`
    FOREIGN KEY (`Gruppen_id` , `Gruppen_Spiele_id`)
    REFERENCES `turnier`.`Gruppen` (`id` , `Spiele_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `turnier`.`Gruppen` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `gruppe_id` INT(6) NOT NULL DEFAULT 0,
  `gruppe_name` VARCHAR(45) NOT NULL DEFAULT 'no Name',
  `gruppe_status` INT(1) NOT NULL DEFAULT 1,
  `gruppe_team_a` INT(6) NOT NULL DEFAULT 0,
  `gruppe_team_b` INT(6) NOT NULL DEFAULT 0,
  `gruppe_team_c` INT(6) NOT NULL DEFAULT 0,
  `gruppe_team_d` INT(6) NOT NULL DEFAULT 0,
  `gruppe_bestes_team` INT(6) NOT NULL DEFAULT 0,
  `gruppe_bester_spieler` INT(6) NOT NULL DEFAULT 0,
  `Spiele_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Spiele_id`),
  UNIQUE INDEX `team_id_UNIQUE` (`gruppe_id` ASC) VISIBLE,
  INDEX `fk_Gruppen_Spiele1_idx` (`Spiele_id` ASC) VISIBLE,
  CONSTRAINT `fk_Gruppen_Spiele1`
    FOREIGN KEY (`Spiele_id`)
    REFERENCES `turnier`.`Spiel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `turnier`.`Spiel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `spiel_id` INT(6) NOT NULL DEFAULT 0,
  `spiel_team_a` INT(6) NOT NULL DEFAULT 0,
  `spiel_team_b` INT(6) NOT NULL DEFAULT 0,
  `spiel_gruppe_team_a` INT(6) NOT NULL DEFAULT 0,
  `spiel_gruppe_team_b` INT(6) NOT NULL DEFAULT 0,
  `spiel_ort` VARCHAR(45) NOT NULL DEFAULT 'irgendwo',
  `spiel_start` DATE NOT NULL,
  `spiel_ende` DATE NOT NULL,
  `spiel_stand_team_a` INT(2) NOT NULL DEFAULT 0,
  `spiel_stand_team_b` INT(2) NOT NULL DEFAULT 0,
  `spiel_fauls_team_a` INT(6) NOT NULL DEFAULT 0,
  `spiel_fauls_team_b` INT(6) NOT NULL DEFAULT 0,
  `spiel_körbe_2_team_a` INT(6) NOT NULL DEFAULT 0,
  `spiel_körbe_2_team_b` INT(6) NOT NULL DEFAULT 0,
  `spiel_körbe_3_team_a` INT(6) NOT NULL DEFAULT 0,
  `spiel_körbe_3_team_b` INT(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `turnier`.`Sponsoren` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sponsor_id` INT(6) NOT NULL DEFAULT 0,
  `sponsor_name` VARCHAR(45) NOT NULL DEFAULT 'no Name',
  `sponsor_budget` INT NOT NULL DEFAULT 0,
  `sponsor_status` INT(1) NOT NULL DEFAULT 0,
  `sponsor_ort` VARCHAR(45) NOT NULL DEFAULT 'irgendwo',
  `sponsor_start` DATE NOT NULL,
  `sponsor_ende` DATE NOT NULL,
  `sponsor_satz` VARCHAR(45) NOT NULL DEFAULT '0,0,0',
  `sponsor_spiele` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `team_id_UNIQUE` (`sponsor_id` ASC) VISIBLE)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `turnier`.`Teams` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `team_id` INT(6) NOT NULL DEFAULT 0,
  `team_name` VARCHAR(45) NOT NULL DEFAULT 'no Name',
  `team_leader` INT(6) NOT NULL DEFAULT 0,
  `team_status` INT(1) NOT NULL DEFAULT 1,
  `team_punkte` INT(6) NOT NULL DEFAULT 0,
  `team_körbe_2` INT(6) NOT NULL DEFAULT 0,
  `team_körbe_3` INT(6) NOT NULL DEFAULT 0,
  `team_fauls` INT(6) NOT NULL DEFAULT 0,
  `team_spiele` INT(6) NOT NULL DEFAULT 0,
  `Gruppen_id` INT NOT NULL,
  `Spiele_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Gruppen_id`, `Spiele_id`),
  UNIQUE INDEX `team_id_UNIQUE` (`team_id` ASC) VISIBLE,
  INDEX `fk_Teams_Gruppen1_idx` (`Gruppen_id` ASC) VISIBLE,
  INDEX `fk_Teams_Spiele1_idx` (`Spiele_id` ASC) VISIBLE,
  CONSTRAINT `fk_Teams_Gruppen1`
    FOREIGN KEY (`Gruppen_id`)
    REFERENCES `turnier`.`Gruppen` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teams_Spiele1`
    FOREIGN KEY (`Spiele_id`)
    REFERENCES `turnier`.`Spiel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;