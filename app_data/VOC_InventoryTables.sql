/****** Object:  Table [dbo].[invAsset]    Script Date: 8/22/2020 8:50:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invAsset](
	[AssetID] [int] IDENTITY(1,1) NOT NULL,
	[AssetTypeID] [int] NOT NULL,
	[AssetName] [varchar](100) NOT NULL,
	[Brand] [varchar](100) NOT NULL,
	[VendorCode] [varchar](126) NULL,
	[ModelName] [varchar](100) NULL,
	[ModelNumber] [varchar](100) NULL,
	[SerialNumber] [varchar](100) NULL,
	[AssetDescription] [varchar](500) NULL,
	[PerUnitCost] [money] NULL,
	[QuantityOnHand] [numeric](10, 2) NULL,
	[ReorderLevel] [numeric](10, 2) NULL,
	[ReorderTimeInDays] [int] NULL,
	[ReorderQuantity] [numeric](10, 2) NULL,
	[Discountinued] [bit] NULL,
	[Notes] [varchar](500) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__invAsset__43492372385430A0] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invAssetAttributeValue]    Script Date: 8/22/2020 8:50:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invAssetAttributeValue](
	[AssetAttributeValueID] [int] IDENTITY(1,1) NOT NULL,
	[AssetID] [int] NULL,
	[AssetTypeAttributeID] [int] NULL,
	[AssetAttributeValue] [varchar](500) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssetAttributeValueID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invAssetType]    Script Date: 8/22/2020 8:50:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invAssetType](
	[AssetTypeID] [int] IDENTITY(1,1) NOT NULL,
	[AssetTypeName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AssetTypeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invAssetTypeAttribute]    Script Date: 8/22/2020 8:50:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invAssetTypeAttribute](
	[AssetTypeAttributeID] [int] IDENTITY(1,1) NOT NULL,
	[AssetTypeID] [int] NULL,
	[AttributeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssetTypeAttributeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invAttribute]    Script Date: 8/22/2020 8:50:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invAttribute](
	[AttributeID] [int] IDENTITY(1,1) NOT NULL,
	[AttributeName] [varchar](100) NULL,
	[DataType] [varchar](100) NULL,
	[UoMID] [int] NULL,
	[IsRange] [bit] NULL,
	[AssetAttributeValueMin] [varchar](10) NULL,
	[AssetAttributeValueMax] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invAttributeControlData]    Script Date: 8/22/2020 8:50:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invAttributeControlData](
	[AttributeControlDataID] [int] IDENTITY(1,1) NOT NULL,
	[AttributeID] [int] NOT NULL,
	[ControlDataValue] [varchar](100) NOT NULL,
 CONSTRAINT [PK_invAttributeControlData] PRIMARY KEY CLUSTERED 
(
	[AttributeControlDataID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invInventory]    Script Date: 8/22/2020 8:50:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invInventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[InventoryTypeID] [int] NULL,
	[AssetID] [int] NULL,
	[TransferDateTime] [datetime] NULL,
	[TransferFrom] [varchar](126) NULL,
	[TransferTo] [varchar](126) NULL,
	[TransferQuantity] [decimal](10, 2) NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invInventoryType]    Script Date: 8/22/2020 8:50:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invInventoryType](
	[InventoryTypeID] [int] IDENTITY(1,1) NOT NULL,
	[InventoryTypeName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryTypeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invUnitOfMeasure]    Script Date: 8/22/2020 8:50:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invUnitOfMeasure](
	[UoMID] [int] IDENTITY(1,1) NOT NULL,
	[UoMName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UoMID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invYard]    Script Date: 8/22/2020 8:50:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invYard](
	[YardID] [int] IDENTITY(1,1) NOT NULL,
	[YardName] [varchar](255) NULL,
	[CostCenterCode] [varchar](126) NULL,
	[YardLocation] [varchar](255) NULL,
	[YardLat] [float] NULL,
	[YardLng] [float] NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[YardID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[invAsset] ON 

INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1, 1, N'1" BALL VALVES:AOP STEEL', N'AOP STEEL', NULL, NULL, NULL, NULL, N'1" RA6', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (2, 1, N'1" BALL VALVES:APACHE', N'APACHE', NULL, NULL, NULL, NULL, N'1" WCB, MR01-75', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (3, 1, N'1" BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'1" 316 BALL VALVE', NULL, CAST(3.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (4, 1, N'1" BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'1F - S92N', NULL, CAST(3.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (5, 1, N'1" BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'1F - F92NN', NULL, CAST(51.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (6, 1, N'1" BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'1F - F03N', NULL, CAST(8.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (7, 1, N'1" BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'1F - F92 ', NULL, CAST(98.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (8, 1, N'1" BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'1F - F93N', NULL, CAST(5.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (9, 1, N'1" BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'1F - S62', NULL, CAST(10.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (10, 1, N'1" BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'1F - F03N', NULL, CAST(5.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (11, 1, N'1" BALL VALVES:DYNASTY ', N'DYNASTY ', NULL, NULL, NULL, NULL, N'1F B16.34, B138-CS2-43-S2, WKM, 120108043', NULL, CAST(4.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (12, 1, N'1" BALL VALVES:DYNASTY ', N'DYNASTY ', NULL, NULL, NULL, NULL, N'1 1/2" BALL VALVE', NULL, CAST(15.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (13, 1, N'1" BALL VALVES:DYNASTY ', N'DYNASTY ', NULL, NULL, NULL, NULL, N'1 1/2" BALL VALVE, WCB', NULL, CAST(12.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (14, 1, N'1" BALL VALVES:DYNASTY SEAL', N'DYNASTY SEAL', NULL, NULL, NULL, NULL, N'1" CF8M, MR01-75', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (15, 1, N'1" BALL VALVES:DYNASTY SEAL', N'DYNASTY SEAL', NULL, NULL, NULL, NULL, N'1" WKM, IR, B16.34, B136-CS2-43-S2, 6143', NULL, CAST(4.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (16, 1, N'1" BALL VALVES:KF INDUSTRIES', N'KF INDUSTRIES', NULL, NULL, NULL, NULL, N'1" WCB, A4CE', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (17, 1, N'1" BALL VALVES:NAVCO/CAM', N'NAVCO/CAM', NULL, NULL, NULL, NULL, N'1" S20, MR0175, V202, V8925', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (18, 2, N'1" CHECK VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'1" 9Z1', NULL, CAST(3.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (19, 2, N'1" CHECK VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'1" ', NULL, CAST(23.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (20, 2, N'1" CHECK VALVES:CHEM - OIL', N'CHEM - OIL', NULL, NULL, NULL, NULL, N'1" ', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (21, 2, N'1" CHECK VALVES:FLOMORE', N'FLOMORE', NULL, NULL, NULL, NULL, N'1" D 2000', NULL, CAST(4.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (22, 2, N'1" CHECK VALVES:SHARPE', N'SHARPE', NULL, NULL, NULL, NULL, N'1" CF8M, FIG 20276-1', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (23, 2, N'1" CHECK VALVES:SMITH', N'SMITH', NULL, NULL, NULL, NULL, N'1"', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (24, 2, N'1" CHECK VALVES:WHEATLEY', N'WHEATLEY', NULL, NULL, NULL, NULL, N'1" ', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (25, 1, N'2" FLANGED BALL VALVES:API ', N'API ', NULL, NULL, NULL, N' S/N: 652418', N'2" API 6D C.L.150, 285/-20F, BODY: WCB, TRIM: SS/SS/PTEF, B16.34, P/N:E2151-1922G91,', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (26, 1, N'2" FLANGED BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2F - F63N - RF, A105,SS,SS, NYL, 2X1.5', NULL, CAST(42.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (27, 1, N'2" FLANGED BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2F - F13N - RF, 285 NOP (2" 150)', NULL, CAST(3.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (28, 1, N'2" FLANGED BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2F - F63N - RF, 2X2 600, B16 34,105 SS/SS/NYL,', NULL, CAST(3.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (29, 1, N'2" FLANGED BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2R-F03N-RJ, 3705 - MOP', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (30, 1, N'2" FLANGED BALL VALVES:BONNY FORGE', N'BONNY FORGE', NULL, NULL, NULL, N'S/N: 127833-0022, 127501-001', N'2" 1500, 003705', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (31, 1, N'2" FLANGED BALL VALVES:CAMERON/WKM', N'CAMERON/WKM', NULL, NULL, NULL, N' S/N:1280992,', N'2X2 1500, MODEL: 370D4,BM:2042663-10-03, 6 D, BODY: C/S, STEM: AS ENP, BALL: ASENP, SEAT: LASEN P/NYL-6, SEALS: HNBR', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (32, 1, N'2" FLANGED BALL VALVES:FORCE', N'FORCE', NULL, NULL, NULL, NULL, N'2" 1500, BODY: WCB, BALL: CF8M', NULL, CAST(6.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (33, 1, N'2" FLANGED BALL VALVES:KF  ', N'KF  ', NULL, NULL, NULL, N'S/N: 566613-566617', N'2X1.5" 150, API 6D:ISO 14313, BODY: WCB, TRIM:SS,SS, PTFE, 300F 230MOP, P/N:C2150-1322G911D, ', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (34, 1, N'2" FLANGED BALL VALVES:VINTROL', N'VINTROL', NULL, NULL, NULL, N'S/N: SBV1495/39', N'2" RP 600, WCB, P/N: 4602-1261419999, TRIM: SS/DBILRIN/HNBR', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (35, 2, N'2" FLANGED CHECK VALVES:CAMERON/ WHEATLEY ', N'CAMERON/ WHEATLEY ', NULL, NULL, NULL, N'S/N: 1266586, 106697', N'2" 1500, BODY: WCC, COVER: A516, 2270020-01, ', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (36, 2, N'2" FLANGED CHECK VALVES:CAMERON/ WHEATLEY ', N'CAMERON/ WHEATLEY ', NULL, NULL, NULL, N'S/N: 1303 7000 1001', N'2" 600, FIG: 510-024360-121, ', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (37, 1, N'2" THREAD BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2R - F03', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (38, 1, N'2" THREAD BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2F - S32', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (39, 1, N'2" THREAD BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2R - S92N, 1073/1735', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (40, 1, N'2" THREAD BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2R - S92 1073/1735', NULL, CAST(4.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (41, 1, N'2" THREAD BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2R - F92', NULL, CAST(14.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (42, 1, N'2" THREAD BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2F -F92N', NULL, CAST(56.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (43, 1, N'2" THREAD BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2F - F93N ', NULL, CAST(5.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (44, 1, N'2" THREAD BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2F - 93N ', NULL, CAST(16.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (45, 1, N'2" THREAD BALL VALVES:WKM', N'WKM', NULL, NULL, NULL, NULL, N'2" CSO-857', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (46, 2, N'2" THREAD CHECK VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2R - C03, STL, ', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (47, 2, N'2" THREAD CHECK VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2R-C92, DTL', NULL, CAST(7.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (48, 2, N'2" THREAD CHECK VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'2F - C63S - RF', NULL, CAST(8.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (49, 2, N'2" THREAD CHECK VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N' 2" CHECK VALVE ', NULL, CAST(7.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (50, 2, N'2" THREAD CHECK VALVES:CAMERON/WHEATLEY', N'CAMERON/WHEATLEY', NULL, NULL, NULL, NULL, N'2" DN 50 NPT, BODY: CS/BUNA-PC, FLAPPER:CF8M, P/N# 9D-822-023360-131, PSI/BAR:3660/246, 2268738,WCC', NULL, CAST(5.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (51, 2, N'2" THREAD CHECK VALVES:CHEM - OIL', N'CHEM - OIL', NULL, NULL, NULL, NULL, N'NO: 2D1TVCV - 2000, BODY: A 395, TEMP: 400', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (52, 2, N'2" THREAD CHECK VALVES:FLOMORE', N'FLOMORE', NULL, NULL, NULL, NULL, N'D 2000 - 2 STANDARD TRIM BUNA: N 180MAX, OPTICAL TRIM: VITON A 400 MAX, MR01-75', NULL, CAST(3.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (53, 2, N'2" THREAD CHECK VALVES:FLOMORE', N'FLOMORE', NULL, NULL, NULL, NULL, N'2" WCB CHECK VALVE', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (54, 2, N'2" THREAD CHECK VALVES:TULSA ', N'TULSA ', NULL, NULL, NULL, NULL, N'TV: 2033', NULL, CAST(3.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (55, 2, N'2" THREAD CHECK VALVES:YOUNG OIL TOOLS', N'YOUNG OIL TOOLS', NULL, NULL, NULL, NULL, N'2" CHECK VALVE, 2-18-80-1, SAFE CHECK', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (56, 1, N'3" FLANGED BALL VALVES:BALON ', N'BALON ', NULL, NULL, NULL, NULL, N'3R - F63 -RF 600, AWS CS/CS/NYL', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (57, 1, N'3" FLANGED BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'3R - S32N', NULL, CAST(3.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (58, 1, N'3" FLANGED BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'3F - F13N - RF, 150, 105 SS/SS/NYL', NULL, CAST(5.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (59, 1, N'3" FLANGED BALL VALVES:CAMERON/ WHEATLEY ', N'CAMERON/ WHEATLEY ', NULL, NULL, NULL, N'S/N: 1876120 ', N'3X3 WKM, MODEL: 37004, BM: 2191559-10-05, BODY: C/S, STEM: AS ENP, SEAL: CS ENP, SEALS: HNBR, ', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (60, 2, N'3" FLANGED CHECK VALVE:API ', N'API ', NULL, NULL, NULL, NULL, N'3" 600, P/N: 9D-910-03514-121, BODY: WCC', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (61, 2, N'3" FLANGED CHECK VALVE:BALON', N'BALON', NULL, NULL, NULL, NULL, N'3F - C63S - RF, B16.34, WCB SS/SS', NULL, CAST(9.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (62, 2, N'3" FLANGED CHECK VALVE:BALON', N'BALON', NULL, NULL, NULL, NULL, N'3F - C13S - RF 3X3, BODY: WCB SS/SS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (63, 2, N'3" FLANGED CHECK VALVE:CAMERON/ WHEATLEY |75', N'CAMERON', NULL, NULL, NULL, N'S/N: 080142006109', N'3" 600,  BODY: WCC, DISC: CF8M', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (64, 2, N'3" FLANGED CHECK VALVE:CAMERON/ WHEATLEY |76', N'CAMERON', NULL, NULL, NULL, N'S/N: 100372034, 2067301-063', N'3" 600, BODY: WCC, DISC: CF8M', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (65, 2, N'3" FLANGED CHECK VALVE:CAMERON/ WHEATLEY ', N'CAMERON/ WHEATLEY ', NULL, NULL, NULL, NULL, N'3" 600, CCSA: CWP 14890, P/N: 150, FIG: 90-510-034216-121, ', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (66, 2, N'3" FLANGED CHECK VALVE:CAMERON/WHEATLEY', N'CAMERON/WHEATLEY', NULL, NULL, NULL, N'S/N: 110308002179', N'NPS 3 600,  FIG: 90-510-035 144 - 121', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (67, 2, N'3" FLANGED CHECK VALVE:CAMERON/WHEATLEY', N'CAMERON/WHEATLEY', NULL, NULL, NULL, N'S/N: 413725,', N'3" 600, SERIES: 35,  P/N: 7856-1130RB1961, TRIM: SS, BODY: C/S', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (68, 2, N'3" FLANGED CHECK VALVE:CAMERON/WHEATLEY', N'CAMERON/WHEATLEY', NULL, NULL, NULL, N'S/N: 100371002039,', N'3" 600, SERIES: 35,  P/N: 100, CLAPPER: SS, BODY: WCC, SERVICE: STANDARD', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (69, 1, N'3" THREAD BALL VALVE:BALON', N'BALON', NULL, NULL, NULL, NULL, N'3R - F92N', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (70, 1, N'3" THREAD BALL VALVE:BALON', N'BALON', NULL, NULL, NULL, NULL, N'3F - S32N,D- 1286', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (71, 1, N'3" THREAD BALL VALVE:BALON', N'BALON', NULL, NULL, NULL, NULL, N'3F - 932N, D-1286', NULL, CAST(14.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (72, 1, N'3" THREAD BALL VALVE:BALON', N'BALON', NULL, NULL, NULL, NULL, N'3F - F63N', NULL, CAST(6.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (73, 1, N'3" THREAD BALL VALVE:CAMERON/ WKM', N'CAMERON/ WKM', NULL, NULL, NULL, NULL, N'3X2 MODEL: 310C5, BM:2056911-01, B136, BODY/SEAL: CS2, BODY/STEM: S2, ', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (74, 2, N'3" THREAD CHECK VALVE:FLOMORE', N'FLOMORE', NULL, NULL, NULL, NULL, N'D 2000 - 3, STANDARD TRIM: BUNA, OPTICAL TRIM: VITON, MR01-75', NULL, CAST(5.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (75, 2, N'3" THREAD CHECK VALVE:KF', N'KF', NULL, NULL, NULL, NULL, N'3" 1500, SERIES: 31', NULL, CAST(3.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (76, 3, N'3/4" GATE VALVE:DSI', N'DSI', NULL, NULL, NULL, N'S/N: (2)131698 - 016, (2)130751, (2)130921-009,  131696-016', N'3/4" 800, 4121A8-18, BODY:A105N, STEM: F6, DISC:F6, SEAT: F6HF', NULL, CAST(9.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (77, 1, N'4" FLANGED BALL VALVE:BALON', N'BALON', NULL, NULL, NULL, NULL, N'4R - F13N - RF, A105 SS/SS NYL', NULL, CAST(3.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (78, 1, N'4" FLANGED BALL VALVE:BALON', N'BALON', NULL, NULL, NULL, NULL, N'4R - F63N - RF 600, 4X3', NULL, CAST(7.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (79, 1, N'4" FLANGED BALL VALVE:BALON', N'BALON', NULL, NULL, NULL, NULL, N'4F - F63 -RF, 4X4', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (80, 1, N'4" FLANGED BALL VALVE:KF', N'KF', NULL, NULL, NULL, NULL, N'4 X 3 150,API: ISO 14313, BODY: WCB, TRIM: NACE SS TEE, P/N: G2155-1822G9ILD.', NULL, CAST(16.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (81, 1, N'4" THREAD BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'4F - F32N BALL VALVE', NULL, CAST(6.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (82, 1, N'4" THREAD BALL VALVES:BALON', N'BALON', NULL, NULL, NULL, NULL, N'4R - S32 BALL VALVE', NULL, CAST(11.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (83, 2, N'4" THREAD CHECK VALVE:BALON', N'BALON', NULL, NULL, NULL, NULL, N'4F - C13S - RF CHECK VALVE, BODY WCB SS/SS', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (84, 2, N'4" THREAD CHECK VALVE:CAMERON/ WHEATLEY ', N'CAMERON/ WHEATLEY ', NULL, NULL, NULL, N'S/N: 2063604-067', N'4" 600, FIG: 9D-510-045144-121, BODY: WCC', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (85, 2, N'4" THREAD CHECK VALVE:CAMERON/ WHEATLEY ', N'CAMERON/ WHEATLEY ', NULL, NULL, NULL, N'S/N: 120100002023', N'4" 600, E-121599-3, BODY: WCC, CLAPPER: SS', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (86, 2, N'4" THREAD CHECK VALVE:CAMERON', N'CAMERON', NULL, NULL, NULL, N'S/N: 12045839-004', N'4" 600, BODY: WCC, PISTON: 4COSS, SEALS: BUNA 2270093-01, ', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (87, 2, N'4" THREAD CHECK VALVE:FLOMORE', N'FLOMORE', NULL, NULL, NULL, NULL, N'D 2000 - 4, CHECK VALVE', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (88, 2, N'4" THREAD CHECK VALVE:KF', N'KF', NULL, NULL, NULL, N'S/N: 180340', N'4" 600, P/N: 7857-1139KC1961, BODY: WCB, TRIM: SS ', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (89, 2, N'4" THREAD CHECK VALVE:KF', N'KF', NULL, NULL, NULL, N'S/N: 394162, 360240', N'4" 600, SERIES: 35, BODY: WCB, P/N:7857-113KB1911, ', NULL, CAST(2.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (90, 1, N'6" FLANGED BALL VALVE:BALON', N'BALON', NULL, NULL, NULL, N'S/N: 00VVM, 04BMQ,0472L, 008EA,03PSN,03JJW,03N03, 008EM, 012EU, O4BMR, 3EHN, 8HPO,  04BMVV', N'6F - F63N - RF, 600, A105 SS/SS/ CC', NULL, CAST(13.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (91, 1, N'6" FLANGED BALL VALVE:BALON', N'BALON', NULL, NULL, NULL, NULL, N'6F - F13N - RF, 150', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (92, 1, N'6" FLANGED BALL VALVE:KF', N'KF', NULL, NULL, NULL, N'S/N: 567835', N'6 X 4 150, BODY: WCB, TRIM: SS TEE', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (93, 2, N'6" FLANGED CHECK VALVE:BALON', N'BALON', NULL, NULL, NULL, NULL, N'6F - C63S -RF', NULL, CAST(1.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), N'dbo', CAST(N'2020-08-06T11:19:34.953' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (102, 3, N'abcde', N'xyz', NULL, NULL, NULL, NULL, N'test', NULL, CAST(100.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, NULL, N'VERDUN\jchen', CAST(N'2020-08-20T10:09:53.793' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-20T22:05:58.907' AS DateTime), 1)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (104, 3, N'Gate Valve JC', N'Verdun', NULL, NULL, NULL, NULL, N'Gate Valve JC Description', NULL, CAST(50.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, N'How are you doing?', N'Guest', CAST(N'2020-08-21T20:12:40.390' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:22:13.613' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (106, 3, N'abc13', N'Click2Houston', NULL, NULL, NULL, NULL, N'welcome to houston', NULL, CAST(25.00 AS Numeric(10, 2)), NULL, NULL, NULL, NULL, N'Today is a hot day.', N'VERDUN\jchen', CAST(N'2020-08-21T16:27:12.837' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:35:30.830' AS DateTime), 0)
INSERT [dbo].[invAsset] ([AssetID], [AssetTypeID], [AssetName], [Brand], [VendorCode], [ModelName], [ModelNumber], [SerialNumber], [AssetDescription], [PerUnitCost], [QuantityOnHand], [ReorderLevel], [ReorderTimeInDays], [ReorderQuantity], [Discountinued], [Notes], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (107, 1, N'sfada', N'safdsa', NULL, NULL, NULL, NULL, N'fdsaf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VERDUN\jchen', CAST(N'2020-08-21T17:02:04.287' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T17:02:04.287' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[invAsset] OFF
GO
SET IDENTITY_INSERT [dbo].[invAssetAttributeValue] ON 

INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, 2, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, 3, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, 4, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, 5, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, 6, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, 7, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, 8, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, 9, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, 10, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, 11, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, 12, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, 13, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, 14, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, 15, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, 16, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, 17, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, 18, 8, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, 20, 8, N'CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (19, 21, 8, N'SWING CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (20, 22, 8, N'CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (21, 23, 8, N'CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (22, 24, 8, N'CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (23, 25, 1, N'CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (24, 26, 1, N'CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (25, 29, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (26, 30, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (27, 31, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (28, 32, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (29, 33, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (30, 34, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (31, 35, 8, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (32, 36, 8, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (33, 37, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (34, 39, 1, N'THREAD CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (35, 40, 1, N'THREAD CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (36, 41, 1, N'THREAD CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (37, 42, 1, N'THREAD CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (38, 43, 1, N'THREAD CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (39, 44, 1, N'THREAD CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (40, 45, 1, N'THREAD CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (41, 46, 8, N'THREAD CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (42, 47, 8, N'THREAD CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (43, 48, 8, N'THREAD CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (44, 50, 8, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (45, 51, 8, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (46, 52, 8, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (47, 53, 8, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (48, 54, 8, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (49, 55, 8, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (50, 56, 1, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (51, 57, 1, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (52, 58, 1, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (53, 59, 1, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (54, 61, 8, N'FLANGED CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (55, 62, 8, N'FLANGED CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (56, 64, 8, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (57, 65, 8, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (58, 66, 8, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (59, 67, 8, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (60, 69, 1, N'FLANGES CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (61, 70, 1, N'FLANGED CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (62, 71, 1, N'FLANGED CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (63, 72, 1, N'FLANGED CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (64, 73, 1, N'FLANGE CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (65, 74, 8, N'FLANGED CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (66, 77, 1, N'FLANGED CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (67, 79, 1, N'THREAD CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (68, 80, 1, N'THREAD CHECK VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (69, 81, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (70, 82, 1, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (71, 83, 8, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (72, 84, 8, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (73, 85, 8, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (74, 87, 8, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (75, 88, 8, N'THREAD BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (76, 90, 1, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (77, 91, 1, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (78, 92, 1, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (79, 93, 8, N'FLANGED BALL VALVE', N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime), N'dbo', CAST(N'2020-08-11T17:29:47.097' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (80, 2, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (81, 3, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (82, 4, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (83, 5, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (84, 6, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (85, 7, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (86, 8, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (87, 9, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (88, 10, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (89, 11, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (90, 12, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (91, 13, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (92, 14, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (93, 15, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (94, 16, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (95, 17, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (96, 18, 9, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (97, 20, 9, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (98, 21, 9, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (99, 22, 9, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
GO
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (100, 23, 9, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (101, 24, 9, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (102, 25, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (103, 26, 2, N'1"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (104, 29, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (105, 30, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (106, 31, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (107, 32, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (108, 33, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (109, 34, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (110, 35, 9, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (111, 36, 9, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (112, 37, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (113, 39, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (114, 40, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (115, 41, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (116, 42, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (117, 43, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (118, 44, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (119, 45, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (120, 46, 9, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (121, 47, 9, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (122, 48, 9, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (123, 50, 9, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (124, 51, 9, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (125, 52, 9, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (126, 53, 9, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (127, 54, 9, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (128, 55, 9, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (129, 56, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (130, 57, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (131, 58, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (132, 59, 2, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (133, 61, 9, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (134, 62, 9, N'2"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (135, 64, 9, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (136, 65, 9, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (137, 66, 9, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (138, 67, 9, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (139, 69, 2, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (140, 70, 2, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (141, 71, 2, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (142, 72, 2, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (143, 73, 2, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (144, 74, 9, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (145, 77, 2, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (146, 79, 2, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (147, 80, 2, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (148, 81, 2, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (149, 82, 2, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (150, 83, 9, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (151, 84, 9, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (152, 85, 9, N'3"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (153, 87, 9, N'4"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (154, 88, 9, N'4"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (155, 90, 2, N'4"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (156, 91, 2, N'4"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (157, 92, 2, N'4"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (158, 93, 9, N'4"', N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime), N'dbo', CAST(N'2020-08-11T17:39:52.227' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (159, 2, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (160, 3, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (161, 4, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (162, 5, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (163, 6, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (164, 7, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (165, 8, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (166, 9, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (167, 10, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (168, 11, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (169, 12, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (170, 13, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (171, 14, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (172, 15, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (173, 16, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (174, 17, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (175, 18, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (176, 20, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (177, 21, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (178, 22, 11, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (179, 23, 11, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (180, 24, 11, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (181, 25, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (182, 26, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (183, 29, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (184, 30, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (185, 31, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (186, 32, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (187, 33, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (188, 34, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (189, 35, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (190, 36, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (191, 37, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (192, 39, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (193, 40, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (194, 41, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (195, 42, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (196, 43, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (197, 44, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (198, 45, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (199, 46, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
GO
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (200, 47, 11, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (201, 48, 11, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (202, 50, 11, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (203, 51, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (204, 52, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (205, 53, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (206, 54, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (207, 55, 11, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (208, 56, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (209, 57, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (210, 58, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (211, 59, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (212, 61, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (213, 62, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (214, 64, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (215, 65, 11, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (216, 66, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (217, 67, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (218, 69, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (219, 70, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (220, 71, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (221, 72, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (222, 73, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (223, 74, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (224, 77, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (225, 79, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (226, 80, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (227, 81, 4, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (228, 82, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (229, 83, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (230, 84, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (231, 85, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (232, 87, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (233, 88, 11, N'False', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (234, 90, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (235, 91, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (236, 92, 4, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (237, 93, 11, N'True', N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime), N'dbo', CAST(N'2020-08-11T17:41:19.337' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (238, 2, 3, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (239, 3, 3, N'3000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (240, 4, 3, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (241, 5, 3, N'2500PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (242, 6, 3, N'1500PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (243, 7, 3, N'3000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (244, 8, 3, N'2500PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (245, 9, 3, N'3000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (246, 10, 3, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (247, 11, 3, N'2000WOG', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (248, 12, 3, N'2000WOG', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (249, 13, 3, N'2000WOG ', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (250, 14, 3, N'2000WP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (251, 15, 3, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (252, 16, 3, N'3000WP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (253, 17, 3, N'2000WOG', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (254, 18, 10, N'2000WOG', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (255, 20, 10, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (256, 21, 10, N'200PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (257, 22, 10, N'2500PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (258, 23, 10, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (259, 24, 10, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (260, 25, 3, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (261, 26, 3, N'800PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (262, 29, 3, N'3000MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (263, 30, 3, N'750PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (264, 31, 3, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (265, 32, 3, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (266, 33, 3, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (267, 34, 3, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (268, 35, 10, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (269, 36, 10, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (270, 37, 3, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (271, 39, 3, N'3000WP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (272, 40, 3, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (273, 41, 3, N'2000WP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (274, 42, 3, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (275, 43, 3, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (276, 44, 3, NULL, N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (277, 45, 3, N'5000WP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (278, 46, 10, N'300WP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (279, 47, 10, N'2000WP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (280, 48, 10, NULL, N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (281, 50, 10, N'1480 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (282, 51, 10, N'148 PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (283, 52, 10, NULL, N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (284, 53, 10, N'285 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (285, 54, 10, NULL, N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (286, 55, 10, N'1480 NOP ', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (287, 56, 3, N'370 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (288, 57, 3, N'3700 PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (289, 58, 3, N'1500 PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (290, 59, 3, NULL, N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (291, 61, 10, N'3750 PSI ', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (292, 62, 10, N'2540 PSI ', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (293, 64, 10, NULL, N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (294, 65, 10, N'285 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (295, 66, 10, N'1480 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (296, 67, 10, N'1480 PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (297, 69, 3, N'1480MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (298, 70, 3, N'285 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (299, 71, 3, N'1500 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
GO
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (300, 72, 3, N'1480 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (301, 73, 3, N'1500 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (302, 74, 10, N'1500 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (303, 77, 3, NULL, N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (304, 79, 3, N'2000 PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (305, 80, 3, N'1500 PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (306, 81, 3, N'3000 PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (307, 82, 3, N'2000PSI', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (308, 83, 10, N'750 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (309, 84, 10, N'750 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (310, 85, 10, N'1500MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (311, 87, 10, N'750 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (312, 88, 10, N'?', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (313, 90, 3, N'285 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (314, 91, 3, N'285 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (315, 92, 3, N'1480 MOP', N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (316, 93, 10, NULL, N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime), N'dbo', CAST(N'2020-08-11T17:43:57.220' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (366, 102, 15, N'1" valve', N'VERDUN\jchen', CAST(N'2020-08-20T10:09:54.037' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-20T22:05:58.940' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (367, 102, 16, N'1', N'VERDUN\jchen', CAST(N'2020-08-20T10:09:54.057' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-20T22:05:58.967' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (368, 102, 17, N'100', N'VERDUN\jchen', CAST(N'2020-08-20T10:09:54.060' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-20T22:05:58.987' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (369, 102, 18, NULL, N'VERDUN\jchen', CAST(N'2020-08-20T10:09:54.060' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-20T22:05:59.010' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (370, 102, 19, N'2', N'VERDUN\jchen', CAST(N'2020-08-20T10:09:54.060' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-20T22:05:59.033' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (371, 102, 20, N'200', N'VERDUN\jchen', CAST(N'2020-08-20T10:09:54.060' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-20T22:05:59.057' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (372, 102, 21, N'7', N'VERDUN\jchen', CAST(N'2020-08-20T10:09:54.060' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-20T22:05:59.077' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (373, 102, 23, N'9/23/2020', N'VERDUN\jchen', CAST(N'2020-08-20T10:09:54.060' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-20T22:05:59.100' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (382, 104, 15, N'Thread Gate Valve', N'Guest', CAST(N'2020-08-21T20:12:40.580' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:22:13.653' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (383, 104, 16, N'1.5', N'Guest', CAST(N'2020-08-21T20:12:40.583' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:22:13.673' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (384, 104, 17, N'4000', N'Guest', CAST(N'2020-08-21T20:12:40.587' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:22:13.697' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (385, 104, 18, NULL, N'Guest', CAST(N'2020-08-21T20:12:40.587' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:22:13.717' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (386, 104, 19, N'2', N'Guest', CAST(N'2020-08-21T20:12:40.587' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:22:13.737' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (387, 104, 20, N'', N'Guest', CAST(N'2020-08-21T20:12:40.587' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:22:13.760' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (388, 104, 21, N'2', N'Guest', CAST(N'2020-08-21T20:12:40.587' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:22:13.777' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (389, 104, 23, N'8/28/2020', N'Guest', CAST(N'2020-08-21T20:12:40.587' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:22:13.797' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (390, 106, 15, N'1" valve', N'VERDUN\jchen', CAST(N'2020-08-21T16:27:13.150' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:35:30.873' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (391, 106, 16, N'1', N'VERDUN\jchen', CAST(N'2020-08-21T16:27:13.167' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:35:30.897' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (392, 106, 17, N'', N'VERDUN\jchen', CAST(N'2020-08-21T16:27:13.167' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:35:30.920' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (393, 106, 18, N'on', N'VERDUN\jchen', CAST(N'2020-08-21T16:27:13.167' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:35:30.940' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (394, 106, 19, N'2', N'VERDUN\jchen', CAST(N'2020-08-21T16:27:13.167' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:35:30.963' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (395, 106, 20, N'', N'VERDUN\jchen', CAST(N'2020-08-21T16:27:13.167' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:35:30.987' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (396, 106, 21, N'6', N'VERDUN\jchen', CAST(N'2020-08-21T16:27:13.167' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:35:31.013' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (397, 106, 23, N'9/30/2020', N'VERDUN\jchen', CAST(N'2020-08-21T16:27:13.167' AS DateTime), N'VERDUN\jchen', CAST(N'2020-08-21T16:35:31.037' AS DateTime))
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (398, 107, 1, N'', N'VERDUN\jchen', CAST(N'2020-08-21T17:02:04.507' AS DateTime), NULL, NULL)
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (399, 107, 2, N'sfa', N'VERDUN\jchen', CAST(N'2020-08-21T17:02:04.520' AS DateTime), NULL, NULL)
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (400, 107, 3, N'', N'VERDUN\jchen', CAST(N'2020-08-21T17:02:04.520' AS DateTime), NULL, NULL)
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (401, 107, 4, NULL, N'VERDUN\jchen', CAST(N'2020-08-21T17:02:04.520' AS DateTime), NULL, NULL)
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (402, 107, 5, N'', N'VERDUN\jchen', CAST(N'2020-08-21T17:02:04.520' AS DateTime), NULL, NULL)
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (403, 107, 6, N'', N'VERDUN\jchen', CAST(N'2020-08-21T17:02:04.520' AS DateTime), NULL, NULL)
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (404, 107, 7, N'0', N'VERDUN\jchen', CAST(N'2020-08-21T17:02:04.520' AS DateTime), NULL, NULL)
INSERT [dbo].[invAssetAttributeValue] ([AssetAttributeValueID], [AssetID], [AssetTypeAttributeID], [AssetAttributeValue], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (405, 107, 22, N'', N'VERDUN\jchen', CAST(N'2020-08-21T17:02:04.520' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[invAssetAttributeValue] OFF
GO
SET IDENTITY_INSERT [dbo].[invAssetType] ON 

INSERT [dbo].[invAssetType] ([AssetTypeID], [AssetTypeName]) VALUES (1, N'Ball Valve')
INSERT [dbo].[invAssetType] ([AssetTypeID], [AssetTypeName]) VALUES (2, N'Check Valve')
INSERT [dbo].[invAssetType] ([AssetTypeID], [AssetTypeName]) VALUES (3, N'Gate Valve')
INSERT [dbo].[invAssetType] ([AssetTypeID], [AssetTypeName]) VALUES (4, N'Pressure Regulator')
INSERT [dbo].[invAssetType] ([AssetTypeID], [AssetTypeName]) VALUES (5, N'Pressure Regulator Gas')
SET IDENTITY_INSERT [dbo].[invAssetType] OFF
GO
SET IDENTITY_INSERT [dbo].[invAssetTypeAttribute] ON 

INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (24, NULL, NULL)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (1, 1, 1)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (2, 1, 2)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (3, 1, 3)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (4, 1, 4)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (5, 1, 5)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (6, 1, 7)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (7, 1, 8)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (22, 1, 9)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (8, 2, 1)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (9, 2, 2)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (10, 2, 3)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (11, 2, 4)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (12, 2, 5)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (13, 2, 7)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (14, 2, 8)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (15, 3, 1)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (16, 3, 2)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (17, 3, 3)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (18, 3, 4)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (19, 3, 5)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (20, 3, 7)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (21, 3, 8)
INSERT [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID], [AssetTypeID], [AttributeID]) VALUES (23, 3, 9)
SET IDENTITY_INSERT [dbo].[invAssetTypeAttribute] OFF
GO
SET IDENTITY_INSERT [dbo].[invAttribute] ON 

INSERT [dbo].[invAttribute] ([AttributeID], [AttributeName], [DataType], [UoMID], [IsRange], [AssetAttributeValueMin], [AssetAttributeValueMax]) VALUES (1, N'Asset Type Description', N'string', NULL, NULL, NULL, NULL)
INSERT [dbo].[invAttribute] ([AttributeID], [AttributeName], [DataType], [UoMID], [IsRange], [AssetAttributeValueMin], [AssetAttributeValueMax]) VALUES (2, N'Size', N'int', 1, NULL, NULL, NULL)
INSERT [dbo].[invAttribute] ([AttributeID], [AttributeName], [DataType], [UoMID], [IsRange], [AssetAttributeValueMin], [AssetAttributeValueMax]) VALUES (3, N'Pressure Rating', N'int', 2, NULL, NULL, NULL)
INSERT [dbo].[invAttribute] ([AttributeID], [AttributeName], [DataType], [UoMID], [IsRange], [AssetAttributeValueMin], [AssetAttributeValueMax]) VALUES (4, N'IsNACE', N'boolean', NULL, NULL, NULL, NULL)
INSERT [dbo].[invAttribute] ([AttributeID], [AttributeName], [DataType], [UoMID], [IsRange], [AssetAttributeValueMin], [AssetAttributeValueMax]) VALUES (5, N'Oriface', N'int', 1, NULL, NULL, NULL)
INSERT [dbo].[invAttribute] ([AttributeID], [AttributeName], [DataType], [UoMID], [IsRange], [AssetAttributeValueMin], [AssetAttributeValueMax]) VALUES (6, N'WOG', N'int', 2, NULL, NULL, NULL)
INSERT [dbo].[invAttribute] ([AttributeID], [AttributeName], [DataType], [UoMID], [IsRange], [AssetAttributeValueMin], [AssetAttributeValueMax]) VALUES (7, N'WP', N'int', 2, NULL, NULL, NULL)
INSERT [dbo].[invAttribute] ([AttributeID], [AttributeName], [DataType], [UoMID], [IsRange], [AssetAttributeValueMin], [AssetAttributeValueMax]) VALUES (8, N'Grade', N'ControlData', NULL, NULL, NULL, NULL)
INSERT [dbo].[invAttribute] ([AttributeID], [AttributeName], [DataType], [UoMID], [IsRange], [AssetAttributeValueMin], [AssetAttributeValueMax]) VALUES (9, N'ExpirationDate', N'Date', NULL, NULL, NULL, NULL)
INSERT [dbo].[invAttribute] ([AttributeID], [AttributeName], [DataType], [UoMID], [IsRange], [AssetAttributeValueMin], [AssetAttributeValueMax]) VALUES (10, N'Catogory', N'ControlData', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[invAttribute] OFF
GO
SET IDENTITY_INSERT [dbo].[invAttributeControlData] ON 

INSERT [dbo].[invAttributeControlData] ([AttributeControlDataID], [AttributeID], [ControlDataValue]) VALUES (1, 8, N'A')
INSERT [dbo].[invAttributeControlData] ([AttributeControlDataID], [AttributeID], [ControlDataValue]) VALUES (2, 8, N'B')
INSERT [dbo].[invAttributeControlData] ([AttributeControlDataID], [AttributeID], [ControlDataValue]) VALUES (3, 8, N'C')
INSERT [dbo].[invAttributeControlData] ([AttributeControlDataID], [AttributeID], [ControlDataValue]) VALUES (6, 8, N'D')
INSERT [dbo].[invAttributeControlData] ([AttributeControlDataID], [AttributeID], [ControlDataValue]) VALUES (7, 8, N'E')
INSERT [dbo].[invAttributeControlData] ([AttributeControlDataID], [AttributeID], [ControlDataValue]) VALUES (10, 10, N'Engine')
INSERT [dbo].[invAttributeControlData] ([AttributeControlDataID], [AttributeID], [ControlDataValue]) VALUES (9, 10, N'Regulator')
INSERT [dbo].[invAttributeControlData] ([AttributeControlDataID], [AttributeID], [ControlDataValue]) VALUES (8, 10, N'Valve')
SET IDENTITY_INSERT [dbo].[invAttributeControlData] OFF
GO
SET IDENTITY_INSERT [dbo].[invUnitOfMeasure] ON 

INSERT [dbo].[invUnitOfMeasure] ([UoMID], [UoMName]) VALUES (1, N'" Inch ')
INSERT [dbo].[invUnitOfMeasure] ([UoMID], [UoMName]) VALUES (2, N'PSI')
SET IDENTITY_INSERT [dbo].[invUnitOfMeasure] OFF
GO
/****** Object:  Index [UC_invAssetType_invAttribute]    Script Date: 8/22/2020 8:50:07 AM ******/
ALTER TABLE [dbo].[invAssetTypeAttribute] ADD  CONSTRAINT [UC_invAssetType_invAttribute] UNIQUE NONCLUSTERED 
(
	[AssetTypeID] ASC,
	[AttributeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_invAttributeControlData]    Script Date: 8/22/2020 8:50:07 AM ******/
ALTER TABLE [dbo].[invAttributeControlData] ADD  CONSTRAINT [UC_invAttributeControlData] UNIQUE NONCLUSTERED 
(
	[AttributeID] ASC,
	[ControlDataValue] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[invAsset] ADD  CONSTRAINT [df_Asset_CreateBy]  DEFAULT (user_name()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[invAsset] ADD  CONSTRAINT [df_Asset_CreateDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[invAsset] ADD  CONSTRAINT [df_Asset_ModifiedBy]  DEFAULT (user_name()) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[invAsset] ADD  CONSTRAINT [df_Asset_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[invAsset] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[invAssetAttributeValue] ADD  DEFAULT (user_name()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[invAssetAttributeValue] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[invAssetAttributeValue] ADD  DEFAULT (user_name()) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[invAssetAttributeValue] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[invAsset]  WITH CHECK ADD  CONSTRAINT [FK_invAsset_invAssetType] FOREIGN KEY([AssetTypeID])
REFERENCES [dbo].[invAssetType] ([AssetTypeID])
GO
ALTER TABLE [dbo].[invAsset] CHECK CONSTRAINT [FK_invAsset_invAssetType]
GO
ALTER TABLE [dbo].[invAssetAttributeValue]  WITH CHECK ADD  CONSTRAINT [FK_invAssetAttributeValue_invAsset] FOREIGN KEY([AssetID])
REFERENCES [dbo].[invAsset] ([AssetID])
GO
ALTER TABLE [dbo].[invAssetAttributeValue] CHECK CONSTRAINT [FK_invAssetAttributeValue_invAsset]
GO
ALTER TABLE [dbo].[invAssetAttributeValue]  WITH CHECK ADD  CONSTRAINT [FK_invAssetAttributeValue_invAssetTypeAttribute] FOREIGN KEY([AssetTypeAttributeID])
REFERENCES [dbo].[invAssetTypeAttribute] ([AssetTypeAttributeID])
GO
ALTER TABLE [dbo].[invAssetAttributeValue] CHECK CONSTRAINT [FK_invAssetAttributeValue_invAssetTypeAttribute]
GO
ALTER TABLE [dbo].[invAssetTypeAttribute]  WITH CHECK ADD  CONSTRAINT [FK_invAssetTypeAttribute_invAssetType] FOREIGN KEY([AssetTypeID])
REFERENCES [dbo].[invAssetType] ([AssetTypeID])
GO
ALTER TABLE [dbo].[invAssetTypeAttribute] CHECK CONSTRAINT [FK_invAssetTypeAttribute_invAssetType]
GO
ALTER TABLE [dbo].[invAssetTypeAttribute]  WITH CHECK ADD  CONSTRAINT [FK_invAssetTypeAttribute_invAttribute] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[invAttribute] ([AttributeID])
GO
ALTER TABLE [dbo].[invAssetTypeAttribute] CHECK CONSTRAINT [FK_invAssetTypeAttribute_invAttribute]
GO
ALTER TABLE [dbo].[invAttribute]  WITH CHECK ADD  CONSTRAINT [FK_invAttribute_invUnitOfMeasure] FOREIGN KEY([UoMID])
REFERENCES [dbo].[invUnitOfMeasure] ([UoMID])
GO
ALTER TABLE [dbo].[invAttribute] CHECK CONSTRAINT [FK_invAttribute_invUnitOfMeasure]
GO
ALTER TABLE [dbo].[invAttributeControlData]  WITH CHECK ADD  CONSTRAINT [FK_invAttributeControlData_invAttribute] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[invAttribute] ([AttributeID])
GO
ALTER TABLE [dbo].[invAttributeControlData] CHECK CONSTRAINT [FK_invAttributeControlData_invAttribute]
GO
ALTER TABLE [dbo].[invInventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Asset] FOREIGN KEY([AssetID])
REFERENCES [dbo].[invAsset] ([AssetID])
GO
ALTER TABLE [dbo].[invInventory] CHECK CONSTRAINT [FK_Inventory_Asset]
GO
ALTER TABLE [dbo].[invInventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_InventoryType] FOREIGN KEY([InventoryTypeID])
REFERENCES [dbo].[invInventoryType] ([InventoryTypeID])
GO
ALTER TABLE [dbo].[invInventory] CHECK CONSTRAINT [FK_Inventory_InventoryType]
GO
/****** Object:  StoredProcedure [dbo].[upInvGetAssetAttributes]    Script Date: 8/22/2020 8:50:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- ===========================================================================================================
-- Author:		Jim Chen
-- Created On:  08/07/2020
-- Modified On: 08/14/2020
-- Description:	MF due to schema change. Pivot attributes with asset columns. Add assetTypeName
-------------------------------------------------------------------------------------------------------
	EXEC dbo.upInvGetAssetAttributes
-- ===========================================================================================================
*/
CREATE PROCEDURE [dbo].[upInvGetAssetAttributes] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT a.AssetID, a.AssetName, a.Brand, a.AssetDescription, a.AssetTypeID, t.AssetTypeName, a.QuantityOnHand
		, a.ModelName, a.ModelNumber, a.VendorCode, a.SerialNumber, a.PerUnitCost
		, b.Attr1 AS AttrType, b.Attr2 AS AttrSize, b.Attr3 AS AttrPressure, b.Attr4 AS AttrIsNACE
		, c.Attr1 AS AttrTypeId, c.Attr2 AS AttrSizeId, c.Attr3 AS AttrPressureId, c.Attr4 AS AttrIsNACEId    
      --,[ReorderLevel]
      --,[ReorderTimeInDays]
      --,[ReorderQuantity]
      --,[Discountinued]
      --,[Notes]
FROM [dbo].[invAsset] a join dbo.invAssetType t on a.AssetTypeID = t.AssetTypeID
	join
	(
		SELECT * 
		FROM (
			SELECT a.AssetID, v.AssetAttributeValue
				, 'Attr' + CAST( ROW_NUMBER() OVER (PARTITION BY a.AssetID ORDER BY b.AttributeID) as varchar(10)) as ColumnSeq
			FROM  dbo.invAsset a join dbo.invAssetTypeAttribute ta on a.AssetTypeID = ta.AssetTypeID
			join dbo.invAssetAttributeValue v on v.AssetID = a.AssetID and v.AssetTypeAttributeID = ta.AssetTypeAttributeID
			join dbo.invAttribute b on ta.AttributeID = b.AttributeID		
			LEFT join dbo.invUnitOfMeasure u on b.UoMID = u.UoMID		
		) t
		PIVOT (
			MAX(AssetAttributeValue)
			FOR  ColumnSeq in (Attr1, Attr2, Attr3, Attr4)		
		) as PIV		
	) b on a.AssetID = b.AssetID	
	join (
		SELECT * 
		FROM (
			SELECT a.AssetID, v.AssetTypeAttributeID
				, 'Attr' + CAST( ROW_NUMBER() OVER (PARTITION BY a.AssetID ORDER BY b.AttributeID) as varchar(10)) as ColumnSeq
			FROM  dbo.invAsset a join dbo.invAssetTypeAttribute ta on a.AssetTypeID = ta.AssetTypeID
			join dbo.invAssetAttributeValue v on v.AssetID = a.AssetID and v.AssetTypeAttributeID = ta.AssetTypeAttributeID
			join dbo.invAttribute b on ta.AttributeID = b.AttributeID		
			LEFT join dbo.invUnitOfMeasure u on b.UoMID = u.UoMID		
		) t02
		PIVOT (
			MAX(AssetTypeAttributeID)
			FOR  ColumnSeq in (Attr1, Attr2, Attr3, Attr4)		
		) as PIV02		
	) c on a.AssetID = c.AssetID	
END
GO
/****** Object:  StoredProcedure [dbo].[upInvGetAssetAttributesForEditByAssetId]    Script Date: 8/22/2020 8:50:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- ================================================================================================================
-- Author:		Jim Chen
-- Created On:  08/06/2020
-- Modified On: 08/19/2020
-- Description:	This query is to get all attribute values for an asset for editing.
	Change SP name to make it more clear.
----------------------------------------------------------------------------------------------------------------
	EXEC dbo.upInvGetAssetAttributesForEditByAssetId 100	
-- =================================================================================================================
*/
CREATE   PROCEDURE [dbo].[upInvGetAssetAttributesForEditByAssetId] 
	@assetId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT v.AssetTypeAttributeID, a.AssetTypeID, ab.AttributeID AS InvAttributeId, t.AssetTypeName
	, ab.AttributeName AS InvAttributeName, v.AssetAttributeValue AS InvAttributeValue
	, ab.DataType AS AttributeDataType, m.UoMName AS UnitOfMeasurement
FROM dbo.invAsset a 
	join dbo.invAssetType t on a.AssetTypeID = t.AssetTypeID	 	
	join dbo.invAssetTypeAttribute ta  on t.AssetTypeID = ta.AssetTypeID
	join dbo.invAttribute ab on ta.AttributeID = ab.AttributeID
	join dbo.invAssetAttributeValue v on a.AssetID = v.AssetID and ta.AssetTypeAttributeID = v.AssetTypeAttributeID	
	left join dbo.invUnitOfMeasure m on ab.UoMID = m.UoMID
WHERE a.AssetID = @assetId;

END
GO
/****** Object:  StoredProcedure [dbo].[upInvGetAssetByAssetTypeId]    Script Date: 8/22/2020 8:50:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- ======================================================================================
-- Author:		Jim Chen
-- Created On:  08/06/2020
-- Modified On: 08/13/2020
-- Description:	Use the new AssetType table
---------------------------------------------------------------------------------------
	EXEC dbo.upInvGetAssetByAssetTypeId 1	
-- ======================================================================================
*/
CREATE PROCEDURE [dbo].[upInvGetAssetByAssetTypeId] 
	@assetTypeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM dbo.invAsset WHERE AssetTypeID = @assetTypeId;

END
GO
/****** Object:  StoredProcedure [dbo].[upInvGetAssetByAssetTypeName]    Script Date: 8/22/2020 8:50:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- ======================================================================================
-- Author:		Jim Chen
-- Created On:  08/10/2020
-- Modified On: 08/13/2020
-- Description:	MF due to schema change. Change column name.
---------------------------------------------------------------------------------------
	EXEC dbo.upInvGetAssetByAssetTypeName 'Ball Valve'	
-- ======================================================================================
*/
CREATE PROCEDURE [dbo].[upInvGetAssetByAssetTypeName] 
	@assetTypeName varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT a.* 
	FROM dbo.invAsset a  join dbo.invAssetType ta on a.AssetTypeID = ta.AssetTypeID
	WHERE ta.AssetTypeName = @assetTypeName;

END
GO
/****** Object:  StoredProcedure [dbo].[upInvGetAttributesByAssetTypeId]    Script Date: 8/22/2020 8:50:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- ======================================================================================
-- Author:		Jim Chen
-- Created On:  08/12/2020
-- Modified On: 08/20/2020
-- Description:	Get attributes from AssetType, remains unchanged.
---------------------------------------------------------------------------------------
	EXEC dbo.upInvGetAttributesByAssetTypeId 1	
-- ======================================================================================
*/
CREATE      PROCEDURE [dbo].[upInvGetAttributesByAssetTypeId] 
	@assetTypeId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @assetTypeId = 0
		SELECT ta.AssetTypeAttributeID, t.AssetTypeID,  t.AssetTypeName
			, ab.AttributeID AS InvAttributeID
			, ab.AttributeName AS InvAttributeName
			, ab.DataType AS AttributeDataType, m.UoMName AS UnitOfMeasurement
		FROM dbo.invAssetType t join dbo.invAssetTypeAttribute ta  on t.AssetTypeID = ta.AssetTypeID
				join dbo.invAttribute ab on ta.AttributeID = ab.AttributeID
				left join dbo.invUnitOfMeasure m on ab.UoMID = m.UoMID				
		ORDER BY ta.AssetTypeAttributeID, ab.AttributeID;
	ELSE
		SELECT ta.AssetTypeAttributeID, t.AssetTypeID,  t.AssetTypeName
			, ab.AttributeID AS InvAttributeID
			, ab.AttributeName AS InvAttributeName
			, ab.DataType AS AttributeDataType, m.UoMName AS UnitOfMeasurement
		FROM dbo.invAssetType t join dbo.invAssetTypeAttribute ta  on t.AssetTypeID = ta.AssetTypeID
			join dbo.invAttribute ab on ta.AttributeID = ab.AttributeID
			left join dbo.invUnitOfMeasure m on ab.UoMID = m.UoMID
		WHERE t.AssetTypeID = @assetTypeId
		ORDER BY ta.AssetTypeAttributeID, ab.AttributeID;
		--SELECT ta.AssetTypeAttributeID, t.AssetTypeID, t.AssetTypeName, ab.AttributeID AS InvAttributeID
		--	, ab.AttributeName AS InvAttributeName, ab.DataType AS AttributeDataType, m.UoMName AS UnitOfMeasurement
		--	, d.ControlDataValue, d.AttributeControlDataID
		--FROM dbo.invAssetType t join dbo.invAssetTypeAttribute ta  on t.AssetTypeID = ta.AssetTypeID
		--	join dbo.invAttribute ab on ta.AttributeID = ab.AttributeID
		--	left join dbo.invUnitOfMeasure m on ab.UoMID = m.UoMID
		--	left join dbo.invAttributeControlData d on (ab.DataType='ControlData' and ab.AttributeID = d.AttributeID)
		--WHERE t.AssetTypeID = @assetTypeId
		--ORDER BY ta.AssetTypeAttributeID, ab.AttributeID
END
/************************************ Code segment to parse aboe query with control data together **********************
             AssetTypeAttributeViewModel prevItem = null;
            
            for (int idx=0; idx < resultWithCtrlData.Count; idx++)
            {
                AssetTypeAttributeVM item = resultWithCtrlData[idx];
                AssetTypeAttributeViewModel vmAttr = new AssetTypeAttributeViewModel();
                vmAttr.ControlDataList = new List<InvAttributeControlData>();
                InvAttributeControlData prevCtrlData = null;
                if (item.AttributeDataType.StartsWith("ControlData")) {
                    //Add a default blank for dropdown list
                    InvAttributeControlData defaultCtrl = new InvAttributeControlData() {
                        AttributeControlDataId = 0,
                        AttributeId = 0,
                        ControlDataValue = ""
                    };                    
                    vmAttr.ControlDataList.Add(defaultCtrl);

                    while ( idx < resultWithCtrlData.Count )
                    {                                                            
                        InvAttributeControlData ctrlData = new InvAttributeControlData();
                        ctrlData.AttributeControlDataId = (int) item.AttributeControlDataId;
                        ctrlData.AttributeId = (int) item.InvAttributeId;
                        ctrlData.ControlDataValue = item.ControlDataValue;
                        vmAttr.ControlDataList.Add(ctrlData);                    
                        if (prevCtrlData==null && prevItem.AttributeDataType.StartsWith("ControlData")==false)
                        {
                            vmAttr.AssetTypeAttributeId = item.AssetTypeAttributeId;
                            vmAttr.AssetTypeId = item.AssetTypeId;
                            vmAttr.AssetTypeName = item.AssetTypeName;
                            vmAttr.InvAttributeId = item.InvAttributeId;
                            vmAttr.InvAttributeName = item.InvAttributeName;
                            vmAttr.AttributeDataType = item.AttributeDataType;
                            vmAttr.UnitOfMeasurement = item.UnitOfMeasurement;
                            result.Add(vmAttr);                        
                        }  
                        //move to the next item: a. this is the last item; b. there are more item after it.
                        prevCtrlData = ctrlData;

                        // a. This is the last item
                        if (idx+1 == resultWithCtrlData.Count)
                        {
                            break;
                        }
                        // b. there are more items after it
                        item = resultWithCtrlData[++idx];

                        // c. when the next item is Control Data but with different Attribute Id, separate it here
                        if (item.AttributeDataType.StartsWith("ControlData") && prevItem.AttributeDataType.StartsWith("ControlData") && item.InvAttributeId != prevItem.InvAttributeId)
                        {
                            result.Add(vmAttr);
                            vmAttr = new AssetTypeAttributeViewModel();
                            vmAttr.ControlDataList = new List<InvAttributeControlData>();
                            continue;
                        }

                        // d. when the item is not the control data, jump out of loop
                        if (item.AttributeDataType.StartsWith("ControlData")==false)
                        {
                            idx++;
                            vmAttr = new AssetTypeAttributeViewModel();
                            vmAttr.ControlDataList = new List<InvAttributeControlData>();
                            break;
                        }                  
                    }   //end while
                }

                if (idx + 1 == resultWithCtrlData.Count)
                    break;
                
                vmAttr.AssetTypeAttributeId = item.AssetTypeAttributeId;
                vmAttr.AssetTypeId = item.AssetTypeId;
                vmAttr.AssetTypeName = item.AssetTypeName;
                vmAttr.InvAttributeId = item.InvAttributeId;
                vmAttr.InvAttributeName = item.InvAttributeName;
                vmAttr.AttributeDataType = item.AttributeDataType;
                vmAttr.UnitOfMeasurement = item.UnitOfMeasurement;
                result.Add(vmAttr);
                prevItem = vmAttr;                
            }
******************************************************************************************/
GO
/****** Object:  StoredProcedure [dbo].[upInvGetBaseAssets]    Script Date: 8/22/2020 8:50:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- ===========================================================================================================
-- Author:		Jim Chen
-- Created On:  08/07/2020
-- Modified On: 08/21/2020
-- Description:	MF due to schema change. Pivot attributes with asset columns. Show proper columns as model.
		Order it by creation date. Add IsDeleted column for soft deletion.
------------------------------------------------------------------------------------------------------------
	EXEC dbo.upInvGetBaseAssets
-- ===========================================================================================================
*/
CREATE   PROCEDURE [dbo].[upInvGetBaseAssets] 	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT top 20 a.AssetID, a.AssetTypeID, a.AssetName, a.Brand, a.AssetDescription, a.QuantityOnHand, t.AssetTypeName	
		, a.ModelName, a.ModelNumber, a.SerialNumber, a.PerUnitCost, a.VendorCode, a.Notes	
	FROM [dbo].[invAsset] a join dbo.invAssetType t on a.AssetTypeID = t.AssetTypeID
	WHERE a.IsDeleted = 0
	ORDER BY a.ModifiedDate DESC;

END
GO
