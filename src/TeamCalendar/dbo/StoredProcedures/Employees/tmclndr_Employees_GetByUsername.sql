CREATE PROCEDURE [dbo].[tmclndr_Employees_GetByUsername]
	@Username	VARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON

	SELECT	[Id], 
			[DepartmentId], 
			[ManagerId], 
			[FirstName], 
			[LastName], 
			[Username], 
			[EmailAddress], 
			[JobTitle], 
			[IsManager], 
			[IsSiteAdmin], 
			[UserCreated], 
			[DateCreated], 
			[IsDeleted], 
			[UserDeleted], 
			[DateDeleted], 
			[UserUpdated], 
			[DateUpdated]
	FROM	dbo.Employees (NOLOCK)
	WHERE	Username = @Username
END
