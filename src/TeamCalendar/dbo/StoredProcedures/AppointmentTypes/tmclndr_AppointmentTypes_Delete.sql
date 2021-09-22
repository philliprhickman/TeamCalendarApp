CREATE PROCEDURE [dbo].[tmclndr_AppointmentTypes_Delete]
	@Id				INT,
	@UserDeleted	INT
AS
BEGIN
	SET NOCOUNT ON

	UPDATE	dbo.AppointmentTypes
	SET		IsDeleted	= 1,
			UserDeleted = @UserDeleted,
			DateDeleted = GETDATE()
	WHERE	Id			= @Id
END
