use testdb;
CREATE TABLE IF NOT EXISTS Isler(
	Isler_No INT AUTO_INCREMENT PRIMARY KEY,
    Is_Adi varchar(250) NOT NULL,
    Baslama_vaxti DATE,
    Bitme_vaxti DATE,
    Veziyyet TINYINT NOT NULL DEFAULT 1,
    Onemli TINYINT NOT NULL DEFAULT 3,
    Aciqlama TEXT,
    Qeydiyyat_Zamani TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)ENGINE INNODB;

INSERT INTO isler(is_adi, onemli)
	VALUES('MySQL INSERT ifadesini oyrenmek', 1);
    
INSERT INTO isler(is_adi, onemli)
	VALUES('DEFAULT deyer istifade ederek qeyd etme', DEFAULT);
    
INSERT INTO isler(is_adi, baslama_vaxti,bitme_vaxti)
	VALUES('Cedvele vaxt elave etme','2025-10-25', '2025-11-05');

INSERT INTO isler(is_adi, baslama_vaxti,bitme_vaxti)
	VALUES('Isler ucun update olunmus vaxti istifade etmek',
    CURRENT_DATE(), CURRENT_DATE());
    
INSERT INTO isler(is_adi, onemli)
	VALUES('Bugunun  ilk isi', 1),
		  ('Bugunun  ikinci isi', DEFAULT),
          ('Bugunun ucuncu isi', 3);