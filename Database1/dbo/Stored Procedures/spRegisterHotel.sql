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
		declare @hashedid varbinary(MAX)
		select @numofhotels= MAX(SUBSTRING([Property],3,LEN([Property])))+1 from Hotel where [Property] like UPPER(@state)+'%'
		set @id=UPPER(@state)+@numofhotels
		set @hashedid=HASHBYTES('SHA2_256',@id)
		insert into Hotel ([Property],[Brand],[Property Name],[Property Address Line 1],[Property Address Line 2],[Property City],[Property State],
		[Property  Postal Code],[Property Country],[Property Telephone],[Email],Id,[Status]) values (@id,@brand,@hotelname,@address1,@address2,@city,@state,@zip,@country,@hotelphone,@hotelemail,@hashedid,'Active')
		select 1
	END
