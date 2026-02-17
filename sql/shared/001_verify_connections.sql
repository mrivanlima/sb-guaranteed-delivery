-- =============================================
-- Verify which SQL Server we are connected to
-- =============================================

SELECT 
    @@SERVERNAME      AS ServerName,
    DB_NAME()         AS CurrentDatabase,
    @@VERSION         AS SqlVersion;
GO
