CREATE PROCEDURE [dbo].[spInsertPasswordResetRequest]
	@email varchar(MAX),
	@resetcode varchar(MAX)
AS
	insert into ResetPassword(Email,ResetCode) values(@email,@resetcode)