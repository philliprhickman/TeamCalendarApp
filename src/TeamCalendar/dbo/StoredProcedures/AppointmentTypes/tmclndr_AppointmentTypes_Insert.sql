CREATE PROCEDURE [dbo].[tmclndr_AppointmentTypes_Insert]
	@Id					INT OUT,
	@Name				VARCHAR(100),
	@Description		TEXT,
	@Prefix				VARCHAR(10),
	@BackgroundColor	VARCHAR(50),
	@ForegroundColor	VARCHAR(50),
	@UserCreated		INT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @DateCreated DATETIME = GETDATE()

	INSERT INTO dbo.AppointmentTypes
	(
		[Name],
		[Description],
		Prefix,
		BackgroundColor,
		ForegroundColor,
		UserCreated,
		DateCreated,
		UserUpdated,
		DateUpdated
	)
	VALUES
	(
		@Name,
		@Description,
		@Prefix,
		@BackgroundColor,
		@ForegroundColor,
		@UserCreated,
		@DateCreated,
		@UserCreated,
		@DateCreated
	)

	SET @Id = SCOPE_IDENTITY()
END
