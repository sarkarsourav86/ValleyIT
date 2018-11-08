CREATE TABLE [dbo].[PropertyAdmins]
(
	[Id] INT identity(1,1) NOT NULL PRIMARY KEY, 
    [UserName] VARCHAR(MAX) NULL, 
    [Password] VARCHAR(MAX) NULL, 
    [PropertyId] int NULL, 
    [Role] VARCHAR(50) NULL, 
    [Image] VARBINARY(MAX) NULL, 
    CONSTRAINT [FK_PropertyAdmins_Hotel] FOREIGN KEY ([PropertyId]) REFERENCES hotel([Id]) 
)
