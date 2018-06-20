CREATE TABLE [dbo].[FeedbackTable] (
    [FeedbackId]   int IDENTITY(1,1) NOT NULL,
    [HotelId]      INT NULL,
    [UserId]       INT NULL,
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
    [Comments] VARCHAR(MAX) NULL, 
    [Problem] VARCHAR(50) NULL, 
    [AboutUs] VARCHAR(50) NULL, 
    CONSTRAINT [PK_FeedbackTable] PRIMARY KEY CLUSTERED ([FeedbackId] ASC),
    CONSTRAINT [FK_FeedbackTable_Hotel] FOREIGN KEY ([HotelId]) REFERENCES [dbo].[Hotel] ([Id]) on delete cascade,
    CONSTRAINT [FK_FeedbackTable_UsersTable] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserID])
);

