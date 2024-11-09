USE dbSiticCommerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Product_Configurations]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Table */
	CREATE TABLE [dbo].[Product_Configurations]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador único de la configuración
		[Product_Id] INT NOT NULL, -- Identificador de la llave foránea de Products
		[Configuration_Name] VARCHAR(255) NOT NULL, -- Nombre de la configuración, como puede ser: Color, Tamaño
		[Value] VARCHAR(255) NOT NULL, -- El valor asignado dependiendo de la configuración
		[Created_At] DATETIME NOT NULL DEFAULT GETDATE(), -- Fecha de creación de configuración
		[Updated_At] DATETIME NOT NULL DEFAULT GETDATE(), -- Fecha de última actualización de configuración
		FOREIGN KEY ([Product_Id]) REFERENCES [dbo].[Products]([Id])
	)
END

/* Create Table Comment */
IF OBJECT_ID(N'dbo.Product_Configurations') IS NOT NULL
BEGIN
	IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', NULL, NULL))
	BEGIN
		EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena configuraciones específicas para cada producto, como color y tamaño.', 'SCHEMA', 'dbo', 'table', 'Product_Configurations'
	END 
	ELSE
	BEGIN
		EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena configuraciones específicas para cada producto, como color y tamaño.', 'SCHEMA', 'dbo', 'table', 'Product_Configurations'
	END
END
GO

/* Column Comments */
IF OBJECT_ID(N'dbo.Product_Configurations') IS NOT NULL
BEGIN
	-- Id column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Id'))
		EXEC sp_addextendedproperty 'MS_Description', 'Identificador único de la configuración', 'Schema', [dbo], 'table', [Product_Configurations], 'column', [Id];

	-- Product_Id column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Product_Id'))
		EXEC sp_addextendedproperty 'MS_Description', 'Identificador de la llave foránea de Products', 'Schema', [dbo], 'table', [Product_Configurations], 'column', [Product_Id];

	-- Configuration_Name column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Configuration_Name'))
		EXEC sp_addextendedproperty 'MS_Description', 'Nombre de la configuración, como puede ser: Color, Tamaño', 'Schema', [dbo], 'table', [Product_Configurations], 'column', [Configuration_Name];

	-- Value column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Value'))
		EXEC sp_addextendedproperty 'MS_Description', 'El valor asignado dependiendo de la configuración', 'Schema', [dbo], 'table', [Product_Configurations], 'column', [Value];

	-- Created_At column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Created_At'))
		EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creación de la configuración', 'Schema', [dbo], 'table', [Product_Configurations], 'column', [Created_At];

	-- Updated_At column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Updated_At'))
		EXEC sp_addextendedproperty 'MS_Description', 'Fecha de última actualización de la configuración', 'Schema', [dbo], 'table', [Product_Configurations], 'column', [Updated_At];
END
GO
