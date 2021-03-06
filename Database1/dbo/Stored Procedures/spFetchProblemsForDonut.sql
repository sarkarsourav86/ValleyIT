﻿CREATE PROCEDURE [dbo].[spFetchProblemsForDonut]
	@hotelid int,
	@startdate date
AS
	select (select type from incedenttypes where TYPEID= IncedentType) type, count(*) count,
CASE Incedent.IncedentType
 when 1 then 'blue'
 when 2 then 'purple'
 when 3 then 'orange'
 when 4 then 'red'
 when 5 then 'black'
 when 6 then 'brown'
 when 7 then 'pink'
 when 8 then 'yellow'
 when 9 then 'green'
 end as color from Incedent where FeedbackValue>1 and HotelID=@hotelid and Convert(date,IncedentTime)>@startdate group by IncedentType 
