CREATE PROCEDURE [dbo].[tmclndr_AppointmentTypes_GetAll]
AS
BEGIN
	SET NOCOUNT ON

	SELECT	[Id], 
			[Name], 
			[Description], 
			[Prefix], 
			[BackgroundColor], 
			[ForegroundColor], 
			[UserCreated], 
			[DateCreated], 
			[IsDeleted], 
			[UserDeleted], 
			[DateDeleted], 
			[UserUpdated], 
			[DateUpdated]
	FROM	dbo.AppointmentTypes (NOLOCK)
	WHERE	IsDeleted = 0
END
