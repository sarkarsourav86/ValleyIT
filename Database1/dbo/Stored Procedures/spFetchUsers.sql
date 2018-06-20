CREATE PROCEDURE [dbo].[spFetchUsers]
	
	@id varchar(MAX)
AS
	SELECT [UserID],[LastName],[RoomNo],[CheckOutDate],[Email],[HotelID],[Phone] from Users where UserIdString=@id

