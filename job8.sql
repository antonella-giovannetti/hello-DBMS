-- Créez la base de données SomeCompany à l’aide d’une requête, ajoutez une condition sur l'existence de SomeCompany.
CREATE DATABASE IF NOT EXISTS somecompany

-- 2. Créez la table Employees.
CREATE TABLE employees(
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    birthdate DATE,
    position VARCHAR(255),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 3. Créez la table Departments.
CREATE TABLE departments(
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(255),
    department_head INT,
    location VARCHAR(255),
    FOREIGN KEY (department_head) REFERENCES employees(employee_id)
);

-- 4. Insérez 6 à 9 nouveaux employés dans la table Employees.
INSERT INTO employees (first_name, last_name, birthdate, position, department_id)
VALUES 
("John", "Doe", "1990-05-15", "Software Engineer", 1 ),
("Jane", "Smith", "1985-08-20", "Project
Manager", 2),
("Mike", "Johnson", "1992-03-10", "Data Analyst", 1),
("Emily", "Brown", "1988-12-03", "UX Designer", 1),
("Alex", "Williams", "1995-06-28", "Software
Developer", 1),
("Sarah", "Miller", "1987-09-18", "HR Specialist", 3),
("Ethan", "Clark", "1991-02-14", "Database
Administrator", 1),
("Olivia", "Garcia", "1984-07-22", "Marketing
Manager", 2),
("Emilia", "Clark", "1986-01-12", "HR Manager", 3),
("Daniel", "Taylor", "1993-11-05", "Systems
Analyst", 1),
("William", "Lee", "1994-08-15", "Software
Engineer", 1),
("Sophia", "Baker", "1990-06-25", "IT Manager", 2);

-- 5. Récupérez le nom et le poste de tous les employés.
SELECT first_name, last_name, position FROM employees;

-- 6. Mettez à jour le poste d’un employé dans la table Employees.
UPDATE employees SET position = "Software Engineer" WHERE employee_id = 1;

-- 7. Supprimez un employé de la table Employees.
DELETE FROM employees WHERE employee_id = 1;

-- 8. Affichez le nom, le département et le bureau de chaque employé.
SELECT first_name, last_name, department_name, location FROM employees INNER JOIN departments ON employees.department_id = departments.department_id;

-- 9. Affichez, à l’aide d’un filtre, les membres de l’équipe IT, puis le management, puis les ressources humaines.
SELECT first_name, last_name, department_name, location FROM employees INNER JOIN departments ON employees.department_id = departments.department_id WHERE department_name = "IT";

SELECT first_name, last_name, department_name, location FROM employees INNER JOIN departments ON employees.department_id = departments.department_id WHERE department_name = "Project Management";

SELECT first_name, last_name, department_name, location FROM employees INNER JOIN departments ON employees.department_id = departments.department_id WHERE department_name = "Human Resources";

-- 10. Affichez les départements de SomeCompany dans l’ordre alphabétique, avec les managers respectifs de chaque département.
SELECT department_name, first_name, last_name FROM departments INNER JOIN employees ON departments.department_head = employees.employee_id ORDER BY department_name;

-- 11. Ajoutez un nouveau département à la table Department (Marketing peut-être?), ajoutez ou mettez à jour les employés de ce nouveau département.
INSERT INTO departments (department_name, department_head, location) VALUES ("Marketing", 8, "Paris");

-- 12.Créez une nouvelle table Project : project_id (INT, PK), project_name (VARCHAR), start_date (DATE), end_date (DATE), departement_id (INT, FK). Ajoutez des observations à cette nouvelle table, analysez la productivité des départements en IT et du nouveau département créé précédemment.
CREATE TABLE Projects(
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(255),
    start_date DATE,
    end_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Projects (project_name, start_date, end_date, department_id) VALUES ("Project 1", "2020-01-01", "2020-02-01", 1),
("Project 2", "2020-02-01", "2020-03-01", 1),
("Project 3", "2020-03-01", "2020-04-01", 1),
("Project 4", "2020-04-01", "2020-05-01", 1),
("Project 5", "2020-05-01", "2020-06-01", 1),
("Project 6", "2020-06-01", "2020-07-01", 1),
("Project 7", "2020-07-01", "2020-08-01", 1),
("Project 8", "2020-08-01", "2020-09-01", 1),
("Project 9", "2020-09-01", "2020-10-01", 1),
("Project 10", "2020-10-01", "2020-11-01", 1),
("Project 11", "2020-11-01", "2020-12-01", 1),
("Project 12", "2020-12-01", "2021-01-01", 1),
("Project 13", "2021-01-01", "2021-02-01", 1),
("Project 14", "2021-02-01", "2021-03-01", 1),
("Project 15", "2021-03-01", "2021-04-01", 1),
("Project 16", "2021-04-01", "2021-05-01", 1),
("Project 17", "2021-05-01", "2021-06-01", 1),
("Project 18", "2021-06-01", "2021-07-01", 1),
("Project 19", "2021-07-01", "2021-08-01", 1);

