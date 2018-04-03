CREATE PROCEDURE [dbo].[spfetchHotel]
	@hotelID nvarchar(50)
AS
	SELECT [Property],[Brand],[Property Name],[Property Address Line 1],[Property Address Line 2],[Property City],[Property State],[Property  Postal Code],[Property Telephone],[Property Fax],[Property Number of Rooms],
[Property General Manager],[Property Contact Description],[Property Contact Name],[DummyEmail] from Hotel where [Property]=@hotelID

