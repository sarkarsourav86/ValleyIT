CREATE PROCEDURE [dbo].[spFetchUserStatus]
	@hotelid int
AS
declare @numofusers int;
declare @numofgoodreviews int
declare @numofbadreviews int
declare @numofresolvedproblems int
select @numofusers= count(*) from users where HotelID=@hotelid and CONVERT(date,CheckInDate)=CONVERT(date, getdate())
select @numofgoodreviews=count(*) from FeedbackTable ft where ft.HotelId=@hotelid and ft.Rating>3 and (CONVERT(date,ft.ReviewTime)<=CONVERT(date,GETDATE()) or CONVERT(date,ft.ReviewTime) >CONVERT(date,DATEADD(day,-30,GETDATE())))
select @numofbadreviews=count(*) from FeedbackTable ft where ft.HotelId=@hotelid and ft.Rating<=3 and (CONVERT(date,ft.ReviewTime)<=CONVERT(date,GETDATE()) or CONVERT(date,ft.ReviewTime) >CONVERT(date,DATEADD(day,-30,GETDATE())))
select @numofresolvedproblems=count(*) from Incedent where HotelID=@hotelid and IsResolved=1 and (CONVERT(date,IncedentTime)<=CONVERT(date,GETDATE()) or CONVERT(date,IncedentTime) >CONVERT(date,DATEADD(day,-30,GETDATE())))
select @numofusers Users,@numofgoodreviews Good,@numofbadreviews Bad,@numofresolvedproblems Resolved