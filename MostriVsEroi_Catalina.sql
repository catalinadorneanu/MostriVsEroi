USE [master]
GO
/****** Object:  Database [MostriVsEroi]    Script Date: 6/17/2021 3:46:31 PM ******/
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
/****** Object:  Table [dbo].[Utenti]    Script Date: 6/17/2021 3:46:31 PM ******/
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
/****** Object:  Table [dbo].[Categorie]    Script Date: 6/17/2021 3:46:31 PM ******/
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
/****** Object:  Table [dbo].[Armi]    Script Date: 6/17/2021 3:46:31 PM ******/
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
/****** Object:  Table [dbo].[Livelli]    Script Date: 6/17/2021 3:46:31 PM ******/
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
/****** Object:  Table [dbo].[Eroi]    Script Date: 6/17/2021 3:46:31 PM ******/
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
/****** Object:  View [dbo].[UtenteConEroi]    Script Date: 6/17/2021 3:46:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UtenteConEroi]
AS
SELECT dbo.Utenti.Username, dbo.Eroi.Nome, dbo.Armi.NomeArma, dbo.Armi.PuntiDanno, dbo.Livelli.IdLivello, dbo.Categorie.Personaggio
FROM     dbo.Armi INNER JOIN
                  dbo.Eroi ON dbo.Armi.IdArma = dbo.Eroi.IdArma INNER JOIN
                  dbo.Livelli ON dbo.Eroi.IdLivello = dbo.Livelli.IdLivello INNER JOIN
                  dbo.Utenti ON dbo.Eroi.IdUtente = dbo.Utenti.IdUtente INNER JOIN
                  dbo.Categorie ON dbo.Armi.IdCategoria = dbo.Categorie.IdCategoria AND dbo.Eroi.IdCategoria = dbo.Categorie.IdCategoria
GO
/****** Object:  View [dbo].[ArmiPerCategoria]    Script Date: 6/17/2021 3:46:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ArmiPerCategoria]
AS
SELECT dbo.Armi.NomeArma, dbo.Armi.PuntiDanno, dbo.Categorie.Personaggio
FROM     dbo.Armi INNER JOIN
                  dbo.Categorie ON dbo.Armi.IdCategoria = dbo.Categorie.IdCategoria
GO
/****** Object:  Table [dbo].[Mostri]    Script Date: 6/17/2021 3:46:31 PM ******/
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
         Begin Table = "Eroi"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 734
            End
            DisplayFlags = 280
            TopColumn = 0
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
         Table =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UtenteConEroi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1170
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
