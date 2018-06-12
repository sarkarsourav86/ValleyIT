CREATE PROCEDURE [dbo].[spFetchUsers]
	
	@id varchar(MAX)
AS
	SELECT [UserID],[LastName],[RoomNo],[CheckOutDate],[Email],[HotelID] from Users where UserIdString=@id

