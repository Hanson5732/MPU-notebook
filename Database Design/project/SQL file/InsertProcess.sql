-- 插入数据

-- 教师表
INSERT INTO staff_info ( staffNo, staff_fName, staff_lName, staff_status, staff_sex, staff_address, staff_phone, staff_id, staff_birth, staff_expertise, staff_email )
VALUES
( "t0001", "Zhang", "San", "1", "M", "Macau SAR, China", "86 13011111111", "440681xxxxxxxxxxx0", "1980-01-01", "painting", "zhang@gmail.com" ),
( "t0002", "Li", "Si", "1", "F", "Macau SAR, China", "86 13011111112", "440681xxxxxxxxxxx1", "1990-01-01", "design", "li@gmail.com" ),
( "t0003", "Wang", "Wu", "1", "M", "Macau SAR, China", "86 13011111113", "440681xxxxxxxxxxx2", "1979-01-01", "sketch", "wang@gmail.com" );
	
-- 学生表
INSERT INTO student_info ( studentNo, student_fName, student_lName, student_status, student_sex, student_birth, student_id, student_phone, student_address, student_email )
VALUES
	( "p2211001", "John", "Wu", "1", "M", "2003-09-01", "1", "1", "HongKong, China", "John@gmail.com" ),
	( "p2211002", "Tom", "Yuan", "1", "M", "2003-09-02", "2", "2", "HongKong, China", "Tom@gmail.com" ),
	( "p2211003", "Bob", "Yu", "1", "M", "2003-09-03", "3", "3", "HongKong, China", "Bob@Yahoo.com" );

-- 课程表
INSERT INTO course_info ( courseNo, course_name, course_dsc )
VALUES
	( "c00001", "Painting", "good" ),
	( "c00002", "Sketch", "no good" ),
	( "c00003", "Web Design", "not bad" );
 
 -- 学期课程表
INSERT INTO class_section_info ( sectionNo, associated_course, section_course_day, section_course_time, section_course_duration, instructor, assignment, section_semester, section_year )
VALUES
	( "section-0001", "c00001", "MON", "14:30-17:30", "2023/09/01-2023/12/01", "t0001", "No work", "1", "2023" ),
	( "section-0002", "c00002", "TUE", "9:30-11:30", "2023/09/01-2023/12/01", "t0002", "Do some exercise", "1", "2023" ),
	( "section-0003", "c00003", "WED", "10:30-12:30", "2022/09/01-2022/12/01", "t0003", "Sleep", "1", "2023" ),
	( "section-0004", "c00003", "THU", "15:30-18:30", "2022/09/01-2022/12/01", "t0003", "Wake up", "1", "2023" );
 
 -- 课程注册表
INSERT INTO student_course_registration ( studentNo, sectionNo, enroll_date )
VALUES
	( "p2211001", "section-0001", "2023-10-10 13:00:00" ),
	( "p2211001", "section-0003", "2023-10-10 13:00:00" ),
	( "p2211003", "section-0004", "2023-10-10 13:00:00" ),
	( "p2211002", "section-0003", "2022-10-10 13:00:00" ),
	( "p2211002", "section-0004", "2022-10-10 13:00:00" );
 
 -- 课程材料表
INSERT INTO course_material_info ( document_id, document_author, document_title, document_topic, associated_section, created_time, modified_time )
VALUES
	( "document-0001", "t0001", "textbook", "t", "section-0001", "2023-09-01 15:00:00", "2023-09-01 15:00:00" );
 
-- 作品表
INSERT INTO artwork_info ( artworkNo, artist, artwork_created_time, artwork_submitted_time, artwork_format, artwork_subject, artwork_used_medium,  instructor, associated_section )
VALUES
(1, "p2211001", "2023-11-11 17:00:00", "2023-11-12 10:00:00", "jpg", "Sun", "crayon", "t0001", "section-0001"),
(2, "p2211001", "2023-11-11 17:00:00", "2023-11-12 10:00:00", "jpg", "Moon", "pencil", "t0001", "section-0002");

update artwork_info
set evaluation_written_date = "2023-11-13",
evaluation_grade = "A",
evaluation_remark = "excellent"
where artworkNo = 1;