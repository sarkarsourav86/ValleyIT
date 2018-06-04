CREATE PROCEDURE [dbo].[SpFetchUserstoSendEmail]
as
 select H.[Property Name],U.HotelID, U.RoomNo,U.LastName,U.Email,U.UserID,H.Property,H.PlaceId from Users U, Hotel H where convert(date,CheckOutDate)=convert(date,GETDATE()) and H.Id=U.HotelID


