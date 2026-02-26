USE klasikmodeller;

SELECT durum FROM siparisler;

SELECT durum FROM siparisler
GROUP BY durum;

SELECT DISTINCT durum
FROM siparisler;

SELECT durum, COUNT(*)
FROM siparisler
GROUP BY durum;


SELECT 
    durum,                                   -- sifarişin vəziyyətini göstəririk (məs: 'Hazırlanır', 'Tamamlandı' və s.)
    SUM(siparisAdet * birimFiyat) AS umMebleg   -- hər məhsul üçün (ədəd * birim qiymət) hesablanır və cəmi alınır
FROM siparisler
    -- əsas sifariş məlumatlarını saxlayan cədvəl (siparisNo, durum və s.)

INNER JOIN siparisdetay
    USING (siparisno)                         -- siparisler və siparisdetay cədvəllərini siparisno sütunu ilə birləşdiririk

GROUP BY durum;                               -- nəticəni sifariş vəziyyətinə görə qruplaşdırırıq
-- nəticədə hər bir durum üçün ümumi sifariş məbləğini göstərən hesabat yaradiriq

-- siparisler cədvəlindəki sifarişləri onların vəziyyətinə (durumuna) görə qruplaşdırır
-- və hər vəziyyətdəki sifarişlərin ümumi məbləğini hesablayırıq


SELECT siparisNo,	
SUM(siparisAdet*birimFiyat) AS umQiymet
FROM siparisdetay GROUP BY siparisNo;
-- her bir siparisNo ucun siparisAdet*birimFiyat vurub hesablayacaq
-- butun siralanan siparisNo ucun edecek, bunu elemesi ucunde GROUP BY istifade edecek

SELECT YEAR(siparisTarihi) AS IL,
SUM(siparisAdet*birimFiyat) AS ilTutar 
FROM siparisler INNER JOIN siparisdetay USING(siparisNo)
WHERE durum = 'Shipped' GROUP BY YEAR(siparisTarihi); 
-- siparisler cedveli ile siparisdetay cedvelini INNER JOIN edirik
-- Il versiyasinda Shipped veziyyetinde olan siparis tutarlari ile gosterir(report yaradir)

SELECT YEAR(siparisTarihi) AS IL,
SUM(siparisAdet*birimFiyat) AS ilTutar 
FROM siparisler INNER JOIN siparisdetay USING(siparisNo)
WHERE durum = 'Shipped' GROUP BY YEAR(siparisTarihi) HAVING IL > 2003;