Create function fn_stringSplit(@StringSplit varchar(max))
returns @table table(SplitValue varchar(10) not null)
as
begin
    Declare @StartVal int
    Declare @endVal int
    set @StringSplit = @StringSplit + ' '
    set @StartVal = 1
    set @endVal = 1
    while @endVal >= 0
        begin
            set  @endVal = charindex(' ',@StringSplit,@StartVal);
            insert into @table select SUBSTRING(@StringSplit,@StartVal,@endVal-1)
            set @StringSplit= SUBSTRING(@StringSplit,@endVal+1, LEN(@StringSplit))
            if @StringSplit = '' set @endVal= -1
        end
    return
end

GO
USE StoreWareDB
GO


--===================================
-- Populate Data for each table
--===================================
IF  EXISTS (
	SELECT id FROM Issues WHERE id > 0
)

DELETE FROM Issues

INSERT INTO [Issue_Status](status) VALUES('Outstanding')
INSERT INTO [Issue_Status](status) VALUES('Resolved')


IF  EXISTS (
	SELECT version FROM [Versions] WHERE version > 0
)
DELETE FROM [Versions]

INSERT INTO [Versions](version) VALUES(1.0)
INSERT INTO [Versions](version) VALUES(1.1)
INSERT INTO [Versions](version) VALUES(1.2)
INSERT INTO [Versions](version) VALUES(1.3)
INSERT INTO [Versions](version) VALUES(2.0)
INSERT INTO [Versions](version) VALUES(2.1)

IF  EXISTS (
	SELECT name 
		FROM [OperatingSystems]
		WHERE name = 'Linux'
)
DELETE FROM [OperatingSystems]

INSERT INTO [OperatingSystems](name) VALUES('Windows')
INSERT INTO [OperatingSystems](name) VALUES('Linux')
INSERT INTO [OperatingSystems](name) VALUES('MacOS')
INSERT INTO [OperatingSystems](name) VALUES('Android')
INSERT INTO [OperatingSystems](name) VALUES('iOS')
INSERT INTO [OperatingSystems](name) VALUES('Windows Mobile')

--==========================
-- PRODUCT TABLE
--==========================

IF  EXISTS (
	SELECT id FROM [Products] WHERE id > 0
)
DELETE FROM [Products]

INSERT INTO [Products](name) VALUES('Day Trader Wannabe')
INSERT INTO [Products](name) VALUES('Investment Overlord')
INSERT INTO [Products](name) VALUES('Workout Planner')
INSERT INTO [Products](name) VALUES('Social Anxiety Planner')

--==========================
-- PRODUCTVERSIONS TABLE
--==========================

IF  EXISTS (
	SELECT id FROM [ProductsVersions] WHERE Productid > 0 and VersionId > 0
)
DELETE FROM [Products]

INSERT INTO [ProductsVersions](ProductId, VersionsId) 
VALUES (
    (Select Id from Products where name = 'Day Trader Wannabe'),
    (Select Version from Versions where Version = 1.0)    
)

INSERT INTO [ProductsVersions](ProductId, VersionId) 
VALUES (
    (Select Id from Products where name = 'Day Trader Wannabe'),
    (Select Version from Versions where Version = 1.1)    
)

INSERT INTO [ProductsVersions](ProductId, VersionId) 
VALUES (
    (Select Id from Products where name = 'Day Trader Wannabe'),
    (Select Version from Versions where Version = 1.2)    
)

INSERT INTO [ProductsVersions](ProductId, VersionId) 
VALUES (
    (Select Id from Products where name = 'Day Trader Wannabe'),
    (Select Version from Versions where Version = 1.3)    
)

INSERT INTO [ProductsVersions](ProductId, VersionId) 
VALUES (
    (Select Id from Products where name = 'Investment Overlord'),
    (Select Version from Versions where Version = 1.0)    
)

INSERT INTO [ProductsVersions](ProductId, VersionId) 
VALUES (
    (Select Id from Products where name = 'Investment Overlord'),
    (Select Version from Versions where Version = 2.0)    
)

INSERT INTO [ProductsVersions](ProductId, VersionId) 
VALUES (
    (Select Id from Products where name = 'Investment Overlord'),
    (Select Version from Versions where Version = 2.1)    
)

INSERT INTO [ProductsVersions](ProductId, VersionId) 
VALUES (
    (Select Id from Products where name = 'Workout Planner'),
    (Select Version from Versions where Version = 1.0)    
)

INSERT INTO [ProductsVersions](ProductId, VersionId) 
VALUES (
    (Select Id from Products where name = 'Workout Planner'),
    (Select Version from Versions where Version = 1.1)    
)

