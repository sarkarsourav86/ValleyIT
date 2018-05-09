CREATE TABLE [dbo].[Incedent] (
    [IncedentID]          VARCHAR (MAX)  NOT NULL,
    [IncedentType]        INT           NULL,
    [IncedentDescription] VARCHAR (MAX) NULL,
    [RoomNo]              VARCHAR (50)  NULL,
    [HotelID]             VARCHAR (MAX)  NULL,
    [IncedentTime]        DATETIME      NULL,
    [UserID]              VARCHAR (50)  NULL,
    [FeedbackValue]       INT           NULL,
    CONSTRAINT [PK_Incedent] PRIMARY KEY CLUSTERED ([IncedentID] ASC),
    CONSTRAINT [FK_Incedent_Feedback_options] FOREIGN KEY ([FeedbackValue]) REFERENCES [dbo].[Feedback_options] ([ID]),
    CONSTRAINT [FK_Incedent_Hotel] FOREIGN KEY ([HotelID]) REFERENCES [dbo].[Hotel] ([Property]) on Delete cascade,
    CONSTRAINT [FK_Incedent_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]),
    CONSTRAINT [FK_Incedenttype_Incedent] FOREIGN KEY ([IncedentType]) REFERENCES [dbo].[IncedentTypes] ([TypeID])
);

