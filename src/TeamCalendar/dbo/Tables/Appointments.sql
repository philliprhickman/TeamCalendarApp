CREATE TABLE [dbo].[Appointments]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[AppointmentTypeId] INT NOT NULL,
	[EmployeeId] INT NOT NULL,
	[Title] VARCHAR(100) NOT NULL,
	[Description] TEXT NULL,
	[StartsAt] DATETIME NOT NULL,
	[EndsAt] DATETIME NOT NULL,
	[UserCreated] INT NOT NULL,
	[DateCreated] DATETIME NOT NULL,
	[IsDeleted] BIT NOT NULL DEFAULT(0),
	[UserDeleted] INT NULL,
	[DateDeleted] DATETIME NULL,
	[UserUpdated] INT NOT NULL,
	[DateUpdated] DATETIME NOT NULL
)
