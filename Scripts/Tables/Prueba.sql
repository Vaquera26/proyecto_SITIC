IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Products]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Table */
	CREATE TABLE [dbo].[Products]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador principal de la tabla Products
		[Name] VARCHAR (255) NOT NULL, -- Nombre del producto
		[Description] TEXT NOT NULL, -- Descripción del producto
		[Price] DECIMAL (18,2) NOT NULL, -- Precio del producto
		[Current_Stock] INT NOT NULL, -- Existencia actual del producto
		[Max_Stock] INT NOT NULL, -- Existencia máxima del producto
		[Stock_Status_Id] INT NOT NULL, -- Estado de existencia del producto
		[Image_Path] VARCHAR(255), -- Ruta de la imagen
		[Created_At] DATETIME DEFAULT GETDATE(), -- Fecha de creación
		[Updated_At] DATETIME DEFAULT GETDATE(), -- Fecha de última actualización

		FOREIGN KEY (Stock_Status_Id) REFERENCES [dbo].[Stock_Status]([Id])
	)
END

/* Create Table Comment */
IF OBJECT_ID(N'dbo.Products') IS NOT NULL
BEGIN
	IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', NULL, NULL))
	BEGIN
		EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena la información básica de los productos, así como la existencia actual y su control', 'SCHEMA', 'dbo', 'table', 'Products'
	END 
	ELSE
	BEGIN
		EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena la información básica de los productos, así como la existencia actual y su control', 'SCHEMA', 'dbo', 'table', 'Products'
	END
END
GO

/* Column Comments */
IF OBJECT_ID(N'dbo.Products') IS NOT NULL
BEGIN
	-- Id column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Id'))
		EXEC sp_addextendedproperty 'MS_Description', 'Identificador principal de la tabla Products', 'Schema', [dbo], 'table', [Products], 'column', [Id];

	-- Name column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Name'))
		EXEC sp_addextendedproperty 'MS_Description', 'Nombre del producto', 'Schema', [dbo], 'table', [Products], 'column', [Name];

	-- Description column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Description'))
		EXEC sp_addextendedproperty 'MS_Description', 'Descripción detallada del producto', 'Schema', [dbo], 'table', [Products], 'column', [Description];

	-- Price column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Price'))
		EXEC sp_addextendedproperty 'MS_Description', 'Precio del producto', 'Schema', [dbo], 'table', [Products], 'column', [Price];

	-- Current_Stock column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Current_Stock'))
		EXEC sp_addextendedproperty 'MS_Description', 'Existencia actual del producto', 'Schema', [dbo], 'table', [Products], 'column', [Current_Stock];

	-- Max_Stock column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Max_Stock'))
		EXEC sp_addextendedproperty 'MS_Description', 'Existencia máxima del producto', 'Schema', [dbo], 'table', [Products], 'column', [Max_Stock];

	-- Stock_Status_Id column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Stock_Status_Id'))
		EXEC sp_addextendedproperty 'MS_Description', 'Relación con la tabla Stock_Status', 'Schema', [dbo], 'table', [Products], 'column', [Stock_Status_Id];

	-- Image_Path column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Image_Path'))
		EXEC sp_addextendedproperty 'MS_Description', 'Ruta de la imagen del producto', 'Schema', [dbo], 'table', [Products], 'column', [Image_Path];

	-- Created_At column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Created_At'))
		EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creación del producto', 'Schema', [dbo], 'table', [Products], 'column', [Created_At];

	-- Updated_At column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Updated_At'))
		EXEC sp_addextendedproperty 'MS_Description', 'Fecha de última actualización del producto', 'Schema', [dbo], 'table', [Products], 'column', [Updated_At];
END
GO
