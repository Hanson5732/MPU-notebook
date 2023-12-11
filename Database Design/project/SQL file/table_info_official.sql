-- 教师信息表
CREATE TABLE staff_info (
	staffNo CHAR ( 5 ) PRIMARY KEY,
	staff_fName VARCHAR ( 30 ) NOT NULL,
	staff_lName VARCHAR ( 30 ) NOT NULL,
	staff_status CHAR ( 1 ) NOT NULL,
	staff_sex CHAR ( 6 ) NOT NULL,
	staff_address VARCHAR ( 100 ) NOT NULL,
	staff_phone CHAR ( 14 ) NOT NULL,
	staff_id CHAR ( 18 ) UNIQUE NOT NULL,
	staff_birth DATE NOT NULL,
	staff_expertise VARCHAR ( 10 ) NOT NULL,
	staff_email VARCHAR ( 100 ) NOT NULL 
);

-- 学生信息表
CREATE TABLE student_info (
	studentNo CHAR ( 8 ) PRIMARY KEY,
	student_fName VARCHAR ( 30 ) NOT NULL,
	student_lName VARCHAR ( 30 ) NOT NULL,
	student_status CHAR ( 1 ) NOT NULL,
	student_id VARCHAR ( 30 ) UNIQUE NOT NULL,
	student_address VARCHAR ( 255 ),
	student_sex CHAR ( 1 ),
	student_phone VARCHAR ( 15 ),
	student_birth DATE,
	student_email VARCHAR ( 50 ) NOT NULL 
);

-- 课程信息表
CREATE TABLE course_info (
	courseNo VARCHAR ( 25 ) PRIMARY KEY,
	course_name VARCHAR ( 20 ) NOT NULL,
	course_dsc VARCHAR ( 50 ),
	course_pre VARCHAR ( 50 )
);

-- 课程章节表
CREATE TABLE class_section_info (
	sectionNo CHAR ( 100 ) PRIMARY KEY,
	associated_course VARCHAR ( 25 ) NOT NULL,
	section_course_day char(3) NOT NULL,
	section_course_time char(11) NOT NULL,
	section_course_duration char(21) NOT NULL,
	instructor CHAR ( 5 ) NOT NULL,
	assignment VARCHAR ( 255 ),
	section_semester CHAR ( 1 ) NOT NULL,
	section_year YEAR NOT NULL,
	CONSTRAINT fk_section_staff FOREIGN KEY ( instructor ) REFERENCES staff_info ( staffNo ) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_section_course FOREIGN KEY ( associated_course ) REFERENCES course_info ( courseNo ) ON UPDATE CASCADE ON DELETE CASCADE 
);

-- 学生与课程的连接表
CREATE TABLE student_course_registration (
	studentNo CHAR ( 8 ) NOT NULL,
	sectionNo CHAR ( 100 ) NOT NULL,
	enroll_date DATETIME NOT NULL,
	FOREIGN KEY ( studentNo ) REFERENCES student_info ( studentNo ) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY ( sectionNo ) REFERENCES class_section_info ( sectionNo ) ON UPDATE CASCADE ON DELETE CASCADE 
);

-- 课程材料信息表
CREATE TABLE course_material_info (
	document_id VARCHAR ( 36 ) PRIMARY KEY,
	document_title VARCHAR ( 100 ) NOT NULL DEFAULT "new file",
	document_topic VARCHAR ( 100 ) NOT NULL,
	associated_section CHAR ( 100 ) NOT NULL,
	document_author CHAR ( 5 ) NOT NULL,
	created_time DATETIME NOT NULL,
	modified_time DATETIME,
	CONSTRAINT fk_material_section FOREIGN KEY ( associated_section ) REFERENCES class_section_info ( sectionNo ) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_material_staff FOREIGN KEY ( document_author ) REFERENCES staff_info ( staffNo ) ON UPDATE CASCADE ON DELETE RESTRICT 
);

-- 作品信息+评价表
CREATE TABLE artwork_info (
	artworkNo INT PRIMARY KEY AUTO_INCREMENT,
	artist CHAR ( 8 ) NOT NULL,
	artwork_format VARCHAR ( 5 ) NOT NULL,
	artwork_created_time DATETIME NOT NULL,
	artwork_submitted_time DATETIME NOT NULL,
	artwork_used_medium VARCHAR ( 50 ) NOT NULL,
	artwork_subject VARCHAR ( 255 ) NOT NULL,
	instructor CHAR ( 5 ) NOT NULL,
	associated_section CHAR ( 100 ),
	evaluation_written_date DATETIME,
	evaluation_grade CHAR ( 5 ),
	evaluation_remark VARCHAR ( 255 ),
	FOREIGN KEY ( instructor ) REFERENCES staff_info ( staffNo ) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY ( artist ) REFERENCES student_info ( studentNo ) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY ( associated_section ) REFERENCES class_section_info ( sectionNo ) ON UPDATE CASCADE ON DELETE SET NULL 
);