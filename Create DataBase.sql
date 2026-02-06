/* ============================================================
   Database Creation
   Database : onlinestore
   Purpose  : Analytical project for online store data
   ============================================================ */


/* ============================================================
   Database Initialization Script
   ============================================================ */

IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'onlinestore')
BEGIN
    CREATE DATABASE onlinestore;
END;
GO

USE onlinestore;
GO
