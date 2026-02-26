USE testdb;

CREATE TABLE cihazlar (
	cihazNo INT AUTO_INCREMENT PRIMARY KEY,
    adi varchar(100)
);

INSERT INTO cihazlar(adi)
	VALUES('Router F1'),('Switch 1'),('Switch 2');
    
INSERT INTO cihazlar(adi)
	VALUES('Printer')
    ON DUPLICATE KEY UPDATE adi = 'Printer';
-- Eger biz cihazlar cedveline biz 'Printer' adinda
-- yeni bir qeyd elave etdikde ( burda Primary key yada UNIQUE deyer varsa)
-- sen adi hissesini 'Printer' olaraq update et

INSERT INTO cihazlar(adi)
	VALUES(4, 'Printer'); -- Xeta verecek 4 nomreli cihaz var
    
INSERT INTO cihazlar(cihazNo, adi)
	VALUES (4, 'Printer')
    ON DUPLICATE KEY UPDATE adi = 'Public User Printer';
    
CREATE TABLE abunelik(
	abuneNo INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL UNIQUE
);


INSERT INTO abunelik(email)
	VALUES('testmail01@gmail.com');
    
INSERT INTO abunelik(email)
	VALUES('testmail01@gmail.com'),
          ('testmail02@gmail.com'); 
-- bele halda elave ede bilmirik

INSERT IGNORE INTO abunelik(email)
    VALUES('unkmail02@gmail.com'),
		  ('testmail01@gmail.com'); 
-- bu halda elave ede bilirik. Abunelik elave eden zaman
-- duplicate varsa legv edir (duplicate) olmayani qeyd edir

INSERT IGNORE INTO abunelik(email)
    VALUES('unkmail02@gmail.com'),
		  ('testmail01@gmail.com'),
          ('mytestm03@gmail.com');