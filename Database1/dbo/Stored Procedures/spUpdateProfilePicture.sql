CREATE PROCEDURE [dbo].[spUpdateProfilePicture]
	@image varbinary(MAX),
	
	@emailid varchar(MAX)
AS
	update PropertyAdmins set Image =@image where UserName=@emailid

