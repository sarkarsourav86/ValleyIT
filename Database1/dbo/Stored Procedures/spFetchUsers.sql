CREATE PROCEDURE [dbo].[spFetchUsers]
	
	@id int
AS
	SELECT [LastName],[RoomNo],[CheckOutDate],[Email],[HotelID] from Users where [UserID]=@id

