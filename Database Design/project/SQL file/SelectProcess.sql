 -- 查询数据
 
 
 
-- (a) 查询指定教师对应的课程(class)
SELECT
	a.staff_name,
	b.*
FROM
	staff_info a
	INNER JOIN class_section_info b ON b.instructor = a.staffNo
WHERE
	b.instructor = "t0003"
	and a.staff_status = "1";
 
 
 
-- (b) 查询注册表的学生人数
SELECT
	COUNT( DISTINCT a.studentNo ) AS total_enroll_student 
FROM
	student_course_registration a
	INNER JOIN student_info b ON b.studentNo = a.studentNo 
WHERE
	a.enroll_date > "2023-09-01 00:00:00" 
	AND student_status = "1";
 
 
 
-- (c) 查询作品表 
SELECT
	d.student_fName AS artist_fName,
	d.student_lName AS artist_lName,
	a.artwork_created_time AS created_time,
	a.artwork_submitted_time AS submitted_time,
	a.artwork_format AS format,
	a.artwork_subject AS theme,
	a.artwork_used_medium AS used_medium,
	e.staff_fName AS instructor_fName,
	e.staff_lName AS instructor_lName,
	c.course_name AS course,
	b.assignment AS assignment 
FROM
	artwork_info a
	INNER JOIN class_section_info b ON a.associated_section = b.sectionNO
	INNER JOIN course_info c ON b.associated_course = c.courseNo
	INNER JOIN student_info d ON a.artist = d.studentNo
	INNER JOIN staff_info e ON a.instructor = e.staffNo
WHERE
	a.artist = "p2211001";
	

 
-- (d) 查询教师和学生的信息
SELECT
	staffNo,
	staff_fName,
	staff_lName,
	staff_sex,
	staff_phone,
	staff_email,
	staff_address,
	staff_expertise 
FROM
	staff_info 
WHERE
	staff_status = "1" 
	AND staffNo = "t0001";
 
SELECT
	studentNo,
	student_fName,
	student_lName,
	student_sex,
	student_phone,
	student_email,
	student_address,
FROM
	student_info 
WHERE
	student_status = "1"
	AND studentNo = "p2211002";
	 
	
	
-- (e) 查询评价表
SELECT
	a.artworkNo,
	d.student_fName AS artist_fName,
	d.student_lName AS artist_lName,
	a.artwork_subject AS theme,
	e.staff_fName AS instructor_fName,
	e.staff_lName AS instructor_lName,
	c.course_name AS course,
	b.assignment AS assignment,
	a.evaluation_grade AS grade,
	a.evaluation_written_date AS written_date,
	a.evaluation_remark AS remark
FROM
	artwork_info a
	INNER JOIN class_section_info b ON a.associated_section = b.sectionNo
	INNER JOIN course_info c ON b.associated_course = c.courseNo
	INNER JOIN student_info d ON a.artist = d.studentNo
	INNER JOIN staff_info e ON a.instructor = e.staffNo
WHERE
	a.artist = "p2211001"
	AND a.evaluation_written_date IS NOT Null;
	
	
	
-- (f) 查询课程材料表和关联课程
SELECT
	c.course_name,
	a.document_topic,
	a.document_title,
	a.document_author,
	a.created_time,
	a.modified_time 
FROM
	course_material_info a
	INNER JOIN class_section_info b ON a.associated_section = b.sectionNo
	INNER JOIN course_info c ON c.courseNo = b.associated_course
WHERE
	a.document_id = "document-0001";
	
-- (g) 查询课程
SELECT
	b.student_fName AS student_fName,
	b.student_lName AS student_lName,
	d.course_name,
	c.section_course_day,
	c.section_course_time,
	c.section_course_duration,
	e.staff_fName,
	e.staff_lName,
	c.assignment,
	c.section_semester,
	c.section_year
FROM
	student_course_registration a
	INNER JOIN student_info b ON b.studentNo = a.studentNo
	INNER JOIN class_section_info c ON c.sectionNo = a.sectionNo
	INNER JOIN course_info d ON c.associated_course = d.courseNo
	INNER JOIN staff_info e ON c.instructor = e.staffNo
WHERE 
	a.studentNo = "p2211001"
	AND a.enroll_date > "2023-09-01 00:00:00"
	AND d.course_name = "Painting";