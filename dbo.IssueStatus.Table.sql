USE [StoneWareDB]
GO
/****** Object:  Table [dbo].[IssueStatus]    Script Date: 12/12/2020 17:33:05 ******/
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
GO
