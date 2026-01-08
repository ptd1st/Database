-- 1 แสดงรายการข้อมูลพนักงานที่ใช้อีเมล Gmail โดยเรียงลำดับชื่อพนักงานจากมากไปน้อย (Z → A)
-- • ให้แสดงชื่อพนักงานเป็นอักษรตัวใหญ่ตั้งชื่อคอลัมน์ว่า empName
SELECT UPPER (Firstname) as empName FROM employees order by email DESC

-- ข้อ 2 แสดงหมายเลขประจำตัวพนักงาน โดยตัดอักขระ 2 ตัวแรกออกไป เช่น 01122, 02233
-- • ตั้งชื่อคอลัมน์ว่า empNo
Select substring(empno from 3 for 5) as empNo from employees 

-- ข้อ 3 แสดงชื่อพนักงาน และจำนวนอักขระของชื่อพนักงาน
-- • ตั้งชื่อคอลัมน์ว่า Name_Length
select firstname , length(firstname) as Name_Length From employees


-- 4 แสดงรายการข้อมูลพนักงานแผนก AA (รหัสพนักงานขึ้นต้นด้วย AAxxxxx)โดยเรียงรหัสพนักงานจากน้อยไปมาก
Select * from employees where empno LIKE 'A%' order by empNo ASC

-- 5 แสดงรายชื่อเมือง (empAddr) ที่แตกต่างกัน (ไม่ซ้ำ) โดยแสดงตัวอักษร 3 ตัวสุดท้ายของชื่อเมือง เช่น vor, tle, ood
select substring(empaddr from length(empaddr)-3 for 3),length(empaddr) from employees

-- ข้อ 6 แสดงชื่อเมือง 3 ตัวอักษร และชื่อพนักงาน 3 ตัวอักษร โดยมี '-' คั่นกลาง เช่น Den-Lan
-- • ตั้งชื่อคอลัมนวา City-Name
-- • เรียงตามชื่อเมืองจากมากไปน้อย และหากชื่อเมืองเท่ากันให้เรียงชื่อพนักงานจากน้อยไปมาก
Select CONCAT(substring (empaddr from 1 for 3),'_',substring(firstname from 1 for 3))as City_name from employees order by empaddr DESC

-- ข้อ 7 แสดงหมายเลขพนักงาน และหมายเลขพนักงานที่มี '-' คั่นระหว่างแผนกและเลขลำดับ เช่น AA01122, BB-03344
Select concat(substring(empno from 1 for 2),'-',substring(empno from 3 for length(empno) )) from employees

-- ข้อ 8 แสดงนามสกุลพนักงานทั้งหมด โดยต้องไม่มีนามสกุลซ้ำ
-- • เรียงลำดับตามตัวอักษร A → Z
Select DisTinct lastname as Last_name from employees order by lastname ASC

-- ข้อ 9 แสดงหมายเลขพนักงาน ชื่อพนักงาน เงินเดือนพนักงาน (บาท) และเงินเดือนพนักงาน (K)
-- • หมายเหตุ: 1K = 1,000 บาท
SELECT empno , firstname, salary from employees