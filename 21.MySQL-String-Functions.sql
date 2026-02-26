-- CONCAT()
USE klasikmodeller;

SELECT CONCAT(musteriAdi, ' ', musterSoyAdi) tamAdi
FROM musteriler;

-- CONCAT_WS()
SELECT CONCAT_WS(', ', musteriAdi, musterSoyAdi) tamAdi
FROM musteriler;

-- INSTR()
SELECT urunAdi
FROM urunler
WHERE INSTR(urunAdi, 'Car') > 0;

-- LENGTH()
SELECT urunAdi, LENGTH(urunAdi)
FROM urunler
ORDER BY LENGTH(urunAdi);

-- LEFT(),RIGHT(),REVERSE()
SELECT urunKodu, urunAdi, LEFT(urunAciklama, 50)
FROM urunler;

SELECT urunKodu, urunAdi, RIGHT(urunAciklama, 50)
FROM urunler;

SELECT urunKodu, urunAdi, REVERSE(LEFT(urunAciklama, 50))
FROM urunler;

SELECT urunKodu, RIGHT(urunKodu, 
LENGTH(urunkodu) - INSTR(urunKodu, '_')) mehsulKodu 
FROM urunler;
-- INSTR(urunKodu, '_')  → '_' simvolunun yerini tapir
-- LENGTH(urunKodu)      → umumi uzunlugu olcur
-- RIGHT(...)            → hemin movqeden sonraki hisseni goturur
-- Netice: "ABC_1234" → "1234", INSTR(urunKodu, '_')-1) yazsaq 
-- 3 denesini verecek ona gore -1 yazmiriq 

SELECT urunKodu, LEFT(urunKodu, 
INSTR(urunKodu, '_')-1) mehsulKodu 
FROM urunler;

-- LOWER(), UPPER()
SELECT musteriAdi, musterSoyAdi,
LOWER(CONCAT(musteriAdi, ', ', musterSoyAdi)) adSoyad
FROM musteriler;

SELECT musteriAdi, musterSoyAdi,
UPPER(CONCAT(musteriAdi, ', ', musterSoyAdi)) adSoyad
FROM musteriler;

SELECT musteriAdi, musterSoyAdi,
CONCAT(musteriAdi, ', ', UPPER(musterSoyAdi)) adSoyad
FROM musteriler;

-- TRIM(), LTRIM(), RTRIM(), REPLACE()
SELECT TRIM('          MySQL TRIM funksiyasi         ') myTable;
-- Basdaki ve sondaki boslugu temizleyer
SELECT LTRIM('          MySQL TRIM funksiyasi         ') myTable;
-- Soldaki boslugu temizleyer
SELECT RTRIM('          MySQL TRIM funksiyasi         ') myTable;
-- Sagdaki boslugu temizleyer

UPDATE urunler
SET urunAciklama = REPLACE(urunAciklama, 'about', 'abuot');

SELECT * FROM urunler
WHERE INSTR(urunAciklama, 'abuot') > 0;

UPDATE urunler
SET urunAciklama = REPLACE(urunAciklama, 'abuot', 'about');
-- abuot yazilibsa onu about elemek veya eksine deyismek
-- isteyirikse(sozdeki herfleri) replace istifade edirik

-- SUBSTR()
SELECT SUBSTR('MySQL SUBSTRING orneyi', 8, 4) myTable;
-- UBST deyerlerini yeni 8-ciden etibaren ilk 4 herfi getirecek
SELECT SUBSTR('MySQL SUBSTRING orneyi', 7) myTable;
-- 7-den sonra hecne qeyd etmesek o hisseden etibaren
-- hamisini alacaqdir

SELECT SUBSTR('MySQL SUBSTRING orneyi', -10) myTable;
-- MySQL yox eks terefden orneyi baslayar ve ekrana
-- ING orneyi yazdiracaq
SELECT SUBSTR('MySQL SUBSTRING orneyi', 0) myTable;
-- bos deyer donur
SELECT SUBSTR('MySQL SUBSTRING orneyi', -10,3) myTable;
-- Eksden baslayib ING ilk 3-nu yazdiracaq

SELECT musteriAdi, musterSoyAdi,
CONCAT(SUBSTR(musteriAdi,1,1),'.',musterSoyAdi) adSoyad
FROM musteriler;
-- ilk adin bas herfini yeni (1,1) getirecek '.' qoyub
-- soyadlari yazacaq