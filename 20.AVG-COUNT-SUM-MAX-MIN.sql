-- AVG()
SELECT AVG(alisFiyati) ortalamaAlisFiyati
FROM urunler;

SELECT urunHatti, AVG(alisFiyati)
FROM urunler GROUP BY urunHatti
ORDER BY urunHatti;

-- COUNT()
SELECT COUNT(*) FROM urunler;

SELECT COUNT(DISTINCT(urunKodu))
FROM urunler;

SELECT urunHatti, COUNT(*)
FROM urunler
GROUP BY urunHatti
ORDER BY urunHatti;


-- SUM()
SELECT urunKodu, SUM(birimFiyat*siparisAdet) umumiMebleg
FROM siparisdetay
GROUP BY urunKodu
ORDER BY umumiMebleg DESC;

SELECT urunKodu,urunAdi, SUM(birimFiyat*siparisAdet) umumiMebleg
FROM siparisdetay
INNER JOIN urunler USING(urunKodu)
GROUP BY urunKodu
ORDER BY umumiMebleg DESC;


-- MAX() ve MIN()
SELECT urunHatti, MAX(alisFiyati)
FROM urunler
GROUP BY urunHatti
ORDER BY MAX(alisFiyati) DESC;

SELECT urunHatti, MIN(alisFiyati)
FROM urunler
GROUP BY urunHatti
ORDER BY MIN(alisFiyati) ASC;


-- GROUP_CONCAT()
/*
Her bir satis temsilcisi iscinin(personelin) mesuliyyeti oldugu musterileri
tek bir yer icinde siyahiya alaq
*/

SELECT ilkAdi, soyadi, 
GROUP_CONCAT(DISTINCT musteriAdi
			 ORDER BY musteriAdi) musteriler
FROM personel
INNER JOIN musteriler
ON musteriler.satisTemsPersonelNo = personelNo
GROUP BY personelNo
ORDER BY ilkAdi, soyadi;