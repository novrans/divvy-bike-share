# Analysis of Divvy Bike-Share 
## Business Understanding
Divvy is a bike share company with a fleet of geo-tracked bicycles that are locked into a network of stations throughout Chicago. Divvy offers three different pricing options: day passes, annual memberships, and single-ride passes. Casual riders are customers who purchase single-ride or full-day passes. Member riders are customers who purchase annual memberships.

The primary goal of this case is to investigate ride data to identify differences in the usage of Divvy’s bikes between member riders and casual riders. These insights will then be used to develop marketing strategies aimed at converting casual riders into member riders. The marketing team believes that the company's future growth will be driven by maximizing the number of member riders, who are more profitable than casual riders.

The following are three questions that will guide the future marketing strategy:
(1) How do member riders and casual riders differ from each other?
(2) Why would casual riders purchase an annual membership?
(3) How can Divvy use digital media to encourage casual riders to become member riders?

## Data Understanding
Source: [Divvy’s Historical Trip History Data 2021-2022](https://divvy-tripdata.s3.amazonaws.com/index.html) 

- **Data attributes description:**
    - **ride_id** #Ride id - unique
    - **rideable_type** #Bike type - Classic, Docked, Electric
    - **started_at** #Trip start day and time
    - **ended_at** #Trip end day and time
    - **start_station_name** #Trip start station
    - **start_station_id** #Trip start station id
    - **end_station_name** #Trip end station
    - **end_station_id** #Trip end station id
    - **start_lat** #Trip start latitude
    - **start_lng** #Trip start longitude
    - **end_lat** #Trip end latitude
    - **end_lat** #Trip end longitude
    - **member_casual** #Rider type - Member or Casual
