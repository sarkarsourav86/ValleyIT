CREATE PROCEDURE [dbo].[spInsertPayment]
	@id varchar(MAX),
	@email varchar(100)
AS
	declare @sha_id varchar(MAX)
	set @sha_id=Convert(varchar(MAX),HASHBYTES('SHA2_256',@id),2)
	insert into Payment(Value,Email,Registered) values(@sha_id,@email,0)
	select @sha_id as Id
