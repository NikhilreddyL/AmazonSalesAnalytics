-- Declare variables
DECLARE @StartDate DATE = '2020-01-01';
DECLARE @EndDate DATE = '2025-12-31';
DECLARE @CurrentDate DATE = @StartDate;

-- Insert dates and their components into the dim_date table
WHILE @CurrentDate <= @EndDate
BEGIN
    INSERT INTO dwh.dim_date (Date, Day, Month, Quarter, Year, Weekday)
    VALUES (
        @CurrentDate,
        DAY(@CurrentDate),
        MONTH(@CurrentDate),
        DATEPART(QUARTER, @CurrentDate),
        YEAR(@CurrentDate),
        DATENAME(WEEKDAY, @CurrentDate)
    );

    -- Increment the date
    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
END;