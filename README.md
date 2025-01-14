# School Management Database

## 📚 Project Overview

This project showcases a **School Management Database** built using **MSSQL**. It is a fully normalized, relational database designed to manage key aspects of a school's operations, including students, teachers, classes, subjects, schedules, grades, attendance, and more. This repository serves as a comprehensive demonstration of database design, implementation, and management skills.

---

## 🛠️ Features

- **Dynamic class assignments:** Track students' class assignments over time, including historical data.
- **Flexible teacher management:** Handle multiple specializations, class schedules, and substitution scenarios.
- **Attendance tracking:** Monitor attendance and handle justifications.
- **Grade management:** Track grades with support for improvements, weighted evaluations, and grade types.
- **Extensible design:** Includes dictionaries for contact types, justification types, and room management.
- **Historical integrity:** Maintains data consistency and historical accuracy for school years, teacher assignments, and more.

---

## 🗂️ Database Structure

The database includes **19 tables**, each designed to manage a specific aspect of school operations:

| #   | Table Name                  | Description                                           |
|-----|-----------------------------|-------------------------------------------------------|
| 1   | `SchoolYears`              | Tracks school years with start and end dates.         |
| 2   | `Classes`                  | Defines individual classes for each school year.      |
| 3   | `Students`                 | Stores student details.                              |
| 4   | `Teachers`                 | Stores teacher details.                              |
| 5   | `Specializations`          | Stores specialization details.                       |
| 6   | `TeacherSpecializations`   | Tracks teacher specializations over time.            |
| 7   | `Subjects`                 | Defines subjects, including mandatory and optional.  |
| 8   | `ClassAssignments`         | Tracks students' class assignments.                  |
| 9   | `ClassSubjectAssignments`  | Manages the relationship between classes, subjects, and teachers. |
| 10  | `Class_Homeroom_Teachers`  | Tracks class homeroom teacher assignments.           |
| 11  | `Contacts`                 | Stores contact details for students, teachers, and parents. |
| 12  | `ContactTypes`             | Defines types of contacts, e.g., phone or email.     |
| 13  | `Grades`                   | Stores grades assigned to students.                  |
| 14  | `GradeTypes`               | Defines types and weights of grades.                 |
| 15  | `Attendance`               | Tracks student attendance.                           |
| 16  | `AttendanceJustifications` | Tracks justifications for absences.                  |
| 17  | `JustificationTypes`       | Defines types of justifications.                     |
| 18  | `Rooms`                    | Manages room assignments for classes.                |
| 19  | `Schedules`                | Tracks schedules for classes and subjects.           |

### Entity-Relationship Diagram (ERD)
TO DO DIAGRAM

---

## 📦 Project Components

1. **Database Script (`create_database.sql`)**
   - Full DDL script to create all tables, constraints, and relationships.

2. **Sample Data (`insert_sample_data.sql`)**
   - Example dataset for testing and demonstration purposes.

3. **Stored Procedures (`stored_procedures.sql`)**
   - Common operations such as adding students, assigning grades, or tracking attendance.

4. **Queries (`queries.sql`)**
   - Ready-to-use SQL queries for common tasks like:
     - Retrieving a student's grades.
     - Listing all classes for a school year.
     - Viewing attendance records for a specific date.

5. **Documentation (`README.md`)**
   - Comprehensive documentation of the project.

---

## 📝 Installation and Usage

### Prerequisites
- **MSSQL**: Ensure you have MSSQL installed on your system.

### Steps to Set Up

TO DO ....

## 🛠️ Example Use Cases

TO DO ....

## 🌟 Highlights of the Design

- **Normalized Structure:** Avoids redundancy and ensures data consistency.
- **Historical Tracking:** Captures historical changes in class assignments, teacher roles, and more.
- **Scalability: Designed** to accommodate growing data with indexes and extensible structures.

## 🧑‍💻 Author
- Lukasz Kwiatkowski