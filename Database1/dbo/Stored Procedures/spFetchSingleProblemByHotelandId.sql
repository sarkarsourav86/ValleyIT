CREATE PROCEDURE [dbo].[spFetchSingleProblemByHotelandId]
	@hotelid int,
	@incedentId int
AS
	SELECT I.[IncedentID] Id
      ,I.[IncedentType] Type
      ,I.[IncedentDescription] Descrp
      ,I.[RoomNo] Room
      ,I.[HotelID]
      ,I.[IncedentTime] Time
      ,I.[UserID]
      ,I.[FeedbackValue]
      ,I.[IsResolved],
	  u.Email,
	  u.LastName as name,
	  u.Phone
  FROM [Incedent] I,[Users] U where i.HotelID=@hotelid and i.IncedentID=@incedentId and u.UserID=i.UserID

