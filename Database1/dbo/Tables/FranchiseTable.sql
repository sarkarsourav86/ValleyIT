CREATE TABLE [dbo].[FranchiseTable]
(
	[Id] INT Identity(1,1) NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(MAX) NULL, 
    [RewardsLink] VARCHAR(MAX) NULL, 
    [RewardsName] VARCHAR(MAX) NULL
)
