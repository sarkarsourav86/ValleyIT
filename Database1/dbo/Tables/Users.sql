﻿CREATE TABLE [dbo].[Users] (
    [UserID]       VARCHAR (50) NOT NULL,
    [LastName]     VARCHAR (50) NULL,
    [RoomNo]       VARCHAR (50) NULL,
    [CheckOutDate] DATETIME     NULL,
    [Email]        VARCHAR (50) NULL,
    [HotelID]      VARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([UserID] ASC),
	CONSTRAINT [FK_User_Hotel] FOREIGN KEY ([HotelID]) REFERENCES [dbo].[Hotel] ([Property]) on Delete cascade
);

