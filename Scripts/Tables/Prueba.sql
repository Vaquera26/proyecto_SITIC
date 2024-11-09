IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Products]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	CREATE TABLE [dbo].[Products]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador principal de la tabla Products
		[Name] VARCHAR (255) NOT NULL, -- Nombre del product
		[Description] TEXT NOT NULL, -- Descripcion del producto
		[Price] DECIMAL (18,2) NOT NULL, -- Precio del producto
		[Current_Stock] INT NOT NULL, -- Ecistencia actual del producto
		[Max_Stock] INT NOT NULL, -- Existencia maxima del producto
		[Stock_Status_Id] INT NOT NULL, -- Existencia minima del producto
		[Image_Path] VARCHAR(255), -- Ruta de la imagen
		[Created_At] DATETIME DEFAULT GETDATE(), -- Fecha de creacion
		[Updated_At] DATETIME DEFAULT GETDATE(), -- Fecha de Ultima Actualizacion del producto

		
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena la informacion basica de los productos, asi como la existencia actual y su control', 'SCHEMA', 'dbo', 'table', 'NombreTabla'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena la informacion basica de los productos, asi como la existencia actual y su control', 'SCHEMA', 'dbo', 'table', 'NombreTabla'
END
GO


-- Verifica y agrega la descripción extendida para cada columna en la tabla Products

-- Id column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Identificador principal de la tabla products', 'Schema', [dbo], 'table', Products, 'column', [Id]

-- Name column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Name'))
	EXEC sp_addextendedproperty 'MS_Description', 'Nombre del producto', 'Schema', [dbo], 'table', Products, 'column', [Name]

-- Description column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Description'))
	EXEC sp_addextendedproperty 'MS_Description', 'Descripción detallada del producto', 'Schema', [dbo], 'table', Products, 'column', [Description]

-- Price column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Price'))
	EXEC sp_addextendedproperty 'MS_Description', 'Precio del producto', 'Schema', [dbo], 'table', Products, 'column', [Price]

-- Current_Stock column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Current_Stock'))
	EXEC sp_addextendedproperty 'MS_Description', 'Existencia actual del producto', 'Schema', [dbo], 'table', Products, 'column', [Current_Stock]

-- Max_Stock column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Max_Stock'))
	EXEC sp_addextendedproperty 'MS_Description', 'Existencia máxima del producto', 'Schema', [dbo], 'table', Products, 'column', [Max_Stock]

-- Min_Stock column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Min_Stock'))
	EXEC sp_addextendedproperty 'MS_Description', 'Existencia mínima del producto', 'Schema', [dbo], 'table', Products, 'column', [Min_Stock]

-- Stock_Status_Id column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Stock_Status_Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Relación con la tabla Stock_Status', 'Schema', [dbo], 'table', Products, 'column', [Stock_Status_Id]

-- Image_Path column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Image_Path'))
	EXEC sp_addextendedproperty 'MS_Description', 'Ruta de la imagen', 'Schema', [dbo], 'table', Products, 'column', [Image_Path]

-- Created_At column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Created_At'))
	EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creación del producto', 'Schema', [dbo], 'table', Products, 'column', [Created_At]

-- Updated_At column
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Updated_At'))
	EXEC sp_addextendedproperty 'MS_Description', 'Fecha de última actualización del producto', 'Schema', [dbo], 'table', Products, 'column', [Updated_At]