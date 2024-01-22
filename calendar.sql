create table Employee (
    no number(10) not null,
    ID varchar2(50) unique not null,
    PW varchar2(50) not null,
    Name varchar2(20) not null,
    Position varchar2(20) not null,
    Phone varchar2(50) not null,
    Call varchar2(50) not null,
    Email varchar2(200) not null,
    Gender varchar2(20) not null,
    Birth varchar2(20) not null,
    DeptName varchar2(10) not null,
    DeptNo number(4) not null,
    HireDate date not null,
    ExitDate date,
    Photo BLob,
    CONSTRAINT Employee_pk primary key(no)
);

INSERT INTO employee VALUES (1, 'a', 'a', '홍길동', '회장', '010', '010', 'a@a', 'M', '1997', '총무부', '1', 
to_date('1997/11/7','YYYY/MM/DD'), 
to_date('2023/12/14','YYYY/MM/DD'), '2');

SELECT * FROM EMPLOYEE;

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

INSERT INTO calendar (title, startday, endday, allday, content, location, attendee, repeat, privacy, color, writer, emp_no)
values('할일title15',
to_date('2023-12-05'),
to_date('2023-12-05'), 
'true', 
'할일content15', 
'할일location15', 
'할일attendee', 
'year', 
'false', 
'blue', 
'홍길동', 
2
);

UPDATE CALENDAR SET NO = '2' WHERE title='할일title15';

SELECT no, title,
		SUBSTR(startday, 1, 10) || ' ' || SUBSTR(startday, 12, 5) AS startday,
		SUBSTR(endday, 1, 10) || ' ' || SUBSTR(endday, 12, 5) AS endday,
		allday,
		content,
		location,
		attendee,
		repeat,
		privacy,
		color,
		writer,
		emp_no
		FROM CALENDAR
		ORDER BY startday asc;

UPDATE CALENDAR SET title = '종일ㅋㅋ' WHERE NO = 89;

DELETE FROM CALENDAR WHERE no = 2;
	
DROP TABLE calendar;

create sequence cal_seq
increment by 1
start WITH 1 
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE
NOORDER;

DROP SEQUENCE cal_seq;

SELECT * FROM calendar;

--test

create table calendarr(
	id number primary key,
	groupId NUMBER,
	title varchar2(50),
	writer varchar2(50),
	content varchar2(1000),
	start1 date,
	end1 date,
	allDay number(1),
	textColor varchar(50),
	backgroundColor varchar2(50),
	borderColor varchar2(50)
);

INSERT INTO calendarr values(cal_seq.nextval,'2','할일title2','test',
'내용-content',to_date('2023/12/25','YYYY/MM/DD'),
to_date('2023/12/26','YYYY/MM/DD'),1,'yellow','navy','navy');

SELECT * FROM CALENDAR;

SELECT ID, TITLE,
		TO_char(START1, 'YYYY-MM-DD"T"HH24:MI:SS') START1,
		TO_char(END1, 'YYYY-MM-DD"T"HH24:MI:SS') END1,
		ALLDAY,
		TEXTCOLOR,
		BACKGROUNDCOLOR,
		BORDERCOLOR 
		FROM CALENDARR;
		
