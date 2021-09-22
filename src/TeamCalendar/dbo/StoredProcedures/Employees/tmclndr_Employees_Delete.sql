CREATE PROCEDURE [dbo].[tmclndr_Employees_Delete]
	@Id				INT,
	@UserDeleted	INT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @DateDeleted DATETIME = GETDATE()

	UPDATE	dbo.Employees
	SET		IsDeleted	= 1,
			UserDeleted = @UserDeleted,
			DateCreated = @DateDeleted
	WHERE	Id			= @Id 
END
