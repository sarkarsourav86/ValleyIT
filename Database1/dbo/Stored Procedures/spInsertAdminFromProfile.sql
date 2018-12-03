CREATE PROCEDURE [dbo].[spInsertAdminFromProfile]
	@username varchar(MAX),
	@password varchar(MAX),
	@hotelid int,
	@role varchar(50)
AS
	
	insert into PropertyAdmins values(@username,@password,@hotelid,@role,null)
