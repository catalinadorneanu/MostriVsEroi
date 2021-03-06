USE [master]
GO
/****** Object:  Database [MostriVsEroi]    Script Date: 6/18/2021 2:24:27 PM ******/
CREATE DATABASE [MostriVsEroi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MostriVsEroi', FILENAME = N'C:\Users\catal\MostriVsEroi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MostriVsEroi_log', FILENAME = N'C:\Users\catal\MostriVsEroi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MostriVsEroi] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MostriVsEroi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MostriVsEroi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MostriVsEroi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MostriVsEroi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MostriVsEroi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MostriVsEroi] SET ARITHABORT OFF 
GO
ALTER DATABASE [MostriVsEroi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MostriVsEroi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MostriVsEroi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MostriVsEroi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MostriVsEroi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MostriVsEroi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MostriVsEroi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MostriVsEroi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MostriVsEroi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MostriVsEroi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MostriVsEroi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MostriVsEroi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MostriVsEroi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MostriVsEroi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MostriVsEroi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MostriVsEroi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MostriVsEroi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MostriVsEroi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MostriVsEroi] SET  MULTI_USER 
GO
ALTER DATABASE [MostriVsEroi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MostriVsEroi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MostriVsEroi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MostriVsEroi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MostriVsEroi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MostriVsEroi] SET QUERY_STORE = OFF
GO
USE [MostriVsEroi]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [MostriVsEroi]
GO
/****** Object:  Table [dbo].[Utenti]    Script Date: 6/18/2021 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utenti](
	[IdUtente] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Utenti] PRIMARY KEY CLUSTERED 
(
	[IdUtente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorie]    Script Date: 6/18/2021 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorie](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
	[Personaggio] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Armi]    Script Date: 6/18/2021 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Armi](
	[IdArma] [int] IDENTITY(1,1) NOT NULL,
	[NomeArma] [nvarchar](50) NOT NULL,
	[PuntiDanno] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
 CONSTRAINT [PK_Armi] PRIMARY KEY CLUSTERED 
(
	[IdArma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Livelli]    Script Date: 6/18/2021 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livelli](
	[IdLivello] [int] IDENTITY(1,1) NOT NULL,
	[Livello] [int] NOT NULL,
	[PuntiVita] [int] NOT NULL,
 CONSTRAINT [PK_Livelli] PRIMARY KEY CLUSTERED 
(
	[IdLivello] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eroi]    Script Date: 6/18/2021 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eroi](
	[IdEroe] [int] NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdArma] [int] NOT NULL,
	[IdLivello] [int] NOT NULL,
	[IdUtente] [int] NOT NULL,
	[PuntiAccumulati] [int] NOT NULL,
 CONSTRAINT [PK_Eroi] PRIMARY KEY CLUSTERED 
(
	[IdEroe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UtenteConEroi]    Script Date: 6/18/2021 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UtenteConEroi]
AS
SELECT dbo.Utenti.Username, dbo.Eroi.Nome, dbo.Armi.NomeArma, dbo.Armi.PuntiDanno, dbo.Eroi.PuntiAccumulati, dbo.Categorie.Tipo, dbo.Categorie.Personaggio, dbo.Livelli.Livello, dbo.Livelli.PuntiVita
FROM     dbo.Armi INNER JOIN
                  dbo.Eroi ON dbo.Armi.IdArma = dbo.Eroi.IdArma INNER JOIN
                  dbo.Livelli ON dbo.Eroi.IdLivello = dbo.Livelli.IdLivello INNER JOIN
                  dbo.Utenti ON dbo.Eroi.IdUtente = dbo.Utenti.IdUtente INNER JOIN
                  dbo.Categorie ON dbo.Armi.IdCategoria = dbo.Categorie.IdCategoria AND dbo.Eroi.IdCategoria = dbo.Categorie.IdCategoria
GO
/****** Object:  View [dbo].[ArmiPerCategoria]    Script Date: 6/18/2021 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ArmiPerCategoria]
AS
SELECT dbo.Armi.NomeArma, dbo.Armi.PuntiDanno, dbo.Categorie.Personaggio, dbo.Categorie.Tipo
FROM     dbo.Armi INNER JOIN
                  dbo.Categorie ON dbo.Armi.IdCategoria = dbo.Categorie.IdCategoria
GO
/****** Object:  Table [dbo].[Mostri]    Script Date: 6/18/2021 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mostri](
	[IdMostro] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdArma] [int] NOT NULL,
	[IdLivello] [int] NOT NULL,
	[IdUtente] [int] NOT NULL,
 CONSTRAINT [PK_Mostri] PRIMARY KEY CLUSTERED 
(
	[IdMostro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TipiMostri]    Script Date: 6/18/2021 2:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TipiMostri]
AS
SELECT dbo.Mostri.Nome, dbo.Categorie.Personaggio, dbo.Armi.NomeArma, dbo.Armi.PuntiDanno, dbo.Livelli.Livello, dbo.Livelli.PuntiVita
FROM     dbo.Armi INNER JOIN
                  dbo.Categorie ON dbo.Armi.IdCategoria = dbo.Categorie.IdCategoria INNER JOIN
                  dbo.Mostri ON dbo.Armi.IdArma = dbo.Mostri.IdArma AND dbo.Categorie.IdCategoria = dbo.Mostri.IdCategoria INNER JOIN
                  dbo.Livelli ON dbo.Mostri.IdLivello = dbo.Livelli.IdLivello
GO
SET IDENTITY_INSERT [dbo].[Armi] ON 

INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (2, N'Alabarda', 15, 3)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (3, N'Ascia', 8, 3)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (4, N'Mazza', 5, 3)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (5, N'Spada', 10, 3)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (6, N'Spadone', 15, 3)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (7, N'Arco e frecce', 8, 2)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (8, N'Bacchetta', 5, 2)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (9, N'Bastone magico', 10, 2)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (10, N'Onda d''urto', 15, 2)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (11, N'Pugnale', 5, 2)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (12, N'Discorso noioso ', 4, 4)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (13, N'Farneticazione', 7, 4)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (15, N'Imprecazione', 5, 4)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (16, N'Magia nera', 3, 4)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (17, N'Arco', 7, 5)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (18, N'Clava', 5, 5)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (19, N'Spada rotta', 3, 5)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (20, N'Mazza chiodata', 10, 5)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (21, N'Alabarda del drago', 30, 6)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (22, N'Divinazione', 15, 6)
INSERT [dbo].[Armi] ([IdArma], [NomeArma], [PuntiDanno], [IdCategoria]) VALUES (23, N'Fulmine', 10, 6)
SET IDENTITY_INSERT [dbo].[Armi] OFF
GO
SET IDENTITY_INSERT [dbo].[Categorie] ON 

INSERT [dbo].[Categorie] ([IdCategoria], [Tipo], [Personaggio]) VALUES (2, N'Mago', N'Eroe')
INSERT [dbo].[Categorie] ([IdCategoria], [Tipo], [Personaggio]) VALUES (3, N'Guerriero', N'Eroe')
INSERT [dbo].[Categorie] ([IdCategoria], [Tipo], [Personaggio]) VALUES (4, N'Cultista', N'Mostro')
INSERT [dbo].[Categorie] ([IdCategoria], [Tipo], [Personaggio]) VALUES (5, N'Orco', N'Mostro')
INSERT [dbo].[Categorie] ([IdCategoria], [Tipo], [Personaggio]) VALUES (6, N'Signore del male', N'Mostro')
SET IDENTITY_INSERT [dbo].[Categorie] OFF
GO
INSERT [dbo].[Eroi] ([IdEroe], [Nome], [IdCategoria], [IdArma], [IdLivello], [IdUtente], [PuntiAccumulati]) VALUES (1, N'Elfi', 3, 2, 1, 1, 0)
INSERT [dbo].[Eroi] ([IdEroe], [Nome], [IdCategoria], [IdArma], [IdLivello], [IdUtente], [PuntiAccumulati]) VALUES (3, N'Mezzelfi', 2, 10, 1, 1, 0)
INSERT [dbo].[Eroi] ([IdEroe], [Nome], [IdCategoria], [IdArma], [IdLivello], [IdUtente], [PuntiAccumulati]) VALUES (4, N'Nani', 2, 4, 1, 1, 0)
INSERT [dbo].[Eroi] ([IdEroe], [Nome], [IdCategoria], [IdArma], [IdLivello], [IdUtente], [PuntiAccumulati]) VALUES (5, N'Tabaxi', 3, 7, 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Livelli] ON 

INSERT [dbo].[Livelli] ([IdLivello], [Livello], [PuntiVita]) VALUES (1, 1, 20)
INSERT [dbo].[Livelli] ([IdLivello], [Livello], [PuntiVita]) VALUES (2, 2, 40)
INSERT [dbo].[Livelli] ([IdLivello], [Livello], [PuntiVita]) VALUES (3, 3, 60)
INSERT [dbo].[Livelli] ([IdLivello], [Livello], [PuntiVita]) VALUES (4, 4, 80)
INSERT [dbo].[Livelli] ([IdLivello], [Livello], [PuntiVita]) VALUES (5, 5, 100)
SET IDENTITY_INSERT [dbo].[Livelli] OFF
GO
SET IDENTITY_INSERT [dbo].[Mostri] ON 

INSERT [dbo].[Mostri] ([IdMostro], [Nome], [IdCategoria], [IdArma], [IdLivello], [IdUtente]) VALUES (1, N'Lizardfolk', 5, 20, 1, 1)
INSERT [dbo].[Mostri] ([IdMostro], [Nome], [IdCategoria], [IdArma], [IdLivello], [IdUtente]) VALUES (2, N'Drow', 6, 22, 1, 1)
INSERT [dbo].[Mostri] ([IdMostro], [Nome], [IdCategoria], [IdArma], [IdLivello], [IdUtente]) VALUES (3, N'Beholder', 4, 15, 1, 1)
SET IDENTITY_INSERT [dbo].[Mostri] OFF
GO
SET IDENTITY_INSERT [dbo].[Utenti] ON 

INSERT [dbo].[Utenti] ([IdUtente], [Username], [Password], [IsAdmin]) VALUES (1, N'c_dor', N'1234', 0)
SET IDENTITY_INSERT [dbo].[Utenti] OFF
GO
ALTER TABLE [dbo].[Armi]  WITH CHECK ADD  CONSTRAINT [FK_Armi_Categorie] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorie] ([IdCategoria])
GO
ALTER TABLE [dbo].[Armi] CHECK CONSTRAINT [FK_Armi_Categorie]
GO
ALTER TABLE [dbo].[Eroi]  WITH CHECK ADD  CONSTRAINT [FK_Eroi_Armi] FOREIGN KEY([IdArma])
REFERENCES [dbo].[Armi] ([IdArma])
GO
ALTER TABLE [dbo].[Eroi] CHECK CONSTRAINT [FK_Eroi_Armi]
GO
ALTER TABLE [dbo].[Eroi]  WITH CHECK ADD  CONSTRAINT [FK_Eroi_Categorie] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorie] ([IdCategoria])
GO
ALTER TABLE [dbo].[Eroi] CHECK CONSTRAINT [FK_Eroi_Categorie]
GO
ALTER TABLE [dbo].[Eroi]  WITH CHECK ADD  CONSTRAINT [FK_Eroi_Livelli] FOREIGN KEY([IdLivello])
REFERENCES [dbo].[Livelli] ([IdLivello])
GO
ALTER TABLE [dbo].[Eroi] CHECK CONSTRAINT [FK_Eroi_Livelli]
GO
ALTER TABLE [dbo].[Eroi]  WITH CHECK ADD  CONSTRAINT [FK_Eroi_Utenti] FOREIGN KEY([IdUtente])
REFERENCES [dbo].[Utenti] ([IdUtente])
GO
ALTER TABLE [dbo].[Eroi] CHECK CONSTRAINT [FK_Eroi_Utenti]
GO
ALTER TABLE [dbo].[Mostri]  WITH CHECK ADD  CONSTRAINT [FK_Mostri_Armi] FOREIGN KEY([IdArma])
REFERENCES [dbo].[Armi] ([IdArma])
GO
ALTER TABLE [dbo].[Mostri] CHECK CONSTRAINT [FK_Mostri_Armi]
GO
ALTER TABLE [dbo].[Mostri]  WITH CHECK ADD  CONSTRAINT [FK_Mostri_Categorie] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorie] ([IdCategoria])
GO
ALTER TABLE [dbo].[Mostri] CHECK CONSTRAINT [FK_Mostri_Categorie]
GO
ALTER TABLE [dbo].[Mostri]  WITH CHECK ADD  CONSTRAINT [FK_Mostri_Livelli] FOREIGN KEY([IdLivello])
REFERENCES [dbo].[Livelli] ([IdLivello])
GO
ALTER TABLE [dbo].[Mostri] CHECK CONSTRAINT [FK_Mostri_Livelli]
GO
ALTER TABLE [dbo].[Mostri]  WITH CHECK ADD  CONSTRAINT [FK_Mostri_Utenti] FOREIGN KEY([IdUtente])
REFERENCES [dbo].[Utenti] ([IdUtente])
GO
ALTER TABLE [dbo].[Mostri] CHECK CONSTRAINT [FK_Mostri_Utenti]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Armi"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categorie"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 148
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ArmiPerCategoria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ArmiPerCategoria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Armi"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categorie"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 148
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Livelli"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 148
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Mostri"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TipiMostri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TipiMostri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TipiMostri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[27] 2[18] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Armi"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Eroi"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 734
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Livelli"
            Begin Extent = 
               Top = 7
               Left = 782
               Bottom = 148
               Right = 976
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Utenti"
            Begin Extent = 
               Top = 7
               Left = 1024
               Bottom = 170
               Right = 1218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categorie"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 148
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 3432
         Width = 2712
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UtenteConEroi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UtenteConEroi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UtenteConEroi'
GO
USE [master]
GO
ALTER DATABASE [MostriVsEroi] SET  READ_WRITE 
GO
