USE dbSiticCommerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Orders]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Table */
	CREATE TABLE [dbo].[Orders]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador único de la tabla
		[TotalPrice] DECIMAL(20,2) NOT NULL, -- Precio total del pedido
		[Status] VARCHAR(50) NOT NULL, -- Estado del pedido (e.g., pendiente, enviado, completado)
		[Created_At] DATETIME NOT NULL DEFAULT GETDATE(), -- Fecha de creación del pedido
		[Updated_At] DATETIME NOT NULL DEFAULT GETDATE() -- Fecha de última actualización del pedido
	)
END

/* Create Table Comment */
IF OBJECT_ID(N'dbo.Orders') IS NOT NULL
BEGIN
	IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', NULL, NULL))
	BEGIN
		EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena la información sobre los pedidos realizados', 'SCHEMA', 'dbo', 'table', 'Orders'
	END 
	ELSE
	BEGIN
		EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena la información sobre los pedidos realizados', 'SCHEMA', 'dbo', 'table', 'Orders'
	END
END
GO

/* Column Comments */
IF OBJECT_ID(N'dbo.Orders') IS NOT NULL
BEGIN
	-- Id column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Id'))
		EXEC sp_addextendedproperty 'MS_Description', 'Identificador único del pedido', 'Schema', [dbo], 'table', [Orders], 'column', [Id];

	-- TotalPrice column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'TotalPrice'))
		EXEC sp_addextendedproperty 'MS_Description', 'Precio total del pedido', 'Schema', [dbo], 'table', [Orders], 'column', [TotalPrice];

	-- Status column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Status'))
		EXEC sp_addextendedproperty 'MS_Description', 'Estado del pedido (e.g., pendiente, enviado, completado)', 'Schema', [dbo], 'table', [Orders], 'column', [Status];

	-- Created_At column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Created_At'))
		EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creación del pedido', 'Schema', [dbo], 'table', [Orders], 'column', [Created_At];

	-- Updated_At column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Updated_At'))
		EXEC sp_addextendedproperty 'MS_Description', 'Fecha de última actualización del pedido', 'Schema', [dbo], 'table', [Orders], 'column', [Updated_At];
END
GO
