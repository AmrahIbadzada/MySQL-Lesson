SELECT soyadi FROM personel
ORDER BY soyadi;
-- Bir biri ile eyni olanlari gosterecek

SELECT DISTINCT soyadi FROM personel
ORDER BY soyadi;
-- Ferqli olanlari getirecek

SELECT DISTINCT eyalet FROM musteriler;
-- Butun null deyerleri tek olaraq sayir


SELECT eyalet FROM musteriler;
-- Birden cox null deyerini sayacaq


SELECT DISTINCT eyalet, sehir FROM musteriler
WHERE eyalet IS NOT NULL;
-- Birden cox sutun uzerindede Distinct
-- ifadesini istifade ede bilerik


SELECT COUNT(eyalet) FROM musteriler
WHERE ulke='USA';

SELECT COUNT(DISTINCT(eyalet)) FROM musteriler
WHERE ulke='USA';


SELECT DISTINCT eyalet FROM musteriler
WHERE eyalet IS NOT NULL
LIMIT 5;
-- ferqli olan eyaletleri siralayir amma
-- ilk 5 denesini getirir


SELECT musterino, musteriAdi, kredilimit
FROM musteriler
ORDER BY krediLimit ASC LIMIT 5;
-- kredit limiti en asagi 5 musteri

SELECT musterino, musteriAdi, kredilimit
FROM musteriler
ORDER BY krediLimit DESC LIMIT 5;
-- en yuksek kredit limitine sahib 5 musteri

SELECT musterino, musteriAdi, kredilimit
FROM musteriler
ORDER BY krediLimit DESC LIMIT 10,10;
-- Limit ile 2 parametrde vere bilerik
-- Kredi limitlerine bagli olaraq azalan
-- sekilde siralayir ve 10- cu siradan etibaren
-- 10 nefer al

SELECT musterino, musteriAdi, kredilimit
FROM musteriler
ORDER BY krediLimit DESC LIMIT 10;


SELECT CONCAT(soyadi, ', ', ilkadi) 
FROM personel;
-- Concat string deyerleri birlesdirir

SELECT CONCAT(soyadi, ', ', ilkadi) 
AS Soyad_ilkAd FROM personel;

-- SELECT CONCAT(soyadi, ', ', ilkadi) 
-- AS 'Soyad ilkAd' FROM personel;
-- Araya bosluq qoymaq lazimdisa string deyerlerde
-- ' '-dirnaq isareti istifade etmemiz lazimdi


-- SELECT musterino, musteriAdi AS 'Musteri Adi', kredilimit AS 'Kredit Limiti'
-- FROM musteriler
-- ORDER BY krediLimit DESC LIMIT 10,10;


-- SELECT musterino FROM musteriler m;
-- Cedvelede ad qoya bilerik, musteriler 
-- cedveline m adini ver 


-- SELECT m.musterino, m.musteriAdi AS 'Musteri Adi', m.kredilimit
-- FROM musteriler m;
