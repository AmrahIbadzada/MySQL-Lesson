CREATE DATABASE fkDemo;
use fkDemo;

CREATE TABLE Kateqoriyalar (
	kateqoriya_no INT AUTO_INCREMENT PRIMARY KEY,
    kateqoriya_adi VARCHAR(100) NOT NULL
);

CREATE TABLE Productlar (
	poduct_no INT AUTO_INCREMENT PRIMARY KEY,
    product_adi VARCHAR(100) NOT NULL,
    kateqoriyaNomresi INT,
    CONSTRAINT fk_kateqoriya
		FOREIGN KEY (kateqoriyaNomresi)
			REFERENCES kateqoriyalar(kateqoriya_no)
);

INSERT INTO Kateqoriyalar(kateqoriya_adi)
		VALUES ('Mobil Cihaz'),
               ('Agilli Saat');

INSERT INTO Productlar(product_adi,kateqoriyaNomresi)
	VALUES('IPhone', 1);
    
INSERT INTO Prodtctlar(product_adi,kateqoriyaNomresi)
	VALUES('IPad', 3);
    
UPDATE Kateqoriyalar SET kateqoriya_no=100
WHERE kateqoriya_no=1;

DROP TABLE Productlar;

CREATE TABLE Productlar (
	poduct_no INT AUTO_INCREMENT PRIMARY KEY,
    product_adi VARCHAR(100) NOT NULL,
    kateqoriyaNomresi INT,
    CONSTRAINT fk_kateqoriya
		FOREIGN KEY (kateqoriyaNomresi)
			REFERENCES kateqoriyalar(kateqoriya_no)
			ON UPDATE CASCADE
            ON DELETE CASCADE
);

INSERT INTO Productlar(product_adi,kateqoriyaNomresi)
	VALUES('IPhone', 1),
		  ('Xiaomi', 1),
          ('Apple Watch', 2),
          ('Samsung Galaxy Watch', 2);

DELETE FROM kateqoriyalar WHERE kateqoriya_no=2;

DROP TABLE IF EXISTS productlar; -- Foreign key gore ilk productlari silmeliyik
DROP TABLE IF EXISTS kateqoriyalar; -- Ilk kateqoriyalar-i sile bilmirik


CREATE TABLE kateqoriyalar (
	kateqoriya_no INT AUTO_INCREMENT PRIMARY KEY,
    kateqoriya_adi VARCHAR(100) NOT NULL
);

CREATE TABLE productlar (
	poduct_no INT AUTO_INCREMENT PRIMARY KEY,
    product_adi VARCHAR(100) NOT NULL,
    kateqoriya_no INT,
    CONSTRAINT fk_kateqoriya
		FOREIGN KEY (kateqoriya_no)
			REFERENCES kateqoriyalar(kateqoriya_no)
			ON UPDATE SET NULL
            ON DELETE SET NULL
);

INSERT INTO kateqoriyalar(kateqoriya_adi)
		VALUES ('Mobil Cihaz'),
               ('Agilli Saat');
               
INSERT INTO Productlar(product_adi,kateqoriya_no)
	VALUES('IPhone', 1),
		  ('Xiaomi', 1),
          ('Apple Watch', 2),
          ('Samsung Galaxy Watch', 2);
          
UPDATE kateqoriyalar SET kateqoriya_no = 100
WHERE kateqoriya_no = 1;

DELETE FROM kateqoriyalar WHERE kateqoriya_no =2;

SHOW CREATE TABLE productlar;
ALTER TABLE productlar DROP FOREIGN KEY fk_kateqoriya;

SHOW CREATE TABLE productlar;