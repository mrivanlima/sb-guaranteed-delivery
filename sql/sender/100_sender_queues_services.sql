-- =============================================
-- SenderDb: Initiator Queue + Service
-- =============================================
USE SenderDb;
GO

-- Queue
IF OBJECT_ID(N'dbo.InitiatorQueue', N'SQ') IS NULL
BEGIN
    CREATE QUEUE dbo.InitiatorQueue;
END
GO

-- Service
IF NOT EXISTS (
    SELECT 1
    FROM sys.services
    WHERE name = N'InitiatorService'
)
BEGIN
    CREATE SERVICE [InitiatorService]
    ON QUEUE dbo.InitiatorQueue
    ([OrderContract]);
END
GO
