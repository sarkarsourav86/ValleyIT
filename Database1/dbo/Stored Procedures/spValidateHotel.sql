CREATE PROCEDURE [dbo].[spValidateHotel]
	@hotelid varchar(max)
AS
	SELECT [Property Name] from Hotel where Property=@hotelid

