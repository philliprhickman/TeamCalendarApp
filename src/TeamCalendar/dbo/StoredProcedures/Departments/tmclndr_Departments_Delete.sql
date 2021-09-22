CREATE PROCEDURE [dbo].[tmclndr_Departments_Delete]
	@Id				INT,
	@UserDeleted	INT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @DateDeleted DATETIME = GETDATE()

	UPDATE	dbo.Departments
	SET		IsDeleted	= 1,
			UserDeleted	= @UserDeleted,
			DateDeleted = @DateDeleted
	WHERE	Id			= @Id 
END
