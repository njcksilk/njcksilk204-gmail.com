DROP DATABASE IF EXISTS DB_Facebook_Management;
CREATE DATABASE DB_Facebook_Management;
USE DB_Facebook_Management;
CREATE TABLE `National`(
National_id				TINYINT PRIMARY KEY AUTO_INCREMENT ,
National_Name			NVARCHAR(20) NOT NULL ,
Language_Main			NVARCHAR(20) NOT NULL  
);
CREATE TABLE Office	(
Office_id			TINYINT PRIMARY KEY AUTO_INCREMENT ,
Street_Address		NVARCHAR(20) NOT NULL,
National_id			TINYINT UNIQUE,
FOREIGN KEY (National_id) REFERENCES `National`(National_id)
);
CREATE TABLE Staff(
Staff_id			TINYINT PRIMARY KEY AUTO_INCREMENT ,
First_Name			NVARCHAR(20) NOT NULL,
Last_Name			NVARCHAR(20) NOT NULL,
Email				NVARCHAR(20) NOT NULL,
Office_id			TINYINT UNIQUE,
FOREIGN KEY (Office_id) REFERENCES Office(Office_id)
);
INSERT INTO `db_facebook_management`.`national` (`National_Name`, `Language_Main`) VALUES ('VietNam', 'Việt');
INSERT INTO `db_facebook_management`.`national` (`National_Name`, `Language_Main`) VALUES ('Anh', 'Anh');
INSERT INTO `db_facebook_management`.`national` (`National_Name`, `Language_Main`) VALUES ('Phap', 'Phap');
INSERT INTO `db_facebook_management`.`national` (`National_Name`, `Language_Main`) VALUES ('Mỹ', 'Anh');
INSERT INTO `db_facebook_management`.`national` (`National_Name`, `Language_Main`) VALUES ('Tay Ban Nha', 'Taybannha');
INSERT INTO `db_facebook_management`.`national` (`National_Name`, `Language_Main`) VALUES ('Đông Lào', 'Việt');
INSERT INTO `db_facebook_management`.`national` (`National_Name`, `Language_Main`) VALUES ('Hàn Quốc', 'Hàn');
INSERT INTO `db_facebook_management`.`national` (`National_Name`, `Language_Main`) VALUES ('Nhật Bản', 'Nhật');
INSERT INTO `db_facebook_management`.`national` (`National_Name`, `Language_Main`) VALUES ('Trung Quốc', 'Chingchong');
INSERT INTO `db_facebook_management`.`national` (`National_Name`, `Language_Main`) VALUES ('Lào', 'Lào');
INSERT INTO `db_facebook_management`.`office` (`Street_Address`, `National_id`) VALUES ('Hồ Tây,Hà Nội', '1');
INSERT INTO `db_facebook_management`.`office` (`Street_Address`, `National_id`) VALUES ('Pari', '4');
INSERT INTO `db_facebook_management`.`office` (`Street_Address`, `National_id`) VALUES ('Hà Đông', '3');
INSERT INTO `db_facebook_management`.`office` (`Street_Address`, `National_id`) VALUES ('Tokyo', '5');
INSERT INTO `db_facebook_management`.`office` (`Street_Address`, `National_id`) VALUES ('Sudgs', '7');
INSERT INTO `db_facebook_management`.`office` (`Street_Address`, `National_id`) VALUES ('Quảng Châu', '6');
INSERT INTO `db_facebook_management`.`office` (`Street_Address`, `National_id`) VALUES ('Mitaribay', '2');
INSERT INTO `db_facebook_management`.`office` (`Street_Address`, `National_id`) VALUES ('Phúc Thọ', '8');
INSERT INTO `db_facebook_management`.`office` (`Street_Address`, `National_id`) VALUES ('Hà Thành', '9');
INSERT INTO `db_facebook_management`.`office` (`Street_Address`, `National_id`) VALUES ('Cổ Nhuế', '10');
INSERT INTO `db_facebook_management`.`staff` (`First_Name`, `Last_Name`, `Email`, `Office_id`) VALUES ('Le', 'Hoang', 'lehoang@gg.com', '5');
INSERT INTO `db_facebook_management`.`staff` (`First_Name`, `Last_Name`, `Email`, `Office_id`) VALUES ('Ho', 'Cang', 'hocang@gmail.com', '3');
INSERT INTO `db_facebook_management`.`staff` (`First_Name`, `Last_Name`, `Email`, `Office_id`) VALUES ('Nhu', 'Ka', 'nhucang@gmail.com', '6');
INSERT INTO `db_facebook_management`.`staff` (`First_Name`, `Last_Name`, `Email`, `Office_id`) VALUES ('Fu', 'Ku', 'fuku@gmail.com', '7');
INSERT INTO `db_facebook_management`.`staff` (`First_Name`, `Last_Name`, `Email`, `Office_id`) VALUES ('Saco', 'Late', 'saco@gmail.com', '1');
INSERT INTO `db_facebook_management`.`staff` (`First_Name`, `Last_Name`, `Email`, `Office_id`) VALUES ('La', 'Mi', 'lami@gmail.com', '2');
INSERT INTO `db_facebook_management`.`staff` (`First_Name`, `Last_Name`, `Email`, `Office_id`) VALUES ('Hi', 'Ho', 'hiho@gmail.com', '8');
INSERT INTO `db_facebook_management`.`staff` (`First_Name`, `Last_Name`, `Email`, `Office_id`) VALUES ('Noo', 'Lee', 'noolee@gmail.com', '10');
INSERT INTO `db_facebook_management`.`staff` (`First_Name`, `Last_Name`, `Email`, `Office_id`) VALUES ('Hu', 'Tao', 'hutao@gmail.com', '9');

