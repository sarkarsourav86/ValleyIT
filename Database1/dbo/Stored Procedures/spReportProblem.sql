CREATE PROCEDURE [dbo].[spReportProblem]
	@IncedentType int,
	@IncedentDescription varchar(MAX),
	@RoomNo varchar(50),
	@HotelID varchar(MAX),
	@IncedentTime datetime,
	@UserID int,
	@FeedbackValue int
AS
	declare @checkKey int
	declare @id int
	select @checkKey= count(*) from [dbo].[Hotel] where [Property]=@HotelId
	select @id=Id from Hotel where Property=@HotelId
	IF @checkKey =1
	begin
		declare @countRows int
		--select @countRows=count(*)+1 from [dbo].Incedent where [HotelId]=@HotelId
		
		insert into [dbo].Incedent values(@IncedentType,@IncedentDescription,@RoomNo,@id,@IncedentTime,@UserID,@FeedbackValue)
	end

