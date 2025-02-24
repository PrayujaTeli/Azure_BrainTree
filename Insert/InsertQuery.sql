BULK INSERT BrainTree.dbo.countries
FROM '/countries.csv'
WITH
(
 FORMAT = 'CSV',
 FIRSTROW = 2
)
GO