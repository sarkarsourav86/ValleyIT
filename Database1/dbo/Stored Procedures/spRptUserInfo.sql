CREATE PROCEDURE [dbo].[spRptUserInfo]
	@hotelid int
AS
	select u.UserID ID,u.Email,u.Phone,u.LastName Name,u.RoomNo,u.CheckInDate,u.CheckOutDate from Users u where u.HotelID=@hotelid

