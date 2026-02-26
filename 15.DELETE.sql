SELECT * FROM personel;

SELECT * FROM personel
WHERE ofisKodu=4;

DELETE FROM personel
WHERE ofisKodu = 4;

-- SELECT * FROM personel
-- WHERE ofisKodu = 4 AND 
-- personelNo NOT IN (SELECT * FROM personel);
-- 4 nömrəli ofis personeli arasında eyni ofisdə özünə bağlı
-- personel olan şəxslər

UPDATE personel 
SET
	kimebagli = NULL
WHERE ofiskodu=4;

SELECT * FROM personel
WHERE ofisKodu=4;

DELETE FROM personel
WHERE ofisKodu = 4;

SELECT * FROM personel 
WHERE kimebagli IN (SELECT personelNo 
					FROM personel WHERE ofisKodu = 4);
-- Personel cedveli icinde 4 nomreli ofisde calisan personellerden
-- her hansi birine bagli basqa personel varmi

UPDATE personel 
SET kimebagli = NULL
WHERE kimebagli = 1102;
-- Pesonel cedvelinde 1102 nomreliye personele bagli olan
-- sexslerin kimebagli hissesini NULL deyer ile update ele

UPDATE musteriler
SET satisTemsPersonelNo = NULL 
WHERE satisTemsPersonelNo IN (SELECT personelNo
							  FROM personel
                              WHERE ofiskodu=4);
-- Musteriler cedvelinde 4 nomreli ofis personelinden 
-- musteri satis temsilcisi olaraq teyin edilen personelin
-- melumatlarini NULL olaraq update ele

DELETE FROM personel
WHERE ofisKodu = 4;