create table approval(
    NO integer,
    startDept varchar2(1000),
    endDept varchar2(1000),
    replyDept varchar2(1000),
    writer varchar2(1000),
    writerReply varchar2(1000),
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

insert into approval (NO, title, form) values (app_seq.nextval, '예시', '기안');

SELECT * FROM APPROVAL;

drop index approval_index;

CREATE INDEX approval_index ON approval(no);

SELECT * FROM APPROVAL;

SELECT  
	no, form, title, writer, to_date(writeday, 'yyyy-mm-dd hh24:mi:ss'), progress
FROM APPROVAL;

COMMIT;

create sequence app_seq
increment by 1
start WITH 1 
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE
NOORDER;

create sequence app_seq_ord
increment by 1
start WITH 1 
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE
NOORDER;

DROP SEQUENCE app_seq;
DROP TABLE approval;

insert into approval (no) values (app_seq.nextval);

CREATE OR REPLACE TRIGGER approval_trigger
BEFORE INSERT ON approval
FOR EACH ROW
BEGIN
    SELECT app_seq.NEXTVAL INTO :new.no FROM dual;
END;

CREATE TABLE emp {
	NO integer,
	name varchar2(20)
}

SELECT * FROM APPROVAL;

UPDATE approval
SET originNo = CASE
    WHEN originNo IS NULL THEN no
    ELSE originNo
END;

ALTER TABLE approval
ADD(content clob);

ALTER TABLE approval ADD (refNo1 integer, refNo2 integer);

ALTER TABLE APPROVAL DROP COLUMN yearUseDate;

ALTER TRIGGER approval_trigger DISABLE;

ALTER TABLE APPROVAL DROP COLUMN groupOrd;

INSERT INTO APPROVAL (originNo, groupOrd) value (NO, )

DELETE FROM approval WHERE temp = '임시저장';

CREATE INDEX app_indexx ON approval (no);

DROP INDEX app_index ON approval;

SELECT NO AS "원글번호", originNo AS "부모번호", groupOrd AS "자식순서", title FROM APPROVAL;

SELECT * FROM APPROVAL WHERE form = '연차';

COMMIT;

CREATE TABLE EMP (
	NO integer,
	empName varchar(1000),
	empDept varchar(1000),
	id varchar(1000),
	pw varchar(1000)
);

ALTER TABLE emp RENAME COLUMN empNo TO no;

create sequence emp_seq
increment by 1
start WITH 1 
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE
NOORDER;

drop sequence emp_seq;
DROP TABLE emp;

INSERT INTO emp VALUES (emp_seq.NEXTVAL, 'ㄷㅅ아무개', '개발2팀', '4', '4');

SELECT * FROM emp;

CREATE OR REPLACE TRIGGER emp_trigger
BEFORE INSERT ON emp
FOR EACH ROW
BEGIN
    SELECT emp_seq.NEXTVAL INTO :new.no FROM dual;
END;

create table employee (
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
    Photo BLob,
    CONSTRAINT Employee_pk primary key(no)
    );
   
DROP TABLE employee;

DROP SEQUENCE SEQ_BOARD;
DROP TABLE TBL_BOARD;

SELECT CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME, R_OWNER, R_TABLE_NAME
FROM ALL_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'R'
AND R_TABLE_NAME = 'TBL_BOARD';

SELECT * FROM TBL_BOARD;
CREATE SEQUENCE SEQ_BOARD;

CREATE TABLE TBL_BOARD(
	BNO NUMBER(10) PRIMARY KEY,
	TITLE VARCHAR2(1000) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	DEPTNAME VARCHAR2(20) NOT NULL,
	NAME VARCHAR2(1000) NOT NULL,
	REGDATE DATE DEFAULT SYSDATE,
	UPDATEDATE DATE DEFAULT SYSDATE
);

/*-------------------------------------------------------------------*/
CREATE TABLE TBL_BOARD(
	BNO NUMBER(10) PRIMARY KEY,
	TITLE VARCHAR2(1000) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	DEPTNAME VARCHAR2(20) NOT NULL,
	NAME VARCHAR2(1000) NOT NULL,
	REGDATE DATE DEFAULT SYSDATE,
	UPDATEDATE DATE DEFAULT SYSDATE
);

CREATE SEQUENCE SEQ_BOARD;

CREATE TABLE TBL_FILE(
	UUID VARCHAR2(1000) CONSTRAINT PK_FILE PRIMARY KEY,
	UPLOAD_PATH VARCHAR2(1000),
	FILE_NAME VARCHAR2(1000),
	FILE_TYPE CHAR(1),
	BNO NUMBER(10),
	CONSTRAINT FK_FILE FOREIGN KEY(BNO) REFERENCES TBL_BOARD(BNO) ON DELETE CASCADE
);
/*-------------------------------------------------------------------*/

ALTER TABLE TBL_FILE DROP CONSTRAINT FK_FILE;

ALTER TABLE TBL_FILE ADD CONSTRAINT FK_FILE FOREIGN KEY(BNO) REFERENCES TBL_BOARD(BNO)
ON DELETE CASCADE;

create table employee (
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
    Photo BLob,
    CONSTRAINT Employee_pk primary key(no)
);

SELECT * FROM TBL_FILE;
SELECT * FROM TBL_BOARD;

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
    Photo varchar(2000),
    CONSTRAINT Employee_pk primary key(no)
);
 SELECT * FROM employee WHERE DeptName = '인사부';

DROP TABLE Employee;

create sequence empNo_seq
increment by 1
start WITH 1 
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE
NOORDER;

insert into employee(no, id, pw, name, position, phone, call, email, gender, birth, deptname, deptno, hiredate, status)
values (empNo_seq.NEXTVAL, '1', '1', 'test', '사원', '010-2222-2222', '02-1111-2222', 'test@test.com', 'test', '2023-01-01', '관리자', '0', '2023-01-01' ,'재직');

