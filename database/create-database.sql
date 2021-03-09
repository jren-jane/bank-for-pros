DROP DATABASE IF EXISTS `banking`;
CREATE DATABASE `banking`; 
USE `banking`;

CREATE TABLE `currency_types` (
                                  `currency_type_id` tinyint NOT NULL AUTO_INCREMENT,
                                  `name` varchar(50) NOT NULL,
                                  PRIMARY KEY (`currency_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `currency_types` VALUES (1,'EUR');
INSERT INTO `currency_types` VALUES (2,'USD');

CREATE TABLE `accounts` (
                            `client_id` int,
                            `currency_type_id` tinyint,
                            `current_balance` decimal(9,2),
                            `daily_limit` decimal(9,2)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `clients` (
                           `client_id` int NOT NULL AUTO_INCREMENT,
                           `email` varchar(50),
                           `username` varchar(50),
                           `password` varchar(50),
                           `first_name` varchar(30),
                           `last_name` varchar(30),
                           `address` varchar(50),
                           `city` varchar(50),
                           `zip_code` varchar(50),
                           `phone` varchar(50),
                           PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `transactions` (
                                `client_id` int,
                                `target_id` int,
                                `currency_type_id` int,
                                `target_currency_type_id` int,
                                `transaction_amount` decimal(9,2),
                                `transaction_date` date
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `admin_accounts` (
                                  `username` varchar(50),
                                  `password` varchar(50),
                                  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `admin_accounts` VALUES ('admin', '1234');