-- ============================================
-- CUSTOMER COMPLAINT TRACKING SYSTEM DATABASE
-- ============================================

--  DROP TABLES IF THEY EXIST (for fresh start)
DROP TABLE IF EXISTS Complaint;
DROP TABLE IF EXISTS Customer;

--  CREATE CUSTOMER TABLE
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Name VARCHAR(100) NOT NULL,
    Contact_Number VARCHAR(20)
);

--  CREATE COMPLAINT TABLE
CREATE TABLE Complaint (
    Complaint_ID INT PRIMARY KEY,
    Customer_ID INT,
    Complaint_Type VARCHAR(50),
    Complaint_Description TEXT,
    Date_of_Complaint DATE,
    Complaint_Priority VARCHAR(10),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- ============================================
--  INSERT SAMPLE CUSTOMERS
-- ============================================
INSERT INTO Customer (Customer_Name, Contact_Number) VALUES
('ABU BAKAR', '3247531458'),
('Nabi Ahmed', '3487823075'),
('Hassan Nawaz', '3006620808'),
('Ali Raza', '3008090606'),
('Hasan ali', '3215677966'),
('Abdul Mateen', '5888225678'),
('Yajooj Majooj', '3196547832'),
('Harris', '3368611223'),
('Muhammad Zohaib Arshad', '3270643636'),
('Abdullah', '3007868909'),
('Laiba khan', '3008888000');

-- ============================================
--  INSERT COMPLAINTS
-- ============================================
INSERT INTO Complaint (Complaint_ID, Customer_ID, Complaint_Type, Complaint_Description, Date_of_Complaint, Complaint_Priority) VALUES
(9034, 1, 'Late Delivery', 'Late delivery', '2025-12-29', 'High'),
(6789, 2, 'Wrong Product', 'I ordered a Navy blue coat but I received red coat.', '2025-12-29', 'High'),
(2490, 3, 'Wrong Product', 'You deliver the wrong product', '2025-12-31', 'Medium'),
(6785, 4, 'Late Delivery', 'I didn’t received my package', '2025-12-31', 'High'),
(3367, 5, 'Billing Issue', 'Billing issue', '2025-12-31', 'Medium'),
(4907, 5, 'Billing Issue', 'Very high amount of bill', '2026-01-01', 'Medium'),
(5599, NULL, 'Other', 'None', '2026-01-03', 'Low'),
(8809, 6, 'Late Delivery', 'Late delivery', '2026-01-03', 'High'),
(2062, 7, 'Service Delay', 'My Hammer not received yet', '2026-01-02', 'High'),
(8090, 8, 'Service Delay', 'Service delay', '2026-01-04', 'High'),
(6662, 9, 'Service Delay', 'Service delay', '2026-01-04', 'Medium'),
(4369, 10, 'Late Delivery', 'My product not received yet', '2026-01-01', 'High'),
(8790, 11, 'Late Delivery', 'I didn’t received my face wash', '2026-01-09', 'High');

-- ============================================
-- SAMPLE QUERIES
-- ============================================

-- a) Total complaints per day
SELECT Date_of_Complaint, COUNT(*) AS Total_Complaints
FROM Complaint
GROUP BY Date_of_Complaint
ORDER BY Date_of_Complaint;

-- b) Complaints by type
SELECT Complaint_Type, COUNT(*) AS Count
FROM Complaint
GROUP BY Complaint_Type
ORDER BY Count DESC;

-- c) High priority complaints
SELECT c.Complaint_ID, cu.Customer_Name, c.Complaint_Type, c.Date_of_Complaint
FROM Complaint c
JOIN Customer cu ON c.Customer_ID = cu.Customer_ID
WHERE c.Complaint_Priority = 'High';

-- d) Complaints per customer
SELECT cu.Customer_Name, COUNT(*) AS Total_Complaints
FROM Complaint c
JOIN Customer cu ON c.Customer_ID = cu.Customer_ID
GROUP BY cu.Customer_Name
ORDER BY Total_Complaints DESC;

-- e) Complaints on a specific date (example: 2026-01-01)
SELECT c.Complaint_ID, cu.Customer_Name, c.Complaint_Type, c.Complaint_Priority
FROM Complaint c
JOIN Customer cu ON c.Customer_ID = cu.Customer_ID
WHERE c.Date_of_Complaint = '2026-01-01';

-- ============================================
-- END OF SCRIPT
-- ============================================
customer_complaint.sql