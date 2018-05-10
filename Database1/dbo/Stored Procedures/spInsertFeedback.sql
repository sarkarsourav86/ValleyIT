CREATE proc [dbo].[spInsertFeedback] 
@HotelId int,
@UserId int,
@RoomFeedback int,
@FrontDeskFeedback int,
@ReservationFeedback int,
@HousekeepingFeedback int,
@BreakfastFeedback int,
@WiFiFeedback int,
@MaintenanceFeedback int,
@PoolFeedback int,
@CommonFeedback int,
@ParkingFeedback int,
@HotelRating int,
@comments varchar(MAX)
as
Begin
	declare @checkKey int
	select @checkKey= count(*) from [dbo].[Hotel] where [Property]=@HotelId
	IF @checkKey =1
	begin
		declare @countRows int
		select @countRows=count(*)+1 from [dbo].[FeedbackTable] where [HotelId]=@HotelId
		
		insert into [dbo].[FeedbackTable] values(@HotelId,@UserId,@RoomFeedback,@FrontDeskFeedback,@ReservationFeedback,@HousekeepingFeedback,@BreakfastFeedback,@WiFiFeedback,@MaintenanceFeedback,@PoolFeedback,@CommonFeedback,@ParkingFeedback,@HotelRating,@comments)
	end
End