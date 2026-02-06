/* =========================================================
   Project: Maven Fuzzy Factory
   Purpose: Truncate & Bulk Load CSV Data with Time Tracking
   Schema : mff
   Author : Kundan
   Date   : 23-01-2026
   ========================================================= */

SET NOCOUNT ON;
SET XACT_ABORT ON;

DECLARE 
    @ProcessStartTime   DATETIME2,
    @ProcessEndTime     DATETIME2,
    @TaskStartTime      DATETIME2,
    @TaskEndTime        DATETIME2;

SET @ProcessStartTime = SYSDATETIME();

BEGIN TRY
    BEGIN TRANSACTION;

    PRINT '========================================================='
    PRINT 'STARTING BULK INSERT PROCESS'
    PRINT 'Start Time: ' + CONVERT(VARCHAR, @ProcessStartTime, 120)
    PRINT '========================================================='


    /* =========================================================
       TASK 1: mff.order_items
       ========================================================= */
    PRINT 'TASK 1: Preparing mff.order_items'

    IF OBJECT_ID('mff.order_items', 'U') IS NOT NULL
    BEGIN
        TRUNCATE TABLE mff.order_items;
        PRINT 'mff.order_items truncated successfully'
    END

    SET @TaskStartTime = SYSDATETIME();

    BULK INSERT mff.order_items
    FROM 'C:/Downloads/Maven+Fuzzy+Factory/order_items.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );

    SET @TaskEndTime = SYSDATETIME();

    PRINT 'mff.order_items loaded successfully'
    PRINT 'Time Taken (seconds): '
        + CAST(DATEDIFF(MILLISECOND, @TaskStartTime, @TaskEndTime) / 1000.0 AS VARCHAR(20))
    PRINT '---------------------------------------------------------'


    /* =========================================================
       TASK 2: mff.orders
       ========================================================= */
    PRINT 'TASK 2: Preparing mff.orders'

    IF OBJECT_ID('mff.orders', 'U') IS NOT NULL
    BEGIN
        TRUNCATE TABLE mff.orders;
        PRINT 'mff.orders truncated successfully'
    END

    SET @TaskStartTime = SYSDATETIME();

    BULK INSERT mff.orders
    FROM 'C:/Downloads/Maven+Fuzzy+Factory/orders.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );

    SET @TaskEndTime = SYSDATETIME();

    PRINT 'mff.orders loaded successfully'
    PRINT 'Time Taken (seconds): '
        + CAST(DATEDIFF(MILLISECOND, @TaskStartTime, @TaskEndTime) / 1000.0 AS VARCHAR(20))
    PRINT '---------------------------------------------------------'


    /* =========================================================
       TASK 3: mff.order_item_refunds
       ========================================================= */
    PRINT 'TASK 3: Preparing mff.order_item_refunds'

    IF OBJECT_ID('mff.order_item_refunds', 'U') IS NOT NULL
    BEGIN
        TRUNCATE TABLE mff.order_item_refunds;
        PRINT 'mff.order_item_refunds truncated successfully'
    END

    SET @TaskStartTime = SYSDATETIME();

    BULK INSERT mff.order_item_refunds
    FROM 'C:/Downloads/Maven+Fuzzy+Factory/order_item_refunds.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );

    SET @TaskEndTime = SYSDATETIME();

    PRINT 'mff.order_item_refunds loaded successfully'
    PRINT 'Time Taken (seconds): '
        + CAST(DATEDIFF(MILLISECOND, @TaskStartTime, @TaskEndTime) / 1000.0 AS VARCHAR(20))
    PRINT '---------------------------------------------------------'


    /* =========================================================
       TASK 4: mff.products
       ========================================================= */
    PRINT 'TASK 4: Preparing mff.products'

    IF OBJECT_ID('mff.products', 'U') IS NOT NULL
    BEGIN
        TRUNCATE TABLE mff.products;
        PRINT 'mff.products truncated successfully'
    END

    SET @TaskStartTime = SYSDATETIME();

    BULK INSERT mff.products
    FROM 'C:/Downloads/Maven+Fuzzy+Factory/products.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );

    SET @TaskEndTime = SYSDATETIME();

    PRINT 'mff.products loaded successfully'
    PRINT 'Time Taken (seconds): '
        + CAST(DATEDIFF(MILLISECOND, @TaskStartTime, @TaskEndTime) / 1000.0 AS VARCHAR(20))
    PRINT '---------------------------------------------------------'


    /* =========================================================
       TASK 5: mff.maven_fuzzy_factory_data_dictionary
       ========================================================= */
    PRINT 'TASK 5: Preparing mff.maven_fuzzy_factory_data_dictionary'

    IF OBJECT_ID('mff.maven_fuzzy_factory_data_dictionary', 'U') IS NOT NULL
    BEGIN
        TRUNCATE TABLE mff.maven_fuzzy_factory_data_dictionary;
        PRINT 'mff.maven_fuzzy_factory_data_dictionary truncated successfully'
    END

    SET @TaskStartTime = SYSDATETIME();

    BULK INSERT mff.maven_fuzzy_factory_data_dictionary
    FROM 'C:/Downloads/Maven+Fuzzy+Factory/maven_fuzzy_factory_data_dictionary.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );

    SET @TaskEndTime = SYSDATETIME();

    PRINT 'mff.maven_fuzzy_factory_data_dictionary loaded successfully'
    PRINT 'Time Taken (seconds): '
        + CAST(DATEDIFF(MILLISECOND, @TaskStartTime, @TaskEndTime) / 1000.0 AS VARCHAR(20))
    PRINT '---------------------------------------------------------'


    /* =========================================================
       TASK 6: mff.website_sessions
       ========================================================= */
    PRINT 'TASK 6: Preparing mff.website_sessions'

    IF OBJECT_ID('mff.website_sessions', 'U') IS NOT NULL
    BEGIN
        TRUNCATE TABLE mff.website_sessions;
        PRINT 'mff.website_sessions truncated successfully'
    END

    SET @TaskStartTime = SYSDATETIME();

    BULK INSERT mff.website_sessions
    FROM 'C:/Downloads/Maven+Fuzzy+Factory/website_sessions.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );

    SET @TaskEndTime = SYSDATETIME();

    PRINT 'mff.website_sessions loaded successfully'
    PRINT 'Time Taken (seconds): '
        + CAST(DATEDIFF(MILLISECOND, @TaskStartTime, @TaskEndTime) / 1000.0 AS VARCHAR(20))
    PRINT '---------------------------------------------------------'


    COMMIT TRANSACTION;

    SET @ProcessEndTime = SYSDATETIME();

    PRINT '========================================================='
    PRINT 'ALL BULK INSERT TASKS COMPLETED SUCCESSFULLY'
    PRINT 'Total Execution Time (seconds): '
        + CAST(DATEDIFF(MILLISECOND, @ProcessStartTime, @ProcessEndTime) / 1000.0 AS VARCHAR(20))
    PRINT 'End Time: ' + CONVERT(VARCHAR, @ProcessEndTime, 120)
    PRINT '========================================================='

END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT '========================================================='
    PRINT 'ERROR OCCURRED DURING BULK INSERT'
    PRINT 'TRANSACTION ROLLED BACK'
    PRINT '========================================================='

    PRINT 'Error Number   : ' + CAST(ERROR_NUMBER() AS VARCHAR(10))
    PRINT 'Error Severity : ' + CAST(ERROR_SEVERITY() AS VARCHAR(10))
    PRINT 'Error State    : ' + CAST(ERROR_STATE() AS VARCHAR(10))
    PRINT 'Error Line     : ' + CAST(ERROR_LINE() AS VARCHAR(10))
    PRINT 'Error Message  : ' + ERROR_MESSAGE()

END CATCH;
