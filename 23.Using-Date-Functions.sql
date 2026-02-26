-- CURDATE()
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE; 
-- Hamisi hazirki vaxti qeyd edecek

-- DATEDIFF() funksiyası iki tarix arasındakı gün fərqini hesablayır
/*
DATEDIFF() iki tarix arasındakı fərqi günlərlə hesablayır.
Bu sorğuda istenenTarihi ilə kargoTarihi arasındakı gün fərqini tapır 
və "Shipped" statuslu sifarişləri çatdırılma müddətinə görə 
azalan sırayla göstərir. 
*/

SELECT siparisNo,
DATEDIFF(istenenTarihi, kargoTarihi) texminiCatdirilma
FROM siparisler
WHERE kargoTarihi IS NOT NULL
ORDER BY texminiCatdirilma DESC;

SELECT siparisNo,
DATEDIFF(istenenTarihi, kargoTarihi) texminiCatdirilma
FROM siparisler
WHERE durum = 'Shipped'
ORDER BY texminiCatdirilma DESC;
-- Bu sekildede yaza bilerik

SELECT siparisNo,
DATEDIFF(istenenTarihi, siparisTarihi) qalanVaxt
FROM siparisler 
WHERE durum = 'Shipped'
ORDER BY qalanVaxt;


-- DAY(), YEAR()
SELECT DAY(siparisTarihi) ayinGunleri, COUNT(*)
FROM siparisler
WHERE YEAR(siparisTarihi) = 2003
GROUP BY ayinGunleri
ORDER BY ayinGunleri;
-- Sifarislerin verildiyi tarixlerde ayin hansi gun oldugunu
-- tapacaq daha sonra o gunlerde verilmis olan sifarisleri
-- sayacaq ve bunlari siraliyacaq, YEAR() verilen tarixin
-- ilini geri dondurur

SELECT DAY(siparisTarihi) ayinGunleri, COUNT(*) siparisSayi
FROM siparisler
WHERE YEAR(siparisTarihi) = 2003
GROUP BY ayinGunleri
ORDER BY siparisSayi;

SELECT DAY(siparisTarihi) ayinGunleri, COUNT(*) siparisSayi,
DAYOFWEEK(siparisTarihi) hefteGunu,
DAYNAME(siparisTarihi) hefteAdi
FROM siparisler
WHERE YEAR(siparisTarihi) = 2003
GROUP BY ayinGunleri, hefteGunu,hefteAdi
ORDER BY siparisSayi DESC;

-- MONTH() -iller icinde aylara gore siralama
SELECT YEAR(siparisTarihi) iller,
MONTH(siparisTarihi) aylar,
COUNT(*) FROM siparisler
GROUP BY iller, aylar;
-- Iller uzre her ay verilen sifarisleri gosterecek

SELECT DAYNAME(siparisTarihi) gunler,
COUNT(*) FROM siparisler
GROUP BY gunler;
-- Hansi gunlerde ne qeder sifaris oldugunu gosterecek