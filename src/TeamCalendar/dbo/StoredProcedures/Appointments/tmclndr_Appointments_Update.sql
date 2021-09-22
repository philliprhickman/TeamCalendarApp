CREATE PROCEDURE [dbo].[tmclndr_Appointments_Update]
	@Id					INT,
	@AppointmentTypeId	INT,
	@EmployeeId			INT,
	@Title				VARCHAR(100),
	@Description		TEXT,
	@StartsAt			DATETIME,
	@EndsAt				DATETIME,
	@UserUpdated		INT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @DateUpdated DATETIME = GETDATE()

	UPDATE	dbo.Appointments
	SET		AppointmentTypeId	= @AppointmentTypeId,
			EmployeeId			= @EmployeeId,
			Title				= @Title,
			[Description]		= @Description,
			StartsAt			= @StartsAt,
			EndsAt				= @EndsAt,
			UserUpdated			= @UserUpdated,
			DateUpdated			= @DateUpdated
	WHERE	Id					= @Id
END
