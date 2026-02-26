USE klasikmodeller;

SELECT ilkadi, soyadi, eposta 
FROM personel WHERE personelNo=1056;

UPDATE personel
SET
	eposta='mis.marypatterson@classicmodelcars.com'
WHERE
	personelNo = 1056;
    
    
UPDATE personel
SET
	soyadi='Paterson'
WHERE
	personelNo = 1056;
    
    
UPDATE personel
SET
	eposta=REPLACE(eposta,'@classicmodelcars.com', '@officesixsales.com')
WHERE 
	istanim='Sales Rep' AND ofisKodu = 6;
    

SELECT personelNo FROM personel
WHERE istanim='Sales Rep'
ORDER BY RAND() LIMIT 1;


UPDATE musteriler
SET 
	satisTemsPersonelNo = (
							SELECT personelNo FROM personel
							WHERE istanim='Sales Rep'
							ORDER BY RAND() LIMIT 1)
WHERE 
	satisTemsPersonelNo IS NULL;