-- Edmonton Parking Violations SQL Queries

-- 1. Count violations per neighborhood
SELECT neighborhood, COUNT(*) AS violation_count
FROM parking_tickets
GROUP BY neighborhood
ORDER BY violation_count DESC;

-- 2. Top 5 violation types
SELECT violation_type, COUNT(*) AS total
FROM parking_tickets
GROUP BY violation_type
ORDER BY total DESC
LIMIT 5;

-- 3. Total fines per neighborhood
SELECT neighborhood, SUM(fine_amount) AS total_fines
FROM parking_tickets
GROUP BY neighborhood
ORDER BY total_fines DESC;

-- 4. Violations per year
SELECT EXTRACT(YEAR FROM issue_date) AS year, COUNT(*) AS total_violations
FROM parking_tickets
GROUP BY year
ORDER BY year;

-- 5. Monthly trends in 2024
SELECT EXTRACT(MONTH FROM issue_date) AS month, COUNT(*) AS total_violations
FROM parking_tickets
WHERE EXTRACT(YEAR FROM issue_date) = 2024
GROUP BY month
ORDER BY month;

-- 6. Average fine per violation type
SELECT violation_type, AVG(fine_amount) AS avg_fine
FROM parking_tickets
GROUP BY violation_type
ORDER BY avg_fine DESC;

-- 7. Violations by officer
SELECT officer_id, COUNT(*) AS tickets_issued, SUM(fine_amount) AS total_fines
FROM parking_tickets
GROUP BY officer_id
ORDER BY tickets_issued DESC;

-- 8. Top 5 neighborhoods with highest fines per violation
SELECT neighborhood, SUM(fine_amount)/COUNT(*) AS avg_fine_per_ticket
FROM parking_tickets
GROUP BY neighborhood
ORDER BY avg_fine_per_ticket DESC
LIMIT 5;

-- 9. Violations by day of the week
SELECT TO_CHAR(issue_date, 'Day') AS day_of_week, COUNT(*) AS total_violations
FROM parking_tickets
GROUP BY day_of_week
ORDER BY total_violations DESC;

-- 10. Violations per neighborhood per month
SELECT neighborhood, EXTRACT(MONTH FROM issue_date) AS month, COUNT(*) AS total_violations
FROM parking_tickets
GROUP BY neighborhood, month
ORDER BY neighborhood, month;

| neighborhood | month | total_violations |
| ------------ | ----- | ---------------- |
| Downtown     | 1     | 1,050            |
| Downtown     | 2     | 1,020            |
| University   | 1     | 850              |
| University   | 2     | 800              |

-- 11. Violation hotspots using latitude/longitude
SELECT neighborhood, latitude, longitude, COUNT(*) AS violation_count
FROM parking_tickets
GROUP BY neighborhood, latitude, longitude
ORDER BY violation_count DESC
LIMIT 20;

-- 12. Percentage of total violations by type
SELECT violation_type, ROUND((COUNT(*)*100.0)/(SELECT COUNT(*) FROM parking_tickets),2) AS pct_of_total
FROM parking_tickets
GROUP BY violation_type
ORDER BY pct_of_total DESC;
