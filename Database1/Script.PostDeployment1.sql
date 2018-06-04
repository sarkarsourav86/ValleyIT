/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
declare @numrow int
select @numrow=count(*) from IncedentTypes
if(@numrow=0)
BEGIN
	insert into IncedentTypes values(1,'Housekeeping')
	insert into IncedentTypes values(2,'WiFi & Internet')
	insert into IncedentTypes values(3,'Maintenance')
	insert into IncedentTypes values(4,'Common Area')
	insert into IncedentTypes values(5,'Room')
	insert into IncedentTypes values(6,'Front Desk Staff')
END
select @numrow=count(*) from Feedback_options
if(@numrow=0)
BEGIN
	insert into Feedback_options values(0,'No Comments')
	insert into Feedback_options values(1,'Works Great/ Satisfied with it')
	insert into Feedback_options values(2,'Not Satisfied with it')
	insert into Feedback_options values(3,'Something is broken')
	insert into Feedback_options values(4,'Needs Immediate Attention')
	
END
update Feedback_options set FieldText='Not Satisfied' where ID=2
update Feedback_options set FieldText='Everything is Great/ Very Satisfied' where ID=1
select @numrow=count(name) from FranchiseTable
IF(@numrow=0)
BEGIN
	insert into FranchiseTable values('Hilton','http://hiltonhonors3.hilton.com/en/index.html','Hilton Rewards')
	insert into FranchiseTable values('Wyndham','https://www.wyndhamhotels.com/wyndham-rewards','Wyndham Rewards')
	insert into FranchiseTable values('choice Hotels','https://www.choicehotels.com/choice-privileges','Choice Privileges')
	insert into FranchiseTable values('IHG','https://www.ihg.com/rewardsclub/content/us/en/home','IHG Rewards')
	insert into FranchiseTable values('Marriott','https://www.marriott.com/rewards/rewards-program.mi','Marriott Rewards')
	insert into FranchiseTable values('Best Western','https://www.bestwestern.com/en_US/best-western-rewards.html','BW Rewards')
	insert into FranchiseTable values('Independent',NULL,NULL)
	update Hotel set Franchise=1
END


