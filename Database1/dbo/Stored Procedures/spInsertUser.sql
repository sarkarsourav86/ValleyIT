CREATE Procedure [dbo].[spInsertUser] 
@LastName nvarchar(50),
@RoomNo nvarchar(50),
@CheckOutDate datetime,
@Email nvarchar(50),
@HotelID nvarchar(MAX) as

Begin
declare @res int

select @res =count(*) from [dbo].[Hotel] where Property1=@HotelID
IF @res>0
	Begin
		declare @newId varchar(50)
		select @newId=Property1 from Hotel where Property1=@HotelID
		select @newId=@newId+'_'+trim(str(count(*)+1)) from [dbo].[Users] where [HotelID]=@HotelID
		insert into [dbo].[Users] values (@newId,@LastName,@RoomNo,@CheckOutDate,@Email,@HotelID)
		select @newId
	End
ELSE
	Begin
	
		select ''
	End
End