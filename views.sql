CREATE VIEW courses_with_most_signed_up_students AS
SELECT nazev_predmetu, sign_up_students
FROM course
ORDER BY sign_up_students DESC
LIMIT 5;

CREATE VIEW report_all_data AS
SELECT student.student_id, student.name AS student_name, course.course_id, course.nazev_predmetu, course.sign_up_students, trainer.name AS trainer
FROM student
INNER JOIN student_course_signup ON student.student_id = student_course_signup.student_id
INNER JOIN course ON student_course_signup.course_id = course.course_id
INNER JOIN trainer ON course.trainer_id = trainer.trainer_id;

CREATE VIEW trainers_teaching_atleast_2_courses AS
SELECT trainer.name, COUNT(course.course_id) AS num_of_courses
FROM trainer
INNER JOIN course ON trainer.trainer_id = course.trainer_id
GROUP BY trainer.name
HAVING COUNT(course.course_id) >= 2;

CREATE VIEW trainers_with_highest_student_outreach AS
SELECT trainer.name, SUM(course.sign_up_students) AS total_students
FROM trainer
INNER JOIN course ON trainer.trainer_id = course.trainer_id
GROUP BY trainer.name
ORDER BY total_students DESC
LIMIT 3;
