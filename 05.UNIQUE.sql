USE testdb;
CREATE TABLE isciler(
	isci_no INT AUTO_INCREMENT,
    adi varchar(20) NOT NULL,
    telfon_no VARCHAR(20) NOT NULL UNIQUE,
    unvan varchar(255) NOT NULL,
    PRIMARY KEY (isci_no),
    CONSTRAINT uk_adi_unvan UNIQUE(adi, unvan)
);

INSERT INTO isciler(adi, telfon_no, unvan)
	VALUES('Unknown', '(1)-112-222-1234', '1xxx West Street');
    
SELECT * FROM isciler;

-- INSERT INTO isciler(adi, telfon_no, unvan)
-- 	VALUES('Unknown', '(1)-112-222-1234', '1xxx West Street');
-- Eyni datalari 2-ci defe qeyd ede bilmerik

INSERT INTO isciler(adi, telfon_no, unvan)
	VALUES('Unknown2', '(1)-221-123-3412', '2xx West Street')
    
-- INSERT INTO isciler(adi, telfon_no, unvan)
-- 	VALUES('Unknown', '(1)-112-222-1256', '1xxx West Street');
-- nomre ferqli olsada, ad ile unvan-ni UNIQUE oldugundan eyni vere bilmerik

SHOW CREATE TABLE isciler;

SHOW INDEX FROM isciler;

DROP INDEX uk_adi_unvan ON isciler;

SHOW INDEX FROM isciler;

ALTER TABLE isciler ADD CONSTRAINT uk_adi_unvan UNIQUE(adi, unvan);

SHOW INDEX FROM isciler;