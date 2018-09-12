CREATE PROCEDURE [dbo].[spInsertPayment]
	@id varchar(MAX),
	@email varchar(100),
	@amount money,
	@paymentdate datetime,
	@expirydate datetime,
	@hotelid varchar(max)=null
	
AS
	declare @sha_id varchar(MAX)
	set @sha_id=Convert(varchar(MAX),HASHBYTES('SHA2_256',@id),2)
	insert into Payment(Value,Email,Registered,Amount,PaymentDate,ExpiryDate) values(@sha_id,@email,0,@amount,@paymentdate,@expirydate)
	update Hotel set PaymentId=@sha_id where Property=@hotelid
	select @sha_id as Id
