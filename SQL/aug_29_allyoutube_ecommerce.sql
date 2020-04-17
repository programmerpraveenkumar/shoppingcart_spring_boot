# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.22)
# Database: youtube_ecommerce
# Generation Time: 2020-04-17 16:35:12 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table add_to_cart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `add_to_cart`;

CREATE TABLE `add_to_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `added_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_pk_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `add_to_cart` WRITE;
/*!40000 ALTER TABLE `add_to_cart` DISABLE KEYS */;

INSERT INTO `add_to_cart` (`id`, `product_id`, `qty`, `price`, `added_date`, `user_id`)
VALUES
	(1,2,1,150,NULL,2),
	(2,2,1,150,NULL,2);

/*!40000 ALTER TABLE `add_to_cart` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `name`)
VALUES
	(1,'shirt'),
	(2,'T-Shirts'),
	(3,'Blazers'),
	(4,'Musical Instruments'),
	(5,'Mobile');

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table checkout_cart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checkout_cart`;

CREATE TABLE `checkout_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_type` enum('COD','ONLINE') DEFAULT NULL,
  `delivery_address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `checkout_cart` WRITE;
/*!40000 ALTER TABLE `checkout_cart` DISABLE KEYS */;

INSERT INTO `checkout_cart` (`id`, `product_id`, `qty`, `price`, `order_date`, `user_id`, `order_id`, `payment_type`, `delivery_address`)
VALUES
	(10,2,6,9150,'2020-01-28 21:52:18',1,21144,'COD','test adding.'),
	(11,1,1,9150,'2020-01-28 21:52:18',1,21144,'COD','test adding.'),
	(12,2,1,18000,'2020-04-04 23:07:52',1,27393,'COD','delivery address'),
	(13,4,3,18000,'2020-04-04 23:07:52',1,27393,'COD','delivery address'),
	(14,1,1,150,'2020-04-04 23:08:55',1,20865,'COD','tsting.'),
	(15,1,1,1650,'2020-04-04 23:34:04',1,16909,'COD','testing address '),
	(16,2,1,1650,'2020-04-04 23:34:04',1,16909,'COD','testing address ');

/*!40000 ALTER TABLE `checkout_cart` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(40) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `order_on` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_pk_id` (`product_id`),
  CONSTRAINT `product_pk_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `price` double DEFAULT NULL,
  `added_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id_fk` (`category_id`),
  CONSTRAINT `category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `name`, `price`, `added_on`, `category_id`)
VALUES
	(1,'test',150,'2019-05-10 00:00:00',1),
	(2,'test2',1500,'2019-06-11 00:00:00',2),
	(3,'test3',1500,'2019-06-11 00:00:00',2),
	(4,'men blazers',5500,'2019-06-11 00:00:00',3);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_token` text,
  `type` int(11) DEFAULT NULL,
  `address` text,
  `is_email_verified` int(11) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `login_token`, `type`, `address`, `is_email_verified`, `mobile`)
VALUES
	(1,'test','test@gmail.com','test','2020-01-17 15:59:52',NULL,NULL,NULL,1,'123456789'),
	(2,'test1','test1@gmail.com','123456','2020-01-17 18:45:58',NULL,NULL,NULL,NULL,'789465123'),
	(4,'test1','test12@gmail.com','123456','2020-01-17 18:47:24',NULL,NULL,NULL,NULL,'789465124'),
	(6,'test1','test12@gmail.com','123456','2020-01-17 18:49:12',NULL,NULL,NULL,NULL,'7894651245'),
	(7,'test1','test12@gmail.com','123456','2020-03-01 14:21:55',NULL,NULL,NULL,NULL,'78946512455'),
	(8,'praveen kumar','test@gmail.com','123456789','2020-03-01 14:32:22',NULL,NULL,NULL,NULL,'1234567895'),
	(9,'test','qwe@we.com','123456','2020-03-01 14:34:10',NULL,NULL,NULL,NULL,'78945615');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
