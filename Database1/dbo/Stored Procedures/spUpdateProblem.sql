CREATE PROCEDURE [dbo].[spUpdateProblem]
	@incedentId int,
	@description varchar(max),
	@incedentType int,
	@feedbackValue int,
	@isSolved bit
AS
	update Incedent set IncedentDescription=@description,IncedentType=@incedentType,FeedbackValue=@feedbackValue,IsResolved=@isSolved where IncedentID=@incedentId

