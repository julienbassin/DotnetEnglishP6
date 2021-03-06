USE [StoneWareDB]
GO
/****** Object:  Table [dbo].[ProductsVersions]    Script Date: 12/12/2020 17:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsVersions](
	[ProductId] [int] NOT NULL,
	[VersionId] [int] NOT NULL
) ON [PRIMARY]
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