INSERT INTO [ProductsVersions](ProductId, VersionId) 
VALUES (
    (Select Id from Products where name = 'Workout Planner'),
    (Select Version from Versions where Version = 2.0)    
)

INSERT INTO [ProductsVersions](ProductId, VersionId) 
VALUES (
    (Select Id from Products where name = 'Social Anxiety Planner'),
    (Select Version from Versions where Version = 1.0)    
)

INSERT INTO [ProductsVersions](ProductId, VersionId) 
VALUES (
    (Select Id from Products where name = 'Social Anxiety Planner'),
    (Select Version from Versions where Version = 1.1)    
)

--==========================
-- PRODUCTOPERATINGSYSTEM TABLE
--==========================

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Day Trader Wannabe'),
    (Select Id from OperatingSystems where Name = 'Windows')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Day Trader Wannabe'),
    (Select Id from OperatingSystems where Name = 'Linux')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Day Trader Wannabe'),
    (Select Id from OperatingSystems where Name = 'Android')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Day Trader Wannabe'),
    (Select Id from OperatingSystems where Name = 'MacOS')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Day Trader Wannabe'),
    (Select Id from OperatingSystems where Name = 'iOS')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Day Trader Wannabe'),
    (Select Id from OperatingSystems where Name = 'Windows Mobile')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Investment Overlord'),
    (Select Id from OperatingSystems where Name = 'Linux')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Investment Overlord'),
    (Select Id from OperatingSystems where Name = 'Windows')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Investment Overlord'),
    (Select Id from OperatingSystems where Name = 'Android')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Investment Overlord'),
    (Select Id from OperatingSystems where Name = 'Windows Mobile')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Workout Planner'),
    (Select Id from OperatingSystems where Name = 'Linux')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Workout Planner'),
    (Select Id from OperatingSystems where Name = 'MacOS')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Workout Planner'),
    (Select Id from OperatingSystems where Name = 'Windows')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Workout Planner'),
    (Select Id from OperatingSystems where Name = 'Android')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Workout Planner'),
    (Select Id from OperatingSystems where Name = 'iOS')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Workout Planner'),
    (Select Id from OperatingSystems where Name = 'Windows Mobile')    
)


INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Social Anxiety Planner'),
    (Select Id from OperatingSystems where Name = 'MacOS')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Social Anxiety Planner'),
    (Select Id from OperatingSystems where Name = 'Windows')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Social Anxiety Planner'),
    (Select Id from OperatingSystems where Name = 'Android')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Social Anxiety Planner'),
    (Select Id from OperatingSystems where Name = 'iOS')    
)

INSERT INTO [ProductOperatingSystems](OperatingSystemId, ProductId) 
VALUES (
    (Select Id from Products where name = 'Social Anxiety Planner'),
    (Select Id from OperatingSystems where Name = 'Windows Mobile')    
)

--==========================
-- ISSUES TABLE
--==========================

IF  EXISTS (
	SELECT id 
		FROM Issues
		WHERE id > 0
)

DELETE FROM Issues

GO

CREATE PROCEDURE AddIssue1
	@productId int, 
    @IssuesStatusId int, 
    @IssueDescription varchar(3000), 
    @IssueCreatedAt datetime, 
	@ResolutionDescription varchar(3000) = null, 
    @DateIssueResolved datetime = null
AS
BEGIN
	INSERT INTO [Issues](productId, IssuesStatusId, IssueDescription, IssueCreatedAt, ResolutionDescription, DateIssueResolved)
		VALUES(@productId, @IssuesStatusId, @IssueDescription, @IssueCreatedAt, @ResolutionDescription, @DateIssueResolved)

END

EXEC dbo.AddIssue1 
    @productId = 1, 
    @IssuesStatusId = 2,
	@IssueDescription = 'User tried to sign in with their gmail account and keep getting an error message
		saying that the email does not exist',
	@IssueCreatedAt = '2020-12-18',
	@ResolutionDescription = 'The user was using the wrong email address.',
	@DateIssueResolved = '2020-12-19'

GO

CREATE PROCEDURE AddIssue2
	@productId int, 
    @IssuesStatusId int, 
    @IssueDescription varchar(3000), 
    @IssueCreatedAt datetime, 
	@ResolutionDescription varchar(3000), 
    @DateIssueResolved datetime
AS
BEGIN
	INSERT INTO [Issues](productId, IssuesStatusId, IssueDescription, IssueCreatedAt, ResolutionDescription, DateIssueResolved)
		VALUES(@productId, @IssuesStatusId, @IssueDescription, @IssueCreatedAt, @ResolutionDescription, @DateIssueResolved)

