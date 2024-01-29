create table Employee (
    no number(20) not null,
    ID varchar2(500) unique not null,
    PW varchar2(500) not null,
    Name varchar2(200) not null,
    Position varchar2(200) not null,
    Phone varchar2(50) not null,
    Call varchar2(50) not null,
    Email varchar2(2000) not null,
    Gender varchar2(200) not null,
    Birth varchar2(200) not null,
    DeptName varchar2(100) not null,
    DeptNo number(4) not null,
    HireDate varchar2(200) not null,
    ExitDate varchar2(200),
    Status varchar2(20) not null,
    Photo varchar2(2000),
    CONSTRAINT Employee_pk primary key(no)
    );
    
create table commute(
    Intimedate Timestamp,
    OutTime Timestamp ,
    no number(20) not null);
    
create sequence empNo_seq
increment by 1
start WITH 1 
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE SEQ_BOARD;

CREATE TABLE TBL_BOARD(
	BNO NUMBER(10),
	TITLE VARCHAR2(1000) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	DEPTNAME VARCHAR2(20) NOT NULL,
	NAME VARCHAR2(1000) NOT NULL,
	REGDATE DATE DEFAULT SYSDATE,
	UPDATEDATE DATE DEFAULT SYSDATE,
	CONSTRAINT PK_BOARD PRIMARY KEY(BNO)
);

CREATE TABLE TBL_FILE(
	UUID VARCHAR2(1000) CONSTRAINT PK_FILE PRIMARY KEY,
	UPLOAD_PATH VARCHAR2(1000),
	FILE_NAME VARCHAR2(1000),
	FILE_TYPE CHAR(1),
	BNO NUMBER(10),
	CONSTRAINT FK_FILE FOREIGN KEY(BNO) REFERENCES TBL_BOARD(BNO)
);

CREATE SEQUENCE SEQ_REPLY;

CREATE TABLE TBL_REPLY(
	RNO NUMBER(10),
	BNO NUMBER(10),
	REPLY VARCHAR2(1000),
	REPLIER VARCHAR2(500),
	REPLYDATE DATE DEFAULT SYSDATE,
	UPDATEDATE DATE DEFAULT SYSDATE,
	CONSTRAINT PK_REPLY PRIMARY KEY(RNO),
	CONSTRAINT FK_REPLY_BOARD FOREIGN KEY(BNO)
	REFERENCES TBL_BOARD(BNO)
);

CREATE TABLE dayOffInfo(
no number(20) not null,
Total int DEFAULT 0,
Remind int DEFAULT 0,
UsedTotal int DEFAULT 0
);

create table approval(
    NO integer,
    startDept varchar2(1000),
    endDept varchar2(1000),
    replyDept varchar2(1000),
    writer varchar2(1000),
    writerNo integer,
    writerReply varchar2(1000),
    writerReplyNo integer,
    form varchar2(1000),
    title varchar2(1000),
    content varchar2(1000),
    state varchar2(1000),
    writeDay VARCHAR2(1000),
    appNo1 integer,
    appName1 varchar2(1000),
    appDept1 varchar2(1000),
    appState1 varchar2(1000),
    appDay1 VARCHAR2(1000),
    appNo2 integer,
    appName2 varchar2(1000),
    appDept2 varchar2(1000),
    appState2 varchar2(1000),
    appDay2 VARCHAR2(1000),
    appNo3 integer,
    appName3 varchar2(1000),
    appDept3 varchar2(1000),
    appState3 varchar2(1000),
    appDay3 VARCHAR2(1000),
    refNo1 integer,
    refName1 varchar2(1000),
    refDept1 varchar2(1000),
    refNo2 integer,
    refName2 varchar2(1000),
    refDept2 varchar2(1000), 
    updateDay VARCHAR2(20),
    temp varchar2(1000),
    SendReceive varchar2(1000),
    originNo integer, 
    groupOrd integer DEFAULT 0,
    titleReply varchar2(1000),
    contentReply varchar2(1000),
   yearUseDays varchar2(1000),
   yearUseDateStart varchar2(1000),
   yearUseDateEnd varchar2(1000),
   yearAmPm varchar2(1000),
   yearReason varchar2(1000)
);

CREATE TABLE calendar (
    no INTEGER,
    title VARCHAR(50) NOT NULL,
    startday VARCHAR2(16),
    endday VARCHAR2(16),
    allday integer,
    content VARCHAR2(1000),
    location VARCHAR2(50),
    attendee VARCHAR2(50),
    repeat VARCHAR2(10),
    privacy VARCHAR2(10),
    color VARCHAR2(20),
    writer VARCHAR2(20),
    emp_no NUMBER(10)
);

CREATE OR REPLACE TRIGGER calendar_trigger
BEFORE INSERT ON calendar
FOR EACH ROW
BEGIN
    SELECT cal_seq.NEXTVAL INTO :new.no FROM dual;
END;

create sequence cal_seq
increment by 1
start WITH 1 
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE
NOORDER;

create sequence app_seq
increment by 1
start WITH 1 
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE
NOORDER;

CREATE OR REPLACE TRIGGER approval_trigger
BEFORE INSERT ON approval
FOR EACH ROW
BEGIN
    SELECT app_seq.NEXTVAL INTO :new.no FROM dual;
END;

insert into employee(no, id, pw, name, position, phone, call, email, gender, birth, deptname, deptno, hiredate, status)
values (empNo_seq.NEXTVAL, 'admin', 'admin', 'admin', '사원', '010-2222-2222', '02-1111-2222', 'admin@admin.com', 'admin', '2023-01-01', '관리자', '1', '2023-01-01' ,'재직');

insert into employee(no, id, pw, name, position, phone, call, email, gender, birth, deptname, deptno, hiredate, status)
values (empNo_seq.NEXTVAL, '1111', '1111', '한주연', '사원', '010-2222-2222', '02-1111-2222', 'test@test.com', '여성', '2023-01-01', '제품개발부', '0', '2023-01-01' ,'재직');

SELECT * FROM APPROVAL;