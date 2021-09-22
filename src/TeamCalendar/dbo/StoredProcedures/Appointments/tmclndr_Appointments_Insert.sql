CREATE PROCEDURE [dbo].[tmclndr_Appointments_Insert]
	@Id					INT OUT,
	@AppointmentTypeId	INT,
	@EmployeeId			INT,
	@Title				VARCHAR(100),
	@Description		TEXT,
	@StartsAt			DATETIME,
	@EndsAt				DATETIME,
	@UserCreated		INT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @DateCreated DATETIME = GETDATE()

	INSERT INTO dbo.Appointments
	(
		Id,
		AppointmentTypeId,
		EmployeeId,
		Title,
		[Description],
		StartsAt,
		EndsAt,
		UserCreated,
		DateCreated,
		UserUpdated,
		DateUpdated
	)
	VALUES
	(
		@Id,
		@AppointmentTypeId,
		@EmployeeId,
		@Title,
		@Description,
		@StartsAt,
		@EndsAt,
		@UserCreated,
		@DateCreated,
		@UserCreated,
		@DateCreated
	)

	SET @Id = SCOPE_IDENTITY()
END
