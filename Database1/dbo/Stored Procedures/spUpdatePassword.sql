CREATE PROCEDURE [dbo].[spUpdatePassword]
	@email varchar(MAX),
	@resetcode varchar(MAX),
	@password varchar(MAX)
AS
	declare @count int
	select @count= count(*) from ResetPassword where Email=@email and ResetCode=@resetcode
	if @count>0
	BEGIN
		update PropertyAdmins set Password=@password where UserName=@email
		delete from ResetPassword where Email=@email and ResetCode=@resetcode
		Select 1 as RetCode
	END
	else
	BEGIN
		Select 0 as RetCode
	END
