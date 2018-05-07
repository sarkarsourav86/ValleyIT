CREATE PROCEDURE [dbo].[spValidateHotelRegistration]
	@id varchar(MAX)
	
AS
	SELECT Email from Payment where Payment.Value=@id and Registered=0

