CREATE TABLE [dbo].[Users] (
    [UserID]       INT IDENTITY(1,1) NOT NULL,
    [LastName]     VARCHAR (50) NULL,
    [RoomNo]       VARCHAR (50) NULL,
    [CheckOutDate] DATETIME     NULL,
    [Email]        VARCHAR (50) NULL,
    [HotelID]      INT NOT NULL,
    [UserIdString] VARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([UserID] ASC),
	CONSTRAINT [FK_User_Hotel] FOREIGN KEY ([HotelID]) REFERENCES [dbo].[Hotel] ([Id]) on Delete cascade
);

