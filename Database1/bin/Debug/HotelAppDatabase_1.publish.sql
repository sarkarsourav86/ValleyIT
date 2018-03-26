﻿/*
Deployment script for ExperienceHotelApp

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "ExperienceHotelApp"
:setvar DefaultFilePrefix "ExperienceHotelApp"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating [dbo].[spReportProblem]...';


GO
CREATE PROCEDURE [dbo].[spReportProblem]
	@IncedentType int,
	@IncedentDescription int,
	@RoomNo varchar(50),
	@HotelID varchar(50),
	@IncedentTime datetime,
	@UserID varchar(50),
	@FeedbackValue int
AS
	declare @checkKey int
	select @checkKey= count(*) from [dbo].[Hotel] where [Property]=@HotelId
	IF @checkKey =1
	begin
		declare @countRows int
		select @countRows=count(*)+1 from [dbo].Incedent where [HotelId]=@HotelId
		declare @IncedentID varchar(50)
		set @IncedentID=@HotelId+'_'+trim(str(@countRows))
		insert into [dbo].Incedent values(@IncedentID,@IncedentType,@IncedentDescription,@RoomNo,@HotelID,@IncedentTime,@UserID,@FeedbackValue)
	end
GO
PRINT N'Update complete.';


GO
