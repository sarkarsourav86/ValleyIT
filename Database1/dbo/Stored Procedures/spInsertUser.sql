CREATE Procedure [dbo].[spInsertUser] 
@LastName nvarchar(50),
@RoomNo nvarchar(50),
@CheckOutDate datetime,
@Email nvarchar(50),
@HotelID nvarchar(50) as

Begin
declare @res int
select @res =count(*) from [dbo].[Hotel] where Property=@HotelID
IF @res>0
	Begin
		declare @newId varchar(50)
		select @newId=@HotelID+'_'+trim(str(count(*)+1)) from [dbo].[Users] where [HotelID]=@HotelID
		insert into [dbo].[Users] values (@newId,@LastName,@RoomNo,@CheckOutDate,@Email,@HotelID)
	End
ELSE
	Begin
	
		select @res as retcode
	End
End