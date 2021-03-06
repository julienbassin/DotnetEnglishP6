USE [StoneWareDB]
GO
/****** Object:  Table [dbo].[ProductOperatingSystems]    Script Date: 12/12/2020 17:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOperatingSystems](
	[OperatingSystemId] [int] NOT NULL,
	[ProductId] [int] NOT NULL
) ON [PRIMARY]
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
