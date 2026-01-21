USE university;

-- 1️⃣ Studenti nati nel 1990
SELECT *
FROM students
WHERE YEAR(date_of_birth) = 1990;

-- 2️⃣ Corsi con più di 10 crediti
SELECT *
FROM courses
WHERE cfu > 10;

-- 3️⃣ Studenti con più di 30 anni
SELECT *
FROM students
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 30;

-- 4️⃣ Corsi del primo semestre del primo anno
SELECT *
FROM courses
WHERE year = 1
  AND period = 'I semestre';

-- 5️⃣ Appelli del 20/06/2020 dopo le 14
SELECT *
FROM exams
WHERE date = '2020-06-20'
  AND hour > '14:00:00';

-- 6️⃣ Corsi di laurea magistrale
SELECT *
FROM degrees
WHERE level = 'magistrale';

-- 7️⃣ Numero di dipartimenti
SELECT COUNT(*) AS numero_dipartimenti
FROM departments;

-- 8️⃣ Insegnanti senza numero di telefono
SELECT COUNT(*) AS insegnanti_senza_telefono
FROM teachers
WHERE phone IS NULL;