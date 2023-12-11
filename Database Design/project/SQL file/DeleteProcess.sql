-- 删除、更新操作


-- 更新、删除教师
UPDATE staff_info 
SET staff_phone = "",
staff_address = "Macau",
staff_email = "12345@qq.com",
staff_expertise = "" 
WHERE
	staffNo = "t0001";

UPDATE staff_info 
SET staff_status = "0" 
WHERE
	staffNo = "t0001";
	
	
-- 更新、删除学生
UPDATE student_info 
SET student_phone = "",
student_address = "Macau",
student_email = "23456@qq.com",
WHERE
	staffNo = "p2211001";

UPDATE student_info 
SET student_status = "0" 
WHERE
	studentNo = "p2211001";


-- 更新、删除课程
UPDATE course_info
SET course_name = "",
course_dsc = "",
course_pre = ""
WHERE 
	courseNo = "";

-- 更新、删除课表
DELETE 
FROM
	class_section_info 
WHERE
	sectionNo = "section-0002";

-- 更新、删除课程材料
UPDATE course_material_info
SET document_title = "T1",
document_topic = "sketch"
WHERE
	document_id = "D0001";

-- 更新、删除作品、评价
UPDATE artwork_info
SET artist = "",
	artwork_format = ""
WHERE
	artworkNo = "001"

UPDATE artwork_info
SET evaluation_grade = "A",
	evaluation = "Good"
WHERE
	artworkNo = "001";

DELETE
FROM 
	artwork_info
	WHERE
		artworkNo = "001";