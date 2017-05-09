USE [IdentityServer]
GO
/****** Object:  StoredProcedure [dbo].[GetUsersByPage]    Script Date: 09-05-2017 18:23:07 ******/
DROP PROCEDURE [dbo].[GetUsersByPage]
GO
/****** Object:  StoredProcedure [dbo].[GetClientsByPaging]    Script Date: 09-05-2017 18:23:07 ******/
DROP PROCEDURE [dbo].[GetClientsByPaging]
GO
/****** Object:  StoredProcedure [dbo].[GetAllUserTags]    Script Date: 09-05-2017 18:23:07 ******/
DROP PROCEDURE [dbo].[GetAllUserTags]
GO
/****** Object:  StoredProcedure [dbo].[DeleteMappedScopes]    Script Date: 09-05-2017 18:23:07 ******/
DROP PROCEDURE [dbo].[DeleteMappedScopes]
GO
ALTER TABLE [dbo].[UserTagAssignment] DROP CONSTRAINT [FK_UserIdToTag]
GO
ALTER TABLE [dbo].[UserTagAssignment] DROP CONSTRAINT [FK_TagIdToTag]
GO
ALTER TABLE [dbo].[IdentityClaims] DROP CONSTRAINT [FK_IdentityClaims_IdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[ClientUserAssignment] DROP CONSTRAINT [FK_ClientUserAssignment_Clients]
GO
ALTER TABLE [dbo].[ClientUserAssignment] DROP CONSTRAINT [FK_ClientUserAssignment_AspNetUsers]
GO
ALTER TABLE [dbo].[ClientSecrets] DROP CONSTRAINT [FK_ClientSecrets_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientScopes] DROP CONSTRAINT [FK_ClientScopes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientRedirectUris] DROP CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] DROP CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientIdPRestrictions] DROP CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientGrantTypes] DROP CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientCorsOrigins] DROP CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientClaims] DROP CONSTRAINT [FK_ClientClaims_Clients_ClientId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims] DROP CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[ApiSecrets] DROP CONSTRAINT [FK_ApiSecrets_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiScopes] DROP CONSTRAINT [FK_ApiScopes_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiScopeClaims] DROP CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ApiScopeId]
GO
ALTER TABLE [dbo].[ApiClaims] DROP CONSTRAINT [FK_ApiClaims_ApiResources_ApiResourceId]
GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_ClientId_Type]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_PersistedGrants_SubjectId_ClientId_Type] ON [dbo].[PersistedGrants]
GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_PersistedGrants_SubjectId_ClientId] ON [dbo].[PersistedGrants]
GO
/****** Object:  Index [IX_PersistedGrants_SubjectId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_PersistedGrants_SubjectId] ON [dbo].[PersistedGrants]
GO
/****** Object:  Index [IX_IdentityResources_Name]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_IdentityResources_Name] ON [dbo].[IdentityResources]
GO
/****** Object:  Index [IX_IdentityClaims_IdentityResourceId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_IdentityClaims_IdentityResourceId] ON [dbo].[IdentityClaims]
GO
/****** Object:  Index [IX_ClientSecrets_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_ClientSecrets_ClientId] ON [dbo].[ClientSecrets]
GO
/****** Object:  Index [IX_ClientScopes_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_ClientScopes_ClientId] ON [dbo].[ClientScopes]
GO
/****** Object:  Index [IX_Clients_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_Clients_ClientId] ON [dbo].[Clients]
GO
/****** Object:  Index [IX_ClientRedirectUris_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_ClientRedirectUris_ClientId] ON [dbo].[ClientRedirectUris]
GO
/****** Object:  Index [IX_ClientPostLogoutRedirectUris_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_ClientPostLogoutRedirectUris_ClientId] ON [dbo].[ClientPostLogoutRedirectUris]
GO
/****** Object:  Index [IX_ClientIdPRestrictions_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_ClientIdPRestrictions_ClientId] ON [dbo].[ClientIdPRestrictions]
GO
/****** Object:  Index [IX_ClientGrantTypes_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_ClientGrantTypes_ClientId] ON [dbo].[ClientGrantTypes]
GO
/****** Object:  Index [IX_ClientCorsOrigins_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_ClientCorsOrigins_ClientId] ON [dbo].[ClientCorsOrigins]
GO
/****** Object:  Index [IX_ClientClaims_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_ClientClaims_ClientId] ON [dbo].[ClientClaims]
GO
/****** Object:  Index [UserNameIndex]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [EmailIndex]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [EmailIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
GO
/****** Object:  Index [IX_ApiSecrets_ApiResourceId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_ApiSecrets_ApiResourceId] ON [dbo].[ApiSecrets]
GO
/****** Object:  Index [IX_ApiScopes_Name]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_ApiScopes_Name] ON [dbo].[ApiScopes]
GO
/****** Object:  Index [IX_ApiScopes_ApiResourceId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_ApiScopes_ApiResourceId] ON [dbo].[ApiScopes]
GO
/****** Object:  Index [IX_ApiScopeClaims_ApiScopeId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_ApiScopeClaims_ApiScopeId] ON [dbo].[ApiScopeClaims]
GO
/****** Object:  Index [IX_ApiResources_Name]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_ApiResources_Name] ON [dbo].[ApiResources]
GO
/****** Object:  Index [IX_ApiClaims_ApiResourceId]    Script Date: 09-05-2017 18:23:07 ******/
DROP INDEX [IX_ApiClaims_ApiResourceId] ON [dbo].[ApiClaims]
GO
/****** Object:  Table [dbo].[UserTagAssignment]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[UserTagAssignment]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[Tags]
GO
/****** Object:  Table [dbo].[PersistedGrants]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[PersistedGrants]
GO
/****** Object:  Table [dbo].[IdentityResources]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[IdentityResources]
GO
/****** Object:  Table [dbo].[IdentityClaims]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[IdentityClaims]
GO
/****** Object:  Table [dbo].[ClientUserAssignment]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[ClientUserAssignment]
GO
/****** Object:  Table [dbo].[ClientSecrets]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[ClientSecrets]
GO
/****** Object:  Table [dbo].[ClientScopes]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[ClientScopes]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[Clients]
GO
/****** Object:  Table [dbo].[ClientRedirectUris]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[ClientRedirectUris]
GO
/****** Object:  Table [dbo].[ClientPostLogoutRedirectUris]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[ClientPostLogoutRedirectUris]
GO
/****** Object:  Table [dbo].[ClientIdPRestrictions]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[ClientIdPRestrictions]
GO
/****** Object:  Table [dbo].[ClientGrantTypes]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[ClientGrantTypes]
GO
/****** Object:  Table [dbo].[ClientCorsOrigins]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[ClientCorsOrigins]
GO
/****** Object:  Table [dbo].[ClientClaims]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[ClientClaims]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[AspNetUserTokens]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[AspNetRoleClaims]
GO
/****** Object:  Table [dbo].[ApiSecrets]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[ApiSecrets]
GO
/****** Object:  Table [dbo].[ApiScopes]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[ApiScopes]
GO
/****** Object:  Table [dbo].[ApiScopeClaims]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[ApiScopeClaims]
GO
/****** Object:  Table [dbo].[ApiResources]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[ApiResources]
GO
/****** Object:  Table [dbo].[ApiClaims]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[ApiClaims]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 09-05-2017 18:23:07 ******/
DROP TABLE [dbo].[__EFMigrationsHistory]
GO
USE [master]
GO
/****** Object:  Database [IdentityServer]    Script Date: 09-05-2017 18:23:07 ******/
DROP DATABASE [IdentityServer]
GO
/****** Object:  Database [IdentityServer]    Script Date: 09-05-2017 18:23:07 ******/
CREATE DATABASE [IdentityServer] ON  PRIMARY 
( NAME = N'IdentityServer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\IdentityServer.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IdentityServer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\IdentityServer_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IdentityServer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IdentityServer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IdentityServer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IdentityServer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IdentityServer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IdentityServer] SET ARITHABORT OFF 
GO
ALTER DATABASE [IdentityServer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IdentityServer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IdentityServer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IdentityServer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IdentityServer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IdentityServer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IdentityServer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IdentityServer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IdentityServer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IdentityServer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IdentityServer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IdentityServer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IdentityServer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IdentityServer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IdentityServer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IdentityServer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IdentityServer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IdentityServer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IdentityServer] SET  MULTI_USER 
GO
ALTER DATABASE [IdentityServer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IdentityServer] SET DB_CHAINING OFF 
GO
USE [IdentityServer]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApiClaims]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ApiClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApiResources]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ApiResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApiScopeClaims]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiScopeId] [int] NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ApiScopeClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApiScopes]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Emphasize] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Required] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_ApiScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApiSecrets]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NULL,
	[Value] [nvarchar](2000) NULL,
 CONSTRAINT [PK_ApiSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[Provider] [nvarchar](20) NOT NULL CONSTRAINT [DF_AspNetUsers_Provider]  DEFAULT (N'local'),
	[ContactNumber] [nvarchar](20) NULL,
	[DateOfBirth] [date] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientClaims]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_ClientClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientCorsOrigins]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientCorsOrigins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Origin] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ClientCorsOrigins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientGrantTypes]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientGrantTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[GrantType] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_ClientGrantTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientIdPRestrictions]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientIdPRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Provider] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ClientIdPRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientPostLogoutRedirectUris]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientPostLogoutRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[PostLogoutRedirectUri] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ClientPostLogoutRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientRedirectUris]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[RedirectUri] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ClientRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clients]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AbsoluteRefreshTokenLifetime] [int] NOT NULL,
	[AccessTokenLifetime] [int] NOT NULL,
	[AccessTokenType] [int] NOT NULL,
	[AllowAccessTokensViaBrowser] [bit] NOT NULL,
	[AllowOfflineAccess] [bit] NOT NULL,
	[AllowPlainTextPkce] [bit] NOT NULL,
	[AllowRememberConsent] [bit] NOT NULL,
	[AlwaysIncludeUserClaimsInIdToken] [bit] NOT NULL,
	[AlwaysSendClientClaims] [bit] NOT NULL,
	[AuthorizationCodeLifetime] [int] NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[ClientName] [nvarchar](200) NULL,
	[ClientUri] [nvarchar](2000) NULL,
	[EnableLocalLogin] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[IdentityTokenLifetime] [int] NOT NULL,
	[IncludeJwtId] [bit] NOT NULL,
	[LogoUri] [nvarchar](max) NULL,
	[LogoutSessionRequired] [bit] NOT NULL,
	[LogoutUri] [nvarchar](max) NULL,
	[PrefixClientClaims] [bit] NOT NULL,
	[ProtocolType] [nvarchar](200) NOT NULL,
	[RefreshTokenExpiration] [int] NOT NULL,
	[RefreshTokenUsage] [int] NOT NULL,
	[RequireClientSecret] [bit] NOT NULL,
	[RequireConsent] [bit] NOT NULL,
	[RequirePkce] [bit] NOT NULL,
	[SlidingRefreshTokenLifetime] [int] NOT NULL,
	[UpdateAccessTokenClaimsOnRefresh] [bit] NOT NULL,
	[ClientType] [nvarchar](100) NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientScopes]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ConsumingClientId] [int] NULL,
 CONSTRAINT [PK_ClientScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientSecrets]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ClientSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientUserAssignment]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientUserAssignment](
	[ClientId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[InSync] [bit] NOT NULL CONSTRAINT [DF_ClientUserAssignment_InSync]  DEFAULT ((0)),
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__ClientUs__3214EC07C0E56071] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IdentityClaims]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_IdentityClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IdentityResources]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Emphasize] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Required] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_IdentityResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersistedGrants]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersistedGrants](
	[Key] [nvarchar](200) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[SubjectId] [nvarchar](200) NULL,
 CONSTRAINT [PK_PersistedGrants] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTagAssignment]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTagAssignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagId] [int] NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK__UserTagA__3214EC07FC807509] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'1.0.0-rtm-21431')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170301093752_InitialIdentityServerPersistedGrantDbMigration', N'1.1.0-rtm-22752')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170301093815_InitialIdentityServerConfigurationDbMigration', N'1.1.0-rtm-22752')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170417095258_FirstNameAndLastName', N'1.1.0-rtm-22752')
