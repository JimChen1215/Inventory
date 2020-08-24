USE [master]
GO
/****** Object:  Database [VOC_EnterpriseSecurity]    Script Date: 8/4/2020 10:29:50 AM ******/
CREATE DATABASE [VOC_EnterpriseSecurity]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VOC_EnterpriseSecurity', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VOC_EnterpriseSecurity.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VOC_EnterpriseSecurity_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VOC_EnterpriseSecurity_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VOC_EnterpriseSecurity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET ARITHABORT OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET RECOVERY FULL 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET  MULTI_USER 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VOC_EnterpriseSecurity', N'ON'
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET QUERY_STORE = OFF
GO
USE [VOC_EnterpriseSecurity]
GO
/****** Object:  Table [dbo].[EnterpriseApplication]    Script Date: 8/4/2020 10:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnterpriseApplication](
	[EnterpriseApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationName] [varchar](150) NULL,
	[ApplicationURL] [varchar](250) NULL,
 CONSTRAINT [PK__Enterpri__25E3FF953EEE5CA3] PRIMARY KEY CLUSTERED 
(
	[EnterpriseApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnterpriseRole]    Script Date: 8/4/2020 10:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnterpriseRole](
	[EnterpriseRoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleDescription] [varchar](50) NULL,
 CONSTRAINT [PK__Enterpri__BA0D1AC86EFF8455] PRIMARY KEY CLUSTERED 
(
	[EnterpriseRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnterpriseUser]    Script Date: 8/4/2020 10:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnterpriseUser](
	[EnterpriseUserId] [int] IDENTITY(1,1) NOT NULL,
	[DomainId] [varchar](100) NOT NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[Email] [varchar](150) NULL,
	[MobilePhone] [varchar](20) NULL,
	[DeleteFlag] [bit] NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__Enterpri__6D293CAF15FBC615] PRIMARY KEY CLUSTERED 
(
	[EnterpriseUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnterpriseUserApplicationRole]    Script Date: 8/4/2020 10:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnterpriseUserApplicationRole](
	[EnterpriseUserApplicationRoleId] [int] IDENTITY(1,1) NOT NULL,
	[EnterpriseUserId] [int] NOT NULL,
	[EnterpriseApplicationId] [int] NOT NULL,
	[EnterpriseRoleId] [int] NOT NULL,
 CONSTRAINT [PK_EnterpriseUserApplicationRole] PRIMARY KEY CLUSTERED 
(
	[EnterpriseUserApplicationRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EnterpriseApplication] ON 

INSERT [dbo].[EnterpriseApplication] ([EnterpriseApplicationId], [ApplicationName], [ApplicationURL]) VALUES (1, N'Verdun.Enterprise.Web', N'https://localhost:63443/Home/Privacy')
INSERT [dbo].[EnterpriseApplication] ([EnterpriseApplicationId], [ApplicationName], [ApplicationURL]) VALUES (2, N'Verdun.Enterprise.Security', N'http://localhost:63443/EnterpriseUser/UserList')
INSERT [dbo].[EnterpriseApplication] ([EnterpriseApplicationId], [ApplicationName], [ApplicationURL]) VALUES (2003, N'Verdun.Enterprise.Inventory', NULL)
INSERT [dbo].[EnterpriseApplication] ([EnterpriseApplicationId], [ApplicationName], [ApplicationURL]) VALUES (2012, N'xyz123', N'test')
SET IDENTITY_INSERT [dbo].[EnterpriseApplication] OFF
GO
SET IDENTITY_INSERT [dbo].[EnterpriseRole] ON 

INSERT [dbo].[EnterpriseRole] ([EnterpriseRoleId], [RoleDescription]) VALUES (1, N'NoPermission')
INSERT [dbo].[EnterpriseRole] ([EnterpriseRoleId], [RoleDescription]) VALUES (2, N'ReadOnly')
INSERT [dbo].[EnterpriseRole] ([EnterpriseRoleId], [RoleDescription]) VALUES (3, N'ReadWrite')
INSERT [dbo].[EnterpriseRole] ([EnterpriseRoleId], [RoleDescription]) VALUES (4, N'Administration')
INSERT [dbo].[EnterpriseRole] ([EnterpriseRoleId], [RoleDescription]) VALUES (1046, N'a123')
INSERT [dbo].[EnterpriseRole] ([EnterpriseRoleId], [RoleDescription]) VALUES (1047, N'b')
SET IDENTITY_INSERT [dbo].[EnterpriseRole] OFF
GO
SET IDENTITY_INSERT [dbo].[EnterpriseUser] ON 

INSERT [dbo].[EnterpriseUser] ([EnterpriseUserId], [DomainId], [LastName], [FirstName], [Email], [MobilePhone], [DeleteFlag], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'verdun\jcodianne', N'Codianne', N'Jason', N'jcodianne@verdunoilco.com', N'2816505957', NULL, NULL, NULL, N'VERDUN\jchen', CAST(N'2020-07-28T09:15:03.013' AS DateTime))
INSERT [dbo].[EnterpriseUser] ([EnterpriseUserId], [DomainId], [LastName], [FirstName], [Email], [MobilePhone], [DeleteFlag], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'verdun\jchen', N'Chen', N'Jim', N'jchen@verdunoilco.com', N'713-858-3188', 0, N'dbo', CAST(N'2020-07-17T10:58:03.747' AS DateTime), N'VERDUN\jchen', CAST(N'2020-07-25T09:11:48.393' AS DateTime))
INSERT [dbo].[EnterpriseUser] ([EnterpriseUserId], [DomainId], [LastName], [FirstName], [Email], [MobilePhone], [DeleteFlag], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'verdun\evela', N'Vela', N'Emanuel', N'emanuel@verdunoilco.com', N'+1 7133379276', 0, N'dbo', CAST(N'2020-07-21T15:05:13.003' AS DateTime), N'VERDUN\jchen', CAST(N'2020-07-29T15:12:47.177' AS DateTime))
INSERT [dbo].[EnterpriseUser] ([EnterpriseUserId], [DomainId], [LastName], [FirstName], [Email], [MobilePhone], [DeleteFlag], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'verdun\tnguyen', N'Nguyen', N'Tai', N'tnguyen@verdunoilco.com', NULL, 0, N'dbo', CAST(N'2020-07-21T15:07:08.920' AS DateTime), N'VERDUN\jchen', CAST(N'2020-07-29T15:18:59.163' AS DateTime))
INSERT [dbo].[EnterpriseUser] ([EnterpriseUserId], [DomainId], [LastName], [FirstName], [Email], [MobilePhone], [DeleteFlag], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (23, N'abc345', N'b22', N'a11', N'abc@cde.org', N'278-345-9000', NULL, NULL, NULL, N'VERDUN\jchen', CAST(N'2020-07-30T17:00:21.523' AS DateTime))
SET IDENTITY_INSERT [dbo].[EnterpriseUser] OFF
GO
SET IDENTITY_INSERT [dbo].[EnterpriseUserApplicationRole] ON 

INSERT [dbo].[EnterpriseUserApplicationRole] ([EnterpriseUserApplicationRoleId], [EnterpriseUserId], [EnterpriseApplicationId], [EnterpriseRoleId]) VALUES (1, 1, 1, 4)
INSERT [dbo].[EnterpriseUserApplicationRole] ([EnterpriseUserApplicationRoleId], [EnterpriseUserId], [EnterpriseApplicationId], [EnterpriseRoleId]) VALUES (2, 1, 2, 4)
INSERT [dbo].[EnterpriseUserApplicationRole] ([EnterpriseUserApplicationRoleId], [EnterpriseUserId], [EnterpriseApplicationId], [EnterpriseRoleId]) VALUES (3, 2, 1, 1)
INSERT [dbo].[EnterpriseUserApplicationRole] ([EnterpriseUserApplicationRoleId], [EnterpriseUserId], [EnterpriseApplicationId], [EnterpriseRoleId]) VALUES (4, 2, 2, 4)
INSERT [dbo].[EnterpriseUserApplicationRole] ([EnterpriseUserApplicationRoleId], [EnterpriseUserId], [EnterpriseApplicationId], [EnterpriseRoleId]) VALUES (9, 4, 2, 3)
INSERT [dbo].[EnterpriseUserApplicationRole] ([EnterpriseUserApplicationRoleId], [EnterpriseUserId], [EnterpriseApplicationId], [EnterpriseRoleId]) VALUES (10, 23, 2012, 1047)
SET IDENTITY_INSERT [dbo].[EnterpriseUserApplicationRole] OFF
GO
/****** Object:  Index [UX_UserAppRole]    Script Date: 8/4/2020 10:29:50 AM ******/
ALTER TABLE [dbo].[EnterpriseUserApplicationRole] ADD  CONSTRAINT [UX_UserAppRole] UNIQUE NONCLUSTERED 
(
	[EnterpriseUserId] ASC,
	[EnterpriseApplicationId] ASC,
	[EnterpriseRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EnterpriseUser] ADD  CONSTRAINT [DF_EnterpriseUser_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
GO
ALTER TABLE [dbo].[EnterpriseUser] ADD  CONSTRAINT [DF__Enterpris__Creat__286302EC]  DEFAULT (user_name()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[EnterpriseUser] ADD  CONSTRAINT [DF__Enterpris__Creat__29572725]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EnterpriseUser] ADD  CONSTRAINT [DF__Enterpris__Modif__2A4B4B5E]  DEFAULT (user_name()) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[EnterpriseUser] ADD  CONSTRAINT [DF__Enterpris__Modif__2B3F6F97]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[EnterpriseUserApplicationRole]  WITH CHECK ADD FOREIGN KEY([EnterpriseUserId])
REFERENCES [dbo].[EnterpriseUser] ([EnterpriseUserId])
GO
ALTER TABLE [dbo].[EnterpriseUserApplicationRole]  WITH CHECK ADD FOREIGN KEY([EnterpriseApplicationId])
REFERENCES [dbo].[EnterpriseApplication] ([EnterpriseApplicationId])
GO
ALTER TABLE [dbo].[EnterpriseUserApplicationRole]  WITH CHECK ADD FOREIGN KEY([EnterpriseRoleId])
REFERENCES [dbo].[EnterpriseRole] ([EnterpriseRoleId])
GO
/****** Object:  StoredProcedure [dbo].[upGetAllUserApplicationRoles]    Script Date: 8/4/2020 10:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-- ======================================================================================
-- Author:		Jim Chen
-- Created On:  07/25/2020
-- Modified On: 07/26/2020
-- Description:	Get application roles for all the users.
-----------------------------------------------------------------------
	EXEC dbo.upGetAllUserApplicationRoles 
-- ======================================================================================
*/
CREATE PROCEDURE [dbo].[upGetAllUserApplicationRoles] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ROW_NUMBER() OVER(ORDER BY eu.EnterpriseUserId) AS RowId
		, eu.DomainId, eu.LastName, eu.FirstName, eu.Email, eu.MobilePhone
		, ea.ApplicationName AS AppName, ea.ApplicationURL AS AppURL, er.RoleDescription AS AppRole
		, eu.EnterpriseUserId AS UserId, ua.EnterpriseApplicationId AS AppId, ua.EnterpriseRoleId AS roleId
		, ua.EnterpriseUserApplicationRoleId AS UserAppRoleId
	FROM dbo.EnterpriseUser eu LEFT JOIN dbo.EnterpriseUserApplicationRole ua ON eu.EnterpriseUserId = ua.EnterpriseUserId
			LEFT JOIN dbo.EnterpriseApplication ea ON ua.EnterpriseApplicationId = ea.EnterpriseApplicationId
			LEFT JOIN dbo.EnterpriseRole er ON er.EnterpriseRoleId = ua.EnterpriseRoleId
	--WHERE eu.DeleteFlag = 0;
	ORDER BY eu.EnterpriseUserId;

END
GO
/****** Object:  StoredProcedure [dbo].[upGetUserApplicationRoleByDomainId]    Script Date: 8/4/2020 10:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-- ======================================================================================
-- Author:		Jim Chen
-- Created On:  07/26/2020
-- Modified On: 07/29/2020
-- Description:	Get application roles by the user domain id. Add AppURL field
		Take either a full domain ID or just the user id
---------------------------------------------------------------------------------------
	EXEC dbo.upGetUserApplicationRoleByDomainId 'verdun\jchen'
	EXEC dbo.upGetUserApplicationRoleByDomainId 'jcodianne'
-- ======================================================================================
*/
CREATE PROCEDURE [dbo].[upGetUserApplicationRoleByDomainId] 
	@domainId varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ROW_NUMBER() OVER(ORDER BY eu.EnterpriseUserId) AS RowId
		, eu.DomainId, eu.LastName, eu.FirstName, eu.Email, eu.MobilePhone
		, ea.ApplicationName AS AppName, ea.ApplicationURL AS AppURL, er.RoleDescription AS AppRole
		, eu.EnterpriseUserId AS UserId, ua.EnterpriseApplicationId AS AppId, ua.EnterpriseRoleId AS roleId
		, ua.EnterpriseUserApplicationRoleId AS UserAppRoleId
	FROM dbo.EnterpriseUser eu JOIN dbo.EnterpriseUserApplicationRole ua ON eu.EnterpriseUserId = ua.EnterpriseUserId
			JOIN dbo.EnterpriseApplication ea ON ua.EnterpriseApplicationId = ea.EnterpriseApplicationId
			JOIN dbo.EnterpriseRole er ON er.EnterpriseRoleId = ua.EnterpriseRoleId
	WHERE eu.DomainId like @domainId or eu.DomainId like 'verdun\'+@domainId
	ORDER BY ua.EnterpriseApplicationId;

END
GO
USE [master]
GO
ALTER DATABASE [VOC_EnterpriseSecurity] SET  READ_WRITE 
GO
