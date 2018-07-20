CREATE PROCEDURE [dbo].[spFetchProblemsByHotelId]
	@hotelid int,
	@top int=0
AS
if @top>0
	SELECT top 5 i.IncedentID, RoomNo,it.Type,IncedentDescription,IncedentTime,i.IsResolved,(select FieldText from Feedback_options where ID=FeedbackValue) Problem, 
	CASE FeedbackValue
		WHEN 1 Then 'green'
		WHEN 2 Then 'purple'
		WHEN 3 Then 'orange'
		WHEN 4 Then 'red'
		ELSE null
	END
	as Color
	from Incedent i,IncedentTypes it where HotelID=@hotelid and it.TypeID=i.IncedentType  and FeedbackValue<>1 order by IncedentTime desc
else
	SELECT i.IncedentID, RoomNo,it.Type,IncedentDescription,IncedentTime,i.IsResolved,(select FieldText from Feedback_options where ID=FeedbackValue) Problem,
	CASE FeedbackValue
		WHEN 1 Then 'green'
		WHEN 2 Then 'purple'
		WHEN 3 Then 'orange'
		WHEN 4 Then 'red'
		ELSE null
	END
	as Color
	from Incedent i,IncedentTypes it where HotelID=@hotelid and it.TypeID=i.IncedentType  and FeedbackValue<>1 order by IncedentTime desc

