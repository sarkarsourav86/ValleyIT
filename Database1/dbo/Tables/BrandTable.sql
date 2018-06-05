CREATE TABLE [dbo].[BrandTable]
(
	[Id] INT Identity(1,1) NOT NULL PRIMARY KEY, 
    [FranchiseId] INT NULL, 
    [BrandName] VARCHAR(MAX) NULL 
)
