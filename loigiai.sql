-- Questions 2 a
SELECT * FROM HuongDan hd
JOIN SinhVien sv ON hd.masv = sv.masv
WHERE hd.madt IS NULL;
-- Questions 2 b
SELECT COUNT(hd.madt) FROM HuongDan hd
JOIN SinhVien sv ON hd.masv = sv.masv
JOIN Detai dt ON hd.madt = dt.madt
WHERE dt.tendt = 'Cong Nghe Sinh Học'
GROUP BY hd.madt;
-- Questions 3
CREATE VIEW SinhVienInfos  AS
(SELECT sv.masv,sv.hoten , dt.tendt FROM HuongDan hd
JOIN DeTai dt ON hd.madt = dt.madt
JOIN SinhVien sv ON hd.masv = sv.masv)
UNION
(SELECT sv.masv,sv.hoten , 'chưa có' FROM SinhVien sv
JOIN HuongDan hd ON hd.masv = sv.masv
WHERE hd.madt IS NULL);
-- Questions 4
DROP TRIGGER IF EXISTS tg_SinhVienmin;
DELIMITER $$
	CREATE TRIGGER tg_SinhVienmin
     BEFORE INSERT ON SinhVien
    FOR EACH ROW
    BEGIN		
		DECLARE v_namsinhmin YEAR; 
        SELECT sv.namsinh INTO v_namsinhmin FROM SinhVien sv WHERE sv.namsinh = NEW.namsinh;
		IF v_namsinhmin <= 1900 THEN 
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = '"năm sinh phải > 1900"';
		END IF;        
    END$$
DELIMITER ;
-- cách 2
DROP TRIGGER IF EXISTS tg_SinhVienmin2 ;
 DELIMITER $$ 
 CREATE TRIGGER tg_SinhVienmin2 
 BEFORE INSERT ON sinhvien 
 FOR EACH ROW 
 BEGIN
IF(year(NEW.namsinh) <= 1900) THEN 
	SIGNAL SQLSTATE '12345'
    SET MESSAGE_TEXT ='năm sinh phải > 1900' ;
 END IF ;
 END $$ 
 DELIMITER ;
 
INSERT INTO `finalexam`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('Nguyen Van c ', 1800, 'Than Hoá');
-- Questions 5
ALTER TABLE HuongDan DROP FOREIGN KEY FK_sv ; 
ALTER TABLE HuongDan ADD CONSTRAINT FK_sv FOREIGN KEY (masv) REFERENCES SinhVien(masv) ON DELETE CASCADE ;
