SELECT * FROM personel;

SELECT soyadi,ilkAdi,isTanim FROM personel;

SELECT * FROM personel
ORDER BY soyadi;


-- SELECT * FROM personel
-- ORDER BY soyadi ASC; 
-- bu iki ifadede eynidi artan sira ile gelecek

SELECT * FROM personel
ORDER BY soyadi DESC; -- azalan sekilde siraliyacaq

SELECT * FROM personel 
ORDER BY soyadi ASC, ilkAdi DESC;
-- Her birini oz iclerindede duzelde bilirik

SELECT *, birimFiyat*siparisAdet FROM siparisdetay
ORDER BY birimFiyat*siparisAdet;

SELECT *, birimFiyat*siparisAdet FROM siparisdetay
ORDER BY birimFiyat*siparisAdet DESC;


SELECT * FROM siparisler 
ORDER BY durum;
-- bu bize durum( veziyyet ) icinde olanlari
-- artan sira ile getirecek

SELECT * FROM siparisler
ORDER BY FIELD(durum,
			'In Process',
            'On Hold',
            'Cancelled',
            'Resolved',
            'Disputed',
            'Shipped'
);