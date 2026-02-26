USE my_dtb;

CREATE TABLE isler2(
	isler_no INT AUTO_INCREMENT PRIMARY KEY,
    adi VARCHAR(255) NOT NULL,
    baslama_tarixi DATE NOT NULL,
    bitme_vaxti DATE
);

INSERT INTO isler2(adi, baslama_tarixi, bitme_vaxti)
	VALUES('NOT NULL-u oyrenek', '2025-10-21', '2025-11-03'),
		  ('NOT NULL-u oyrenek ve update edek', '2025-10-21', NULL);
   
SELECT * FROM isler2 
WHERE bitme_vaxti IS NULL;
   
-- UPDATE isler2
-- SET bitme_vaxti = baslama_tarixi+7
-- WHERE bitme_vaxti IS NULL;  
-- NULL olan hisseye tarix elave edirik

SELECT * FROM isler2;   

INSERT INTO isler2(adi, baslama_tarixi, bitme_vaxti)
	VALUES('MySQL TESt', '2025-10-23', '2025-11-03'),
		  ('MySQL NULL TEST', '2025-10-27', NULL);   
          
SELECT * FROM isler2;

-- DELETE FROM `my_dtb`.`isler2` WHERE (`isler_no` = '4');

ALTER TABLE isler2
CHANGE bitme_vaxti bitme_vaxti DATE NOT NULL;

-- INSERT INTO isler2(adi, baslama_tarixi, bitme_vaxti)
-- 	VALUES('MySQL NULL TEST', '2025-10-27', NULL); 
-- Xeta verecek cunki NULL bri deyer daxil ede bilmerik 

ALTER TABLE isler2
MODIFY bitme_vaxti DATE;

INSERT INTO isler2(adi, baslama_tarixi, bitme_vaxti)
	VALUES('MySQL NULL TEST0', '2025-10-27', NULL); 

SELECT * FROM isler2;