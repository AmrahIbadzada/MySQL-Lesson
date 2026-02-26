USE testdb;

CREATE TABLE binalar(
	binaNo INT PRIMARY KEY AUTO_INCREMENT,
    binaAdi VARCHAR(255) NOT NULL
);


INSERT INTO binalar (binaAdi)
	VALUES('Texnologiya ve Innovasiya'),
          ('Resm ve Dizayn'),
          ('Robotexnika ve Muhendislik'),
          ('Suni Intellekt ve Mentiq');
          
SELECT * FROM binalar;

DELETE FROM binalar
WHERE binaNo= 5;
-- WHERE ile vermesek binalar cedvelnin tamini silecek

-- DELETE FROM binalar
-- WHERE binaNo IN(5,6,7,8);


DELETE FROM binalar 
ORDER BY binaAdi
LIMIT 2;
-- Binalar cedveline silmeni heyata kecireceyik
-- bu silmeni bina adina gore siralayib ilk siradaki 
-- ilk iki binani sileceyik

CREATE TABLE sinifler(
	sinifNo INT PRIMARY KEY AUTO_INCREMENT,
    sinifAdi VARCHAR(255) NOT NULL,
    binaNo INT NOT NULL,
    FOREIGN KEY (binaNo)
		REFERENCES binalar(binaNo)
        ON DELETE CASCADE
);

INSERT INTO sinifler(sinifAdi, binaNo)
	VALUES('TI100', 1),
		  ('RD110', 2),
          ('RM120', 3),
          ('SIM130', 4);
          
DELETE FROM binalar
WHERE binaNo= 5; -- 5 nomreli olarsa burda hazirda yoxdu
-- hem binalarda hemde siniflerde silinecek
