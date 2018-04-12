CREATE PROCEDURE [dbo].[spfetchHotel]
	@hotelID nvarchar(50)
AS
	SELECT [Property],[Brand],[Property Name],[Property Address Line 1],[Property Address Line 2],[Property City],[Property State],[Property  Postal Code] as PostalCode,[Property Telephone],[Property Fax],[Property Number of Rooms],
[Property General Manager],[Property Contact Description],[Property Contact Name],[Property Contact Address Line 1],[Property Contact Address Line 2],[Property Contact Address Line 3],[Property Contact City],[Property Contact State],[Property Contact Postal Code][DummyEmail] from Hotel where [Property]=@hotelID

