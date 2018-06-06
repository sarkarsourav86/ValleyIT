CREATE PROCEDURE [dbo].[spFetchFranchiseBrands]
	@franchiseId int
AS
	SELECT Id,BrandName from BrandTable where FranchiseId=@franchiseId or Id=0