END

EXEC dbo.AddIssue2
        @productId = 1, 
        @IssuesStatusId = 2,
        @IssueDescription = 'User says product is buying two of every purchase made. If the user
		wishes to buy 10 shares of Apple stock, the product makes two transactions, each for 10
		shares.',
	    @IssueCreatedAt = '2020-12-18',
	    @ResolutionDescription = 'User was on a 3G network and expected the purchase to complete
		faster than it was. User clicked the Purchase button, then clicked it again when the screen
		did not change fast enough. Sent request to Development to add in progress animation
		when purchases are made and to disable Purchase button after first click.',
	    @DateIssueResolved = '2020-12-19'

GO

CREATE PROCEDURE AddIssue3
	@productId int, 
    @IssuesStatusId int, 
    @IssueDescription varchar(3000), 
    @IssueCreatedAt datetime, 
	@ResolutionDescription varchar(3000) = null, 
    @DateIssueResolved datetime = null
AS
BEGIN
	INSERT INTO [Issues](productId, IssuesStatusId, IssueDescription, IssueCreatedAt, ResolutionDescription, DateIssueResolved)
		VALUES(@productId, @IssuesStatusId, @IssueDescription, @IssueCreatedAt, @ResolutionDescription, @DateIssueResolved)

END


EXEC dbo.AddIssue3
        @productId = 4, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'User says the stock price keeps changing randomly.',
	    @IssueCreatedAt = '2020-12-14'
	
EXEC dbo.AddIssue4 
        @productId = 5, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'User says the stock price keeps changing randomly.',
	    @IssueCreatedAt = '2020-12-15'

EXEC dbo.AddIssue5 
        @productId = 1, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'The app keeps crashing for the user while they try to cancel an order.',
	    @IssueCreatedAt = '2020-12-14'

EXEC dbo.AddIssue6 
        @productId = 2, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'The app keeps crashing when trying to cancel an order.',
	    @IssueCreatedAt = '2020-12-15'

EXEC dbo.AddIssue7 
        @productId = 1, 
        @IssuesStatusId = 2,
	    @IssueDescription = 'The user is having difficulty updating the application.',
	    @IssueCreatedAt = '2020-12-14',
	    @ResolutionDescription = 'Asked user to delete the older version and downloading the newest
	version that is available.',
	    @DateIssueResolved = '2020-12-14'

	EXEC dbo.AddIssue8 
        @productId = 4, 
        @IssuesStatusId = 2,
	    @IssueDescription = 'USers are having difficulty updating the application.',
	    @IssueCreatedAt = '2020-12-15',
	    @ResolutionDescription = 'Advised user to delete the older version and downloading the newest
	version that is available.',
	    @DateIssueResolved = '2020-12-15'

EXEC dbo.AddIssue9 
        @productId = 5, 
        @IssuesStatusId = 2,
	    @IssueDescription = 'User says the application is running slow.',
	    @IssueCreatedAt = '2020-12-10',
	    @ResolutionDescription = 'The user had 10 other applications opended at the same time. Advised to 
	close the other applications.',
	    @DateIssueResolved = '2020-12-10'

	EXEC dbo.AddIssue10 
        @productId = 2, 
        @IssuesStatusId = 2,
	    @IssueDescription = 'User says the application is running slow.',
	    @IssueCreatedAt = '2020-12-10',
	    @ResolutionDescription = 'The user had 10 other applications opended at the same time. Advised to 
	close the other applications.',
	    @DateIssueResolved = '2020-12-10'

EXEC dbo.AddIssue11 
        @productId = 1, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'The user complains that the application text is not scrolling. The information is displayed
	outside the view window.',
	    @IssueCreatedAt = '2020-12-14'

	EXEC dbo.AddIssue12 
        @productId = 1, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'The user complains that the application text is not scrolling. The information is displayed
	outside the view window.',
	    @IssueCreatedAt = '2020-12-14'

EXEC dbo.AddSeedToIssueTable 
        @productId = 5, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'The user complains that the application text is not scrolling. The information is displayed
	outside the view window.',
	    @IssueCreatedAt = '2020-12-17'

EXEC dbo.AddIssue13 
        @productId = 2, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'App not updating the proper date for displaying the account information',
	    @IssueCreatedAt = '2020-12-01'

EXEC dbo.AddIssue14 
        @productId = 2, 
        @IssuesStatusId = 2,
	    @IssueDescription = 'User says the application is running slow.',
	    @IssueCreatedAt = '2020-12-10',
	    @ResolutionDescription = 'The user had 10 other applications opended at the same time. Advised to 
	close the other applications.',
	    @DateIssueResolved = '2020-12-10'

