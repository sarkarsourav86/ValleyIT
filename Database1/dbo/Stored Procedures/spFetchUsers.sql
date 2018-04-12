CREATE PROCEDURE [dbo].[spFetchUsers]
	
	@id varchar(50)
AS
	SELECT [LastName],[RoomNo],[CheckOutDate],[Email],[HotelID] from Users where [UserID]=@id

