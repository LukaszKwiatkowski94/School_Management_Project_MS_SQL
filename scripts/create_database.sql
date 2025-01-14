CREATE DATABASE SchoolManagement;
GO
USE SchoolManagement;
GO

CREATE TABLE SchoolYears (
    SchoolYearID INT IDENTITY PRIMARY KEY,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    CONSTRAINT chk_schoolyear_dates CHECK (StartDate < EndDate)
);

CREATE TABLE Classes (
    ClassID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    SchoolYearID INT NOT NULL,
    FOREIGN KEY (SchoolYearID) REFERENCES SchoolYears(SchoolYearID)
);

CREATE TABLE Students (
    StudentID INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL
);

CREATE TABLE Teachers (
    TeacherID INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL
);

CREATE TABLE Specializations (
    SpecializationID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Description NVARCHAR(MAX)
);

CREATE TABLE TeacherSpecializations (
    TeacherSpecializationID INT IDENTITY PRIMARY KEY,
    TeacherID INT NOT NULL,
    SpecializationID INT NOT NULL,
    DateAcquired DATE NOT NULL,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
    FOREIGN KEY (SpecializationID) REFERENCES Specializations(SpecializationID),
    UNIQUE (TeacherID, SpecializationID)
);

CREATE TABLE Subjects (
    SubjectID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Code NVARCHAR(10) UNIQUE NOT NULL,
    Description NVARCHAR(MAX),
    IsMandatory BIT NOT NULL,
    IsActive BIT NOT NULL
);

CREATE TABLE ClassAssignments (
    AssignmentID INT IDENTITY PRIMARY KEY,
    ClassID INT NOT NULL,
    StudentID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    Comment NVARCHAR(MAX) NULL,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE ClassSubjectAssignments (
    AssignmentID INT IDENTITY PRIMARY KEY,
    ClassID INT NOT NULL,
    SubjectID INT NOT NULL,
    TeacherID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

CREATE TABLE Class_Homeroom_Teachers (
    AssignmentID INT IDENTITY PRIMARY KEY,
    ClassID INT NOT NULL,
    TeacherID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    IsSubstitute BIT NOT NULL,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

CREATE TABLE ContactTypes (
    ContactTypeID INT IDENTITY PRIMARY KEY,
    TypeName NVARCHAR(50) NOT NULL
);

CREATE TABLE Contacts (
    ContactID INT IDENTITY PRIMARY KEY,
    ObjectKey NVARCHAR(50) NOT NULL,
    ObjectID INT NOT NULL,
    ContactTypeID INT NOT NULL,
    ContactValue NVARCHAR(255) NOT NULL,
    Comment NVARCHAR(MAX) NULL,
    FOREIGN KEY (ContactTypeID) REFERENCES ContactTypes(ContactTypeID)
);

CREATE TABLE GradeTypes (
    GradeTypeID INT IDENTITY PRIMARY KEY,
    TypeName NVARCHAR(50) NOT NULL,
    Weight DECIMAL(3, 2) NOT NULL
);

CREATE TABLE Grades (
    GradeID INT IDENTITY PRIMARY KEY,
    StudentID INT NOT NULL,
    ClassSubjectAssignmentID INT NOT NULL,
    TeacherID INT NOT NULL,
    GradeValue DECIMAL(3, 2) NOT NULL,
    GradeTypeID INT NOT NULL,
    DateAwarded DATE NOT NULL,
    ImprovementOfGradeID INT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassSubjectAssignmentID) REFERENCES ClassSubjectAssignments(AssignmentID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
    FOREIGN KEY (GradeTypeID) REFERENCES GradeTypes(GradeTypeID),
    FOREIGN KEY (ImprovementOfGradeID) REFERENCES Grades(GradeID)
);

CREATE TABLE Attendance (
    AttendanceID INT IDENTITY PRIMARY KEY,
    StudentID INT NOT NULL,
    ClassSubjectAssignmentID INT NOT NULL,
    TeacherID INT NOT NULL,
    Date DATE NOT NULL,
    Status NVARCHAR(10) NOT NULL,
    Comment NVARCHAR(MAX) NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassSubjectAssignmentID) REFERENCES ClassSubjectAssignments(AssignmentID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

CREATE TABLE JustificationTypes (
    JustificationTypeID INT IDENTITY PRIMARY KEY,
    TypeName NVARCHAR(50) NOT NULL
);

CREATE TABLE AttendanceJustifications (
    JustificationID INT IDENTITY PRIMARY KEY,
    AttendanceID INT NOT NULL,
    JustificationTypeID INT NOT NULL,
    DateSubmitted DATE NOT NULL,
    Comment NVARCHAR(MAX) NULL,
    FOREIGN KEY (AttendanceID) REFERENCES Attendance(AttendanceID),
    FOREIGN KEY (JustificationTypeID) REFERENCES JustificationTypes(JustificationTypeID)
);

CREATE TABLE Rooms (
    RoomID INT IDENTITY PRIMARY KEY,
    RoomName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(MAX)
);

CREATE TABLE Schedules (
    ScheduleID INT IDENTITY PRIMARY KEY,
    ClassSubjectAssignmentID INT NOT NULL,
    DayOfWeek INT NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    Room INT NULL,
    Fraction NVARCHAR(10) NULL,
	FOREIGN KEY (Room) REFERENCES Rooms(RoomID)
    FOREIGN KEY (ClassSubjectAssignmentID) REFERENCES ClassSubjectAssignments(AssignmentID)
);
