SELECT siparisNo,
	SUM(siparisAdet) AS toplamUrunAdedi,
    SUM(birimFiyat*siparisAdet) AS toplamTutari
FROM siparisdetay
GROUP BY siparisNo
ORDER BY toplamTutari ASC;


SELECT siparisNo,
	SUM(siparisAdet) AS toplamUrunAdedi,
    SUM(birimFiyat*siparisAdet) AS toplamTutari
FROM siparisdetay
GROUP BY siparisNo
HAVING toplamTutari > 5000
ORDER BY toplamTutari ASC;



SELECT siparisNo,
	SUM(siparisAdet) AS toplamUrunAdedi,
    SUM(birimFiyat*siparisAdet) AS toplamTutari
FROM siparisdetay
GROUP BY siparisNo
HAVING toplamTutari > 5000 AND toplamUrunAdedi > 100
ORDER BY toplamTutari ASC;

/*
Butun mehsul (urun adedi) ededi 100 ustu olan ve veziyyeti
'Shipped' - Gonderildi olaraq qeyd olan siparisleri gruplayaq
*/

SELECT 
	sd.siparisNo,
    durum,
    SUM(siparisAdet) toplamUrunAdedi
FROM siparisdetay sd
INNER JOIN siparisler s
	ON s.siparisno=sd.siparisno
GROUP BY 
	siparisno,
    durum
HAVING
	toplamUrunAdedi > 100 AND durum='Shipped';
    
    
    
-- SELECT 
-- 	sd.siparisNo,
--     durum,
--     SUM(siparisAdet) toplamUrunAdedi
-- FROM siparisdetay sd
-- INNER JOIN siparisler s
-- 	USING(siparisno)
-- GROUP BY 
-- 	siparisno,
--     durum
-- HAVING
-- 	toplamUrunAdedi > 100 AND durum='Shipped';
-- eyni ifadeni geri donderecek