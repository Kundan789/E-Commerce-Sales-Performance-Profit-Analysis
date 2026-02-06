/* ============================================================
   Schema Setup
   Purpose : Create logical data layers
   ============================================================ */

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'mff')
BEGIN
    CREATE SCHEMA mff;
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'mffa')
BEGIN
    CREATE SCHEMA mffa;
END;
GO