EXEC dbo.AddIssue15 
        @productId = 4, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'The user is not able to access the calendar.',
	    @IssueCreatedAt = '2020-12-28'

EXEC dbo.AddIssue16
    @productId = 4, 
    @IssuesStatusId = 1,
	@IssueDescription = 'Found a bug when attempting to update calendar. Error message says that the operation cannot complete
	because the date is NULL',
	@IssueCreatedAt = '2020-12-29'

EXEC dbo.AddIssue17 
        @productId = 5, 
        @IssuesStatusId = 2,
	    @IssueDescription = 'The app is accepting empty entries when creating a new entry.',
	    @IssueCreatedAt = '2020-12-10',
	    @ResolutionDescription = 'Added validation to the entry form to check if the user is attempting to
	submit and empty form. Will display a validation error to notify the user that they cannot submit
	empty data.',
	    @DateIssueResolved = '2020-12-10'

EXEC dbo.AddIssue18 
        @productId = 5, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'The total amounts are not calculating properly.',
	    @IssueCreatedAt = '2020-12-20'

EXEC dbo.AddIssue19 
        @productId = 5, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'User says they have found a few spelling errors in the application.',
	    @IssueCreatedAt = '2020-12-29'

EXEC dbo.AddIssue20 
        @productId = 1, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'Found a bug when attempting to update calendar. Error message says that the operation cannot complete
	because the date is NULL',
	    @IssueCreatedAt = '2020-12-29'

EXEC dbo.AddIssue21 
        @productId = 2, 
        @IssuesStatusId = 2,
	    @IssueDescription = 'The application keeps locking up',
	    @IssueCreatedAt = '2020-12-03',
	    @ResolutionDescription = 'Advised the customer to update their operating system.',
	    @DateIssueResolved = '2020-12-10'

EXEC dbo.AddIssue22 
        @productId = 4, 
        @IssuesStatusId = 2,
	    @IssueDescription = 'The application keeps locking up',
	    @IssueCreatedAt = '2020-12-03',
	    @ResolutionDescription = 'Advising users to update their operating system.',
	    @DateIssueResolved = '2020-12-10'

EXEC dbo.AddIssue23 
        @productId = 4, 
        @IssuesStatusId = 2,
	    @IssueDescription = 'App is not displaying properly on smaller screen devices.',
	    @IssueCreatedAt = '2020-12-04',
	    @ResolutionDescription = 'Added a screen size check and adjusted displaying properly',
	    @DateIssueResolved = '2020-12-10'

EXEC dbo.AddIssue24 
        @productId = 2, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'User says the application starts acting crazy when they tap the screen exactly 5 times in a row.',
	    @IssueCreatedAt = '2020-12-20'

EXEC dbo.AddIssue25 
        @productId = 1, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'User says the application starts acting crazy when they tap the screen exactly 5 times in a row.',
	    @IssueCreatedAt = '2020-12-20'

EXEC dbo.AddIssue26 
        @productId = 5, 
        @IssuesStatusId = 2,
	    @IssueDescription = 'User says the planner is not displaying the correct information for dates selected.',
	    @IssueCreatedAt = '2020-11-25',
	    @ResolutionDescription = 'Found a bug that was not updating the calendar properly.',
	    @DateIssueResolved = '2020-12-11'

EXEC dbo.AddIssue27 
        @productId = 1, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'User says the application starts acting crazy when they tap the screen exactly 5 times in a row.',
	    @IssueCreatedAt = '2020-12-20'

EXEC dbo.AddIssue28 
        @productId = 1, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'Found a bug when attempting to update calendar. Error message says that the operation cannot complete
	because the date is NULL',
	    @IssueCreatedAt = '2020-12-29'

EXEC dbo.AddIssue29 
        @productId = 2, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'User is not able to update their account information',
	    @IssueCreatedAt = '2020-12-16'

EXEC dbo.AddIssue30 
        @productId = 4, 
        @IssuesStatusId = 2,
	    @IssueDescription = 'User says the exercises are not displaying properly and the timer is off by 2 secs.',
	    @IssueCreatedAt = '2020-12-16',
	    @ResolutionDescription = 'Found a bug that was setting the timer offet by 2 secs. Updated the timer.',
	    @DateIssueResolved = '2020-12-17'

EXEC dbo.AddIssue31 
        @productId = 4, 
        @IssuesStatusId = 2,
	    @IssueDescription = 'The application is running slow for certain users in the North East Market',
	    @IssueCreatedAt = '2020-12-16',
	    @ResolutionDescription = 'Data carriers was experiencing heavy load times',
	    @DateIssueResolved = '2020-12-18'

