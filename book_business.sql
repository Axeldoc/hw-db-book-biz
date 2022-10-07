-- bookPublishing 

DROP DATABASE IF EXISTS `bookPublishBusiness`; 
CREATE DATABASE IF NOT EXISTS `bookPublishBusiness`; 
USE `bookPublishBusiness`;
SET NAMES UTF8MB4; 
SET character_set_client = UTF8MB4;

CREATE TABLE `publishers` (
	`publisherId`	int NOT NULL,
    `name`			varchar(20) NOT NULL,
	`phoneNo`		bigint NULL,
	`address`		varchar(50) NULL,
    PRIMARY KEY (`publisherId`),
    INDEX `publisherId` (`publisherId` ASC), 
    INDEX `name` (`name` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `books` (
	`ISBN`		    varchar(13) NOT NULL,
    `title`			varchar(100) NOT NULL,
	`salesCount`	int NOT NULL,
	`pageCount`		int NOT NULL,
	`language`		varchar(20) NOT NULL,
	`publisherId`	int NOT NULL,
    PRIMARY KEY (`ISBN`),
    FOREIGN KEY (publisherId) REFERENCES publishers(publisherId),
    INDEX `ISBN` (`ISBN` ASC), 
    INDEX `title` (`title` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `authors` (
	`authorId`		int NOT NULL,
    `firstName`		varchar(10) NOT NULL,
	`lastName`		varchar(15) NOT NULL,
	`authorLanguage` varchar(15) NOT NULL,
    `authorRoyalties`int NOT NULL,
    PRIMARY KEY (`authorId`),
    INDEX `authorId` (`authorId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `genres` (
    `genreId` INT NOT NULL,
    `genre` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`genreId`),
    INDEX `genreId` (`genreId` ASC),
    INDEX `genre` (`genre` ASC)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

CREATE TABLE `customers` (
	`customerId`	int NOT NULL,
    `firstName`		varchar(40) NOT NULL,
    `lastName`		varchar(50) NOT NULL,
    PRIMARY KEY (`customerId`),
    INDEX `customerId` (`customerId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `editors` (
	`editorId`		int NOT NULL,
    `editorCompany`	varchar(20) NOT NULL,
    PRIMARY KEY (`editorId`),
    INDEX `editorId` (`editorId` ASC), 
    INDEX `editorCompany` (`editorCompany` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
	`orderId`		int NOT NULL,
    `dateOfOrder`	DATE NULL,
    PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;


