-- 1) จำนวนลูกค้าทั้งหมด
SELECT Count(custno) FROM custtbl;

-- 2) จำนวนพนักงานทั้งหมด
SELECT COUNT(emp) FROM emptbl;

-- 3) ราคาสินค้าสูงสุด ต่ำสุด และเฉลี่ย
SELECT MAX(prodPrice),MIN(prodPrice),AVG(prodPrice) FROM prodtbl;
SELECT MIN(prodPrice) FROM prodtbl;
SELECT AVG(prodPrice) FROM prodtbl;

-- 4) จำนวนใบสั่งซื้อทั้งหมด
SELECT COUNT(orderno) FROM ordertbl;
-- 5) จำนวนใบสั่งซื้อของลูกค้าแต่ละคน
SELECT custNo, COUNT(orderNo) FROM ordertbl
Group By custNO;
-- 6) จำนวนครั้งที่สินค้าถูกสั่งซื้อ (จำนวนแถว)
SELECT prodno, count(orderQTY) FROM orderdetail
Group BY prodno;
-- 7) จำนวนสินค้าที่ขายได้รวมของแต่ละสินค้า
SELECT prodno, sum(orderQTY) FROM orderdetail
Group by prodno; 
-- 8) จำนวนสินค้าเฉลี่ยต่อการสั่งซื้อ (แต่ละสินค้า)
SELECT prodno ,AVG(orderQTY) FROM orderdetail
GROUP BY prodno;

-- 9)สินค้าที่ขายได้มากกว่า 5 ชิ้น
SELECT prodno, sum(orderQTY) FROM orderdetail
GROUP BY prodno 
HAVING sum(orderQTY) > 5;
-- 10สินค้าที่มีจำนวนสั่งซื้อมากกว่า 2 ครั้ง
SELECT custNo ,count(orderno) FROM ordertbl
GROUP BY custNo
Having count(orderno) > 2;



