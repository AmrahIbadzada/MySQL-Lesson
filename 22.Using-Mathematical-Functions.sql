SELECT ABS(-10), ABS(0), ABS(10);
-- ABS icerisinde menfi deyer olsa bele 
-- onu alib musbet deyere cevirecek
SELECT urunKodu, alisFiyati, TESF, TESF - alisFiyati
FROM urunler;
-- Tovsiyye edilen satis qiymetinden alis qiymetini cixiriq
SELECT urunKodu, alisFiyati, TESF, alisFiyati - TESF
FROM urunler;
-- bu versiyada bu deyerler menfi olacaq, bele veziyyetlerde
-- ABS istifade ede bilerik
SELECT urunKodu, alisFiyati, TESF, ABS(alisFiyati - TESF) 
FROM urunler;

-- CEIL(), FLOOR() - onluq sayilari yuvarlaqlasdirmamiza komek edir
-- ROUND() - bundan ferqli olaraq CEIL - onluq sayini ozune en
-- yaxin boyuk tam reqeme yuvarlayir, FLOOR en yaxin kicik tam
-- reqeme tamamlayir

SELECT CEIL(1.5), CEIL(1.2), CEIL(1.9); -- 2
SELECT FLOOR(1.5), FLOOR(1.2), FLOOR(1.9); -- 1
SELECT ROUND(1.5), ROUND(1.2), ROUND(1.9); -- 2, 1, 2

-- TRUNCATE()
SELECT TRUNCATE(1.5555,1); 
-- 1.5 - 1.5555 ədədini 1 onluqdan sonra kəsir,
-- amma yuvarlaqlaşdırmır, sadəcə artıq hissəni atır.
SELECT ROUND(1.5555,1); -- 1.6

-- MOD()
SELECT MOD(11,3);
-- 11-i 3-e bolende tam hisse 3, qaliq 2 olur.
-- Ona göre netice 2-dir.