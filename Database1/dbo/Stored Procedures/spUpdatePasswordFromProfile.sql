CREATE PROCEDURE [dbo].[spUpdatePasswordFromProfile]
	@username varchar(MAX),
	@password varchar(MAX)
AS
	update PropertyAdmins set Password=@password where UserName=@username