GO
SET IDENTITY_INSERT [dbo].[ApiResources] ON 

GO
INSERT [dbo].[ApiResources] ([Id], [Description], [DisplayName], [Enabled], [Name]) VALUES (1, NULL, N'My API', 1, N'api1')
GO
SET IDENTITY_INSERT [dbo].[ApiResources] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiScopes] ON 

GO
INSERT [dbo].[ApiScopes] ([Id], [ApiResourceId], [Description], [DisplayName], [Emphasize], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (1, 1, NULL, N'My API', 0, N'api1', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[ApiScopes] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'1', N'11111111111', N'dev', N'dev')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f46a27be-15fe-4c22-967f-f7f0dc527962', N'1')
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [FirstName], [LastName], [Provider], [ContactNumber], [DateOfBirth]) VALUES (N'047711fe-282b-4864-9457-d610ba1f4f94', 0, N'50ad11a5-897d-4708-b3f2-121a053e0d38', N'surendrakumar.uppari@valuemomentum.biz', 0, 1, NULL, N'SURENDRAKUMAR.UPPARI@VALUEMOMENTUM.BIZ', N'SURENDRAU', N'AQAAAAEAACcQAAAAECzgBF8k4sRZ7FmVySeOrq74EjZTMjBFX79ZjB/wAP0eYdBA1KRFQe7ACxw2mtX/BQ==', NULL, 0, N'2b0edfba-c8a3-4a80-ba12-211d8cb66a31', 0, N'surendrau', N'Surendra', N'Kumar', N'local', NULL, CAST(N'2017-04-28' AS Date))
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [FirstName], [LastName], [Provider], [ContactNumber], [DateOfBirth]) VALUES (N'f46a27be-15fe-4c22-967f-f7f0dc527962', 0, N'49e09c45-f3cc-4177-8b8f-8a9bcea7ecda', N'mahesh.gupta@valuemomentum.biz', 0, 1, NULL, N'MAHESH.GUPTA@VALUEMOMENTUM.BIZ', N'MAHESH', N'AQAAAAEAACcQAAAAEJYGL4nDpvlD9l1IMribbSDUZTBRfpxOjUneKhHyoYiKGb460uWCnkKO09slcMVobA==', NULL, 0, N'a744cc81-ab79-4bb3-bbf2-55263aaa4d14', 0, N'mahesh', N'Mahesh', N'Gupta', N'local', NULL, CAST(N'2017-04-28' AS Date))
GO
SET IDENTITY_INSERT [dbo].[ClientCorsOrigins] ON 

