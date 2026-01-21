USE university;

-- 1️⃣ Studenti iscritti al Corso di Laurea in Economia
SELECT s.*
FROM students s
JOIN degrees d ON s.degree_id = d.id
WHERE d.name = 'Economia';

-- 2️⃣ Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT d.*
FROM degrees d
JOIN departments dep ON d.department_id = dep.id
WHERE d.level = 'magistrale'
  AND dep.name = 'Neuroscienze';

-- 3️⃣ Corsi in cui insegna Fulvio Amato (id=44)
SELECT c.*
FROM courses c
JOIN courses_teachers ct ON c.id = ct.course_id
WHERE ct.teacher_id = 44;

-- 4️⃣ Tutti gli studenti con il corso di laurea e il dipartimento, ordinati per cognome e nome
SELECT s.*, d.name AS degree_name, dep.name AS department_name
FROM students s
JOIN degrees d ON s.degree_id = d.id
JOIN departments dep ON d.department_id = dep.id
ORDER BY s.last_name, s.first_name;

-- 5️⃣ Tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT d.name AS degree_name, c.name AS course_name, t.first_name, t.last_name
FROM degrees d
JOIN courses c ON c.degree_id = d.id
JOIN courses_teachers ct ON ct.course_id = c.id
JOIN teachers t ON t.id = ct.teacher_id
ORDER BY d.name, c.name, t.last_name;

-- 6️⃣ Tutti i docenti che insegnano nel Dipartimento di Matematica (id=54)
SELECT DISTINCT t.*
FROM teachers t
JOIN courses_teachers ct ON t.id = ct.teacher_id
JOIN courses c ON c.id = ct.course_id
JOIN degrees d ON d.id = c.degree_id
WHERE d.department_id = 54;

-- 7️⃣ BONUS: per ogni studente, quanti tentativi d’esame ha sostenuto per ciascuno dei suoi esami
SELECT s.id AS student_id, s.first_name, s.last_name,
       c.name AS course_name,
       COUNT(es.exam_id) AS exam_attempts
FROM students s
JOIN exam_student es ON s.id = es.student_id
JOIN exams e ON e.id = es.exam_id
JOIN courses c ON c.id = e.course_id
GROUP BY s.id, c.id
ORDER BY s.last_name, s.first_name, c.name;