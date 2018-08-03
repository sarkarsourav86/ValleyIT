CREATE PROCEDURE [dbo].[spCountReports]
	@hotelid int,
	@startdate date,
	@enddate date
AS
	declare @problemCount int
	declare @starCount int
	declare @signupCount int
	select @problemCount= count(HotelID) from Incedent where HotelID=@hotelid and convert(date,IncedentTime)>=@startdate and convert(date,IncedentTime)<=@enddate
	select @starCount= count(FeedbackId) from FeedbackTable where HotelID=@hotelid and convert(date,ReviewTime)>=@startdate and convert(date,ReviewTime)<=@enddate
	select @signupCount= count(UserID) from Users u where HotelID=@hotelid and convert(date,u.CheckInDate)>=@startdate and convert(date,u.CheckInDate)<=@enddate
	select @problemCount as problems,@starCount as stars,@signupCount as users

