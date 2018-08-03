CREATE PROCEDURE [dbo].[spFetchProblemsWithinDateRange]
	@hotelid int,
	@start date,
	@end date
AS
	select count(HotelID) as count,CONVERT(date,IncedentTime) as date from Incedent where HotelID=@hotelid and CONVERT(date,IncedentTime)>=@start and CONVERT(date,IncedentTime)<=@end group by CONVERT(date,IncedentTime)

