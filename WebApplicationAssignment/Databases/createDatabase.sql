/****** Creating Subject Area table and adding values to the database too ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectArea](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name_SA] [nvarchar](25) NOT NULL,
	[ImageID] [int],
	[AdditionalInformation] [nvarchar](1000)

 CONSTRAINT [PK_SubjectArea] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SubjectArea] ON
INSERT [dbo].[SubjectArea] ([ID], [Name_SA], [ImageID], [AdditionalInformation]) VALUES (0, 'Engineering', NULL, NULL)
GO
INSERT [dbo].[SubjectArea] ([ID], [Name_SA], [ImageID], [AdditionalInformation]) VALUES (1, 'Construction' , NULL, NULL)
GO
INSERT [dbo].[SubjectArea] ([ID], [Name_SA], [ImageID], [AdditionalInformation]) VALUES (2, 'Public Services', NULL, NULL)
GO
INSERT [dbo].[SubjectArea] ([ID], [Name_SA], [ImageID], [AdditionalInformation]) VALUES (3, 'Sport', NULL, NULL)
GO
INSERT [dbo].[SubjectArea] ([ID], [Name_SA], [ImageID], [AdditionalInformation]) VALUES (4, 'Business', NULL, NULL)
GO
INSERT [dbo].[SubjectArea] ([ID], [Name_SA], [ImageID], [AdditionalInformation]) VALUES (5, 'Digital Technologies', NULL, NULL)
GO
INSERT [dbo].[SubjectArea] ([ID], [Name_SA], [ImageID], [AdditionalInformation]) VALUES (6, 'Health and Social Care', NULL, NULL)
GO
INSERT [dbo].[SubjectArea] ([ID], [Name_SA], [ImageID], [AdditionalInformation]) VALUES (7, 'Childhood Studies', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[SubjectArea] OFF
/****** adding primary key to the table *******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Creating Course table adding values to the database too ******/
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name_Course] [nvarchar](200) NOT NULL,
	[ImageID] [int],
	[AdditionalInformation] [nvarchar](1000),
	[PartFullTime] [nvarchar](10) NOT NULL,
	[LevelOfCourse] [int] NOT NULL,
	[SubjectAreaID] [int] NOT NULL

 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (0, 'HN in Engineering', NULL, NULL, 'Full-Time', 5, 0)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (1, 'HN in Engineering', NULL, NULL, 'Part-Time', 5, 0)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (2, 'FdSc in Building Engineering and Project Management', NULL, NULL, 'Full-Time', 5, 1)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (3, 'FdSc in Building Engineering and Project Management', NULL, NULL, 'Part-Time', 5, 1)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (4, 'HND Construction and the Built Environment', NULL, NULL, 'Part-Time', 5, 1)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (5, 'HNC Construction and the Built Environment', NULL, NULL, 'Part-Time', 4, 1)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (6, 'HND Public Services', NULL, NULL, 'Full-Time', 5, 2)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (7, 'HNC Public Services', NULL, NULL, 'Full-Time', 4, 2)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (8, 'FdSc Sport', NULL, NULL, 'Full-Time', 5, 3)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (9, 'HND Business', NULL, NULL, 'Full-Time', 5, 4)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (10, 'HND Business', NULL, NULL, 'Part-Time', 5, 4)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (11, 'BSc (Hons) Computer Networks', NULL, NULL, 'Full-Time', 6, 5)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (12, 'BSc (Hons) Computer Networks', NULL, NULL, 'Part-Time', 6, 5)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (13, 'BSc (Hons) Computer Software Development', NULL, NULL, 'Full-Time', 6, 5)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (14, 'BSc (Hons) Computer Software Development', NULL, NULL, 'Part-Time', 6, 5)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (15, 'FdSc Computer Networks', NULL, NULL, 'Full-Time', 5, 5)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (16, 'FdSc Computer Networks', NULL, NULL, 'Part-Time', 5, 5)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (17, 'FdSc Computer Software Development', NULL, NULL, 'Full-Time', 5, 5)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (18, 'FdSc Computer Software Development', NULL, NULL, 'Part-Time', 5, 5)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (19, 'FdSc Professional Practice and Health and Social Care', NULL, NULL, 'Full-Time', 5, 6)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (20, 'FdSc Professional Practice and Health and Social Care', NULL, NULL, 'Part-Time', 5, 6)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (21, 'FdA Childrens and Young Peoples services', NULL, NULL, 'Full-Time', 2, 6)
