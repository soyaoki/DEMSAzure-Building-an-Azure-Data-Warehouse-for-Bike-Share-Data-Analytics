BEGIN  
    DROP TABLE station_dim
END;

GO

CREATE TABLE station_dim(
    station_id varchar(255),
    name varchar(255),
    latitude float, 
    longitude float
)

GO

INSERT INTO station_dim (station_id, name, latitude, longitude)
SELECT s.station_id as station_id, s.name as name, s.latitude as latitude, s.longitude as longitude
FROM staging_station as s

GO

Select top 10 * from station_dim

Go