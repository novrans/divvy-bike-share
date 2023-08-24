-- CREATE all_months table

CREATE TABLE
  `cyclistic-data-127.bike_trips.all_months` AS
SELECT
  *
FROM (
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202101_JAN_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202102_FEB_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202103_MAR_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202104_APR_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202105_MAY_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202106_JUN_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202107_JUL_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202108_AUG_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202109_SEP_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202110_OCT_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202111_NOV_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202112_DEC_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202201_JAN_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202202_FEB_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202203_MAR_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202204_APR_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202205_MAY_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202206_JUN_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202207_JUL_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202208_AUG_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202209_SEP_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202210_OCT_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202211_NOV_biketrips`
  UNION ALL
  SELECT
    *
  FROM
    `cyclistic-data-127.bike_trips.202212_DEC_biketrips` ); 
    
-- Create main_table 
-- Add new column ride_duration_hours and ride_duration_mins 
-- Then, extract duration hour and minute using timestamp_diff from ended_at and started_at
-- Convert ride_length data type from STRING to INTERVAL
-- Convert day_of_week data type from INTEGER to STRING
-- Convert ride_month data type from INTEGER to STRING
-- Convert ride_year data type from INTEGER to STRING

CREATE TABLE
  `cyclistic-data-127.bike_trips.main_table` AS
SELECT
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  SAFE_CAST(ride_length AS INTERVAL) AS ride_length,
  ride_start_date,
  ride_end_date,
  ride_date_duration,
  SAFE_CAST(ride_month AS STRING) AS ride_month,
  SAFE_CAST(ride_year AS STRING) AS ride_year,
  start_time,
  end_time,
  timestamp_diff (ended_at, started_at, hour) AS ride_duration_hours,
  timestamp_diff (ended_at, started_at, minute) AS ride_duration_mins,
  SAFE_CAST(day_of_week AS STRING) AS day_of_week,
  member_casual
FROM
  `cyclistic-data-127.bike_trips.all_months`
ORDER BY
  started_at ASC;

  
-- transform day of week from number to the corresponding day names
UPDATE
  `cyclistic-data-127.bike_trips.main_table`
SET
  day_of_week =
  CASE
    WHEN day_of_week = '1' THEN 'Sunday'
    WHEN day_of_week = '2' THEN 'Monday'
    WHEN day_of_week = '3' THEN 'Tuesday'
    WHEN day_of_week = '4' THEN 'Wednesday'
    WHEN day_of_week = '5' THEN 'Thursday'
    WHEN day_of_week = '6' THEN 'Friday'
    WHEN day_of_week = '7' THEN 'Saturday'
END
WHERE
  day_of_week IN ('1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7');
    
-- transform month values to the corresponding month names
UPDATE
  `cyclistic-data-127.bike_trips.main_table`
SET
  ride_month =
  CASE
    WHEN ride_month = '1' THEN "January"
    WHEN ride_month = '2' THEN "February"
    WHEN ride_month = '3' THEN "March"
    WHEN ride_month = '4' THEN "April"
    WHEN ride_month = '5' THEN "May"
    WHEN ride_month = '6' THEN "June"
    WHEN ride_month = '7' THEN "July"
    WHEN ride_month = '8' THEN "August"
    WHEN ride_month = '9' THEN "September"
    WHEN ride_month = '10' THEN "October"
    WHEN ride_month = '11' THEN "November"
    WHEN ride_month = '12' THEN "December"
END
WHERE ride_month IN ('1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12');
