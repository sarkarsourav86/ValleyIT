﻿CREATE PROCEDURE [dbo].[spRegisterHotel]
	@hotelid varchar(MAX),
	@hotelname varchar(MAX),
	@hotelemail varchar(MAX),
	@hotelphone varchar(20),
	@address1 varchar(MAX),
	@country varchar(MAX),
	@zip varchar(50),
	@city varchar(MAX),
	@state varchar(10),
	@managername varchar(MAX),
	@placeid varchar(MAX),
	@coordinates varchar(MAX)
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
		/*declare @hashedid varchar(MAX)*/
		select @numofhotels= dbo.NoofHotels(@state)
		set @id=UPPER(@state)+@numofhotels
		/*set @hashedid=Convert(varchar(MAX),HASHBYTES('SHA2_256',@id),2)*/
		insert into Hotel ([Property],[Brand],[Property Name],[Property Address Line 1],[Property City],[Property State],
		[Property  Postal Code],[Property Country],[Property Telephone],[Email],[Status],[Property1],[PlaceId],LatLong) values (@hotelid,@hotelname,@hotelname,@address1,@city,@state,@zip,@country,@hotelphone,@hotelemail,'Active',@id,@placeid,@coordinates)
		select 1
	END
