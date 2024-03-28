BEGIN
    Drop Table date_dim
END;

GO

CREATE TABLE date_dim(
	date DATETIME,
    quarter INT,
    year INT,
    month INT,
    week INT,
    day INT,
    day_of_week INT, 
	hour INT
)

GO;

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'temp_latest_dates')
    DROP TABLE [temp_latest_dates]
GO
CREATE TABLE [temp_latest_dates] (
    [date] datetime
);

INSERT INTO [temp_latest_dates](date)
SELECT date FROM 
(SELECT TOP 1 CONVERT(DATETIME, SUBSTRING([ended_at], 1, 19),120) AS date FROM [dbo].[staging_trip] ORDER BY date DESC) as latest_trip
UNION ALL SELECT date FROM 
(SELECT TOP 1 CONVERT(DATETIME, SUBSTRING([date], 1, 19),120) AS date FROM [dbo].[staging_payment] ORDER BY date DESC) as latest_payment;

DECLARE @start_date DATETIME = (SELECT TOP 1 CONVERT(DATETIME, SUBSTRING([account_start_date], 1, 19),120)
    FROM [dbo].[staging_rider] ORDER BY [account_start_date]);
DECLARE @num_years INT = 30;
DECLARE @cutoff_date DATETIME = (SELECT TOP 1 DATEADD(YEAR, @num_years, [date]) FROM
        [temp_latest_dates] ORDER BY [date] DESC);

INSERT [date_dim]([date])
SELECT d
FROM
(
    SELECT d = DATEADD(HOUR, rn - 1, @start_date)
    FROM
    (
    SELECT TOP (DATEDIFF(HOUR, @start_date, @cutoff_date))
        rn = ROW_NUMBER() OVER (ORDER BY s1.[object_id])
    FROM sys.all_objects AS s1
    CROSS JOIN sys.all_objects AS s2
    ORDER BY s1.[object_id]
    ) AS x
) AS y;

UPDATE [date_dim]
SET
    [quarter]       = DATEPART(QUARTER, [date]),
    [year]          = DATEPART(YEAR, [date]),
    [month]         = DATEPART(MONTH, [date]),
    [week]          = DATEPART(WEEK, [date]),
    [day]           = DATEPART(DAY, [date]),
    [day_of_week]   = DATEPART(WEEKDAY, [date]),
	[hour]  		= DATEPART(HOUR, [date])
;
GO

GO

SELECT TOP 10 * from date_dim

GO