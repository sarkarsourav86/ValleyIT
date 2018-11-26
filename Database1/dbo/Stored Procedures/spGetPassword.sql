CREATE PROCEDURE [dbo].[spGetPassword]
	@username varchar(MAX)
AS
	select top 1 Password from PropertyAdmins where UserName=@username

