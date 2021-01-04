USE [OCP6StoneWareDB_V3]
GO

IF  EXISTS (
	SELECT id 
		FROM Issues
		WHERE id > 0
)
DELETE FROM Issues