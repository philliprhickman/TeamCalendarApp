CREATE PROCEDURE [dbo].[tmclndr_Employees_GetViewModels]
AS
BEGIN
	SET NOCOUNT ON

	SELECT	E.Id,
			E.FirstName + ' ' + E.LastName AS FullName,
			D.[Name] AS DepartmentName,
			M.FirstName + ' ' + M.LastName AS ManagerName,
			E.Username,
			E.EmailAddress
	FROM	dbo.Employees E (NOLOCK)
	JOIN	dbo.Departments D (NOLOCK) ON D.Id = E.DepartmentId
	JOIN	dbo.Employees M (NOLOCK) ON M.Id = E.ManagerId
	WHERE	E.IsDeleted = 0
END
