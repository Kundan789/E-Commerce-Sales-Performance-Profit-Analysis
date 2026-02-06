/* =========================================================
   Project: Maven Fuzzy Factory
   Purpose: Drop and Recreate Core Tables
   Schema : mff
   Author : Kundan
   Date   : 23-01-2026
   ========================================================= */

SET NOCOUNT ON;
SET XACT_ABORT ON;   -- Automatically rollback on runtime errors

BEGIN TRY
    BEGIN TRANSACTION;

    PRINT '========================================================='
    PRINT 'STARTING TABLE RECREATION PROCESS'
    PRINT '========================================================='


    /* =========================================================
       TASK 1: mff.order_items
       ========================================================= */
    PRINT 'TASK 1: Recreating table mff.order_items'

    IF OBJECT_ID('mff.order_items', 'U') IS NOT NULL
    BEGIN
        DROP TABLE mff.order_items;
        PRINT 'Table mff.order_items dropped successfully'
    END

    CREATE TABLE mff.order_items (
        order_item_id     INT,
        created_at        DATETIME,
        order_id          INT,
        product_id        INT,
        is_primary_item   INT,
        price_usd         FLOAT,
        cogs_usd          FLOAT
    );

    PRINT 'Table mff.order_items created successfully'
    PRINT '---------------------------------------------------------'


    /* =========================================================
       TASK 2: mff.orders
       ========================================================= */
    PRINT 'TASK 2: Recreating table mff.orders'

    IF OBJECT_ID('mff.orders', 'U') IS NOT NULL
    BEGIN
        DROP TABLE mff.orders;
        PRINT 'Table mff.orders dropped successfully'
    END

    CREATE TABLE mff.orders (
        order_id              INT,
        created_at            DATETIME,
        website_session_id    INT,
        user_id               INT,
        primary_product_id    INT,
        items_purchased       INT,
        price_usd             FLOAT,
        cogs_usd              FLOAT
    );

    PRINT 'Table mff.orders created successfully'
    PRINT '---------------------------------------------------------'


    /* =========================================================
       TASK 3: mff.products
       ========================================================= */
    PRINT 'TASK 3: Recreating table mff.products'

    IF OBJECT_ID('mff.products', 'U') IS NOT NULL
    BEGIN
        DROP TABLE mff.products;
        PRINT 'Table mff.products dropped successfully'
    END

    CREATE TABLE mff.products (
        product_id     INT,
        created_at     DATETIME,
        product_name   VARCHAR(255)
    );

    PRINT 'Table mff.products created successfully'
    PRINT '---------------------------------------------------------'


    /* =========================================================
       TASK 4: mff.order_item_refunds
       ========================================================= */
    PRINT 'TASK 4: Recreating table mff.order_item_refunds'

    IF OBJECT_ID('mff.order_item_refunds', 'U') IS NOT NULL
    BEGIN
        DROP TABLE mff.order_item_refunds;
        PRINT 'Table mff.order_item_refunds dropped successfully'
    END

    CREATE TABLE mff.order_item_refunds (
        order_item_refund_id   INT,
        created_at             DATETIME,
        order_item_id          INT,
        order_id               INT,
        refund_amount_usd      FLOAT
    );

    PRINT 'Table mff.order_item_refunds created successfully'
    PRINT '---------------------------------------------------------'


    /* =========================================================
       TASK 5: mff.maven_fuzzy_factory_data_dictionary
       ========================================================= */
    PRINT 'TASK 5: Recreating table mff.maven_fuzzy_factory_data_dictionary'

    IF OBJECT_ID('mff.maven_fuzzy_factory_data_dictionary', 'U') IS NOT NULL
    BEGIN
        DROP TABLE mff.maven_fuzzy_factory_data_dictionary;
        PRINT 'Table mff.maven_fuzzy_factory_data_dictionary dropped successfully'
    END

    CREATE TABLE mff.maven_fuzzy_factory_data_dictionary (
        table_name   VARCHAR(255),
        field_name   VARCHAR(255),
        description  VARCHAR(255)
    );

    PRINT 'Table mff.maven_fuzzy_factory_data_dictionary created successfully'
    PRINT '---------------------------------------------------------'


    /* =========================================================
       TASK 6: mff.website_sessions
       ========================================================= */
    PRINT 'TASK 6: Recreating table mff.website_sessions'

    IF OBJECT_ID('mff.website_sessions', 'U') IS NOT NULL
    BEGIN
        DROP TABLE mff.website_sessions;
        PRINT 'Table mff.website_sessions dropped successfully'
    END

    CREATE TABLE mff.website_sessions (
        website_session_id   INT,
        created_at           DATETIME,
        user_id              INT,
        is_repeat_session    INT,
        utm_source           VARCHAR(255),
        utm_campaign         VARCHAR(255),
        utm_content          VARCHAR(255),
        device_type          VARCHAR(255),
        http_referer         VARCHAR(255)
    );

    PRINT 'Table mff.website_sessions created successfully'
    PRINT '---------------------------------------------------------'


    COMMIT TRANSACTION;

    PRINT '========================================================='
    PRINT 'ALL TASKS COMPLETED SUCCESSFULLY'
    PRINT 'ALL TABLES HAVE BEEN CREATED'
    PRINT '========================================================='

END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT '========================================================='
    PRINT 'ERROR OCCURRED - TRANSACTION ROLLED BACK'
    PRINT '========================================================='

    PRINT 'Error Number   : ' + CAST(ERROR_NUMBER() AS VARCHAR(10))
    PRINT 'Error Severity : ' + CAST(ERROR_SEVERITY() AS VARCHAR(10))
    PRINT 'Error State    : ' + CAST(ERROR_STATE() AS VARCHAR(10))
    PRINT 'Error Line     : ' + CAST(ERROR_LINE() AS VARCHAR(10))
    PRINT 'Error Message  : ' + ERROR_MESSAGE()

END CATCH;
