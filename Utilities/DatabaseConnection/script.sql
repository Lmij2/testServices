/****** Object:  Database [a]    Script Date: 09/04/2021 14:47:38 ******/
CREATE DATABASE [NameDB]
GO
CREATE TABLE [NameDB].[dbo].[Contact](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nature] [nvarchar](120) NOT NULL,
	[Type] [varchar](24) NOT NULL,
	[Name] [nvarchar](128) NULL,
	[Email1] [varchar](50) NULL,
	[Email2] [varchar](50) NULL,
	[Telephone1] [varchar](24) NULL,
	[Telephone2] [varchar](24) NULL,
	[Fax] [varchar](24) NULL,
	[Address] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Affiliation] [nvarchar](128) NULL,
	[Role] [nvarchar](100) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Contact_Unique_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
/****** Object:  Table [NameDB].[dbo].[ContactNature]    Script Date: 09/04/2021 2:33:24 PM ******/
CREATE TABLE [NameDB].[dbo].[ContactNature](
	[Name] [nvarchar](120) NOT NULL,
 CONSTRAINT [PK_ContactNature_1] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
/****** Object:  Table [NameDB].[dbo].[ContactsGroups]    Script Date: 09/04/2021 2:33:24 PM ******/

CREATE TABLE [NameDB].[dbo].[ContactsGroups](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdContact] [bigint] NOT NULL,
	[IdGroup] [bigint] NOT NULL,
 CONSTRAINT [PK_ContactsGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
/****** Object:  Table [NameDB].[dbo].[Diffusion]    Script Date: 09/04/2021 2:33:24 PM ******/
CREATE TABLE [NameDB].[dbo].[Diffusion](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdMail] [bigint] NOT NULL,
	[DiffusionDateTime] [datetime] NOT NULL,
	[DiffusionRecipients] [nvarchar](max) NOT NULL,
	[Object] [nvarchar](255) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[UserName] [nvarchar](64) NULL,
 CONSTRAINT [PK_Diffusion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
/****** Object:  Table [NameDB].[dbo].[Email]    Script Date: 09/04/2021 2:33:24 PM ******/
CREATE TABLE [NameDB].[dbo].[Email](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DateofReceipt] [date] NULL,
	[SenderName] [nvarchar](128) NULL,
	[SenderEmail] [nvarchar](128) NULL,
	[ReceiverName] [nvarchar](128) NULL,
	[ReceiverEmail] [nvarchar](128) NULL,
	[Object] [nvarchar](128) NULL,
	[Body] [nvarchar](max) NULL,
	[AttachedFiles] [nvarchar](max) NULL,
	[DateofImport] [date] NULL,
	[Status] [nvarchar](24) NULL,
	[DateofStatus] [date] NULL,
 CONSTRAINT [PK_Email] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
/****** Object:  Table [NameDB].[dbo].[Folder]    Script Date: 09/04/2021 2:33:24 PM ******/

CREATE TABLE [NameDB].[dbo].[Folder](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Folder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Folder_Unique_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
/****** Object:  Table [NameDB].[dbo].[Group]    Script Date: 09/04/2021 2:33:24 PM ******/

CREATE TABLE [NameDB].[dbo].[Group](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Group_Unique_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
/****** Object:  Table [NameDB].[dbo].[Mail]    Script Date: 09/04/2021 2:33:24 PM ******/

CREATE TABLE [NameDB].[dbo].[Mail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MailType] [varchar](24) NOT NULL,
	[Channel] [varchar](24) NOT NULL,
	[RegistrationDate] [date] NOT NULL,
	[RegistrationNumber] [varchar](24) NOT NULL,
	[IdSender] [bigint] NULL,
	[SenderRegistrationNumber] [varchar](24) NULL,
	[SenderRegistrationDate] [date] NULL,
	[IdRecipient] [bigint] NULL,
	[Priority] [varchar](24) NULL,
	[Confidentiality] [varchar](24) NULL,
	[Object] [nvarchar](max) NULL,
	[DigitizedFile] [nvarchar](128) NULL,
	[Language] [varchar](24) NULL,
	[KeyWords] [nvarchar](128) NULL,
	[Observations] [nvarchar](max) NULL,
	[IdFolder] [bigint] NULL,
	[HardCopyClassification] [nvarchar](64) NULL,
	[Category] [varchar](24) NULL,
	[RecipientType] [nvarchar](32) NULL,
	[SenderType] [nvarchar](32) NULL,
	[SenderName] [nvarchar](128) NULL,
	[RecipientName] [nvarchar](128) NULL,
	[Attachments] [nvarchar](max) NULL,
	[StatusScannedDoc] [nvarchar](24) NULL,
 CONSTRAINT [PK_Mail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Mail] UNIQUE NONCLUSTERED 
(
	[RegistrationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
/****** Object:  Table [NameDB].[dbo].[OutGoingSlip]    Script Date: 09/04/2021 2:33:24 PM ******/

CREATE TABLE [NameDB].[dbo].[OutGoingSlip](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreationDate] [date] NULL,
	[SenderType] [nvarchar](32) NOT NULL,
	[SenderName] [nvarchar](128) NOT NULL,
	[IdSender] [bigint] NULL,
	[RecipientType] [nvarchar](32) NOT NULL,
	[RecipientName] [nvarchar](128) NOT NULL,
	[IdRecipient] [bigint] NULL,
	[ToTheAttentionOf] [nvarchar](255) NOT NULL,
	[Object] [nvarchar](255) NOT NULL,
	[Attachments] [nvarchar](255) NULL,
	[Observations] [nvarchar](max) NULL,
	[FileOutGoingSlip] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OutGoingSlip] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
/****** Object:  Table [NameDB].[dbo].[Workflow]    Script Date: 09/04/2021 2:33:24 PM ******/

CREATE TABLE [NameDB].[dbo].[Workflow](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdMail] [bigint] NOT NULL,
	[IdPrevious] [bigint] NULL,
	[Ticket] [bigint] NULL,
	[AssignedBy] [bigint] NOT NULL,
	[AssignedTo] [bigint] NOT NULL,
	[AssignmentDate] [datetime] NOT NULL,
	[ProcessingDate] [datetime] NULL,
	[State] [nvarchar](32) NOT NULL,
	[Task] [nvarchar](128) NOT NULL,
	[Details] [nvarchar](256) NULL,
	[AssignedByName] [nvarchar](64) NULL,
	[AssignedToName] [nvarchar](64) NULL,
 CONSTRAINT [PK_WorkFlow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE [NameDB].[dbo].[ContactsGroups]  WITH CHECK ADD  CONSTRAINT [FK_ContactsGroups_Contact] FOREIGN KEY([IdContact])
REFERENCES [NameDB].[dbo].[Contact] ([Id])
ALTER TABLE [NameDB].[dbo].[ContactsGroups] CHECK CONSTRAINT [FK_ContactsGroups_Contact]
ALTER TABLE [NameDB].[dbo].[ContactsGroups]  WITH CHECK ADD  CONSTRAINT [FK_ContactsGroups_Group] FOREIGN KEY([IdGroup])
REFERENCES [NameDB].[dbo].[Group] ([Id])
ALTER TABLE [NameDB].[dbo].[ContactsGroups] CHECK CONSTRAINT [FK_ContactsGroups_Group]
ALTER TABLE [NameDB].[dbo].[Diffusion]  WITH CHECK ADD  CONSTRAINT [FK_Diffusion_Mail] FOREIGN KEY([IdMail])
REFERENCES [NameDB].[dbo].[Mail] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [NameDB].[dbo].[Diffusion] CHECK CONSTRAINT [FK_Diffusion_Mail]
ALTER TABLE [NameDB].[dbo].[Mail]  WITH NOCHECK ADD  CONSTRAINT [FK_Mail_Contact_Sender] FOREIGN KEY([IdSender])
REFERENCES [NameDB].[dbo].[Contact] ([Id])
ALTER TABLE [NameDB].[dbo].[Mail] CHECK CONSTRAINT [FK_Mail_Contact_Sender]
ALTER TABLE [NameDB].[dbo].[Mail]  WITH NOCHECK ADD  CONSTRAINT [FK_Mail_Folder] FOREIGN KEY([IdFolder])
REFERENCES [NameDB].[dbo].[Folder] ([Id])
ALTER TABLE [NameDB].[dbo].[Mail] CHECK CONSTRAINT [FK_Mail_Folder]
