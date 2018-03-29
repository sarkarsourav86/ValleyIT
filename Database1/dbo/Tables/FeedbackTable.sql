﻿CREATE TABLE [dbo].[FeedbackTable] (
    [FeedbackId]   VARCHAR (50) NOT NULL,
    [HotelId]      VARCHAR (50) NULL,
    [UserId]       VARCHAR (50) NULL,
    [Room]         NCHAR (10)   NULL,
    [Frontdesk]    NCHAR (10)   NULL,
    [Reservation]  NCHAR (10)   NULL,
    [Housekeeping] NCHAR (10)   NULL,
    [Breakfast]    NCHAR (10)   NULL,
    [WiFi]         NCHAR (10)   NULL,
    [Maintenance]  NCHAR (10)   NULL,
    [Pool]         NCHAR (10)   NULL,
    [Common]       NCHAR (10)   NULL,
    [Parking]      NCHAR (10)   NULL,
    [Rating]       NCHAR (10)   NULL,
    CONSTRAINT [PK_FeedbackTable] PRIMARY KEY CLUSTERED ([FeedbackId] ASC),
    CONSTRAINT [FK_FeedbackTable_Hotel] FOREIGN KEY ([HotelId]) REFERENCES [dbo].[Hotel] ([Property]),
    CONSTRAINT [FK_FeedbackTable_UsersTable] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserID])
);
