use my_dtb;

CREATE TABLE Istifadeciler(
	istifadeci_no INT AUTO_INCREMENT PRIMARY KEY,
    istifadeci_adi VARCHAR(35),
    parol VARCHAR(36),
    gmail VARCHAR(255)
);

CREATE TABLE Rollar (
	rol_no INT AUTO_INCREMENT,
    rol_adi VARCHAR(30),
    PRIMARY KEY(rol_no)
);

CREATE TABLE Istifadeci_rollari(
	rol_no INT,
    istifadeci_no INT,
    PRIMARY KEY(rol_no, istifadeci_no),
    FOREIGN KEY(rol_no)
		REFERENCES Rollar(rol_no),
	FOREIGN KEY(istifadeci_no)
		REFERENCES Istifadeciler(istifadeci_no)
);