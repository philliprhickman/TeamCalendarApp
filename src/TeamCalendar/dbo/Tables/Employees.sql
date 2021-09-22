CREATE TABLE [dbo].[Employees]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[DepartmentId] INT NOT NULL,
	[ManagerId] INT NOT NULL,
	[FirstName] VARCHAR(50) NOT NULL,
	[LastName] VARCHAR(50) NOT NULL,
	[Username] VARCHAR(255) NOT NULL,
	[EmailAddress] VARCHAR(255) NOT NULL,
	[JobTitle] VARCHAR(100) NULL,
	[IsManager] BIT NOT NULL DEFAULT(0),
	[IsSiteAdmin] BIT NOT NULL DEFAULT(0),
	[UserCreated] INT NOT NULL,
	[DateCreated] DATETIME NOT NULL,
	[IsDeleted] BIT NOT NULL DEFAULT(0),
	[UserDeleted] INT NULL,
	[DateDeleted] DATETIME NULL,
	[UserUpdated] INT NOT NULL,
	[DateUpdated] DATETIME NOT NULL
)
