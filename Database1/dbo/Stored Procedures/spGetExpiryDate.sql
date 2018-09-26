CREATE PROCEDURE [dbo].[spGetExpiryDate]
	@hotelid varchar(max)
AS
	select ExpiryDate from Payment where value=(select PaymentId from Hotel where Property=@hotelid)

