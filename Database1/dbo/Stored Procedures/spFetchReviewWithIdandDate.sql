CREATE PROCEDURE [dbo].[spFetchReviewWithIdandDate]
	@hotelid int,
	@start datetime,
	@end datetime
	
AS
	SELECT * from FeedbackTable where HotelId=@hotelid and CONVERT(date,ReviewTime)>=CONVERT(date,@start) and CONVERT(date,ReviewTime)<=CONVERT(date,@end)

