CREATE PROCEDURE [dbo].[tmclndr_Employees_GetByDepartmentId]
	@DepartmentId	INT
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
	WHERE	DepartmentId = @DepartmentId
	AND		IsDeleted = 0
END
