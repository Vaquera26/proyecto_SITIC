USE dbSiticCommerce
IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Stock_Status]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Table */
	CREATE TABLE [dbo].[Stock_Status]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador único de la tabla
		[Status_Name] VARCHAR(50) NOT NULL, -- Nombre del estado de existencia
		[KEY] VARCHAR(50) NOT NULL -- Clave del estado de existencia
	)
END

/* Create Table Comment */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena los diferentes estados de existencias de un producto', 'SCHEMA', 'dbo', 'table', 'Stock_Status'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena los diferentes estados de existencias de un producto', 'SCHEMA', 'dbo', 'table', 'Stock_Status'
END
GO

/* Column Comments */
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Identificador único de la tabla Stock_Status', 'Schema', [dbo], 'table', [Stock_Status], 'column', [Id];

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'Status_Name'))
	EXEC sp_addextendedproperty 'MS_Description', 'Nombre del estado de existencia', 'Schema', [dbo], 'table', [Stock_Status], 'column', [Status_Name];

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'KEY'))
	EXEC sp_addextendedproperty 'MS_Description', 'Clave del estado de existencia', 'Schema', [dbo], 'table', [Stock_Status], 'column', [KEY];
