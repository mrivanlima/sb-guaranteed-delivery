-- =============================================
-- ReceiverDb: Target Queue + Service
-- =============================================
USE ReceiverDb;
GO

-- Queue
IF OBJECT_ID(N'dbo.TargetQueue', N'SQ') IS NULL
BEGIN
    CREATE QUEUE dbo.TargetQueue;
END
GO

-- Service
IF NOT EXISTS (
    SELECT 1
    FROM sys.services
    WHERE name = N'TargetService'
)
BEGIN
    CREATE SERVICE [TargetService]
    ON QUEUE dbo.TargetQueue
    ([OrderContract]);
END
GO