GO
INSERT [dbo].[ClientCorsOrigins] ([Id], [ClientId], [Origin]) VALUES (1, 4, N'http://localhost:5003')
GO
INSERT [dbo].[ClientCorsOrigins] ([Id], [ClientId], [Origin]) VALUES (2, 1002, N'http://localhost:60194')
GO
INSERT [dbo].[ClientCorsOrigins] ([Id], [ClientId], [Origin]) VALUES (3, 1003, N'http://localhost:49894')
GO
INSERT [dbo].[ClientCorsOrigins] ([Id], [ClientId], [Origin]) VALUES (4, 1004, N'http://localhost:64412')
GO
SET IDENTITY_INSERT [dbo].[ClientCorsOrigins] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] ON 

GO
INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (1, 1, N'client_credentials')
GO
INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (2, 4, N'implicit')
GO
INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (3, 2, N'password')
GO
INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (4, 3, N'hybrid')
GO
INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (5, 3, N'client_credentials')
GO
INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (1002, 1002, N'implicit')
GO
INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (1003, 1003, N'implicit')
GO
INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (1004, 1004, N'implicit')
GO
INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (2004, 2003, N'implicit')
GO
INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (2005, 2003, N'client_credentials')
GO
INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (2018, 2009, N' Implicit')
GO
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] ON 

