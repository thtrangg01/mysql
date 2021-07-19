-- TS1--
drop database if exists assignment;
create database assignment;
use assignment;

create table Department
(
    DepartmentID   INT PRIMARY KEY AUTO_INCREMENT, -- để các id là auto_increment
    DepartmentName varchar(24) not null
);

create table Position
(
    PositionID   INT PRIMARY KEY AUTO_INCREMENT, -- primary key -> auto not null :< uaj thees k dc a, hay bỏ cái auto đi
    PositionName varchar(12) not null
);
# crt + alt + L = auto_format hỏi chấm ?
create table `Account`
(
    AccountID    INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Email        varchar(20),
    Username     varchar(12) not null,
    FullName     varchar(24) not null,
    DepartmentID int references Department (DepartmentID),
    PositionID   int references Position (PositionID),
    CreateDate   date
);

create table `Group` -- một số từ đặc biệt phải cho vào `` dưới nút esc  //trùng syntax mysql za zị
(
    GroupID     INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    GroupName   varchar(24) not null,
    CreatorID   int,
    CreatorDate date
);

create table GroupAccount
(
    GroupID   int,
    AccountID int,
    JoinDate  date,
    primary key (GroupID, AccountID)
);

create table TypeQuestion
(
    TypeID   INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    TypeName varchar(12)
);

create table CategoryQuestion
(
    CategoryID   INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CategoryName varchar(12)
);

create table Question
(
    QuestionID  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Content     text,
    CategoryID  int references CategoryQuestion (CategoryID),
    TypeID      int references TypeQuestion (TypeID),
    CreatorID   int,
    CreatorDate date
);

create table Answer
(
    AnswerID   INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Content    text,
    QuestionID int references Question (QuestionID),
    isCorrect  bit
);

create table Exam
(
    ExamID      INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Code        varchar(10),
    Title       text,
    CategoryID  int,
    Duration    time, -- duration để  int sau này dễ so sánh
    CreatorID   int,
    CreatorDate date
);

create table ExamQuestion
(
    ExamID     int references Exam (ExamID),
    QuestionID int references Question (QuestionID),
    primary key (ExamID, QuestionID)

);

-- TS2 --

ALTER TABLE Department AUTO_INCREMENT = 100;
insert into Department(DepartmentName)
values ('Sale'),
       ('Marketing'),
       ('Ki thuat'),
       ('Nhan su'),
       ('Tai chinh');

ALTER TABLE Position AUTO_INCREMENT = 100;
insert into Position(PositionName)
values ('Truong phong'),
       ('Thu ky'),
       ('Pho phong'),
       ('Nhan vien'),
       ('Quan ly');

ALTER TABLE Account AUTO_INCREMENT = 100;
insert into Account(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
values ('nva@gmail.com','nva', 'Nguyen Van A', 'De001', 'Po001', '2020-09-22'),
       ('nvb@gmail.com','nvb', 'Nguyen Van B', 'De002', 'Po002', '2020-10-22'),
       ('nvc@gmail.com','nvc', 'Nguyen Van C', 'De003', 'Po003', '2020-11-22'),
       ('nvd@gmail.com','nvd', 'Nguyen Van D', 'De004', 'Po004', '2020-12-22'),
       ('nve@gmail.com','nve', 'Nguyen Van E', 'De005', 'Po005', '2021-01-22');

ALTER TABLE `Group` AUTO_INCREMENT = 100;
insert into `Group`(GroupName, CreatorID, CreatorDate)
values ('Nhom 01', 'ID001', '2020-08-15'),
       ('Nhom 02', 'ID002', '2020-09-15'),
       ('Nhom 03', 'ID003', '2020-10-15'),
       ('Nhom 04', 'ID004', '2020-11-15'),
       ('Nhom 05', 'ID005', '2020-12-15');

insert into GroupAccount(GroupID, AccountID, JoinDate)
values ('G001','U001', '2021-01-02'),
       ('G002','U002', '2021-02-02'),
       ('G003','U003', '2021-03-03'),
       ('G004','U004', '2021-05-02'),
       ('G005','U005', '2021-04-10');

ALTER TABLE TypeQuestion AUTO_INCREMENT = 100;
insert into TypeQuestion(TypeName)
values ('Essay'),
       ('Multiple-Choice'),
       ('Fill in blanks'),
       ('yes/no questions'),
       ('Short-Answer');

ALTER TABLE CategoryQuestion AUTO_INCREMENT = 100;
insert into CategoryQuestion(CategoryName)
values ('Java'),
       ('.NET'),
       ('SQL'),
       ('Python'),
       ('C++');

ALTER TABLE Question AUTO_INCREMENT = 100;
insert into Question(Content, CreatorID, CreatorDate)
values ('Noi dung 1', 'User01', '2020-12-12'),
       ('Noi dung 2', 'User01', '2020-12-12'),
       ('Noi dung 3', 'User02', '2020-11-12'),
       ('Noi dung 4', 'User03', '2021-05-12'),
       ('Noi dung 5', 'User04', '2021-06-12');

ALTER TABLE Answer AUTO_INCREMENT = 100;
insert into Answer(Content, isCorrect)
values ('Cau tra loi 1', '0'),
       ('Cau tra loi 2', '1'),
       ('Cau tra loi 3', '0'),
       ('Cau tra loi 4', '1'),
       ('Cau tra loi 5', '0');

ALTER TABLE Exam AUTO_INCREMENT = 100;
insert into Exam(Code, Title, CategoryID, Duration, CreatorID, CreatorDate)
values ('Code001', 'Titile 01', 'Cat001' ,'120', 'Ctor001', '2021-01-02'),
       ('Code002', 'Titile 02', 'Cat002' ,'90', 'Ctor002', '2021-01-02'),
       ('Code003', 'Titile 03', 'Cat003' ,'90', 'Ctor003', '2021-01-02'),
       ('Code004', 'Titile 04', 'Cat004' ,'60', 'Ctor004', '2021-05-22'),
       ('Code005', 'Titile 05', 'Cat005' ,'120', 'Ctor005', '2021-06-20');

ALTER TABLE Exam AUTO_INCREMENT = 100;
insert into ExamQuestion(ExamID)
values ('Exam001'),
       ('Exam002'),
       ('Exam003'),
       ('Exam004'),
       ('Exam005');
# sdhfkds