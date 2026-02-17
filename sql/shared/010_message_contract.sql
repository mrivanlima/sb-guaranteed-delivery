-- =============================================
-- Message Type and Contract
-- Shared between SenderDb and ReceiverDb
-- =============================================

-- Use the database you are deploying to before running this script
-- Example:
-- USE SenderDb;
-- GO

-- Create Message Type (JSON payload)
IF NOT EXISTS (
    SELECT 1 
    FROM sys.service_message_types 
    WHERE name = 'OrderCreatedMessage'
)
BEGIN
    CREATE MESSAGE TYPE [OrderCreatedMessage]
    VALIDATION = NONE; -- JSON validation handled in app layer
END
GO

-- Create Contract
IF NOT EXISTS (
    SELECT 1 
    FROM sys.service_contracts 
    WHERE name = 'OrderContract'
)
BEGIN
    CREATE CONTRACT [OrderContract]
    (
