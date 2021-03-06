USE [master]
GO
/****** Object:  Database [ptConfiteria]    Script Date: 2/12/2021 17:32:48 ******/
CREATE DATABASE [ptConfiteria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ptConfiteria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ptConfiteria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ptConfiteria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ptConfiteria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ptConfiteria] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ptConfiteria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ptConfiteria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ptConfiteria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ptConfiteria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ptConfiteria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ptConfiteria] SET ARITHABORT OFF 
GO
ALTER DATABASE [ptConfiteria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ptConfiteria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ptConfiteria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ptConfiteria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ptConfiteria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ptConfiteria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ptConfiteria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ptConfiteria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ptConfiteria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ptConfiteria] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ptConfiteria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ptConfiteria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ptConfiteria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ptConfiteria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ptConfiteria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ptConfiteria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ptConfiteria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ptConfiteria] SET RECOVERY FULL 
GO
ALTER DATABASE [ptConfiteria] SET  MULTI_USER 
GO
ALTER DATABASE [ptConfiteria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ptConfiteria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ptConfiteria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ptConfiteria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ptConfiteria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ptConfiteria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ptConfiteria', N'ON'
GO
ALTER DATABASE [ptConfiteria] SET QUERY_STORE = OFF
GO
USE [ptConfiteria]
GO
/****** Object:  User [lucas]    Script Date: 2/12/2021 17:32:48 ******/
CREATE USER [lucas] FOR LOGIN [lucas] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[articulos]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulos](
	[idArticulo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[precio] [float] NOT NULL,
	[cantidadStock] [int] NOT NULL,
	[idRubro] [int] NOT NULL,
	[estaActivo] [bit] NOT NULL,
 CONSTRAINT [pk_articulos] PRIMARY KEY CLUSTERED 
(
	[idArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_tickets]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_tickets](
	[idDetalle] [int] IDENTITY(1,1) NOT NULL,
	[idTicket] [int] NOT NULL,
	[idArticulo] [int] NOT NULL,
	[precio_unitario] [float] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [pk_detalle] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locales]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locales](
	[idLocal] [int] IDENTITY(1,1) NOT NULL,
	[nombreLocal] [varchar](100) NOT NULL,
	[tipoIva] [varchar](100) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
 CONSTRAINT [pk_locales] PRIMARY KEY CLUSTERED 
(
	[idLocal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mozos]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mozos](
	[idMozo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[comision] [float] NOT NULL,
	[nomUsu] [varchar](50) NULL,
	[pass] [varchar](50) NULL,
	[estaActivo] [int] NULL,
 CONSTRAINT [pk_mozos] PRIMARY KEY CLUSTERED 
(
	[idMozo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rubros]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rubros](
	[idRubro] [int] IDENTITY(1,1) NOT NULL,
	[nombre_rubro] [varchar](100) NOT NULL,
	[estaActivo] [int] NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [pk_rubros] PRIMARY KEY CLUSTERED 
(
	[idRubro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tickets]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tickets](
	[idTicket] [int] IDENTITY(1,1) NOT NULL,
	[fechaAlta] [datetime] NOT NULL,
	[idLocal] [int] NOT NULL,
	[idMozo] [int] NOT NULL,
	[fechaBaja] [datetime] NULL,
 CONSTRAINT [pk_tickets] PRIMARY KEY CLUSTERED 
(
	[idTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[Usuario] [varchar](50) NULL,
	[Contrasenia] [varchar](50) NULL,
	[esAdmin] [bit] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[articulos] ON 

INSERT [dbo].[articulos] ([idArticulo], [descripcion], [precio], [cantidadStock], [idRubro], [estaActivo]) VALUES (1, N'coca Cola', 100, 8, 18, 1)
INSERT [dbo].[articulos] ([idArticulo], [descripcion], [precio], [cantidadStock], [idRubro], [estaActivo]) VALUES (2, N'front', 12, 4, 5, 0)
INSERT [dbo].[articulos] ([idArticulo], [descripcion], [precio], [cantidadStock], [idRubro], [estaActivo]) VALUES (3, N'front', 12, 4, 15, 0)
INSERT [dbo].[articulos] ([idArticulo], [descripcion], [precio], [cantidadStock], [idRubro], [estaActivo]) VALUES (4, N'cerveza', 150, 30, 18, 1)
INSERT [dbo].[articulos] ([idArticulo], [descripcion], [precio], [cantidadStock], [idRubro], [estaActivo]) VALUES (5, N'alfajor', 100, 24, 5, 0)
INSERT [dbo].[articulos] ([idArticulo], [descripcion], [precio], [cantidadStock], [idRubro], [estaActivo]) VALUES (1005, N'cerveza', 150, 995, 18, 0)
INSERT [dbo].[articulos] ([idArticulo], [descripcion], [precio], [cantidadStock], [idRubro], [estaActivo]) VALUES (1006, N'cerveza', 120, 4, 5, 0)
INSERT [dbo].[articulos] ([idArticulo], [descripcion], [precio], [cantidadStock], [idRubro], [estaActivo]) VALUES (1007, N'front', 12, 4, 5, 0)
INSERT [dbo].[articulos] ([idArticulo], [descripcion], [precio], [cantidadStock], [idRubro], [estaActivo]) VALUES (1008, N'front2', 150, 4, 5, 0)
INSERT [dbo].[articulos] ([idArticulo], [descripcion], [precio], [cantidadStock], [idRubro], [estaActivo]) VALUES (1009, N'cafe', 12, 24, 1022, 1)
INSERT [dbo].[articulos] ([idArticulo], [descripcion], [precio], [cantidadStock], [idRubro], [estaActivo]) VALUES (1010, N'galletas', 3245, 0, 5, 1)
INSERT [dbo].[articulos] ([idArticulo], [descripcion], [precio], [cantidadStock], [idRubro], [estaActivo]) VALUES (1011, N'front', 0, 45, 5, 1)
SET IDENTITY_INSERT [dbo].[articulos] OFF
GO
SET IDENTITY_INSERT [dbo].[detalle_tickets] ON 

INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (3, 1, 1, 100, 2)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (7, 10, 4, 150, 2)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (9, 12, 1, 100, 2)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (10, 13, 1, 100, 2)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (11, 13, 4, 150, 10)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (1003, 1002, 1, 100, 2)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (1004, 1002, 1, 100, 2)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (1005, 1003, 1, 100, 2)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (1006, 1003, 1, 100, 2)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (2003, 2002, 1, 100, 10)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (2004, 2003, 1, 100, 2)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (2005, 2003, 1, 100, 2)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (2006, 2004, 1, 100, 2)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (2007, 2004, 1, 100, 5)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (2008, 2005, 1, 100, 10)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (2009, 2005, 1, 100, 7)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (2010, 2006, 1, 100, 2)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (2011, 2006, 1, 100, 2)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (2012, 2007, 1, 100, 10)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (2013, 2007, 1, 100, 10)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (2014, 2008, 1, 100, 10)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (2015, 2008, 1, 100, 10)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (2016, 2009, 1, 100, 2)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (3003, 3002, 1, 100, -4)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (3004, 3003, 1, 100, 5)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (3005, 3004, 1005, 150, 10)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (3006, 3004, 1, 100, 5000)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (3007, 3005, 1, 100, 100)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (3008, 3006, 1, 100, 10)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (3009, 3006, 1005, 150, 5)
INSERT [dbo].[detalle_tickets] ([idDetalle], [idTicket], [idArticulo], [precio_unitario], [cantidad]) VALUES (3010, 3007, 1, 100, 2)
SET IDENTITY_INSERT [dbo].[detalle_tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[locales] ON 

INSERT [dbo].[locales] ([idLocal], [nombreLocal], [tipoIva], [direccion]) VALUES (1, N'Sucursal Centro', N'Resp. Inscripto', N'julio roca 123')
SET IDENTITY_INSERT [dbo].[locales] OFF
GO
SET IDENTITY_INSERT [dbo].[mozos] ON 

INSERT [dbo].[mozos] ([idMozo], [nombre], [apellido], [comision], [nomUsu], [pass], [estaActivo]) VALUES (1, N'Oscar', N'Botta', 10, N'asda', N'gLnqTdJGfhw=', 1)
INSERT [dbo].[mozos] ([idMozo], [nombre], [apellido], [comision], [nomUsu], [pass], [estaActivo]) VALUES (3, N'Elon', N'', 28, N'elon', N'gLnqTdJGfhw=', 1)
INSERT [dbo].[mozos] ([idMozo], [nombre], [apellido], [comision], [nomUsu], [pass], [estaActivo]) VALUES (2002, N'Rodrigo ', N'Rosales', 20, N'rodri', N'gLnqTdJGfhw=', 1)
INSERT [dbo].[mozos] ([idMozo], [nombre], [apellido], [comision], [nomUsu], [pass], [estaActivo]) VALUES (2003, N'Pela', N'munoz', 30, N'lucas', N'gLnqTdJGfhw=', 1)
INSERT [dbo].[mozos] ([idMozo], [nombre], [apellido], [comision], [nomUsu], [pass], [estaActivo]) VALUES (2004, N'julio', N'Di Salvo', 20, N'julio', N'gLnqTdJGfhw=', 1)
INSERT [dbo].[mozos] ([idMozo], [nombre], [apellido], [comision], [nomUsu], [pass], [estaActivo]) VALUES (2005, N'mauricio', N'osses', 1, N'mauricio', N'gLnqTdJGfhw=', 1)
SET IDENTITY_INSERT [dbo].[mozos] OFF
GO
SET IDENTITY_INSERT [dbo].[rubros] ON 

INSERT [dbo].[rubros] ([idRubro], [nombre_rubro], [estaActivo], [descripcion]) VALUES (4, N'bebidas', 0, N'bebidas ricas')
INSERT [dbo].[rubros] ([idRubro], [nombre_rubro], [estaActivo], [descripcion]) VALUES (5, N'pasteleria', 1, N'pasteles')
INSERT [dbo].[rubros] ([idRubro], [nombre_rubro], [estaActivo], [descripcion]) VALUES (13, N'rubro3', 0, N'es el rubro 3')
INSERT [dbo].[rubros] ([idRubro], [nombre_rubro], [estaActivo], [descripcion]) VALUES (15, N'libreria', 1, N'ideal para escolares')
INSERT [dbo].[rubros] ([idRubro], [nombre_rubro], [estaActivo], [descripcion]) VALUES (16, N'rubro 3', 0, N'es el rubro 2')
INSERT [dbo].[rubros] ([idRubro], [nombre_rubro], [estaActivo], [descripcion]) VALUES (17, N'rubro2', 0, N'es el rubro 2')
INSERT [dbo].[rubros] ([idRubro], [nombre_rubro], [estaActivo], [descripcion]) VALUES (18, N'higiene', 1, N'cuidado personal')
INSERT [dbo].[rubros] ([idRubro], [nombre_rubro], [estaActivo], [descripcion]) VALUES (19, N'golosinas', 1, N'bebidas ricas')
INSERT [dbo].[rubros] ([idRubro], [nombre_rubro], [estaActivo], [descripcion]) VALUES (20, N'golosinas', 0, N'ideal para niños')
INSERT [dbo].[rubros] ([idRubro], [nombre_rubro], [estaActivo], [descripcion]) VALUES (21, N'libreria 2', 0, N'sadgt')
INSERT [dbo].[rubros] ([idRubro], [nombre_rubro], [estaActivo], [descripcion]) VALUES (1020, N'infusiones', 0, N'bebidas calientes')
INSERT [dbo].[rubros] ([idRubro], [nombre_rubro], [estaActivo], [descripcion]) VALUES (1021, N'golosinas', 0, N'sadf')
INSERT [dbo].[rubros] ([idRubro], [nombre_rubro], [estaActivo], [descripcion]) VALUES (1022, N'infusione2', 0, N'bebidas calientes')
INSERT [dbo].[rubros] ([idRubro], [nombre_rubro], [estaActivo], [descripcion]) VALUES (1023, N'golosinas', 0, N'asddf')
SET IDENTITY_INSERT [dbo].[rubros] OFF
GO
SET IDENTITY_INSERT [dbo].[tickets] ON 

INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (10, CAST(N'2021-10-22T00:00:00.000' AS DateTime), 1, 3, CAST(N'2021-10-29T00:00:00.000' AS DateTime))
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (12, CAST(N'2021-10-25T00:00:00.000' AS DateTime), 1, 1, CAST(N'2021-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (13, CAST(N'2021-10-25T00:00:00.000' AS DateTime), 1, 1, CAST(N'2021-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (1002, CAST(N'2021-10-26T00:00:00.000' AS DateTime), 1, 1, CAST(N'2021-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (1003, CAST(N'2021-10-26T00:00:00.000' AS DateTime), 1, 1, NULL)
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (2002, CAST(N'2021-11-04T00:00:00.000' AS DateTime), 1, 3, NULL)
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (2003, CAST(N'2021-11-05T00:00:00.000' AS DateTime), 1, 3, NULL)
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (2004, CAST(N'2021-11-05T00:00:00.000' AS DateTime), 1, 1, CAST(N'2021-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (2005, CAST(N'2021-11-05T00:00:00.000' AS DateTime), 1, 1, NULL)
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (2006, CAST(N'2021-11-05T00:00:00.000' AS DateTime), 1, 1, NULL)
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (2007, CAST(N'2021-11-05T00:00:00.000' AS DateTime), 1, 1, NULL)
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (2008, CAST(N'2021-11-05T00:00:00.000' AS DateTime), 1, 3, NULL)
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (2009, CAST(N'2021-11-05T00:00:00.000' AS DateTime), 1, 1, NULL)
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (3002, CAST(N'2021-11-12T00:00:00.000' AS DateTime), 1, 1, NULL)
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (3003, CAST(N'2021-11-12T00:00:00.000' AS DateTime), 1, 1, NULL)
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (3004, CAST(N'2021-11-16T00:00:00.000' AS DateTime), 1, 2002, NULL)
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (3005, CAST(N'2021-11-16T00:00:00.000' AS DateTime), 1, 1, NULL)
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (3006, CAST(N'2021-11-25T00:00:00.000' AS DateTime), 1, 1, NULL)
INSERT [dbo].[tickets] ([idTicket], [fechaAlta], [idLocal], [idMozo], [fechaBaja]) VALUES (3007, CAST(N'2021-11-25T00:00:00.000' AS DateTime), 1, 2005, NULL)
SET IDENTITY_INSERT [dbo].[tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id], [Usuario], [Contrasenia], [esAdmin]) VALUES (1000, N'lucas', N'1234', 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[articulos]  WITH CHECK ADD  CONSTRAINT [fk_articulos_rubros] FOREIGN KEY([idRubro])
REFERENCES [dbo].[rubros] ([idRubro])
GO
ALTER TABLE [dbo].[articulos] CHECK CONSTRAINT [fk_articulos_rubros]
GO
ALTER TABLE [dbo].[detalle_tickets]  WITH CHECK ADD  CONSTRAINT [fk_detalle_articulos] FOREIGN KEY([idArticulo])
REFERENCES [dbo].[articulos] ([idArticulo])
GO
ALTER TABLE [dbo].[detalle_tickets] CHECK CONSTRAINT [fk_detalle_articulos]
GO
ALTER TABLE [dbo].[detalle_tickets]  WITH CHECK ADD  CONSTRAINT [fk_detalles_tickets] FOREIGN KEY([idTicket])
REFERENCES [dbo].[tickets] ([idTicket])
GO
ALTER TABLE [dbo].[detalle_tickets] CHECK CONSTRAINT [fk_detalles_tickets]
GO
ALTER TABLE [dbo].[tickets]  WITH CHECK ADD  CONSTRAINT [fk_tickets_locales] FOREIGN KEY([idLocal])
REFERENCES [dbo].[locales] ([idLocal])
GO
ALTER TABLE [dbo].[tickets] CHECK CONSTRAINT [fk_tickets_locales]
GO
ALTER TABLE [dbo].[tickets]  WITH CHECK ADD  CONSTRAINT [fk_tickets_mozos] FOREIGN KEY([idMozo])
REFERENCES [dbo].[mozos] ([idMozo])
GO
ALTER TABLE [dbo].[tickets] CHECK CONSTRAINT [fk_tickets_mozos]
GO
/****** Object:  StoredProcedure [dbo].[sp_2_venta_porfecha]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_2_venta_porfecha] 
@fecha Date
  as
  begin
  SELECT a.idArticulo Artículo, descripcion as Descripción, sum(cantidad) as Cantidad, sum(precio_unitario*cantidad) as Importe
from detalle_tickets d join tickets t on d.idTicket=t.idTicket join articulos a on a.idArticulo=d.idArticulo
where cast(fechaAlta as date) = @fecha
group by a.idArticulo, descripcion
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_3_venta_porMozo]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE procEDURE [dbo].[sp_3_venta_porMozo]
  @fecha Date,
  @fecha2 Date
  as
  begin
SELECT m.nombre +', ' + m.apellido as Mozo, sum(d.cantidad) as Cantidad, sum(d.precio_unitario*d.cantidad) as 'Importe Total', m.comision as 'comision',  ((sum(d.precio_unitario*d.cantidad)*m.comision)/100) as 'A pagar'
from (detalle_tickets d join tickets t on d.idTicket=t.idTicket)  join mozos m on m.idMozo=t.idMozo 
where cast(fechaAlta as date) between @fecha and @fecha2
group by m.nombre, m.comision, m.apellido
union 
SELECT m.nombre +', ' + m.apellido as Mozo, 0 as Cantidad, 0 as 'Importe Total', m.comision as 'comision',  0 as 'A pagar'
from (detalle_tickets d join tickets t on d.idTicket=t.idTicket)  join mozos m on m.idMozo!=t.idMozo 
where  m.idMozo not in ( SELECT distinct m.idMozo
						from (detalle_tickets d join tickets t on d.idTicket=t.idTicket)  join mozos m on m.idMozo=t.idMozo 
						where cast(fechaAlta as date) between @fecha and @fecha2
						group by m.idMozo )
group by m.nombre, m.comision, m.apellido
order by Cantidad desc
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_agregar_articulo]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_agregar_articulo]
@descripcion varchar(50),

@precio float,
@cantidad int,
@idRubro varchar(50)

  as
  begin
  insert into articulos( descripcion, precio, cantidadStock, idRubro, estaActivo)
					values ( @descripcion, @precio, @cantidad, @idRubro, 1)
					select @@IDENTITY -- devuelve el numero de IDArticulo insertado
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_agregar_detalle]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[sp_agregar_detalle]
@idTicket int,
@idArticulo int,

@precio float,
@cantidad int


  as
  begin
  declare @idInsertado int;
  insert into detalle_tickets( idTicket, idArticulo, precio_unitario, cantidad)
					values ( @idTicket, @idArticulo, @precio, @cantidad)
	SET @idInsertado = @@IDENTITY -- devuelve el numero de IDArticulo insertado
	update articulos 
	set cantidadStock=cantidadStock-@cantidad
	WHERE idArticulo= @idArticulo

	SELECT @idInsertado
end
GO
/****** Object:  StoredProcedure [dbo].[sp_agregar_mozo]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_agregar_mozo]
@nombre varchar(50),
@apellido varchar(50),
@comision float,
@nomUsu varchar(100),
@pass varchar(50)
  as
  begin
  insert into mozos( nombre, apellido, comision, nomUsu, pass, estaActivo)
					values ( @nombre, @apellido, @comision, @nomUsu, @pass, 1)
					select @@IDENTITY -- devuelve el numero de IDRUbro insertado
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_agregar_rubro]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_agregar_rubro]
@nombre varchar(50),
@descripcion varchar(100)
  as
  begin
  insert into rubros( nombre_rubro, descripcion, estaActivo)
					values ( @nombre, @descripcion, 1)
					select @@IDENTITY -- devuelve el numero de IDRUbro insertado
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_agregar_ticket]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[sp_agregar_ticket]
@fecha Datetime,
@idLocal int,
@idMozo int

  as
  begin
  insert into tickets( fechaAlta, idLocal, idMozo)
					values ( @fecha, @idLocal, @idMozo)
					select @@IDENTITY -- devuelve el numero de IDArticulo insertado
					end
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarUsuario]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_AgregarUsuario]
@Usuario varchar(50),
@Contrasenia varchar(50),

@esAdmin bit
as
begin
insert into Usuarios( Usuario, Contrasenia, esAdmin) values (@Usuario,@Contrasenia, @esAdmin)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_Articulos_Lista]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE procEDURE [dbo].[sp_Articulos_Lista] 
  as
  begin
select idArticulo, a.descripcion, precio, a.cantidadStock, r.nombre_rubro from articulos a join rubros r on a.idRubro=r.idRubro
where a.estaActivo = 1 and r.estaActivo=1
end
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_articulo]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_buscar_articulo]
@id int
  as
  begin
  select * from articulos where idArticulo=@id
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_detalle]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_buscar_detalle]
@id int
  as
  begin
  select * from detalle_tickets where idTicket=@id
					end

GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_local]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_buscar_local]
@id int
  as
  begin
  select * from locales where idLocal=@id
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_mozo]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_buscar_mozo]
@id int
  as
  begin
  select * from mozos where idMozo=@id
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_rubro]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_buscar_rubro]
@id int
  as
  begin
  select * from rubros where idRubro=@id
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_ticket]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_buscar_ticket]
@id int
  as
  begin
  select * from tickets where idTicket=@id
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_DtoDetalleTicket]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DtoDetalleTicket]
@idTicket int
as
begin
SELECT d.idTicket 'NroTicket' ,d.idDetalle 'NroDetalle', m.nombre+' '+m.apellido as 'Mozo', d.cantidad 'Cantidad', 
	   a.descripcion 'Articulo', d.precio_unitario 'Precio '  
from DETALLE_TICKETs d join TICKETs t on d.idTicket=t.idTicket join mozos m on m.idMozo=t.idMozo
join articulos a on a.idArticulo=d.idArticulo
where d.idTicket = @idTicket
end
GO
/****** Object:  StoredProcedure [dbo].[sp_editando_articulo]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_editando_articulo]

@descripcion varchar(50),
@precio float,
@cantidad int,
@idRubro varchar(50),
@estaActivo bit,
@id int
  as
  begin
  update articulos
  set descripcion =@descripcion , precio= @precio , cantidadStock= @cantidad, idRubro=@idRubro, estaActivo=@estaActivo
					where idArticulo = @id
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_editando_detalle]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_editando_detalle]

@idTicket int,
@idArticulo int,

@precio float,
@cantidad int,
@id int
  as
  begin
  update detalle_tickets
  set idTicket =@idTicket , idArticulo= @idArticulo , precio_unitario= @precio, cantidad=@cantidad
					where idDetalle = @id
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_editando_local]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_editando_local]

@nombre varchar(50),
@tipoIva varchar(50),

@direccion varchar(100),

@id int
  as
  begin
  update locales
  set nombreLocal =@nombre , tipoIva= @tipoIva , direccion= @direccion
					where idLocal = @id
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_editando_mozo]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_editando_mozo]

@nombre varchar(50),
@apellido varchar(50),
@comision float,
@nomUsu varchar(100),
@pass varchar(50),
@estaActivo int,
@id int
  as
  begin
  update mozos
  set nombre =@nombre , apellido= @apellido , comision= @comision, nomUsu=@nomUsu, pass= @pass, estaActivo = @estaActivo
					where idMozo = @id
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_editando_mozo_sinPass]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_editando_mozo_sinPass]

@nombre varchar(50),
@apellido varchar(50),
@comision float,
@nomUsu varchar(100),
--@pass varchar(50),
@estaActivo int,
@id int
  as
  begin
  update mozos
  set nombre =@nombre , apellido= @apellido , comision= @comision, nomUsu=@nomUsu,  estaActivo = @estaActivo
					where idMozo = @id
					end
					--pass= @pass,
GO
/****** Object:  StoredProcedure [dbo].[sp_editando_rubro]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_editando_rubro]

@nombre varchar(50),
@descripcion varchar(50),
@id int,
@estaActivo int
  as
  begin
  update rubros
  set nombre_rubro =@nombre , descripcion= @descripcion , estaActivo = @estaActivo
					where idRubro = @id
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_editando_ticket]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procEDURE [dbo].[sp_editando_ticket]

@fecha Datetime,
@idLocal int,
@idMozo int,
@fechaBaja Datetime,
@id int
  as
  begin
  update tickets
  set fechaAlta =@fecha , idLocal= @idLocal , idMozo= @idMozo, fechaBaja=@fechaBaja
					where idTicket = @id
					end
GO
/****** Object:  StoredProcedure [dbo].[sp_existeNombreArticulo]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_existeNombreArticulo]
@descripcion varchar(30)
as
select * from articulos where descripcion = @descripcion and estaActivo=1
GO
/****** Object:  StoredProcedure [dbo].[sp_existeNombreRubro]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_existeNombreRubro]
@nomRubro varchar(30)
as
select * from rubros where nombre_rubro = @nomRubro and estaActivo=1
GO
/****** Object:  StoredProcedure [dbo].[sp_existeUserMozo]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_existeUserMozo]
@user varchar(30)
as
select * from mozos where nomUsu = @user and estaActivo=1
GO
/****** Object:  StoredProcedure [dbo].[sp_Tickets_Lista]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procEDURE [dbo].[sp_Tickets_Lista] 
  as
  begin
select idTicket, l.nombreLocal , m.nombre, fechaAlta, fechaBaja from tickets t join mozos m on t.idMozo=m.idMozo join locales l on t.idLocal= l.idLocal  

end
GO
/****** Object:  StoredProcedure [dbo].[SP_ValidarUsuario]    Script Date: 2/12/2021 17:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_ValidarUsuario]
@Usuario varchar(50),
@Contrasenia varchar(50)

as
begin
select*from mozos where nomUsu=@Usuario and  pass=@Contrasenia and estaActivo=1
end
GO
USE [master]
GO
ALTER DATABASE [ptConfiteria] SET  READ_WRITE 
GO
