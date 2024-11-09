USE dbSiticCommerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Order_Items]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Table */
	CREATE TABLE [dbo].[Order_Items]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador único del elemento del pedido
		[Order_Id] INT NOT NULL, -- Identificador de la llave foránea de Orders
		[Product_Id] INT NOT NULL, -- Identificador del producto
		[Quantity] INT NOT NULL, -- Cantidad del producto en el pedido
		[Price] DECIMAL(18,2) NOT NULL, -- Precio del producto en el pedido
		[Created_At] DATETIME NOT NULL DEFAULT GETDATE(), -- Fecha de creación del elemento
		[Updated_At] DATETIME NOT NULL DEFAULT GETDATE(), -- Fecha de última actualización del elemento
		FOREIGN KEY ([Order_Id]) REFERENCES [dbo].[Orders]([Id]),
		FOREIGN KEY ([Product_Id]) REFERENCES [dbo].[Products]([Id])
	)
END

/* Create Table Comment */
IF OBJECT_ID(N'dbo.Order_Items') IS NOT NULL
BEGIN
	IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', NULL, NULL))
	BEGIN
		EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena los elementos individuales de cada pedido, incluyendo la cantidad y el precio de cada producto.', 'SCHEMA', 'dbo', 'table', 'Order_Items'
	END 
	ELSE
	BEGIN
		EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena los elementos individuales de cada pedido, incluyendo la cantidad y el precio de cada producto.', 'SCHEMA', 'dbo', 'table', 'Order_Items'
	END
END
GO

/* Column Comments */
IF OBJECT_ID(N'dbo.Order_Items') IS NOT NULL
BEGIN
	-- Id column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Id'))
		EXEC sp_addextendedproperty 'MS_Description', 'Identificador único del elemento del pedido', 'Schema', [dbo], 'table', [Order_Items], 'column', [Id];

	-- Order_Id column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Order_Id'))
		EXEC sp_addextendedproperty 'MS_Description', 'Identificador de la llave foránea de Orders', 'Schema', [dbo], 'table', [Order_Items], 'column', [Order_Id];

	-- Product_Id column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Product_Id'))
		EXEC sp_addextendedproperty 'MS_Description', 'Identificador del producto', 'Schema', [dbo], 'table', [Order_Items], 'column', [Product_Id];

	-- Quantity column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Quantity'))
		EXEC sp_addextendedproperty 'MS_Description', 'Cantidad del producto en el pedido', 'Schema', [dbo], 'table', [Order_Items], 'column', [Quantity];

	-- Price column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Price'))
		EXEC sp_addextendedproperty 'MS_Description', 'Precio del producto en el pedido', 'Schema', [dbo], 'table', [Order_Items], 'column', [Price];

	-- Created_At column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Created_At'))
		EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creación del elemento del pedido', 'Schema', [dbo], 'table', [Order_Items], 'column', [Created_At];

	-- Updated_At column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Updated_At'))
		EXEC sp_addextendedproperty 'MS_Description', 'Fecha de última actualización del elemento del pedido', 'Schema', [dbo], 'table', [Order_Items], 'column', [Updated_At];
END
GO
