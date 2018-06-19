CREATE proc [dbo].[spInsertFeedback] 
@HotelId varchar(MAX),
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
@comments varchar(MAX),
@problemtype int
as
Begin
	declare @checkKey int
	select @checkKey= count(*) from [dbo].[Hotel] where Property=@HotelId
	IF @checkKey =1
	begin
		declare @id int
		select @id=  Id from Hotel where Property=@HotelId
		update users set HasReviewed=1 where UserID=@UserId
		insert into [dbo].[FeedbackTable] values(@Id,@UserId,@RoomFeedback,@FrontDeskFeedback,@ReservationFeedback,@HousekeepingFeedback,@BreakfastFeedback,@WiFiFeedback,@MaintenanceFeedback,@PoolFeedback,@CommonFeedback,@ParkingFeedback,@HotelRating,@comments,@problemtype)

	end
End