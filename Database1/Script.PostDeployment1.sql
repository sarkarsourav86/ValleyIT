﻿/*
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
insert into FranchiseTable values(0,'Independent',NULL,NULL)
	insert into FranchiseTable values(1,'Hilton','http://hiltonhonors3.hilton.com/en/index.html','Hilton Rewards')
	insert into FranchiseTable values(2,'Wyndham','https://www.wyndhamhotels.com/wyndham-rewards','Wyndham Rewards')
	insert into FranchiseTable values(3,'choice Hotels','https://www.choicehotels.com/choice-privileges','Choice Privileges')
	insert into FranchiseTable values(4,'IHG','https://www.ihg.com/rewardsclub/content/us/en/home','IHG Rewards')
	insert into FranchiseTable values(5,'Marriott','https://www.marriott.com/rewards/rewards-program.mi','Marriott Rewards')
	insert into FranchiseTable values(6,'Best Western','https://www.bestwestern.com/en_US/best-western-rewards.html','BW Rewards')
	
	INSERT into BrandTable VALUES (1, N'Hilton Hotels & Resorts')
	INSERT into BrandTable VALUES (1, N'Waldorf Astoria Hotels & Resorts')
	INSERT into BrandTable VALUES (1, N'Conrad Hotels & Resorts')
	INSERT into BrandTable VALUES (1, N'Canopy by Hilton')
	INSERT into BrandTable VALUES (1, N'Curio—A Collection by Hilton')
	INSERT into BrandTable VALUES (1, N'DoubleTree by Hilton')
	INSERT into BrandTable VALUES (1, N'Tapestry Collection by Hilton')
	INSERT into BrandTable VALUES (1, N'Embassy Suites by Hilton')
	INSERT into BrandTable VALUES (1, N'Hilton Garden Inn')
	INSERT into BrandTable VALUES (1, N'Hampton by Hilton')
	INSERT into BrandTable VALUES (1, N'Tru by Hilton')
	INSERT into BrandTable VALUES (1, N'Homewood Suites by Hilton')
	INSERT into BrandTable VALUES (1, N'Home2 Suites by Hilton')
	INSERT into BrandTable VALUES (1, N'Hilton Grand Vacations')
	INSERT into BrandTable VALUES (2, N'AmericInn')
	INSERT into BrandTable VALUES (2, N'Baymont Inn & Suites')
	INSERT into BrandTable VALUES (2, N'Days Inn')
	INSERT into BrandTable VALUES (2, N'Dazzler Hotels')
	INSERT into BrandTable VALUES (2, N'Dolce Hotels and Resorts')
	INSERT into BrandTable VALUES (2, N'Esplendor Boutique Hotels')
	INSERT into BrandTable VALUES (2, N'Hawthorn Suites by Wyndham')
	INSERT into BrandTable VALUES (2, N'Howard Johnson')
	INSERT into BrandTable VALUES (2, N'La Quinta Inns & Suites')
	INSERT into BrandTable VALUES (2, N'Microtel by Wyndham')
	INSERT into BrandTable VALUES (2, N'Ramada Worldwide')
	INSERT into BrandTable VALUES (2, N'Super 8')
	INSERT into BrandTable VALUES (2, N'The Trademark Hotel Collection')
	INSERT into BrandTable VALUES (2, N'Travelodge')
	INSERT into BrandTable VALUES (2, N'TRYP by Wyndham')
	INSERT into BrandTable VALUES (2, N'Viva Wyndham')
	INSERT into BrandTable VALUES (2, N'Wingate By Wyndham')
	INSERT into BrandTable VALUES (2, N'Wyndham Hotels & Resorts')
	INSERT into BrandTable VALUES (2, N'Wyndham Garden Hotels')
	INSERT into BrandTable VALUES (2, N'Wyndham G')
	INSERT into BrandTable VALUES (3, N'Ascend Hotel Collection')
	INSERT into BrandTable VALUES (3, N'Cambria Hotels & Suites')
	INSERT into BrandTable VALUES (3, N'Clarion Hotels')
	INSERT into BrandTable VALUES (3, N'Comfort Inn Hotels')
	INSERT into BrandTable VALUES (3, N'Comfort Suites Hotels')
	INSERT into BrandTable VALUES (3, N'Econo Lodge')
	INSERT into BrandTable VALUES (3, N'Mainstay Suites')
	INSERT into BrandTable VALUES (3, N'Quality Inn Hotels')
	INSERT into BrandTable VALUES (3, N'Rodeway Inn')
	INSERT into BrandTable VALUES (3, N'Sleep Inn Hotels')
	INSERT into BrandTable VALUES (3, N'Suburban Extended Stay Hotel')
	INSERT into BrandTable VALUES (3, N'WoodSpring Suites')
	INSERT into BrandTable VALUES (4, N'Avid Hotels')
	INSERT into BrandTable VALUES (4, N'Candlewood Suites')
	INSERT into BrandTable VALUES (4, N'Crowne Plaza')
	INSERT into BrandTable VALUES (4, N'Even Hotels')
	INSERT into BrandTable VALUES (4, N'Holiday Inn Hotels & Resorts')
	INSERT into BrandTable VALUES (4, N'Holiday Inn Club Vacations')
	INSERT into BrandTable VALUES (4, N'Holiday Inn Express')
	INSERT into BrandTable VALUES (4, N'Holiday Inn Garden Court')
	INSERT into BrandTable VALUES (4, N'Holiday Inn Resort')
	INSERT into BrandTable VALUES (4, N'Hotel Indigo')
	INSERT into BrandTable VALUES (4, N'Hualuxe Hotels & Resorts')
	INSERT into BrandTable VALUES (4, N'IHG Army Hotels')
	INSERT into BrandTable VALUES (4, N'InterContinental')
	INSERT into BrandTable VALUES (4, N'Kimpton Hotels & Restaurants')
	INSERT into BrandTable VALUES (4, N'Staybridge Suites')
	INSERT into BrandTable VALUES (5, N'JW Marriott')
	INSERT into BrandTable VALUES (5, N'Ritz-Carlton')
	INSERT into BrandTable VALUES (5, N'St. Regis')
	INSERT into BrandTable VALUES (5, N'Bulgari Hotels & Resorts')
	INSERT into BrandTable VALUES (5, N'Edition Hotels')
	INSERT into BrandTable VALUES (5, N'The Luxury Collection')
	INSERT into BrandTable VALUES (5, N'W Hotels')
	INSERT into BrandTable VALUES (5, N'Delta Hotels')
	INSERT into BrandTable VALUES (5, N'Marriott')
	INSERT into BrandTable VALUES (5, N'Marriott Vacation Club')
	INSERT into BrandTable VALUES (5, N'Sheraton')
	INSERT into BrandTable VALUES (5, N'Autograph Collection')
	INSERT into BrandTable VALUES (5, N'Design Hotels')
	INSERT into BrandTable VALUES (5, N'Gaylord Hotels')
	INSERT into BrandTable VALUES (5, N'Le Méridien')
	INSERT into BrandTable VALUES (5, N'Renaissance Hotels')
	INSERT into BrandTable VALUES (5, N'Tribute Portfolio')
	INSERT into BrandTable VALUES (5, N'Westin Hotels & Resorts')
	INSERT into BrandTable VALUES (5, N'Courtyard by Marriott')
	INSERT into BrandTable VALUES (5, N'Fairfield Inn by Marriott')
	INSERT into BrandTable VALUES (5, N'Four Points by Sheraton')
	INSERT into BrandTable VALUES (5, N'Protea Hotels by Marriott')
	INSERT into BrandTable VALUES (5, N'SpringHill Suites by Marriott')
	INSERT into BrandTable VALUES (5, N'AC Hotels')
	INSERT into BrandTable VALUES (5, N'Aloft Hotels')
	INSERT into BrandTable VALUES (5, N'Moxy Hotels')
	INSERT into BrandTable VALUES (5, N'Marriott Executive Apartments')
	INSERT into BrandTable VALUES (5, N'Residence Inn by Marriott')
	INSERT into BrandTable VALUES (5, N'TownePlace Suites by Marriott')
	INSERT into BrandTable VALUES (5, N'Element')
	INSERT into BrandTable VALUES (6, N'Glo')
	INSERT into BrandTable VALUES (6, N'Vib')
	INSERT into BrandTable VALUES (6, N'Best Western')
	INSERT into BrandTable VALUES (6, N'Best Western Plus')
	INSERT into BrandTable VALUES (6, N'Executive Residency by Best Western')
	INSERT into BrandTable VALUES (6, N'Best Western Premier')
	INSERT into BrandTable VALUES (6, N'BW Premier Collection')
	INSERT into BrandTable VALUES (7, N'Independent')
	update Hotel set FranchiseBrand=1
	update Hotel set Franchise=1	
END