EXEC dbo.AddIssue32 
        @productId = 5, 
        @IssuesStatusId = 2,
	    @IssueDescription = 'The application is running slow for certain users in the North East Market',
	    @IssueCreatedAt = '2020-12-16',
	    @ResolutionDescription = 'Data carriers was experiencing heavy load times',
	    @DateIssueResolved = '2020-12-16'

EXEC dbo.AddIssue33 
        @productId = 4, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'App is stuck on loading data. No other information provided.',
	    @IssueCreatedAt = '2020-12-23'
	
EXEC dbo.AddIssue34 
        @productId = 1, 
        @IssuesStatusId = 1,
	    @IssueDescription = 'User is having issues loading data during certain times of the day. Between 12am and 3am eastern time.',
	    @IssueCreatedAt = '2020-12-07'

EXEC dbo.AddIssue35 
        @productId = 1, 
        @IssuesStatusId = 2,
        @IssueDescription = 'User is not able to purchase more than a certain quantity of stocks',
        @IssueCreatedAt = '2020-12-01',
        @ResolutionDescription = 'Verified that there is a safety check in place to ensure massive amounts of stocks are not purchased.',
        @DateIssueResolved = '2020-12-01'

EXEC dbo.AddIssue36 
        @productId = 5, 
        @IssuesStatusId = 2,
        @IssueDescription = 'Partial data is being shown for certain users in the central market',
        @IssueCreatedAt = '2020-12-19',
        @ResolutionDescription = 'Updated geo-location functionality',
        @DateIssueResolved = '2020-12-19'

EXEC dbo.AddIssue37 
        @productId = 2, 
        @IssuesStatusId = 1,
        @IssueDescription = 'User says the app displays a black screen when trying to update information.',
        @IssueCreatedAt = '2020-12-07'

EXEC dbo.AddIssue38 
        @productId = 4, 
        @IssuesStatusId = 1,
        @IssueDescription = 'App keeps disconnecting from data sources.',
        @IssueCreatedAt = '2020-12-07'

EXEC dbo.AddIssue39 
        @productId = 4, 
        @IssuesStatusId = 1,
        @IssueDescription = 'Balance is updating twice',
        @IssueCreatedAt = '2020-12-07'

EXEC dbo.AddIssue40 
        @productId = 4, 
        @IssuesStatusId = 1,
        @IssueDescription = 'Previous balance is being deleted after adding new entry',
        @IssueCreatedAt = '2020-12-02'

EXEC dbo.AddIssue41 
        @productId = 2, 
        @IssuesStatusId = 1,
        @IssueDescription = 'The user cannot update their personal information',
        @IssueCreatedAt = '2020-12-02'

EXEC dbo.AddIssue42 
        @productId = 2, 
        @IssuesStatusId = 1,
        @IssueDescription = 'The user cannot reset their password. Says not getting the confimation emails to reset password.',
        @IssueCreatedAt = '2020-12-02'

EXEC dbo.AddIssue43 
        @productId = 5, 
        @IssuesStatusId = 2,
        @IssueDescription = 'User says the application is running slower than normal lately.',
        @IssueCreatedAt = '2020-12-19',
        @ResolutionDescription = 'Asked the user to update the application and restart their device.',
        @DateIssueResolved = '2020-12-19'

EXEC dbo.AddIssue44 
        @productId = 1, 
        @IssuesStatusId = 2,
        @IssueDescription = 'User says the application is running slower than normal lately.',
        @IssueCreatedAt = '2020-12-19',
        @ResolutionDescription = 'Asked the user to update the application and restart their device.',
        @DateIssueResolved = '2020-12-19'

EXEC dbo.AddIssue45 
        @productId = 2, 
        @IssuesStatusId = 2,
        @IssueDescription = 'Application keeps crashing and displaying error 404',
        @IssueCreatedAt = '2020-12-19',
        @ResolutionDescription = 'Had an incorrect URL for the help and contact page. Updated the URL.',
        @DateIssueResolved = '2020-12-19'

EXEC dbo.AddIssue46 
        @productId = 2, 
        @IssuesStatusId = 1,
        @IssueDescription = 'The user cannot reset their password. Says not getting the confimation emails to reset password.',
        @IssueCreatedAt = '2020-12-02'

EXEC dbo.AddIssue47 
        @productId = 5, 
        @IssuesStatusId = 1,
        @IssueDescription = 'The user cannot reset their password. Says not getting the confimation emails to reset password.',
        @IssueCreatedAt = '2020-12-02'

