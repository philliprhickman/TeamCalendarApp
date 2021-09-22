CREATE PROCEDURE [dbo].[tmclndr_Departments_GetAll]
AS
BEGIN
	SET NOCOUNT ON

	SELECT	[Id], 
			[Name], 
			[Description], 
			[UserCreated], 
			[DateCreated], 
			[IsDeleted], 
			[UserDeleted], 
			[DateDeleted], 
			[UserUpdated], 
			[DateUpdated]
	FROM	dbo.Departments (NOLOCK)
	WHERE	IsDeleted = 0
END