GO
INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [ClientId], [PostLogoutRedirectUri]) VALUES (1, 3, N'http://localhost:5002')
GO
INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [ClientId], [PostLogoutRedirectUri]) VALUES (2, 4, N'http://localhost:5003/index.html')
GO
INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [ClientId], [PostLogoutRedirectUri]) VALUES (1003, 2003, N'http://localhost:5006')
GO
INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [ClientId], [PostLogoutRedirectUri]) VALUES (1007, 2009, N'http://vamsez528/redirect.html')
GO
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] ON 

GO
INSERT [dbo].[ClientRedirectUris] ([Id], [ClientId], [RedirectUri]) VALUES (1, 3, N'http://localhost:5002/signin-oidc')
GO
INSERT [dbo].[ClientRedirectUris] ([Id], [ClientId], [RedirectUri]) VALUES (1002, 1002, N'http://localhost:60194/App/callback.html')
GO
INSERT [dbo].[ClientRedirectUris] ([Id], [ClientId], [RedirectUri]) VALUES (1003, 1003, N'http://localhost:49894/callback.html')
GO
INSERT [dbo].[ClientRedirectUris] ([Id], [ClientId], [RedirectUri]) VALUES (1004, 1004, N'http://localhost:64412/signin-oidc')
GO
INSERT [dbo].[ClientRedirectUris] ([Id], [ClientId], [RedirectUri]) VALUES (2006, 4, N'http://localhost:5003/callback.html')
GO
INSERT [dbo].[ClientRedirectUris] ([Id], [ClientId], [RedirectUri]) VALUES (2007, 4, N'http://localhost:5003/silentrenew.html')
GO
INSERT [dbo].[ClientRedirectUris] ([Id], [ClientId], [RedirectUri]) VALUES (2008, 4, N'http://localhost:5003/loggedout.html')
GO
INSERT [dbo].[ClientRedirectUris] ([Id], [ClientId], [RedirectUri]) VALUES (2010, 2003, N'http://localhost:5006')
GO
INSERT [dbo].[ClientRedirectUris] ([Id], [ClientId], [RedirectUri]) VALUES (2014, 2009, N'http://vamsez528/redirect.html')
GO
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

