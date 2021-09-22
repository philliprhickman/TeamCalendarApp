CREATE TABLE [dbo].[Departments]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[Name] VARCHAR(100) NOT NULL,
	[Description] TEXT NULL,
	[UserCreated] INT NOT NULL,
	[DateCreated] DATETIME NOT NULL,
	[IsDeleted] BIT NOT NULL DEFAULT(0),
	[UserDeleted] INT NULL,
	[DateDeleted] DATETIME NULL,
	[UserUpdated] INT NOT NULL,
	[DateUpdated] DATETIME NOT NULL
)
