SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `boekenlijst9000` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `boekenlijst9000` ;

-- -----------------------------------------------------
-- Table `boekenlijst9000`.`Auteur`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `boekenlijst9000`.`Auteur` (
  `idAuteur` INT NOT NULL ,
  `GeboorteJaar` DATE NULL ,
  `Leeftijd` VARCHAR(3) NULL ,
  PRIMARY KEY (`idAuteur`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boekenlijst9000`.`Uitgeverij`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `boekenlijst9000`.`Uitgeverij` (
  `idUitgeverij` INT NOT NULL ,
  `Code-Uitgeverij` VARCHAR(45) NULL ,
  PRIMARY KEY (`idUitgeverij`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boekenlijst9000`.`Boektitel`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `boekenlijst9000`.`Boektitel` (
  `idBoektite-EN` INT NOT NULL ,
  `Auteur_idAuteur` INT NOT NULL ,
  `Auteur_idAuteur1` INT NOT NULL ,
  `Uitgeverij_idUitgeverij` INT NOT NULL ,
  PRIMARY KEY (`idBoektite-EN`) ,
  INDEX `fk_Boektite-EN_Auteur_idx` (`Auteur_idAuteur` ASC) ,
  INDEX `fk_Boektite-EN_Auteur1_idx` (`Auteur_idAuteur1` ASC) ,
  INDEX `fk_Boektite-EN_Uitgeverij1_idx` (`Uitgeverij_idUitgeverij` ASC) ,
  CONSTRAINT `fk_Boektite-EN_Auteur`
    FOREIGN KEY (`Auteur_idAuteur` )
    REFERENCES `boekenlijst9000`.`Auteur` (`idAuteur` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Boektite-EN_Auteur1`
    FOREIGN KEY (`Auteur_idAuteur1` )
    REFERENCES `boekenlijst9000`.`Auteur` (`idAuteur` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Boektite-EN_Uitgeverij1`
    FOREIGN KEY (`Uitgeverij_idUitgeverij` )
    REFERENCES `boekenlijst9000`.`Uitgeverij` (`idUitgeverij` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boekenlijst9000`.`Vertaling`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `boekenlijst9000`.`Vertaling` (
  `idVertaling` INT NOT NULL ,
  `Boektitel_idBoektite-EN` INT NOT NULL ,
  `Language-type` VARCHAR(45) NULL ,
  PRIMARY KEY (`idVertaling`) ,
  INDEX `fk_Vertaling_Boektitel1_idx` (`Boektitel_idBoektite-EN` ASC) ,
  CONSTRAINT `fk_Vertaling_Boektitel10`
    FOREIGN KEY (`Boektitel_idBoektite-EN` )
    REFERENCES `boekenlijst9000`.`Boektitel` (`idBoektite-EN` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boekenlijst9000`.`Language`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `boekenlijst9000`.`Language` (
  `idLanguage` INT NOT NULL ,
  `ISBN-nummer` VARCHAR(45) NULL ,
  `Pagina` VARCHAR(45) NULL ,
  `Vertaling_idVertaling` INT NOT NULL ,
  PRIMARY KEY (`idLanguage`) ,
  INDEX `fk_Language_Vertaling1_idx` (`Vertaling_idVertaling` ASC) ,
  CONSTRAINT `fk_Language_Vertaling1`
    FOREIGN KEY (`Vertaling_idVertaling` )
    REFERENCES `boekenlijst9000`.`Vertaling` (`idVertaling` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `boekenlijst9000` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
