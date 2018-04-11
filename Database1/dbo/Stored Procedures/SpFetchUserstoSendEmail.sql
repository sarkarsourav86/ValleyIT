CREATE PROCEDURE [dbo].[SpFetchUserstoSendEmail]
as
 select H.[Property Name],U.HotelID, U.RoomNo,U.LastName,U.Email from Users U, Hotel H where convert(date,CheckOutDate)=convert(date,GETDATE()) and H.Property=U.HotelID


