use klasikmodeller;

CREATE TABLE tedarikciler (
	tedarikciNo INT AUTO_INCREMENT,
    tedarikciAdi VARCHAR(50) NOT NULL,
    telefon VARCHAR(50),
    adresSatiri1 VARCHAR(50),
    adresSatiri2 VARCHAR(50),
    sehir VARCHAR(50),
    eyalet VARCHAR(50),
    postaKodu VARCHAR(50),
    ulke VARCHAR(50),
    musteriNo INT,
    PRIMARY KEY (tedarikciNo)
);


SELECT 
	musteriNo,
    musteriAdi,
    telefon,
    adresSatiri1,
    adresSatiri2,
    sehir,
    eyalet,
    postakodu,
    ulke
FROM
	musteriler
WHERE
	ulke = 'USA' AND eyalet = 'CA';
    
INSERT INTO tedarikciler (
    tedarikciAdi,
    telefon,
    adresSatiri1,
    adresSatiri2,
    sehir,
    eyalet,
    postaKodu,
    ulke
)

SELECT 
    musteriAdi,
    telefon,
    adresSatiri1,
    adresSatiri2,
    sehir,
    eyalet,
    postakodu,
    ulke
FROM
	musteriler
WHERE
	ulke = 'USA' AND eyalet = 'CA';
    
    
CREATE TABLE rapor (
	toplamUrun INT,
    toplamMusteri INT,
    toplamSiparis INT
);

INSERT INTO rapor(toplamUrun, toplamMusteri ,toplamSiparis)
	VALUES(
		(SELECT COUNT(*) FROM urunler),
        (SELECT COUNT(*) FROM musteriler),
        (SELECT COUNT(*) FROM siparisler)
    )