EXEC dbo.AddIssue48 
        @productId = 5, 
        @IssuesStatusId = 1,
        @IssueDescription = 'The user cannot reset their password. Says not getting the confimation emails to reset password.',
        @IssueCreatedAt = '2020-12-02'

EXEC dbo.AddIssue49 
        @productId = 5, 
        @IssuesStatusId = 1,
        @IssueDescription = 'The user cannot reset their password. Says not getting the confimation emails to reset password.',
        @IssueCreatedAt = '2020-12-02'


GO

CREATE PROCEDURE Issues
AS
Select issueStatus.status as IssuesStatus,
       product.id as ProductId,
       product.name as ProductName,
       v.version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.ResolutionDescription,
       issue.IssueCreatedAt,
       issue.DateIssueResolved
FROM [Issues] Issue
JOIN [Products] product ON product.id = Issue.productId
JOIN [Versions] v ON v.id = product.Id
JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId


-- =======================================================
-- Get all outstanding issues (all products)
-- =======================================================

DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesForAllProducts]
GO

CREATE OR ALTER PROCEDURE spGetAllIssuesForAllProducts(
    @status  nvarchar(20) = 'OutStanding'
)
AS
BEGIN
    SET NOCOUNT ON;
    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
    Where status = @status
END

EXEC spIssuesGetAll
GO

-- =======================================================
-- Get all outstanding issues for a product (all versions)
-- =======================================================

DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesForProduct]
GO

CREATE PROCEDURE spGetAllIssuesForProduct(
    @productName nvarchar(50) = 'Workout Planner',
    @status  nvarchar(20) = 'outstanding',
    @startDate DATETIME = '2020-12-01',
    @version numeric(2,1)

    )
AS
BEGIN
    SET NOCOUNT ON;
    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
    where status = @status
    AND product.Name = @productName
    AND version = @version
    AND IssueCreatedAt = @startDate
END
GO


-- =======================================================
-- Get all outstanding issues for a product (single version)
-- =======================================================

DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesAndVersionForProduct]
GO

CREATE PROCEDURE spGetAllIssuesAndVersionForProduct(
    @productName nvarchar(50),
    @status  nvarchar(20) = 'outstanding',
    @startDate DATETIME = '2020-12-01',
    @version numeric(2,1) = 1.0
    )
AS
BEGIN
    SET NOCOUNT ON;

    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
    where status = @status
    AND product.Name = @productName
    AND IssueCreatedAt = @startDate
END
GO

-- =========================================================================
-- Get all outstanding issues within date range for a product (all versions)
-- =========================================================================

DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesDaterangeAndVersionsForProduct]
GO

CREATE OR ALTER PROCEDURE spGetAllIssuesDaterangeAndVersionsForProduct(
    @productName nvarchar(50),
    @status  nvarchar(20) = 'outstanding',
    @version numeric(2,1)
    )
AS
BEGIN
    SET NOCOUNT ON;

    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
    where status = @status
    AND product.Name = @productName
    AND version = @version
END
GO


-- ===========================================================================
-- Get all outstanding issues within date range for a product (single version)
-- ===========================================================================

DROP PROCEDURE IF EXISTS dbo.[spAllIssuesDaterangeAndVersionForProduct]
GO


CREATE OR ALTER PROCEDURE spAllIssuesDaterangeAndVersionForProduct(
    @productName nvarchar(50),
    @status  nvarchar(20) = 'outstanding',
    @version NUMERIC (2,1) = '2.0'
    )
AS
BEGIN
    SET NOCOUNT ON;

    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version as Version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
    where status = @status
    AND product.Name = @productName
    AND version = @version
END
GO


-- =====================================================================
-- Get all outstanding issues containing list of keywords (all products)
-- =====================================================================

DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesAndVersionForProduct]
GO


CREATE or Alter PROCEDURE spIssuesGetAllByStatusKeywords(
		@status nvarchar(50) = 'Outstanding', 
		@keyword nvarchar(10) = 'keeps crashing'
    )
AS
BEGIN
	Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version as Version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
	WHERE status = @status AND Issue.IssueDescription in ( Select Issue.IssueDescription from fn_stringSplit(@keyword) ss where issue.IssueDescription LIKE '%'+SplitValue+'%')
END
GO

-- ===================================================================================
-- Get all outstanding issues for a product containing list of keywords (all versions)
-- ===================================================================================
DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesAndVersionsKeywordsForProduct]
GO

CREATE PROCEDURE spGetAllIssuesAndVersionsKeywordsForProduct(
        @productName nvarchar(50),
		@status nvarchar(50) = 'Outstanding',
        @version numeric(2,1),
		@keyword nvarchar(10)
    )