insert into employee(no, id, pw, name, position, phone, call, email, gender, birth, deptname, deptno, hiredate, status)
values (empNo_seq.NEXTVAL, 'admin', 'admin1234', '테스트', '사원', '010-2222-2222', '02-1111-2222', 'test@test.com', 'test', '2023-01-01', '관리자', '0', '2023-01-01' ,'재직');

insert into employee(no, id, pw, name, position, phone, call, email, gender, birth, deptname, deptno, hiredate, status)
values (empNo_seq.NEXTVAL, '5', 'in1234', '닝닝', '사원', '010-2222-2222', '02-1111-2222', 'in@test.com', 'in', '2023-01-01', '회계부', '0', '2023-01-01' ,'재직');

create table commute(
    Intimedate Timestamp,
    OutTime Timestamp ,
    no number(20) not null);
   
SELECT * FROM commute;

SELECT max(rownum) AS max_num  FROM APPROVAL;

create table DayOffInfo(
no int not null,
Total int default 0,
Remind int default 0,
UsedTotal int default 0,
constraint fk_dayOffInfono foreign key(no) references Employee(no)
); 

create table DayOffList(
no int not null,
UseDate varchar2(10),
Kind INT,
Reason VARCHAR2(50),
constraint fk_dayOffListno foreign key(no) references Employee(no)
);

CREATE SEQUENCE SEQ_REPLY;
drop SEQUENCE SEQ_REPLY;

DROP TABLE TBL_REPLY;
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

DROP TABLE EMPLOYEE;
alter table APPROVAL  drop column contentReply;
alter table APPROVAL  add contentReply clob;
alter table approval add writerReplyNo integer;

SELECT * FROM APPROVAL;
SELECT * FROM EMPLOYEE;

select (CASE WHEN outtime IS null THEN null ELSE to_char(outTime-inTimeDate, 'YYYY-MM-DD HH24:MI:SS') END) as summary, no from commute;
select (CASE WHEN outtime IS null THEN null ELSE to_char(outTime-inTimeDate, 'HH24:MI') END) as summary from commute where no = 10;

commit;

SELECT table_name FROM all_tables;

DROP TABLE TBL_BOARD;
DROP TABLE TBL_REPLY;
DROP TABLE COMMUTE;
DROP TABLE DAYOFFINFO;
DROP TABLE DAYOFFLIST;
DROP TABLE EMP;
DROP TABLE TBL_FILE;
DROP TABLE EMPLOYEE;

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

alter table approval drop column yearUseDays;
alter table approval add yearUseDays float;

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

SELECT * FROM EMPLOYEE;
SELECT * FROM APPROVAL;

create table commute(
    Intimedate Timestamp,
    OutTime Timestamp ,
    no number(20) not null
);

select (CASE WHEN outtime IS null THEN null ELSE to_char(outTime-inTimeDate, 'YYYY-MM-DD HH24:MI:SS') END) as summary, no from commute;
select (CASE WHEN outtime IS null THEN null ELSE to_char(outTime-inTimeDate, 'HH24:MI') END) as summary from commute where no = 10;

create sequence empNo_seq
increment by 1
start WITH 1 
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE
NOORDER;

DROP SEQUENCE empNo_seq;
DROP SEQUENCE SEQ_REPLY;
Drop SEQUENCE SEQ_BOARD;

CREATE SEQUENCE SEQ_BOARD;

SELECT * from TBL_BOARD;

CREATE SEQUENCE SEQ_REPLY;

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

CREATE TABLE TBL_FILE(
	UUID VARCHAR2(1000) CONSTRAINT PK_FILE PRIMARY KEY,
	UPLOAD_PATH VARCHAR2(1000),
	FILE_NAME VARCHAR2(1000),
	FILE_TYPE CHAR(1),
	BNO NUMBER(10),
	CONSTRAINT FK_FILE FOREIGN KEY(BNO) REFERENCES TBL_BOARD(BNO)
);

CREATE TABLE dayOffInfo(
no number(20) not null,
Total int DEFAULT 0,
Remind int DEFAULT 0,
UsedTotal int DEFAULT 0
);

SELECT * FROM dayoffinfo;
SELECT * FROM EMPLOYEE;

insert into dayoffinfo (NO, total, remind, usedtotal)
values (11, 40, 30, 10);


create table dayOffList(
no number(20) not null,
UseDate varchar2(10),
Kind int,
Reason varchar2(100)
);

SELECT * FROM APPROVAL;
SELECT * FROM EMPLOYEE;

select count(*) as countTemp from approval
		where temp = '임시저장' and writerno = 4;
		
DELETE FROM approval WHERE form = '연차';