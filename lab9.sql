CREATE TABLE account(
	accout_id SERIAL Primary KEY,
	name VARCHAR(50),
	balance NUMERIC(12,2) NOT NULL 
);

-- สร้าง A , B
Create user A with password 'usera';
Create user B with password 'userb';

ALTER ROLE A LOGIN PASSWORD '123456789';
ALTER ROLE B LOGIN PASSWORD '12345';


Grant insert , update ,delete on table account to A;
Grant insert , update ,delete on table account to B;


select current_user;
select session_user;

set role A;

INSERT INTO account (name, balance) VALUES
('A', 5000),
('B', 3000);


-- ตรวจสอบ
select * from account

-- 3 LAB 1: BEGIN – COMMIT – ROLLBACK
-- 3.1 เริ่ม Transaction
begin;

-- 3.2 แก้ไขข้อมูล
update account set balance = balance - 500 where accout_id = 1;
update account set balance = balance + 500 where accout_id = 2;

-- 3.3 ตรวจสอบใน Transaction
select * from account;

-- 3.4 ทดลอง ROLLBACK
ROLLBACK;

-- 3.5 ตรวจสอบอีกครั้ง
SELECT * FROM account;


4 LAB 2: การใช้SAVEPOINT
-- 4.1 เริ่ม Transaction
Begin;

-- 4.2 ทำรายการแรก
UPDATE account SET balance = balance - 100 WHERE accout_id = 1;
SAVEPOINT sp1;

-- 4.3 ทำรายการที่สอง
UPDATE account SET balance = balance - 300 WHERE accout_id = 1;
SAVEPOINT sp2;

-- 4.4 Rollback เฉพาะบางส่วน
ROLLBACK TO sp1;
select * from account

-- 4.5 ปิด transaction
COMMIT;

-- 5 LAB 3 การโอนเงินระหว่างบัญชี (Atomic transitiong)
Begin;

update account set balance = balance - 1000 where accout_id = 1;
update account set balance = balance + 1000 where accout_id = 2;

COMMIT;
-- สร้าง Error เพื่อสาธิตการ Rollback อัตโนมัติ
-- เช่น บังคับให้update ID ที่ไม่มี
Begin; 

UPDATE account SET balance = balance - 1000 WHERE accout_id = 1;
UPDATE account SET balance = balance + 1000 WHERE accout_id = 9999; -- ERROR

Commit; 
select * from account

