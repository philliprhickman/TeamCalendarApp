CREATE PROCEDURE [dbo].[tmclndr_Employees_GetByManagerId]
	@ManagerId	INT
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
	WHERE	ManagerId = @ManagerId
	AND		IsDeleted = 0
END
