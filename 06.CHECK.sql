CREATE TABLE hisseler(
	hisse_no VARCHAR(18) PRIMARY KEY,
    hisse_adi VARCHAR(40),
    umumixerc DECIMAL(10,2) NOT NULL CHECK(umumixerc >=0),
    mebleg DECIMAL(10,2) NOT NULL CHECK(mebleg >=0)
);

SHOW CREATE TABLE hisseler;

-- INSERT INTO hisseler(hisse_no, hisse_adi, umumixerc, mebleg)
-- 	VALUES('A-110', 'Kuller', 0, -100);
-- Menfi deyer verdiyimize gore elave olunmayacaq
    
INSERT INTO hisseler(hisse_no, hisse_adi, umumixerc, mebleg)
	VALUES('A-110', 'Kuller', 0, 100);
    
SELECT * FROM hisseler;

-- CREATE TABLE hisseler(
-- 	hisse_no VARCHAR(18) PRIMARY KEY,
--     hisse_adi VARCHAR(40),
--     umumixerc DECIMAL(10,2) NOT NULL CHECK(umumixerc >=0),
--     mebleg DECIMAL(10,2) NOT NULL CHECK(mebleg >=0),
--     CONSTRAINT chk_mebleg_boyuk_umumixerc CHECK(mebleg > umumixerc)
-- );


DROP TABLE hisseler;

CREATE TABLE hisseler(
	hisse_no VARCHAR(18) PRIMARY KEY,
    hisse_adi VARCHAR(40),
    umumixerc DECIMAL(10,2) NOT NULL CHECK(umumixerc >=0),
    mebleg DECIMAL(10,2) NOT NULL CHECK(mebleg >=0),
    CONSTRAINT chk_mebleg_boyuk_umumixerc CHECK(mebleg > umumixerc)
);

INSERT INTO hisseler(hisse_no, hisse_adi, umumixerc, mebleg)
	VALUES('A-110', 'Kuller', 0, 100);
    
SELECT * FROM hisseler;

-- INSERT INTO hisseler(hisse_no, hisse_adi, umumixerc, mebleg)
-- 	VALUES('B-001', 'Masa', 35, 25);
    
INSERT INTO hisseler(hisse_no, hisse_adi, umumixerc, mebleg)
	VALUES('B-001', 'Masa', 35, 45);
    
SELECT * FROM hisseler;