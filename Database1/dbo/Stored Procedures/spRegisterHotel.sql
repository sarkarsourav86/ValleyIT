CREATE PROCEDURE [dbo].[spRegisterHotel]
	@brand varchar(MAX),
	@hotelname varchar(MAX),
	@hotelemail varchar(MAX),
	@hotelphone varchar(20),
	@address1 varchar(MAX),
	@address2 varchar(MAX),
	@country varchar(MAX),
	@zip varchar(50),
	@city varchar(MAX),
	@state varchar(10),
	@managername varchar(MAX)
AS
	declare @count int
	select @count=count(*) from Hotel where Hotel.Email=@hotelemail
	if(@count>0) 
	BEGIN
		select 0
	END
	else
	BEGIN
		declare @numofhotels varchar(50)
		declare @id varchar(50)
		declare @hashedid varchar(MAX)
		select @numofhotels= dbo.NoofHotels(@state)
		set @id=UPPER(@state)+@numofhotels
		set @hashedid=Convert(varchar(MAX),HASHBYTES('SHA2_256',@id),2)
		insert into Hotel ([Property],[Brand],[Property Name],[Property Address Line 1],[Property Address Line 2],[Property City],[Property State],
		[Property  Postal Code],[Property Country],[Property Telephone],[Email],[Status],[Property1]) values (@hashedid,@brand,@hotelname,@address1,@address2,@city,@state,@zip,@country,@hotelphone,@hotelemail,'Active',@id)
		select 1
	END
