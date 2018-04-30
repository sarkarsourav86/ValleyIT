CREATE TABLE [dbo].[Hotel] (
    [Property]                        VARCHAR (50)  NOT NULL,
    [Brand]                           VARCHAR (MAX) NULL,
    [Property Name]                   VARCHAR (MAX) NULL,
    [Property Address Line 1]         VARCHAR (MAX) NULL,
    [Property Address Line 2]         VARCHAR (MAX) NULL,
    [Property City]                   VARCHAR (MAX) NULL,
    [Property State]                  VARCHAR (MAX) NULL,
    [Property  Postal Code]           VARCHAR (MAX) NULL,
    [Property Country]                VARCHAR (MAX) NULL,
    [Property Telephone]              VARCHAR (MAX) NULL,
    [Property Fax]                    VARCHAR (MAX) NULL,
    [Property Number of Rooms]        VARCHAR (MAX) NULL,
    [Property General Manager]        VARCHAR (MAX) NULL,
    [Property Contact Description]    VARCHAR (MAX) NULL,
    [Property Contact Name]           VARCHAR (MAX) NULL,
    [Property Contact Address Line 1] VARCHAR (MAX) NULL,
    [Property Contact Address Line 2] VARCHAR (MAX) NULL,
    [Property Contact Address Line 3] VARCHAR (MAX) NULL,
    [Property Contact City]           VARCHAR (MAX) NULL,
    [Property Contact State]          VARCHAR (MAX) NULL,
    [Property Contact Postal Code]    VARCHAR (MAX) NULL,
    [Email]                           VARCHAR (MAX) NULL,
    [DummyEmail] VARCHAR(MAX) NULL, 
    [Id] VARBINARY(MAX) NULL, 
    [Status] VARCHAR(50) NULL DEFAULT 'Active', 
    CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED ([Property] ASC)
);


GO
ALTER TABLE [dbo].[Hotel] SET (LOCK_ESCALATION = DISABLE);

