USE [master]
GO
/****** Object:  Database [LOCADORA]    Script Date: 02/06/2016 16:40:16 ******/
CREATE DATABASE [LOCADORA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LOCADORA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LOCADORA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LOCADORA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LOCADORA_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LOCADORA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LOCADORA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LOCADORA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LOCADORA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LOCADORA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LOCADORA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LOCADORA] SET ARITHABORT OFF 
GO
ALTER DATABASE [LOCADORA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LOCADORA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LOCADORA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LOCADORA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LOCADORA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LOCADORA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LOCADORA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LOCADORA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LOCADORA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LOCADORA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LOCADORA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LOCADORA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LOCADORA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LOCADORA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LOCADORA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LOCADORA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LOCADORA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LOCADORA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LOCADORA] SET  MULTI_USER 
GO
ALTER DATABASE [LOCADORA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LOCADORA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LOCADORA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LOCADORA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LOCADORA] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LOCADORA]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 02/06/2016 16:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](35) NULL,
	[endereco] [varchar](35) NULL,
	[cidade] [varchar](25) NULL,
	[estado] [varchar](2) NULL,
	[aniversario] [datetime] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Filmes]    Script Date: 02/06/2016 16:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Filmes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](35) NULL,
	[genero] [varchar](20) NULL,
	[quantidade] [int] NULL,
	[valor] [float] NULL,
 CONSTRAINT [PK_Filmes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Itens_Locacao]    Script Date: 02/06/2016 16:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Itens_Locacao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[locacao_id] [int] NULL,
	[filme_id] [int] NULL,
	[status] [char](1) NULL,
 CONSTRAINT [PK_Itens_Locacao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Locacao]    Script Date: 02/06/2016 16:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locacao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data] [datetime] NULL,
	[cliente_id] [int] NULL,
 CONSTRAINT [PK_Locacao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([id], [nome], [endereco], [cidade], [estado], [aniversario]) VALUES (1, N'Almir Rogerio Camolesi', N'Rua Joao Ramalho', N'Assis', N'SP', CAST(N'1972-01-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes] ([id], [nome], [endereco], [cidade], [estado], [aniversario]) VALUES (2, N'Samuel A. Camolesi', N'Rua Joao Ramalho', N'Assis', N'SP', CAST(N'2012-11-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes] ([id], [nome], [endereco], [cidade], [estado], [aniversario]) VALUES (3, N'any', N'Rua João Ramalho, 1008', N'Assis', N'SP', CAST(N'1972-01-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes] ([id], [nome], [endereco], [cidade], [estado], [aniversario]) VALUES (1008, N'Begosso', N'Rua XXXX, 1023', N'Candido Mota', N'SP', CAST(N'1965-01-10 00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes] ([id], [nome], [endereco], [cidade], [estado], [aniversario]) VALUES (1009, N'Alex', N'Rua YYYYY, 2342', N'Assis', N'SP', CAST(N'1971-11-10 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Clientes] OFF
SET IDENTITY_INSERT [dbo].[Filmes] ON 

INSERT [dbo].[Filmes] ([id], [titulo], [genero], [quantidade], [valor]) VALUES (1, N'Poeira em Alto MAR', N'Drama', 5, 10)
INSERT [dbo].[Filmes] ([id], [titulo], [genero], [quantidade], [valor]) VALUES (2, N'Lindas Tranças de Um Indio Careca', N'Comédia', 5, 10)
INSERT [dbo].[Filmes] ([id], [titulo], [genero], [quantidade], [valor]) VALUES (3, N'Superman X Batman', N'Ação', 5, 15)
INSERT [dbo].[Filmes] ([id], [titulo], [genero], [quantidade], [valor]) VALUES (4, N'Guerra Civil', N'Ação', 3, 20)
INSERT [dbo].[Filmes] ([id], [titulo], [genero], [quantidade], [valor]) VALUES (5, N'Star Wars', N'Ação ', 4, 15)
SET IDENTITY_INSERT [dbo].[Filmes] OFF
SET IDENTITY_INSERT [dbo].[Itens_Locacao] ON 

INSERT [dbo].[Itens_Locacao] ([id], [locacao_id], [filme_id], [status]) VALUES (2, 2, 1, N'E')
INSERT [dbo].[Itens_Locacao] ([id], [locacao_id], [filme_id], [status]) VALUES (3, 1, 2, N'E')
INSERT [dbo].[Itens_Locacao] ([id], [locacao_id], [filme_id], [status]) VALUES (4, 1, 1, N'E')
INSERT [dbo].[Itens_Locacao] ([id], [locacao_id], [filme_id], [status]) VALUES (5, 2, 2, N'E')
INSERT [dbo].[Itens_Locacao] ([id], [locacao_id], [filme_id], [status]) VALUES (8, 12, 2, N'E')
INSERT [dbo].[Itens_Locacao] ([id], [locacao_id], [filme_id], [status]) VALUES (10, 12, 4, N'E')
INSERT [dbo].[Itens_Locacao] ([id], [locacao_id], [filme_id], [status]) VALUES (14, 11, 4, N'E')
INSERT [dbo].[Itens_Locacao] ([id], [locacao_id], [filme_id], [status]) VALUES (15, 11, 2, N'E')
INSERT [dbo].[Itens_Locacao] ([id], [locacao_id], [filme_id], [status]) VALUES (16, 3, 2, N'E')
SET IDENTITY_INSERT [dbo].[Itens_Locacao] OFF
SET IDENTITY_INSERT [dbo].[Locacao] ON 

INSERT [dbo].[Locacao] ([id], [data], [cliente_id]) VALUES (1, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Locacao] ([id], [data], [cliente_id]) VALUES (2, CAST(N'2016-05-12 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Locacao] ([id], [data], [cliente_id]) VALUES (3, CAST(N'2016-06-02 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Locacao] ([id], [data], [cliente_id]) VALUES (4, CAST(N'2016-06-03 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Locacao] ([id], [data], [cliente_id]) VALUES (7, CAST(N'2016-06-02 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Locacao] ([id], [data], [cliente_id]) VALUES (9, CAST(N'2016-06-05 00:00:00.000' AS DateTime), 1008)
INSERT [dbo].[Locacao] ([id], [data], [cliente_id]) VALUES (10, CAST(N'2016-06-02 00:00:00.000' AS DateTime), 1008)
INSERT [dbo].[Locacao] ([id], [data], [cliente_id]) VALUES (11, CAST(N'2016-06-02 00:00:00.000' AS DateTime), 1008)
INSERT [dbo].[Locacao] ([id], [data], [cliente_id]) VALUES (12, CAST(N'2016-06-02 00:00:00.000' AS DateTime), 1009)
INSERT [dbo].[Locacao] ([id], [data], [cliente_id]) VALUES (13, CAST(N'2016-06-02 00:00:00.000' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Locacao] OFF
ALTER TABLE [dbo].[Itens_Locacao]  WITH CHECK ADD  CONSTRAINT [FK_Itens_Locacao_Filmes1] FOREIGN KEY([filme_id])
REFERENCES [dbo].[Filmes] ([id])
GO
ALTER TABLE [dbo].[Itens_Locacao] CHECK CONSTRAINT [FK_Itens_Locacao_Filmes1]
GO
ALTER TABLE [dbo].[Itens_Locacao]  WITH CHECK ADD  CONSTRAINT [FK_Itens_Locacao_Locacao] FOREIGN KEY([locacao_id])
REFERENCES [dbo].[Locacao] ([id])
GO
ALTER TABLE [dbo].[Itens_Locacao] CHECK CONSTRAINT [FK_Itens_Locacao_Locacao]
GO
ALTER TABLE [dbo].[Locacao]  WITH CHECK ADD  CONSTRAINT [FK_Locacao_Clientes1] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[Clientes] ([id])
GO
ALTER TABLE [dbo].[Locacao] CHECK CONSTRAINT [FK_Locacao_Clientes1]
GO
USE [master]
GO
ALTER DATABASE [LOCADORA] SET  READ_WRITE 
GO