AS
BEGIN
	Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version as Version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
	WHERE status = @status
    AND product.Name = @productName
    AND version = @version    
	AND Issue.IssueDescription in ( Select Issue.IssueDescription from fn_stringSplit(@keyword) ss where issue.IssueDescription LIKE '%'+SplitValue+'%')
END
GO

-- =====================================================================================
-- Get all outstanding issues for a product containing list of keywords (single version) 
-- =====================================================================================

DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesAndVersionKeywordsForProduct]
GO
CREATE PROCEDURE spGetAllIssuesAndVersionKeywordsForProduct(
        @productName nvarchar(50),
		@status nvarchar(50) = 'Outstanding',
        @version numeric(2,1),
		@keyword nvarchar(10)
    )
AS
BEGIN
	Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version as Version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
	WHERE status = @status
    AND product.Name = @productName
    AND version = @version    
	AND Issue.IssueDescription in ( Select Issue.IssueDescription from fn_stringSplit(@keyword) ss where issue.IssueDescription LIKE '%'+SplitValue+'%')
END

GO

-- =====================================================================================================
-- Get all outstanding issues within date range for a product containing list of keywords (all versions)
-- =====================================================================================================
DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesDaterangeAndVersionsKeywordsForProduct]
GO

CREATE PROCEDURE spGetAllIssuesDaterangeAndVersionsKeywordsForProduct(
        @productName nvarchar(50),
		@status nvarchar(50) = 'Outstanding',
        @startDate DATETIME,
        @version numeric(2,1),
		@keyword nvarchar(10)
    )
AS
BEGIN
    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version as Version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
	WHERE status = @status
    AND product.Name = @productName
    AND version = @version    
	AND Issue.IssueDescription in ( Select Issue.IssueDescription from fn_stringSplit(@keyword) ss where issue.IssueDescription LIKE '%'+SplitValue+'%')
    AND vw.IssueCreatedAt = @startDate
END


-- ======================================
-- Get all resolved issues (all products)
-- ======================================

DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesForProducts]
GO

CREATE PROCEDURE spGetAllIssuesForAllProducts(
    @status  nvarchar(20) = 'Resolved'
)
AS
BEGIN
    SET NOCOUNT ON;
    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt,
       issue.DateIssueResolved
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
    Where status = @status
END

-- ====================================================
-- Get all resolved issues for a product (all versions)
-- ====================================================

DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesAndVersionsForProduct]
GO

CREATE PROCEDURE spGetAllIssuesForProduct(
    @productName nvarchar(50) = 'Workout Planner',
    @status  nvarchar(20) = 'Resolved',
    @startDate DATETIME = '2020-12-01',
    @version numeric(2,1)

    )
AS
BEGIN
    SET NOCOUNT ON;
    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    INNER JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
    where status = @status
    AND product.Name = @productName
    AND version = @version
    AND IssueCreatedAt = @startDate
END
GO


-- ======================================================
-- Get all resolved issues for a product (single version)
-- ======================================================

DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesAndVersionForProduct]
GO

CREATE OR ALTER PROCEDURE spGetAllIssuesAndVersionForProduct(
    @productName nvarchar(50),
    @status  nvarchar(20) = 'resolved',
    @startDate DATETIME = '2020-12-01',
    @version numeric(2,1) = 1.0
    )
AS
BEGIN
    SET NOCOUNT ON;

    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
    where status = @status
    AND product.Name = @productName
    AND IssueCreatedAt = @startDate
END
GO

-- ======================================================================
-- Get all resolved issues within date range for a product (all versions)
-- ======================================================================

DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesDaterangeAndVersionsForProduct]
GO

CREATE OR ALTER PROCEDURE spGetAllIssuesDaterangeAndVersionsForProduct(
    @productName nvarchar(50),
    @status  nvarchar(20) = 'resolved',
    @version NUMERIC (2,1) = '2.0'
    )
AS
BEGIN
    SET NOCOUNT ON;

    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version as Version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
    where status = @status
    AND product.Name = @productName
    AND version = @version
END
GO


-- ========================================================================
-- Get all resolved issues within date range for a product (single version)
-- ========================================================================
DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesDaterangeAndVersionForProduct]
GO

CREATE OR ALTER PROCEDURE spGetAllIssuesDaterangeAndVersionForProduct(
    @productName nvarchar(50),
    @status  nvarchar(20) = 'resolved',
    @version NUMERIC (2,1) = '2.0'
    )
AS
BEGIN
    SET NOCOUNT ON;

    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version as Version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
    where status = @status
    AND product.Name = @productName
    AND version = @version
