CREATE PROCEDURE [dbo].[spValidateUserById]
	@UserIdString varchar(MAX)
	
AS
	
	select count(*) from Users where UserIdString=@UserIdString
	

