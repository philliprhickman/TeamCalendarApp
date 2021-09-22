CREATE TABLE [dbo].[AppointmentTypes]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[Name] VARCHAR(100) NOT NULL,
	[Description] TEXT NULL,
	[Prefix] VARCHAR(10) NOT NULL,
	[BackgroundColor] VARCHAR(50) NOT NULL,
	[ForegroundColor] VARCHAR(50) NOT NULL,
	[UserCreated] INT NOT NULL,
	[DateCreated] DATETIME NOT NULL,
	[IsDeleted] BIT NOT NULL DEFAULT(0),
	[UserDeleted] INT NULL,
	[DateDeleted] DATETIME NULL,
	[UserUpdated] INT NOT NULL,
	[DateUpdated] DATETIME NOT NULL
)