END


-- ==================================================================
-- Get all resolved issues containing list of keywords (all products)
-- ==================================================================

DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesKeywordsForProducts]
GO

CREATE PROCEDURE spGetAllIssuesDaterangeAndVersionsKeywordsForProduct(
        @productName nvarchar(50),
		@status nvarchar(50) = 'Resolved',
		@keyword nvarchar(10)
    )
AS
BEGIN
    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version as Version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
	WHERE status = @status
    AND product.Name = @productName
    AND version = @version    
	AND Issue.IssueDescription in ( Select Issue.IssueDescription from fn_stringSplit(@keyword) ss where issue.IssueDescription LIKE '%'+SplitValue+'%')
END

-- ================================================================================
-- Get all resolved issues for a product containing list of keywords (all versions) 
-- ================================================================================
DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesAndVersionsKeywordsForProduct]
GO

CREATE PROCEDURE spGetAllIssuesAndVersionsKeywordsForProduct(
        @productName nvarchar(50),
		@status nvarchar(50) = 'Resolved',
		@keyword nvarchar(10)
    )
AS
BEGIN
    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version as Version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
	WHERE status = @status
    AND product.Name = @productName  
	AND Issue.IssueDescription in ( Select Issue.IssueDescription from fn_stringSplit(@keyword) ss where issue.IssueDescription LIKE '%'+SplitValue+'%')
END

-- ==================================================================================
-- Get all resolved issues for a product containing list of keywords (single version)
-- ==================================================================================

DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesAndVersionKeywordsForProduct]
GO

CREATE PROCEDURE spGetAllIssuesAndVersionsKeywordsForProduct(
        @productName nvarchar(50),
		@status nvarchar(50) = 'Resolved',
		@keyword nvarchar(10),
        @version NUMERIC (2,1) = '2.0' 
    )
AS
BEGIN
    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version as Version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
	WHERE status = @status
    AND product.Name = @productName
    AND Version = @version  
	AND Issue.IssueDescription in ( Select Issue.IssueDescription from fn_stringSplit(@keyword) ss where issue.IssueDescription LIKE '%'+SplitValue+'%')
END


-- ==================================================================================================
-- Get all resolved issues within date range for a product containing list of keywords (all versions)
-- ==================================================================================================

DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesDaterangeAndVersionsKeywordsForProduct]
GO

CREATE PROCEDURE spGetAllIssuesAndVersionsKeywordsForProduct(
        @productName nvarchar(50),
		@status nvarchar(50) = 'Resolved',
		@keyword nvarchar(10),
        @startDate DATETIME = '2020-12-01' 
    )
AS
BEGIN
    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version as Version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
	WHERE status = @status
    AND product.Name = @productName
    AND Version = @version
    AND DateIssueResolvedAt = @StartDate  
	AND Issue.IssueDescription in ( Select Issue.IssueDescription from fn_stringSplit(@keyword) ss where issue.IssueDescription LIKE '%'+SplitValue+'%')
END


-- ====================================================================================================
-- Get all resolved issues within date range for a product containing list of keywords (single version)
-- ====================================================================================================

DROP PROCEDURE IF EXISTS dbo.[spGetAllIssuesDaterangeAndVersionKeywordsForProduct]
GO

CREATE PROCEDURE spGetAllIssuesAndVersionsKeywordsForProduct(
        @productName nvarchar(50) = 'Workout Planner',
		@status nvarchar(50) = 'Resolved',
		@keyword nvarchar(10),
        @version NUMERIC (2,1) = '2.0',
        @startDate DATETIME = '2020-12-01'
    )
AS
BEGIN
    Select issueStatus.status as IssuesStatus,
       product.name as ProductName,
       v.version as Version,
       OSVersion.Name as OperatingSystems,
       issue.IssueDescription,
       issue.IssueCreatedAt
    FROM [Issues] Issue
    JOIN [Products] product ON product.id = Issue.productId
    JOIN [Versions] v ON v.id = product.Id
    JOIN [OperatingSystems] OSVersion ON OSVersion.id = product.id
    JOIN [IssueStatus] issueStatus ON issueStatus.id = Issue.IssuesStatusId
	WHERE status = @status
    AND product.Name = @productName
    AND Version = @version
    AND DateIssueResolvedAt = @StartDate  
	AND Issue.IssueDescription in ( Select Issue.IssueDescription from fn_stringSplit(@keyword) ss where issue.IssueDescription LIKE '%'+SplitValue+'%')
END

EXEC spGetAllIssuesAndVersionsKeywordsForProduct @keyword = 'User says the application is running slow.'
