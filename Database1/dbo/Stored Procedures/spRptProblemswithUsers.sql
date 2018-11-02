CREATE PROCEDURE [dbo].[spRptProblemswithUsers]
	@hotelid int
AS
	select I.RoomNo,(select t.Type from IncedentTypes t where t.TypeID=I.IncedentType) Problem,(select fo.FieldText from Feedback_options fo where fo.ID=I.FeedbackValue) feedback,I.IncedentDescription,I.IncedentTime, u.LastName,u.Email,u.Phone, U.CheckOutDate,U.CheckInDate from Incedent I, Users u where I.UserID=u.UserID and I.HotelID=@hotelid

