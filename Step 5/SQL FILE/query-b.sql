-- Selecting the monitor station name, average PM2.5 reading, and average VPM2.5 reading within a specific time range
SELECT 
    monitor_station.station_name, 
    AVG(air_quality_reading.pm2_5) AS mean_PM2_5, 
    AVG(air_quality_reading.v_pm2_5) AS mean_VPM2_5 
FROM 
    air_quality_reading 
JOIN 
    monitor_station ON air_quality_reading.site_id = monitor_station.site_id -- Joining the air quality reading table with the monitor station table based on the site ID
WHERE 
    air_quality_reading.date_time BETWEEN '2022-01-01 07:00:00' AND '2022-12-31 09:00:00' -- Filtering the readings for a specific time range
GROUP BY 
    monitor_station.station_name; -- Grouping the results by monitor station name to calculate the averages for each station
