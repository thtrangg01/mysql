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
    CreateDate   datetime
);

create table `Group` -- một số từ đặc biệt phải cho vào `` dưới nút esc  //trùng syntax mysql za zị
(
    GroupID     INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    GroupName   varchar(24) not null,
    CreatorID   int,
    CreatorDate datetime
);

create table GroupAccount
(
    GroupID   int,
    AccountID int,
    JoinDate  datetime,
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
    CreatorDate datetime
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
    CreatorDate datetime
);

create table ExamQuestion
(
    ExamID     int references Exam (ExamID),
    QuestionID int references Question (QuestionID),
    primary key (ExamID, QuestionID)

);

# ok