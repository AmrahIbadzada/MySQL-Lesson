USE testdb;

CREATE TABLE masinlar(
	masin_no INT,
    il INT NOT NULL,
    model VARCHAR(100) CHARACTER SET utf8mb4 NOT NULL,
    PRIMARY KEY(masin_no)
);

ALTER TABLE masinlar
ADD firma VARCHAR(100)
NOT NULL;
-- Hecne yazmasaq en son sutunumuzdan sonuna elave edecek

-- ALTER TABLE masinlar
-- ADD firma VARCHAR(100)
-- NOT NULL FIRST; -- ilk elave edir  

-- ALTER TABLE masinlar
-- ADD firma VARCHAR(100)
-- NOT NULL AFTER il; -- ilden sonra elave edecek


DESCRIBE masinlar;

ALTER TABLE masinlar
DROP firma;


ALTER TABLE masinlar
ADD firma varchar(100)
NOT NULL AFTER il;


ALTER TABLE masinlar
ADD reng varchar(50),
ADD aciqlama VARCHAR(255);

DESCRIBE masinlar;


ALTER TABLE masinlar
MODIFY aciqlama varchar(100)
NOT NULL;

DESCRIBE masinlar;


ALTER TABLE masinlar
	MODIFY il SMALLINT
    NOT NULL,
    MODIFY reng VARCHAR(25)
    NULL AFTER model;
    
DESCRIBE masinlar;


ALTER TABLE masinlar
CHANGE COLUMN aciqlama
masin_haqqinda VARCHAR(100)
NOT NULL;

DESCRIBE masinlar;


ALTER TABLE masinlar
RENAME TO cars;