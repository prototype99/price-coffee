CREATE DATABASE coffee;
USE coffee;

SET SQL_MODE="EMPTY_STRING_IS_NULL,STRICT_TRANS_TABLES";

CREATE TABLE data (
  id tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  name tinytext,
  drinkable BOOL NOT NULL,
  weight tinyint(3) UNSIGNED NOT NULL,
  packsize tinyint(3) NOT NULL DEFAULT 1,
  quantity tinyint(3) NOT NULL DEFAULT 1,
  cost DECIMAL(1,0) NOT NULL,
  delivery tinyint(3) NOT NULL,
  gramCost DECIMAL(4,3),
  url tinytext,
  key id (id)
);

LOAD DATA LOCAL INFILE '/home/seirra/Documents/sql/coffee/data.csv'
INTO TABLE data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

UPDATE data SET packsize = DEFAULT WHERE packsize = 0;

UPDATE data SET quantity = DEFAULT WHERE quantity = 0;

UPDATE data SET gramCost = (cost * quantity) / (weight * packsize * quantity + delivery);

SELECT * from data ORDER BY gramCost;