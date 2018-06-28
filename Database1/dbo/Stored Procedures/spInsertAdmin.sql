CREATE PROCEDURE [dbo].[spInsertAdmin]
	@username varchar(MAX),
	@password varchar(MAX),
	@hotelid varchar(MAX),
	@role varchar(50)
AS
	declare @hotelintid int
	select @hotelintid=Id from Hotel where Property=@hotelid
	insert into PropertyAdmins values(@username,@password,@hotelintid,@role)
