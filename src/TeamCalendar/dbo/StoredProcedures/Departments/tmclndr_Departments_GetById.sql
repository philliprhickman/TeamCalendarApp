CREATE PROCEDURE [dbo].[tmclndr_Departments_GetById]
	@Id INT
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
	WHERE	Id = @Id
END
