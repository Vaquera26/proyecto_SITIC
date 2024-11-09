USE dbSiticCommerce;
IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Cart_Items]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Table */
	CREATE TABLE [dbo].[Cart_Items]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador único del elemento del carrito
		[Cart_Id] INT NOT NULL, -- Identificador de la llave foránea de Carts
		[Product_Id] INT NOT NULL, -- Identificador del producto
		[Quantity] INT NOT NULL, -- Cantidad del producto en el carrito
		[Price] DECIMAL (18,2) NOT NULL, -- Precio del producto en el carrito
		[Created_At] DATETIME NOT NULL DEFAULT GETDATE(), -- Fecha de creación del elemento
		[Updated_At] DATETIME NOT NULL DEFAULT GETDATE(), -- Fecha de última actualización del elemento

	)
END

/* Create Table Comment */
IF OBJECT_ID(N'dbo.Cart_Items') IS NOT NULL
BEGIN
	IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Cart_Items', NULL, NULL))
	BEGIN
		EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena los elementos individuales de cada carrito, incluyendo la cantidad y el precio de cada producto.', 'SCHEMA', 'dbo', 'table', 'Cart_Items'
	END 
	ELSE
	BEGIN
		EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena los elementos individuales de cada carrito, incluyendo la cantidad y el precio de cada producto.', 'SCHEMA', 'dbo', 'table', 'Cart_Items'
	END
END
GO

/* Column Comments */
IF OBJECT_ID(N'dbo.Cart_Items') IS NOT NULL
BEGIN
	-- Id column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Cart_Items', 'column', 'Id'))
		EXEC sp_addextendedproperty 'MS_Description', 'Identificador único del elemento del carrito', 'Schema', [dbo], 'table', [Cart_Items], 'column', [Id];

	-- Cart_Id column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Cart_Items', 'column', 'Cart_Id'))
		EXEC sp_addextendedproperty 'MS_Description', 'Identificador de la llave foránea de Carts', 'Schema', [dbo], 'table', [Cart_Items], 'column', [Cart_Id];

	-- Product_Id column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Cart_Items', 'column', 'Product_Id'))
		EXEC sp_addextendedproperty 'MS_Description', 'Identificador del producto', 'Schema', [dbo], 'table', [Cart_Items], 'column', [Product_Id];

	-- Quantity column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Cart_Items', 'column', 'Quantity'))
		EXEC sp_addextendedproperty 'MS_Description', 'Cantidad del producto en el carrito', 'Schema', [dbo], 'table', [Cart_Items], 'column', [Quantity];

	-- Price column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Cart_Items', 'column', 'Price'))
		EXEC sp_addextendedproperty 'MS_Description', 'Precio del producto en el carrito', 'Schema', [dbo], 'table', [Cart_Items], 'column', [Price];

	-- Created_At column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Cart_Items', 'column', 'Created_At'))
		EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creación del elemento del carrito', 'Schema', [dbo], 'table', [Cart_Items], 'column', [Created_At];

	-- Updated_At column
	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Cart_Items', 'column', 'Updated_At'))
		EXEC sp_addextendedproperty 'MS_Description', 'Fecha de última actualización del elemento del carrito', 'Schema', [dbo], 'table', [Cart_Items], 'column', [Updated_At];
END
GO
