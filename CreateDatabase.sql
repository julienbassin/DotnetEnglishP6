USE [master]
GO

DROP DATABASE [StoneWareDB]

/****** Database [StoneWareDB]     Date: 21/11/2020 ******/
CREATE DATABASE [StoneWareDB]
GO
ALTER DATABASE [StoneWareDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoneWareDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
/* Modifies the behavior of the session to override default nullability of new columns when
    the ANSI null default option for the database is false */
ALTER DATABASE [StoneWareDB] SET ANSI_NULL_DEFAULT OFF 
GO
/* Specifies ISO compliant behavior of the Equals (=) and Not Equal To (<>) comparison operators when they are used with null values */
ALTER DATABASE [StoneWareDB] SET ANSI_NULLS OFF 
GO
/* Controls the way the column stores values shorter than the defined size of the column */
ALTER DATABASE [StoneWareDB] SET ANSI_PADDING OFF 
GO
/* Specifies ISO standard behavior for several error conditions. */
ALTER DATABASE [StoneWareDB] SET ANSI_WARNINGS OFF 
GO
/* Ends a query when an overflow or divide-by-zero error occurs during query execution */
ALTER DATABASE [StoneWareDB] SET ARITHABORT OFF 
GO
/* */
ALTER DATABASE [StoneWareDB] SET AUTO_CLOSE ON 
GO
/* Frequently shrinking and expanding a database can lead to physical fragmentation. */
ALTER DATABASE [StoneWareDB] SET AUTO_SHRINK OFF 
GO
/* Displays or changes the automatic statistics update option, AUTO_UPDATE_STATISTICS, for an index, a statistics object, a table, or an indexed view. */
ALTER DATABASE [StoneWareDB] SET AUTO_UPDATE_STATISTICS ON 
GO
/* Controls the behavior of the Transact-SQL COMMIT TRANSACTION statement */
ALTER DATABASE [StoneWareDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
/* the scope of a cursor can be Local or Global */
ALTER DATABASE [StoneWareDB] SET CURSOR_DEFAULT  GLOBAL 
GO
/* Controls whether concatenation results are treated as null or empty string value */
ALTER DATABASE [StoneWareDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
/* Specifies the level of error reporting generated when rounding in an expression causes a loss of precision. */
ALTER DATABASE [StoneWareDB] SET NUMERIC_ROUNDABORT OFF 
GO
/* Causes SQL Server to follow the ISO rules regarding quotation mark delimiting identifiers and literal strings */
ALTER DATABASE [StoneWareDB] SET QUOTED_IDENTIFIER OFF 
GO
/* Both DML and DDL triggers are nested when a trigger performs an action that initiates another trigger */
ALTER DATABASE [StoneWareDB] SET RECURSIVE_TRIGGERS OFF 
GO
/*  ENABLE_BROKER will wait until the other sessions release their locks */
ALTER DATABASE [StoneWareDB] SET ENABLE_BROKER 
GO
/* option to specify whether the statistics are updated synchronously or asynchronously. */
ALTER DATABASE [StoneWareDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
/* The DATE_CORRELATION_OPTIMIZATION database SET option improves the performance of queries 
    that perform an equi-join between two tables whose date or datetime columns are correlated */
ALTER DATABASE [StoneWareDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
/* The TRUSTWORTHY database property is used to indicate whether the instance of SQL Server trusts the database and the contents within it */
ALTER DATABASE [StoneWareDB] SET TRUSTWORTHY OFF 
GO
/* Snapshot isolation enhances concurrency for OLTP applications */
ALTER DATABASE [StoneWareDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
/* the SQL Server query optimizer may choose to parameterize the queries */
ALTER DATABASE [StoneWareDB] SET PARAMETERIZATION SIMPLE 
GO
/* The Database Engine uses shared locks to enforce the default isolation level */
ALTER DATABASE [StoneWareDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
/* Send operations take into consideration the priority levels that are assigned to conversations */
ALTER DATABASE [StoneWareDB] SET HONOR_BROKER_PRIORITY OFF 
GO
/* No log backups. */
ALTER DATABASE [StoneWareDB] SET RECOVERY SIMPLE 
GO
/* Connexion of multi user */
ALTER DATABASE [StoneWareDB] SET  MULTI_USER 
GO
/* This rule checks whether PAGE_VERIFY database option is set to CHECKSUM */
ALTER DATABASE [StoneWareDB] SET PAGE_VERIFY CHECKSUM  
GO
/* */
ALTER DATABASE [StoneWareDB] SET DB_CHAINING OFF 
GO
/* Disable non-transactional access */
ALTER DATABASE [StoneWareDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
/* how to set or change the target recovery time of a SQL Server database */
ALTER DATABASE [StoneWareDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
/* SQL Server transaction commits can be either fully durable, the SQL Server default, or delayed durable */
ALTER DATABASE [StoneWareDB] SET DELAYED_DURABILITY = DISABLED 
GO
/* */
ALTER DATABASE [StoneWareDB] SET QUERY_STORE = OFF
GO
USE [StoneWareDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [StoneWareDB]
GO


/****** Object:  Table [dbo].[Issue_Status]     Date: 11/28/2020 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IssueStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Issue_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Issues]     Date: 11/28/2020 ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Issues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IssueDeion] [nvarchar](3000) NOT NULL,
	[ResolutionDeion] [nvarchar](3000) NOT NULL,
	[IssuesStatusId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[IssueCreatedAt] [date] NOT NULL,
	[DateIssueResolved] [date] NOT NULL,
 CONSTRAINT [PK_Issues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Operating_Systems]     Date:  11/28/2020 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OperatingSystems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OperatingSystems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[Versions]     Date:  11/28/2020 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Versions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Version] [numeric](2, 1) NOT NULL,
 CONSTRAINT [PK_Versions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[Products]     Date:  11/28/2020 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductDeion] [nvarchar](3000) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ProductOperatingSystems](
	[OperatingSystemId] [int] NOT NULL,
	[ProductId] [int] NOT NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[ProductsVersions](
	[ProductId] [int] NOT NULL,
	[VersionId] [int] NOT NULL
) ON [PRIMARY]

/****** Add Foreign keys for each table which have a relationship between them   Date:  11/28/2020 ******/
GO
ALTER TABLE [dbo].[Issues]  WITH CHECK ADD  CONSTRAINT [FK_Issues_IssueStatus] FOREIGN KEY([IssuesStatusId])
REFERENCES [dbo].[IssueStatus] ([id])
GO
ALTER TABLE [dbo].[Issues] CHECK CONSTRAINT [FK_Issues_IssueStatus]
GO
ALTER TABLE [dbo].[Issues]  WITH CHECK ADD  CONSTRAINT [FK_Issues_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Issues] CHECK CONSTRAINT [FK_Issues_Products]
GO
ALTER TABLE [dbo].[ProductOperatingSystems]  WITH CHECK ADD  CONSTRAINT [FK_ProductOperatingSystems_OperatingSystems] FOREIGN KEY([ProductId])
REFERENCES [dbo].[OperatingSystems] ([id])
GO
ALTER TABLE [dbo].[ProductOperatingSystems] CHECK CONSTRAINT [FK_ProductOperatingSystems_OperatingSystems]
GO
ALTER TABLE [dbo].[ProductOperatingSystems]  WITH CHECK ADD  CONSTRAINT [FK_ProductOperatingSystems_Products] FOREIGN KEY([OperatingSystemId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ProductOperatingSystems] CHECK CONSTRAINT [FK_ProductOperatingSystems_Products]
GO
GO
ALTER TABLE [dbo].[ProductsVersions]  WITH CHECK ADD  CONSTRAINT [FK_ProductsVersions_Products] FOREIGN KEY([VersionId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ProductsVersions] CHECK CONSTRAINT [FK_ProductsVersions_Products]
GO
ALTER TABLE [dbo].[ProductsVersions]  WITH CHECK ADD  CONSTRAINT [FK_ProductsVersions_Versions] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Versions] ([id])
GO
ALTER TABLE [dbo].[ProductsVersions] CHECK CONSTRAINT [FK_ProductsVersions_Versions]
GO
