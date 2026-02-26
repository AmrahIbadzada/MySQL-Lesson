/*
ABS-da olan ofislerde calisan personellerin 
ad ve soyadlari nelerdir
*/

SELECT soyadi, ilkAdi
FROM personel
WHERE ofisKodu IN(SELECT ofisKodu 
				  FROM ofisler
                  WHERE ulke = 'USA');
-- Bir SQL ifadesi icerisinde istifade olunan diger SQL
-- ifadesine biz alt sorgu deyirik

SELECT ofisKodu
FROM ofisler
WHERE ulke = 'USA';
-- USA olan ofisleri gosterecek

SELECT * FROM personel
WHERE ofisKodu IN(1,2,3);


/*
Ortalama odemenin ustunde odeme eden musterilerin listi
*/

SELECT AVG(miktar)
FROM odemeler; -- 32431.645531

SELECT musteriNo, cekNo, miktar
FROM odemeler
WHERE miktar >(SELECT AVG(miktar)
			 FROM odemeler);
             


/*
Herhansi bir sifarisde olmamis olan musterilerin adlari nelerdir
*/

SELECT musteriAdi 
FROM musteriler
WHERE musteriNo NOT IN(SELECT DISTINCT musteriNo
					   FROM siparisler);
                       
SELECT DISTINCT musteriNo
FROM siparisler; 
-- siparis veren musteriNo-larini getirecek


/*
Hər sifariş üzrə ən az, ən çox və orta hesabla neçə 
məhsul olduğunu siyahıya salın
*/

SELECT 
	MAX(mehsulSayi),
    MIN(mehsulSayi),
    FLOOR(AVG(mehsulSayi))
FROM
	(SELECT siparisNo, COUNT(siparisNo) AS mehsulSayi
     FROM siparisdetay
     GROUP BY siparisNo) AS sifarisMehsulSayi;
-- Bunlara bir-birinden elaqesiz alt sorgular deyilir
     
-- SELECT siparisNo, COUNT(siparisNo) AS mehsulSayi
-- FROM siparisdetay
-- GROUP BY siparisNo -- her bir sifarisde yer alan ferqli mehsul sayi

SELECT urunAdi, alisFiyati
FROM urunler u1
WHERE alisFiyati > (SELECT AVG(alisFiyati)
					FROM urunler
                    WHERE urunHatti = u1.urunHatti);
                    
SELECT * FROM urunler
WHERE urunHatti = 'Classic Cars';
                    
SELECT AVG(alisFiyati)
FROM urunler 
WHERE urunHatti= 'Classic Cars';


/*
Toplam meblegi 60000 uzeri olan safaris vermis musterilerin
ad ve soyadlarini siyahiya alin
*/

SELECT musteriNo, siparisNo, SUM(birimFiyat*siparisAdet) toplamMebleg
FROM siparisdetay INNER JOIN siparisler USING(siparisNo)
GROUP BY siparisNo
HAVING SUM(birimFiyat*siparisAdet) > 60000;


SELECT musteriNo, musteriAdi
FROM musteriler
WHERE EXISTS(
			 SELECT siparisNo, SUM(birimFiyat*siparisAdet) toplamMebleg
             FROM siparisdetay INNER JOIN siparisler USING(siparisNo)
             WHERE siparisler.musteriNo = musteriler.musteriNo
             GROUP BY siparisNo
             HAVING SUM(birimFiyat*siparisAdet) > 60000
			 );