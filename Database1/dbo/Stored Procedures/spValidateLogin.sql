CREATE PROCEDURE [dbo].[spValidateLogin]
	@username varchar(MAX),
	@password varchar(MAX)
AS
	SELECT PropertyId,(select [Property Name] from Hotel where Id=PropertyId ) as Name,(select [Property] from Hotel where Id=PropertyId ) LongId, UserName, Role from PropertyAdmins where UserName=@username and Password=@password
RETURN 0
