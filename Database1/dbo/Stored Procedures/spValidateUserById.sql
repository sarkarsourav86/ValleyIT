CREATE PROCEDURE [dbo].[spValidateUserById]
	@UserIdString varchar(MAX),
	@CheckReviewed bit = 0
	
AS
	if(@CheckReviewed=0)
	BEGIN
		select count(*) from Users where UserIdString=@UserIdString
	END
	else select count(*) from Users where UserIdString=@UserIdString and (HasReviewed=0 or HasReviewed is null)
	

