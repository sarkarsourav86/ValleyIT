CREATE TABLE [dbo].[ResetPassword]
(
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [Email] VARCHAR(MAX) NULL, 
    [ResetCode] VARCHAR(MAX) NULL
)
