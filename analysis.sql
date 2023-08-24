-- Total rides of casual and member riders
SELECT
member_casual as membership,
COUNT(member_casual) as total_rides,
ROUND(COUNT(member_casual)/SUM(COUNT(member_casual)) OVER () * 100, 2) as percentage
FROM `cyclistic-data-127.bike_trips.main_table`
GROUP BY
member_casual
ORDER BY
member_casual;

-- Total number of rides by bike type
SELECT
rideable_type AS bike_type,
member_casual AS membership,
COUNT(member_casual) as total_rides,
ROUND(COUNT(rideable_type)/SUM(COUNT(rideable_type)) OVER (PARTITION BY rideable_type) * 100, 2) as percentage
FROM `cyclistic-data-127.bike_trips.main_table`
GROUP BY
rideable_type, member_casual
ORDER BY
rideable_type, member_casual;

-- Total rides by months
SELECT
ride_month,
member_casual AS membership,
COUNT(ride_month) AS total_rides,
ROUND(COUNT(ride_month)/SUM(COUNT(ride_month)) OVER (PARTITION BY ride_month) * 100, 2) as percentage
FROM `cyclistic-data-127.bike_trips.main_table`
GROUP BY
ride_month, member_casual
ORDER BY
ride_month, member_casual;

-- Total rides by day
SELECT
day_of_week,
member_casual AS membership,
COUNT(day_of_week) AS total_rides,
ROUND(COUNT(day_of_week)/SUM(COUNT(day_of_week)) OVER (PARTITION BY day_of_week) * 100, 2) as percentage
FROM `cyclistic-data-127.bike_trips.main_table`
GROUP BY
day_of_week, member_casual
ORDER BY
day_of_week, member_casual;

-- Top 10 longest duration rides
SELECT
member_casual AS membership,
ride_length,
ride_duration_hours,
ride_date_duration
FROM `cyclistic-data-127.bike_trips.main_table`
ORDER BY ride_length DESC
LIMIT 10;

-- Average ride duration by casual and member riders
SELECT
member_casual AS membership,
ROUND(AVG(ride_duration_mins), 2) AS avg_ride_duration_mins
FROM `cyclistic-data-127.bike_trips.main_table`
GROUP BY member_casual
ORDER BY member_casual;

-- Average ride duration by bike type
SELECT
rideable_type,
member_casual AS membership,
ROUND(AVG(ride_duration_mins), 2) AS avg_ride_duration_mins
FROM `cyclistic-data-127.bike_trips.main_table`
GROUP BY rideable_type, member_casual
ORDER BY rideable_type, member_casual;

-- The busiest day of the week for rides
SELECT membership, day_of_week, total_rides
FROM (
  SELECT
    DISTINCT member_casual AS membership,
    day_of_week,
    COUNT(member_casual) AS total_rides,
    ROW_NUMBER() OVER (PARTITION BY member_casual ORDER BY COUNT(day_of_week) DESC) AS rn
  FROM `cyclistic-data-127.bike_trips.main_table`
  GROUP BY member_casual, day_of_week
) subquery
WHERE rn = 1
ORDER BY total_rides DESC;

-- Peak hour for rides
SELECT membership, day_of_week, peak_hour, total_rides
FROM (
  SELECT
  DISTINCT member_casual AS membership,
    day_of_week,
    EXTRACT(HOUR FROM start_time) AS peak_hour,
    COUNT(member_casual) AS total_rides,
    ROW_NUMBER() OVER (PARTITION BY member_casual ORDER BY COUNT(start_time) DESC) AS rn
FROM `cyclistic-data-127.bike_trips.main_table`
GROUP BY member_casual, day_of_week, peak_hour
) subquery
WHERE rn = 1
ORDER BY total_rides DESC;

-- Peak season for rides
SELECT membership, ride_month, total_rides
FROM (
  SELECT
  DISTINCT member_casual AS membership,
    ride_month,
    COUNT(member_casual) AS total_rides,
    ROW_NUMBER() OVER (PARTITION BY member_casual ORDER BY COUNT(ride_month) DESC) AS rn
FROM `cyclistic-data-127.bike_trips.main_table`
GROUP BY member_casual, ride_month
) subquery
WHERE rn = 1
ORDER BY total_rides DESC;
