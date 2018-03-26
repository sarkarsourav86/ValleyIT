CREATE PROCEDURE [dbo].[spReportProblem]
	@IncedentType int,
	@IncedentDescription int,
	@RoomNo varchar(50),
	@HotelID varchar(50),
	@IncedentTime datetime,
	@UserID varchar(50),
	@FeedbackValue int
AS
	declare @checkKey int
	select @checkKey= count(*) from [dbo].[Hotel] where [Property]=@HotelId
	IF @checkKey =1
	begin
		declare @countRows int
		select @countRows=count(*)+1 from [dbo].Incedent where [HotelId]=@HotelId
		declare @IncedentID varchar(50)
		set @IncedentID=@HotelId+'_'+trim(str(@countRows))
		insert into [dbo].Incedent values(@IncedentID,@IncedentType,@IncedentDescription,@RoomNo,@HotelID,@IncedentTime,@UserID,@FeedbackValue)
	end