GO
INSERT [dbo].[Clients] ([Id], [AbsoluteRefreshTokenLifetime], [AccessTokenLifetime], [AccessTokenType], [AllowAccessTokensViaBrowser], [AllowOfflineAccess], [AllowPlainTextPkce], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [AlwaysSendClientClaims], [AuthorizationCodeLifetime], [ClientId], [ClientName], [ClientUri], [EnableLocalLogin], [Enabled], [IdentityTokenLifetime], [IncludeJwtId], [LogoUri], [LogoutSessionRequired], [LogoutUri], [PrefixClientClaims], [ProtocolType], [RefreshTokenExpiration], [RefreshTokenUsage], [RequireClientSecret], [RequireConsent], [RequirePkce], [SlidingRefreshTokenLifetime], [UpdateAccessTokenClaimsOnRefresh], [ClientType], [Description]) VALUES (1, 2592000, 3600, 0, 0, 0, 0, 1, 0, 0, 300, N'client', N'client', NULL, 1, 1, 300, 0, NULL, 1, NULL, 1, N'oidc', 1, 1, 1, 1, 0, 1296000, 0, NULL, NULL)
GO
INSERT [dbo].[Clients] ([Id], [AbsoluteRefreshTokenLifetime], [AccessTokenLifetime], [AccessTokenType], [AllowAccessTokensViaBrowser], [AllowOfflineAccess], [AllowPlainTextPkce], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [AlwaysSendClientClaims], [AuthorizationCodeLifetime], [ClientId], [ClientName], [ClientUri], [EnableLocalLogin], [Enabled], [IdentityTokenLifetime], [IncludeJwtId], [LogoUri], [LogoutSessionRequired], [LogoutUri], [PrefixClientClaims], [ProtocolType], [RefreshTokenExpiration], [RefreshTokenUsage], [RequireClientSecret], [RequireConsent], [RequirePkce], [SlidingRefreshTokenLifetime], [UpdateAccessTokenClaimsOnRefresh], [ClientType], [Description]) VALUES (2, 2592000, 3600, 0, 0, 0, 0, 1, 0, 0, 300, N'ro.client', N'ro.client', NULL, 1, 1, 300, 0, NULL, 1, NULL, 1, N'oidc', 1, 1, 1, 1, 0, 1296000, 0, NULL, NULL)
GO
INSERT [dbo].[Clients] ([Id], [AbsoluteRefreshTokenLifetime], [AccessTokenLifetime], [AccessTokenType], [AllowAccessTokensViaBrowser], [AllowOfflineAccess], [AllowPlainTextPkce], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [AlwaysSendClientClaims], [AuthorizationCodeLifetime], [ClientId], [ClientName], [ClientUri], [EnableLocalLogin], [Enabled], [IdentityTokenLifetime], [IncludeJwtId], [LogoUri], [LogoutSessionRequired], [LogoutUri], [PrefixClientClaims], [ProtocolType], [RefreshTokenExpiration], [RefreshTokenUsage], [RequireClientSecret], [RequireConsent], [RequirePkce], [SlidingRefreshTokenLifetime], [UpdateAccessTokenClaimsOnRefresh], [ClientType], [Description]) VALUES (3, 2592000, 3600, 0, 0, 0, 0, 1, 0, 0, 300, N'mvc', N'mvc', NULL, 1, 1, 300, 0, NULL, 1, N'/signout-oidc', 1, N'oidc', 1, 1, 1, 0, 0, 1296000, 0, NULL, NULL)
GO
INSERT [dbo].[Clients] ([Id], [AbsoluteRefreshTokenLifetime], [AccessTokenLifetime], [AccessTokenType], [AllowAccessTokensViaBrowser], [AllowOfflineAccess], [AllowPlainTextPkce], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [AlwaysSendClientClaims], [AuthorizationCodeLifetime], [ClientId], [ClientName], [ClientUri], [EnableLocalLogin], [Enabled], [IdentityTokenLifetime], [IncludeJwtId], [LogoUri], [LogoutSessionRequired], [LogoutUri], [PrefixClientClaims], [ProtocolType], [RefreshTokenExpiration], [RefreshTokenUsage], [RequireClientSecret], [RequireConsent], [RequirePkce], [SlidingRefreshTokenLifetime], [UpdateAccessTokenClaimsOnRefresh], [ClientType], [Description]) VALUES (4, 2592000, 120, 0, 1, 0, 0, 1, 0, 0, 300, N'jswebclient', N'jswebclient', NULL, 1, 1, 300, 0, NULL, 1, NULL, 1, N'oidc', 1, 1, 1, 0, 0, 1296000, 0, NULL, NULL)
GO
INSERT [dbo].[Clients] ([Id], [AbsoluteRefreshTokenLifetime], [AccessTokenLifetime], [AccessTokenType], [AllowAccessTokensViaBrowser], [AllowOfflineAccess], [AllowPlainTextPkce], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [AlwaysSendClientClaims], [AuthorizationCodeLifetime], [ClientId], [ClientName], [ClientUri], [EnableLocalLogin], [Enabled], [IdentityTokenLifetime], [IncludeJwtId], [LogoUri], [LogoutSessionRequired], [LogoutUri], [PrefixClientClaims], [ProtocolType], [RefreshTokenExpiration], [RefreshTokenUsage], [RequireClientSecret], [RequireConsent], [RequirePkce], [SlidingRefreshTokenLifetime], [UpdateAccessTokenClaimsOnRefresh], [ClientType], [Description]) VALUES (1002, 2592000, 3600, 0, 1, 0, 0, 1, 0, 0, 300, N'dotnetjswebclient', N'dotnetjswebclient', NULL, 1, 1, 300, 0, NULL, 1, NULL, 1, N'oidc', 1, 1, 1, 0, 0, 1296000, 0, NULL, NULL)
GO
INSERT [dbo].[Clients] ([Id], [AbsoluteRefreshTokenLifetime], [AccessTokenLifetime], [AccessTokenType], [AllowAccessTokensViaBrowser], [AllowOfflineAccess], [AllowPlainTextPkce], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [AlwaysSendClientClaims], [AuthorizationCodeLifetime], [ClientId], [ClientName], [ClientUri], [EnableLocalLogin], [Enabled], [IdentityTokenLifetime], [IncludeJwtId], [LogoUri], [LogoutSessionRequired], [LogoutUri], [PrefixClientClaims], [ProtocolType], [RefreshTokenExpiration], [RefreshTokenUsage], [RequireClientSecret], [RequireConsent], [RequirePkce], [SlidingRefreshTokenLifetime], [UpdateAccessTokenClaimsOnRefresh], [ClientType], [Description]) VALUES (1003, 2592000, 3600, 0, 1, 0, 0, 1, 0, 0, 300, N'plainhtmlsite', N'JavaScript Client', NULL, 1, 1, 300, 0, NULL, 1, NULL, 1, N'oidc', 1, 1, 1, 0, 0, 1296000, 0, NULL, NULL)
GO
INSERT [dbo].[Clients] ([Id], [AbsoluteRefreshTokenLifetime], [AccessTokenLifetime], [AccessTokenType], [AllowAccessTokensViaBrowser], [AllowOfflineAccess], [AllowPlainTextPkce], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [AlwaysSendClientClaims], [AuthorizationCodeLifetime], [ClientId], [ClientName], [ClientUri], [EnableLocalLogin], [Enabled], [IdentityTokenLifetime], [IncludeJwtId], [LogoUri], [LogoutSessionRequired], [LogoutUri], [PrefixClientClaims], [ProtocolType], [RefreshTokenExpiration], [RefreshTokenUsage], [RequireClientSecret], [RequireConsent], [RequirePkce], [SlidingRefreshTokenLifetime], [UpdateAccessTokenClaimsOnRefresh], [ClientType], [Description]) VALUES (1004, 2592000, 3600, 0, 1, 0, 0, 1, 0, 0, 300, N'dotnetmvcapp', N'MVC Client', NULL, 1, 1, 300, 0, NULL, 1, NULL, 1, N'oidc', 1, 1, 1, 0, 0, 1296000, 0, NULL, NULL)
GO
INSERT [dbo].[Clients] ([Id], [AbsoluteRefreshTokenLifetime], [AccessTokenLifetime], [AccessTokenType], [AllowAccessTokensViaBrowser], [AllowOfflineAccess], [AllowPlainTextPkce], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [AlwaysSendClientClaims], [AuthorizationCodeLifetime], [ClientId], [ClientName], [ClientUri], [EnableLocalLogin], [Enabled], [IdentityTokenLifetime], [IncludeJwtId], [LogoUri], [LogoutSessionRequired], [LogoutUri], [PrefixClientClaims], [ProtocolType], [RefreshTokenExpiration], [RefreshTokenUsage], [RequireClientSecret], [RequireConsent], [RequirePkce], [SlidingRefreshTokenLifetime], [UpdateAccessTokenClaimsOnRefresh], [ClientType], [Description]) VALUES (2003, 2592000, 3600, 0, 0, 0, 0, 1, 0, 0, 300, N'newapplication', N'newapplication', NULL, 1, 1, 300, 0, NULL, 1, NULL, 1, N'oidc', 1, 1, 1, 1, 0, 1296000, 0, NULL, NULL)
GO
INSERT [dbo].[Clients] ([Id], [AbsoluteRefreshTokenLifetime], [AccessTokenLifetime], [AccessTokenType], [AllowAccessTokensViaBrowser], [AllowOfflineAccess], [AllowPlainTextPkce], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [AlwaysSendClientClaims], [AuthorizationCodeLifetime], [ClientId], [ClientName], [ClientUri], [EnableLocalLogin], [Enabled], [IdentityTokenLifetime], [IncludeJwtId], [LogoUri], [LogoutSessionRequired], [LogoutUri], [PrefixClientClaims], [ProtocolType], [RefreshTokenExpiration], [RefreshTokenUsage], [RequireClientSecret], [RequireConsent], [RequirePkce], [SlidingRefreshTokenLifetime], [UpdateAccessTokenClaimsOnRefresh], [ClientType], [Description]) VALUES (2009, 2592000, 3600, 0, 0, 0, 0, 0, 0, 0, 300, N'newapplicationapiid', N'newapplicationapi', NULL, 0, 0, 300, 0, NULL, 0, NULL, 0, N'oidc', 0, 0, 0, 0, 0, 1296000, 0, N'API app', N'newapplicationapi')
GO
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientScopes] ON 

GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (1, 3, N'openid', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (2, 2, N'api1', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (3, 1, N'api1', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (4, 4, N'openid', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (5, 4, N'profile', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (7, 3, N'profile', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (8, 3, N'api1', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (1008, 4, N'api1', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (1009, 1002, N'openid', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (1010, 1002, N'profile', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (1011, 1002, N'api1', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (1012, 1003, N'openid', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (1013, 1003, N'profile', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (1014, 1003, N'api1', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (1015, 1004, N'openid', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (1016, 1004, N'profile', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (1017, 1004, N'api1', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (2011, 2003, N'profile', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (2012, 2003, N'api1', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (2014, 1, N'profile', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (2065, 2009, N'scope1', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (2066, 2009, N'scope2', 0)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (2147, 1, N'api1', 2009)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (2148, 1, N'profile', 2009)
GO
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope], [ConsumingClientId]) VALUES (2149, 1004, N'openid', 2009)
GO
SET IDENTITY_INSERT [dbo].[ClientScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientSecrets] ON 

GO
INSERT [dbo].[ClientSecrets] ([Id], [ClientId], [Description], [Expiration], [Type], [Value]) VALUES (1, 3, NULL, NULL, N'SharedSecret', N'K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=')
GO
INSERT [dbo].[ClientSecrets] ([Id], [ClientId], [Description], [Expiration], [Type], [Value]) VALUES (2, 2, NULL, NULL, N'SharedSecret', N'K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=')
GO
INSERT [dbo].[ClientSecrets] ([Id], [ClientId], [Description], [Expiration], [Type], [Value]) VALUES (3, 1, NULL, NULL, N'SharedSecret', N'K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=')
GO
INSERT [dbo].[ClientSecrets] ([Id], [ClientId], [Description], [Expiration], [Type], [Value]) VALUES (1003, 2003, NULL, NULL, N'SharedSecret', N'1236655555478995522333')
GO
INSERT [dbo].[ClientSecrets] ([Id], [ClientId], [Description], [Expiration], [Type], [Value]) VALUES (1007, 2009, NULL, NULL, NULL, N'newapplicationapi5445645645465645645654')
GO
SET IDENTITY_INSERT [dbo].[ClientSecrets] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientUserAssignment] ON 

GO
INSERT [dbo].[ClientUserAssignment] ([ClientId], [UserId], [InSync], [Id]) VALUES (1, N'047711fe-282b-4864-9457-d610ba1f4f94', 0, 1)
GO
INSERT [dbo].[ClientUserAssignment] ([ClientId], [UserId], [InSync], [Id]) VALUES (2009, N'047711fe-282b-4864-9457-d610ba1f4f94', 0, 3)
GO
INSERT [dbo].[ClientUserAssignment] ([ClientId], [UserId], [InSync], [Id]) VALUES (2009, N'f46a27be-15fe-4c22-967f-f7f0dc527962', 0, 4)
GO
SET IDENTITY_INSERT [dbo].[ClientUserAssignment] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentityClaims] ON 

GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (1, 1, N'sub')
GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (2, 2, N'name')
GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (3, 2, N'family_name')
GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (4, 2, N'given_name')
GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (5, 2, N'middle_name')
GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (6, 2, N'nickname')
GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (7, 2, N'preferred_username')
GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (8, 2, N'profile')
GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (9, 2, N'picture')
GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (10, 2, N'website')
GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (11, 2, N'gender')
GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (12, 2, N'birthdate')
GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (13, 2, N'zoneinfo')
GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (14, 2, N'locale')
GO
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (15, 2, N'updated_at')
GO
SET IDENTITY_INSERT [dbo].[IdentityClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentityResources] ON 

GO
INSERT [dbo].[IdentityResources] ([Id], [Description], [DisplayName], [Emphasize], [Enabled], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (1, NULL, N'Your user identifier', 0, 1, N'openid', 1, 1)
GO
INSERT [dbo].[IdentityResources] ([Id], [Description], [DisplayName], [Emphasize], [Enabled], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (2, N'Your user profile information (first name, last name, etc.)', N'User profile', 1, 1, N'profile', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[IdentityResources] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

GO
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (1, N'Developer')
GO
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (2, N'Tester')
GO
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (8, N'Lead')
GO
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (9, N'Trainee')
GO
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTagAssignment] ON 

GO
INSERT [dbo].[UserTagAssignment] ([Id], [TagId], [UserId]) VALUES (5, 1, N'047711fe-282b-4864-9457-d610ba1f4f94')
GO
INSERT [dbo].[UserTagAssignment] ([Id], [TagId], [UserId]) VALUES (6, 2, N'047711fe-282b-4864-9457-d610ba1f4f94')
GO
INSERT [dbo].[UserTagAssignment] ([Id], [TagId], [UserId]) VALUES (7, 2, N'f46a27be-15fe-4c22-967f-f7f0dc527962')
GO
SET IDENTITY_INSERT [dbo].[UserTagAssignment] OFF
GO
/****** Object:  Index [IX_ApiClaims_ApiResourceId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_ApiClaims_ApiResourceId] ON [dbo].[ApiClaims]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ApiResources_Name]    Script Date: 09-05-2017 18:23:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApiResources_Name] ON [dbo].[ApiResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiScopeClaims_ApiScopeId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_ApiScopeClaims_ApiScopeId] ON [dbo].[ApiScopeClaims]
(
	[ApiScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiScopes_ApiResourceId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_ApiScopes_ApiResourceId] ON [dbo].[ApiScopes]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ApiScopes_Name]    Script Date: 09-05-2017 18:23:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApiScopes_Name] ON [dbo].[ApiScopes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiSecrets_ApiResourceId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_ApiSecrets_ApiResourceId] ON [dbo].[ApiSecrets]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 09-05-2017 18:23:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientClaims_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_ClientClaims_ClientId] ON [dbo].[ClientClaims]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientCorsOrigins_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_ClientCorsOrigins_ClientId] ON [dbo].[ClientCorsOrigins]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientGrantTypes_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_ClientGrantTypes_ClientId] ON [dbo].[ClientGrantTypes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientIdPRestrictions_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_ClientIdPRestrictions_ClientId] ON [dbo].[ClientIdPRestrictions]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientPostLogoutRedirectUris_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_ClientPostLogoutRedirectUris_ClientId] ON [dbo].[ClientPostLogoutRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientRedirectUris_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_ClientRedirectUris_ClientId] ON [dbo].[ClientRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Clients_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Clients_ClientId] ON [dbo].[Clients]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientScopes_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_ClientScopes_ClientId] ON [dbo].[ClientScopes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientSecrets_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_ClientSecrets_ClientId] ON [dbo].[ClientSecrets]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdentityClaims_IdentityResourceId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_IdentityClaims_IdentityResourceId] ON [dbo].[IdentityClaims]
(
	[IdentityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_IdentityResources_Name]    Script Date: 09-05-2017 18:23:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IdentityResources_Name] ON [dbo].[IdentityResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PersistedGrants_SubjectId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_SubjectId] ON [dbo].[PersistedGrants]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_ClientId]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_SubjectId_ClientId] ON [dbo].[PersistedGrants]
(
	[SubjectId] ASC,
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_ClientId_Type]    Script Date: 09-05-2017 18:23:07 ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_SubjectId_ClientId_Type] ON [dbo].[PersistedGrants]
(
	[SubjectId] ASC,
	[ClientId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApiClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiClaims_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiClaims] CHECK CONSTRAINT [FK_ApiClaims_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiScopeClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ApiScopeId] FOREIGN KEY([ApiScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeClaims] CHECK CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ApiScopeId]
GO
ALTER TABLE [dbo].[ApiScopes]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopes_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopes] CHECK CONSTRAINT [FK_ApiScopes_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ApiSecrets_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiSecrets] CHECK CONSTRAINT [FK_ApiSecrets_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ClientClaims]  WITH CHECK ADD  CONSTRAINT [FK_ClientClaims_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientClaims] CHECK CONSTRAINT [FK_ClientClaims_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientCorsOrigins]  WITH CHECK ADD  CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientCorsOrigins] CHECK CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientGrantTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientGrantTypes] CHECK CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientIdPRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientIdPRestrictions] CHECK CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] CHECK CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientRedirectUris] CHECK CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientScopes]  WITH CHECK ADD  CONSTRAINT [FK_ClientScopes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientScopes] CHECK CONSTRAINT [FK_ClientScopes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ClientSecrets_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientSecrets] CHECK CONSTRAINT [FK_ClientSecrets_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientUserAssignment]  WITH CHECK ADD  CONSTRAINT [FK_ClientUserAssignment_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClientUserAssignment] CHECK CONSTRAINT [FK_ClientUserAssignment_AspNetUsers]
GO
ALTER TABLE [dbo].[ClientUserAssignment]  WITH CHECK ADD  CONSTRAINT [FK_ClientUserAssignment_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[ClientUserAssignment] CHECK CONSTRAINT [FK_ClientUserAssignment_Clients]
GO
ALTER TABLE [dbo].[IdentityClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityClaims_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityClaims] CHECK CONSTRAINT [FK_IdentityClaims_IdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[UserTagAssignment]  WITH CHECK ADD  CONSTRAINT [FK_TagIdToTag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[UserTagAssignment] CHECK CONSTRAINT [FK_TagIdToTag]
GO
ALTER TABLE [dbo].[UserTagAssignment]  WITH CHECK ADD  CONSTRAINT [FK_UserIdToTag] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserTagAssignment] CHECK CONSTRAINT [FK_UserIdToTag]
GO
/****** Object:  StoredProcedure [dbo].[DeleteMappedScopes]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


  CREATE PROCEDURE [dbo].[DeleteMappedScopes]
   @consumingId varchar(50)
    AS
        DELETE FROM dbo.ClientScopes where ConsumingClientId=@consumingId 
       

GO
/****** Object:  StoredProcedure [dbo].[GetAllUserTags]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE PROCEDURE [dbo].[GetAllUserTags]
    AS
        SELECT * FROM dbo.Tags

GO
/****** Object:  StoredProcedure [dbo].[GetClientsByPaging]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[GetClientsByPaging]
 @startNumber int,
 @endNumber int
 As
 BEGIN
 
;WITH Results_CTE AS
(
    SELECT ClientId,
    ClientName,
    Id,
    AbsoluteRefreshTokenLifetime,
    AccessTokenLifetime,
    AccessTokenType,
    AllowAccessTokensViaBrowser,
    AllowOfflineAccess,
    AllowPlainTextPkce,
    AllowRememberConsent,
    AlwaysIncludeUserClaimsInIdToken,
    AlwaysSendClientClaims,
    AuthorizationCodeLifetime,
    ClientUri,
    EnableLocalLogin,
    Enabled,
    IdentityTokenLifetime,
    IncludeJwtId,
    ClientType,
    LogoUri,
    LogoutSessionRequired,
    LogoutUri,
    PrefixClientClaims,
    ProtocolType,
    RefreshTokenExpiration,
    RefreshTokenUsage,
    RequireClientSecret,
    RequireConsent,
    RequirePkce,
    SlidingRefreshTokenLifetime,
    UpdateAccessTokenClaimsOnRefresh,
    Description,
    ROW_NUMBER() OVER(Order by Id) AS RowNum
    FROM Clients
   
)
SELECT *
FROM Results_CTE
WHERE RowNum >= @startNumber
AND RowNum <= @endNumber
 END
GO
/****** Object:  StoredProcedure [dbo].[GetUsersByPage]    Script Date: 09-05-2017 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[GetUsersByPage]
 @startNumber int,
 @endNumber int
 As
 BEGIN
 
;WITH Results_CTE AS
(
    SELECT Id,
    AccessFailedCount,
    ConcurrencyStamp,
    Email,
    EmailConfirmed,
    LockoutEnabled,
    LockoutEnd,
    NormalizedEmail,
    NormalizedUserName,
    PasswordHash,
    PhoneNumber,
    PhoneNumberConfirmed,
    SecurityStamp,
    TwoFactorEnabled,
    UserName,
    FirstName,
    LastName,
    Provider,
    ContactNumber,
    DateOfBirth,
    ROW_NUMBER() OVER(Order by Id) AS RowNum
    FROM dbo.AspNetUsers
   
)
SELECT *
FROM Results_CTE
WHERE RowNum >= @startNumber
AND RowNum <= @endNumber
 END
GO
USE [master]
GO
ALTER DATABASE [IdentityServer] SET  READ_WRITE 
GO
