USE dbSiticCommerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Product_Configurations]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Table */
	CREATE TABLE [dbo].[Product_Configurations]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador �nico de la configuraci�n
		[Product_Id] INT NOT NULL, -- Identificador de la llave for�nea de Products
		[Configuration_Name] VARCHAR(255) NOT NULL, -- Nombre de la configuraci�n, como puede ser: Color, Tama�o
		[Value] VARCHAR(255) NOT NULL, -- El valor asignado dependiendo de la configuraci�n
		[Created_At] DATETIME NOT NULL DEFAULT GETDATE(), -- Fecha de creaci�n de configuraci�n
		[Updated_At] DATETIME NOT NULL DEFAULT GETDATE(), -- Fecha de �ltima actualizaci�n de configuraci�n
		FOREIGN KEY ([Product_Id]) REFERENCES [dbo].[Products]([Id])
	)
END

/* Create Table Comment */
IF OBJECT_ID(N'dbo.Product_Configurations') IS NOT NULL
BEGIN
	IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', NULL, NULL))
	BEGIN
		EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena configuraciones espec�ficas para cada producto, como color y tama�o.', 'SCHEMA', 'dbo', 'table', 'Product_Configurations'
	END 
	ELSE
	BEGIN
		EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena configuraciones espec�ficas para cada producto, como color y tama�o.', 'SCHEMA', 'dbo', 'table', 'Product_Configurations'
	END
END
GO

/* Column Comments */
IF OBJECT_ID(N'dbo.Product_Configurations') IS NOT NULL
BEGIN
	-- Id column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Id'))
		EXEC sp_addextendedproperty 'MS_Description', 'Identificador �nico de la configuraci�n', 'Schema', [dbo], 'table', [Product_Configurations], 'column', [Id];

	-- Product_Id column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Product_Id'))
		EXEC sp_addextendedproperty 'MS_Description', 'Identificador de la llave for�nea de Products', 'Schema', [dbo], 'table', [Product_Configurations], 'column', [Product_Id];

	-- Configuration_Name column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Configuration_Name'))
		EXEC sp_addextendedproperty 'MS_Description', 'Nombre de la configuraci�n, como puede ser: Color, Tama�o', 'Schema', [dbo], 'table', [Product_Configurations], 'column', [Configuration_Name];

	-- Value column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Value'))
		EXEC sp_addextendedproperty 'MS_Description', 'El valor asignado dependiendo de la configuraci�n', 'Schema', [dbo], 'table', [Product_Configurations], 'column', [Value];

	-- Created_At column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Created_At'))
		EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creaci�n de la configuraci�n', 'Schema', [dbo], 'table', [Product_Configurations], 'column', [Created_At];

	-- Updated_At column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Updated_At'))
		EXEC sp_addextendedproperty 'MS_Description', 'Fecha de �ltima actualizaci�n de la configuraci�n', 'Schema', [dbo], 'table', [Product_Configurations], 'column', [Updated_At];
END
GO
