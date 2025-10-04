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
