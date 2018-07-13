CREATE Procedure [dbo].[spInsertUser] 
@UserIdString varchar(MAX),
@LastName nvarchar(50),
@RoomNo nvarchar(50),
@CheckOutDate datetime,
@Email nvarchar(50),
@HotelID nvarchar(MAX),
@Phone as varchar(50) as

Begin
declare @res int
declare @id int
select @res =count(*) from [dbo].[Hotel] where Property=@HotelID
IF @res>0
	Begin
		select @id=Id from Hotel where Property=@HotelID
		insert into [dbo].[Users] values (@LastName,@RoomNo,@CheckOutDate,@Email,@id,@UserIdString,0,@Phone,GETDATE())
		SELECT SCOPE_IDENTITY()
	End
ELSE
	Begin
	
		select -100
	End
End