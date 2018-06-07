CREATE PROCEDURE [dbo].[spFetchUsers]
	
	@id int
AS
	SELECT [LastName],[RoomNo],[CheckOutDate],[Email],[HotelID],[UserIdString] from Users where [UserID]=@id