GO
INSERT [dbo].[Course] ([ID], [Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) VALUES (22, 'FdA Childrens and Young Peoples services', NULL, NULL, 'Part-Time', 2, 6)
GO

SET IDENTITY_INSERT [dbo].[Course] OFF
/****** adding primary key to the table *******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Creating Comments table adding values to the database too ******/
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](345) NOT NULL,
	[CommentInformation] [nvarchar](1000) NOT NULL,
	[DateAndTimeOfCommentSent] [datetime] NOT NULL,
	[CourseID] [int]

 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Creating Image table  ******/

CREATE TABLE [dbo].[Image](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ContentType] [varchar](10) NULL,
	[Data] [varbinary](MAX) NULL

 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Creating UserLogin table  ******/

CREATE TABLE [dbo].[UserLogin] (
	[ID] [int] IDENTITY(1, 1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[Surname] [varchar](30) NOT NULL,
	[DateOfBirth] [varchar](15) NOT NULL,
	[Gender] [varchar](15) NOT NULL,
	[EmailAddress] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[CurrentStudent] [varchar](15) NOT NULL,
	[Password] [varchar] (15) NOT NULL,
	[LoggedOn] [bit] NOT NULL

 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
/****** adding primary key to the table *******/
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Creating AdminLogin table ******/
CREATE TABLE [dbo].[AdminLogin] (
	[ID][int] IDENTITY(1, 1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[Surname] [varchar](30) NOT NULL,
	[DateOfBirth] [varchar](15) NOT NULL,
	[Gender] [varchar](15) NOT NULL,
	[EmailAddress] [varchar](50) NOT NULL,
	[Password] [varchar] (15) NOT NULL,
	[LoggedOn] [bit] NOT NULL
CONSTRAINT [PK_AdminLogin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Creating FavouriteCourse table  ******/
CREATE TABLE [dbo].[FavouriteCourse] (
	[ID] [int] IDENTITY(1, 1) NOT NULL,
	[userLoginID] [int] NULL,
	[CourseID] [int] NULL

CONSTRAINT [PK_FavouriteCourse] PRIMARY KEY CLUSTERED 
(
/****** adding primary key to the table *******/
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/***** making relationships between different tables between the foreign keys and the primary keys ******/
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Image_DateAndTimeOfCommentSent]  DEFAULT (getdate()) FOR [DateAndTimeOfCommentSent]
GO

ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_SubjectArea] FOREIGN KEY([SubjectAreaID])
REFERENCES [dbo].[SubjectArea] ([ID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_SubjectArea]
GO
ALTER TABLE [dbo].[SubjectArea]  WITH CHECK ADD  CONSTRAINT [FK_SubjectArea_Image] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Image] ([ID])
GO
ALTER TABLE [dbo].[SubjectArea] CHECK CONSTRAINT [FK_SubjectArea_Image]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Image] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Image] ([ID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Image]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Course]
GO
ALTER TABLE [dbo].[FavouriteCourse]  WITH CHECK ADD  CONSTRAINT [FK_FavouriteCourse_UserLogin] FOREIGN KEY([userLoginID])
REFERENCES [dbo].[UserLogin] ([ID])
GO
ALTER TABLE [dbo].[FavouriteCourse] CHECK CONSTRAINT [FK_FavouriteCourse_userLogin]
GO
ALTER TABLE [dbo].[FavouriteCourse]  WITH CHECK ADD  CONSTRAINT [FK_FavouriteCourse_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[FavouriteCourse] CHECK CONSTRAINT [FK_FavouriteCourses_Course]
GO


