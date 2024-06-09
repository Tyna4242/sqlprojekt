CREATE TABLE trainer (
  trainer_id INTEGER PRIMARY KEY,
  name VARCHAR(20)
);

CREATE TABLE course (
  course_id INTEGER PRIMARY KEY,
  nazev_predmetu VARCHAR(20) UNIQUE,
  sign_up_students INTEGER,
  trainer_id INTEGER,
  FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id)
);

CREATE TABLE student (
  student_id INTEGER PRIMARY KEY,
  name VARCHAR(20),
  num_of_courses INTEGER
);

CREATE TABLE student_course_signup (
  student_id INTEGER,
  course_id INTEGER,
  FOREIGN KEY (student_id) REFERENCES student(student_id),
  FOREIGN KEY (course_id) REFERENCES course(course_id)
);
