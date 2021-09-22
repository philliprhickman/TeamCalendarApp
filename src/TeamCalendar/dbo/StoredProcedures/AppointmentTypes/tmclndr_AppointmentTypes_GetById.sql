CREATE PROCEDURE [dbo].[tmclndr_AppointmentTypes_GetById]
	@Id INT
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
	WHERE	Id = @Id
END
