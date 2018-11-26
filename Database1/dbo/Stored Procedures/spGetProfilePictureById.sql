CREATE PROCEDURE [dbo].[spGetProfilePictureById]
	@email varchar(MAX)
AS
	SELECT Top 1 Image from PropertyAdmins where UserName=@email
