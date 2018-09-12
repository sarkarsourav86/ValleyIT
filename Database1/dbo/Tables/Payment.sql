CREATE TABLE [dbo].[Payment]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Value] VARCHAR(MAX) NULL, 
    [Email] VARCHAR(100) NULL, 
    [Registered] BIT NULL, 
    [Amount] MONEY NULL, 
    [PaymentDate] DATETIME NULL, 
    [ExpiryDate] DATETIME NULL, 
    
)
