CREATE FUNCTION [dbo].[NoofHotels]
(

	@state varchar(10)
)
RETURNS INT
AS
BEGIN
declare @temp varchar(50)
declare @retvalue int
select @temp= MAX(SUBSTRING([Property1],3,LEN([Property1]))) from Hotel where [Property1] like UPPER(@state)+'%'
	if @temp is null
		set @retvalue= 0
	else
		set @retvalue= CONVERT(int,@temp)
	return @retvalue+1
END
