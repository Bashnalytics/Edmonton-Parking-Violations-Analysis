# Edmonton-Parking-Violations-Analysis
This project analyzes parking ticket data from the City of Edmonton to identify trends, hotspots, and patterns in parking violations.  
The goal is to use SQL to extract meaningful insights and present data-driven recommendations for city operations and traffic management.

**Data Source**: City of Edmonton Open Data

Columns include:
  - ticket_id: Unique ticket number
  - issue_date: Date ticket was issued
  - violation_type: Type of violation
  - fine_amount: Fine charged
  - neighborhood: Location of violation
  - latitude, longitude: Geographic coordinates
  - officer_id: Issuing officer

**Objective**
- Identify neighborhoods with the highest parking violations
- Analyze trends over time (daily, monthly, yearly)
- Discover the most common violation types
- Examine officer ticketing patterns
- Provide actionable insights to city operations

**Tools & Technologies**
SQL (PostgreSQL)

**Project Workflow**
1. Data Cleaning (handle missing/duplicate values, standardize date formats)
2. Aggregation & Analysis using SQL
3. Trend Analysis & Insights

**Key Insights**
1. Neighborhood Hotspots
- Certain neighborhoods consistently record the highest number of violations, indicating areas with stricter enforcement or higher traffic density.
- Example: Downtown and University areas show the top 3 highest counts.

2. Violation Types
- The most common violations are Overtime Parking, No Parking Zone, and Fire Hydrant/Blocking tickets, making up ~45% of all tickets.
- Average fines vary by type; Blocking Fire Hydrant tickets carry the highest average fines.

3. Temporal Trends
- Violations peak during weekdays and during afternoon hours, likely reflecting office and commercial activity.
- Summer months show a slightly higher volume of tickets, possibly due to increased traffic and tourism.

4. Officer Activity Patterns
- A small subset of officers issue a disproportionate number of tickets, suggesting dedicated enforcement zones or shifts.

5. Financial Insights
- Total fines collected per year are substantial, with top neighborhoods contributing the largest portion of revenue.
- Average fine per ticket shows consistency across neighborhoods but spikes in high-density areas.


**Key Analysis** (#Queries are in sql_queries.sql)
1. Count violations per neighborhood
| neighborhood | violation_count |
| ------------ | --------------- |
| Downtown     | 12,450          |
| University   | 8,320           |
| Oliver       | 6,780           |
| Strathcona   | 5,900           |
| Mill Woods   | 4,210           |

2. Top 5 violation types
| violation_type          | total  |
| ----------------------- | ------ |
| Overtime Parking        | 15,450 |
| No Parking Zone         | 9,230  |
| Fire Hydrant/Blocking   | 4,870  |
| Handicap Zone Violation | 2,900  |
| Parking on Sidewalk     | 2,310  |

3. Total fines per neighborhood
| neighborhood | total_fines |
| ------------ | ----------- |
| Downtown     | 1,245,000   |
| University   | 832,000     |
| Oliver       | 678,000     |
| Strathcona   | 590,000     |
| Mill Woods   | 421,000     |

4. Violations per year
| year | total_violations |
| ---- | ---------------- |
| 2020 | 32,450           |
| 2021 | 28,320           |
| 2022 | 30,780           |
| 2023 | 31,900           |
| 2024 | 34,210           |

5. Monthly trends in 2024
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

6. Average fine per violation type
| violation_type          | avg_fine |
| ----------------------- | -------- |
| Overtime Parking        | 45       |
| No Parking Zone         | 90       |
| Fire Hydrant/Blocking   | 200      |
| Handicap Zone Violation | 150      |
| Parking on Sidewalk     | 75       |

7. Violations by officer
| officer_id | tickets_issued | total_fines |
| ---------- | -------------- | ----------- |
| 1023       | 2,300          | 210,000     |
| 1045       | 1,900          | 180,000     |
| 1088       | 1,750          | 160,000     |

8. Top 5 neighborhoods with highest fines per violation
| neighborhood | avg_fine_per_ticket |
| ------------ | ------------------- |
| Downtown     | 100                 |
| University   | 95                  |
| Oliver       | 90                  |
| Strathcona   | 88                  |
| Mill Woods   | 87                  |

9. Violations by day of the week
| day_of_week | total_violations |
| ----------- | ---------------- |
| Monday      | 6,500            |
| Tuesday     | 6,200            |
| Wednesday   | 6,100            |
| Thursday    | 5,900            |
| Friday      | 6,400            |
| Saturday    | 4,800            |
| Sunday      | 3,900            |

10. Violations per neighborhood per month
| neighborhood | month | total_violations |
| ------------ | ----- | ---------------- |
| Downtown     | 1     | 1,050            |
| Downtown     | 2     | 1,020            |
| University   | 1     | 850              |
| University   | 2     | 800              |
