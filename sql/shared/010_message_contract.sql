-- =============================================
-- Message Type and Contract
-- =============================================

-- Create Message Type
IF NOT EXISTS (
    SELECT * 
    FROM sys.service_message_types 
    WHERE name = N'OrderCreatedMessage'
)
BEGIN
    CREATE MESSAGE TYPE [OrderCreatedMessage]
    VALIDATION = NONE;
END
GO

-- Create Contract
IF NOT EXISTS (
    SELECT * 
    FROM sys.service_contracts 
    WHERE name = N'OrderContract'
)
BEGIN
    CREATE CONTRACT [OrderContract]
    (
        [OrderCreatedMessage] SENT BY INITIATOR
    );
END
GO
