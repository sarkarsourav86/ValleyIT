CREATE PROCEDURE [dbo].[SpFetchUserstoSendEmail]
as
 declare @isNextDayForUTC int=0

 select @isNextDayForUTC=  1 where CONVERT(time, getdate())>= '00:00:00' and CONVERT(time, getdate())<= '07:00:00'
 IF @isNextDayForUTC=1 
 BEGIN
	select H.[Property Name],U.HotelID, U.RoomNo,U.LastName,U.Email,U.UserID,H.Property,H.PlaceId, U.UserIdString from Users U, Hotel H where DATEADD(day, 1, convert(date,CheckOutDate))=convert(date,GETDATE()) and H.Id=U.HotelID and (U.HasReviewed is null or U.HasReviewed=0)
 END
 ELSE 
	select H.[Property Name],U.HotelID, U.RoomNo,U.LastName,U.Email,U.UserID,H.Property,H.PlaceId, U.UserIdString from Users U, Hotel H where convert(date,CheckOutDate)=convert(date,GETDATE()) and H.Id=U.HotelID and (U.HasReviewed is null or U.HasReviewed=0)


