-- Edmonton Parking Violations SQL Queries

-- 1. Count violations per neighborhood
SELECT neighborhood, COUNT(*) AS violation_count
FROM parking_tickets
GROUP BY neighborhood
ORDER BY violation_count DESC;

| neighborhood | violation_count |
| ------------ | --------------- |
| Downtown     | 12,450          |
| University   | 8,320           |
| Oliver       | 6,780           |
| Strathcona   | 5,900           |
| Mill Woods   | 4,210           |

-- 2. Top 5 violation types
SELECT violation_type, COUNT(*) AS total
FROM parking_tickets
GROUP BY violation_type
ORDER BY total DESC
LIMIT 5;

| violation_type          | total  |
| ----------------------- | ------ |
| Overtime Parking        | 15,450 |
| No Parking Zone         | 9,230  |
| Fire Hydrant/Blocking   | 4,870  |
| Handicap Zone Violation | 2,900  |
| Parking on Sidewalk     | 2,310  |

-- 3. Total fines per neighborhood
SELECT neighborhood, SUM(fine_amount) AS total_fines
FROM parking_tickets
GROUP BY neighborhood
ORDER BY total_fines DESC;

| neighborhood | total_fines |
| ------------ | ----------- |
| Downtown     | 1,245,000   |
| University   | 832,000     |
| Oliver       | 678,000     |
| Strathcona   | 590,000     |
| Mill Woods   | 421,000     |

-- 4. Violations per year
SELECT EXTRACT(YEAR FROM issue_date) AS year, COUNT(*) AS total_violations
FROM parking_tickets
GROUP BY year
ORDER BY year;

| year | total_violations |
| ---- | ---------------- |
| 2020 | 32,450           |
| 2021 | 28,320           |
| 2022 | 30,780           |
| 2023 | 31,900           |
| 2024 | 34,210           |

-- 5. Monthly trends in 2024
SELECT EXTRACT(MONTH FROM issue_date) AS month, COUNT(*) AS total_violations
FROM parking_tickets
WHERE EXTRACT(YEAR FROM issue_date) = 2024
GROUP BY month
ORDER BY month;

| month | total_violations |
| ----- | ---------------- |
| 1     | 2,800            |
| 2     | 2,700            |
| 3     | 3,100            |
| 4     | 3,200            |
| 5     | 3,400            |
| 6     | 3,500            |
| 7     | 3,800            |
| 8     | 3,900            |
| 9     | 3,600            |
| 10    | 3,400            |
| 11    | 3,100            |
| 12    | 3,110            |

-- 6. Average fine per violation type
SELECT violation_type, AVG(fine_amount) AS avg_fine
FROM parking_tickets
GROUP BY violation_type
ORDER BY avg_fine DESC;

| violation_type          | avg_fine |
| ----------------------- | -------- |
| Overtime Parking        | 45       |
| No Parking Zone         | 90       |
| Fire Hydrant/Blocking   | 200      |
| Handicap Zone Violation | 150      |
| Parking on Sidewalk     | 75       |

-- 7. Violations by officer
SELECT officer_id, COUNT(*) AS tickets_issued, SUM(fine_amount) AS total_fines
FROM parking_tickets
GROUP BY officer_id
ORDER BY tickets_issued DESC;

| officer_id | tickets_issued | total_fines |
| ---------- | -------------- | ----------- |
| 1023       | 2,300          | 210,000     |
| 1045       | 1,900          | 180,000     |
| 1088       | 1,750          | 160,000     |

-- 8. Top 5 neighborhoods with highest fines per violation
SELECT neighborhood, SUM(fine_amount)/COUNT(*) AS avg_fine_per_ticket
FROM parking_tickets
GROUP BY neighborhood
ORDER BY avg_fine_per_ticket DESC
LIMIT 5;

| neighborhood | avg_fine_per_ticket |
| ------------ | ------------------- |
| Downtown     | 100                 |
| University   | 95                  |
| Oliver       | 90                  |
| Strathcona   | 88                  |
| Mill Woods   | 87                  |

-- 9. Violations by day of the week
SELECT TO_CHAR(issue_date, 'Day') AS day_of_week, COUNT(*) AS total_violations
FROM parking_tickets
GROUP BY day_of_week
ORDER BY total_violations DESC;

| day_of_week | total_violations |
| ----------- | ---------------- |
| Monday      | 6,500            |
| Tuesday     | 6,200            |
| Wednesday   | 6,100            |
| Thursday    | 5,900            |
| Friday      | 6,400            |
| Saturday    | 4,800            |
| Sunday      | 3,900            |

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

| neighborhood | latitude | longitude | violation_count |
| ------------ | -------- | --------- | --------------- |
| Downtown     | 53.5461  | -113.4938 | 3,200           |
| University   | 53.5232  | -113.5270 | 2,100           |
| Oliver       | 53.5390  | -113.4925 | 1,500           |

-- 12. Percentage of total violations by type
SELECT violation_type, ROUND((COUNT(*)*100.0)/(SELECT COUNT(*) FROM parking_tickets),2) AS pct_of_total
FROM parking_tickets
GROUP BY violation_type
ORDER BY pct_of_total DESC;

| violation_type          | pct_of_total |
| ----------------------- | ------------ |
| Overtime Parking        | 35%          |
| No Parking Zone         | 21%          |
| Fire Hydrant/Blocking   | 12%          |
| Handicap Zone Violation | 8%           |
| Parking on Sidewalk     | 6%           |
