CREATE PROCEDURE [dbo].[tmclndr_Appointments_Delete]
	@Id				INT,
	@UserDeleted	INT
AS
BEGIN
	SET NOCOUNT ON

	UPDATE	dbo.Appointments
	SET		IsDeleted = 1,
			UserDeleted = @UserDeleted
	WHERE	Id			= @Id
END
