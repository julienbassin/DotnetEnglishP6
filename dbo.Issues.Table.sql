USE [StoneWareDB]
GO
/****** Object:  Table [dbo].[Issues]    Script Date: 12/12/2020 17:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IssueDescription] [nvarchar](3000) NOT NULL,
	[ResolutionDescription] [nvarchar](3000) NOT NULL,
	[IssuesStatusId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[IssueCreatedAt] [date] NOT NULL,
	[DateIssueResolved] [date] NOT NULL,
 CONSTRAINT [PK_Issues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
