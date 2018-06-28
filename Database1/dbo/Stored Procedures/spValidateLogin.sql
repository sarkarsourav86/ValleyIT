CREATE PROCEDURE [dbo].[spValidateLogin]
	@username varchar(MAX),
	@password varchar(MAX)
AS
	SELECT PropertyId, Role from PropertyAdmins where UserName=@username and Password=@password
RETURN 0
