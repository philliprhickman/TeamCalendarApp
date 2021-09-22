CREATE PROCEDURE [dbo].[tmclndr_AppointmentTypes_Update]
	@Id					INT,
	@Name				VARCHAR(100),
	@Description		TEXT,
	@Prefix				VARCHAR(10),
	@BackgroundColor	VARCHAR(50),
	@ForegroundColor	VARCHAR(50),
	@UserUpdated		INT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @DateUpdated DATETIME = GETDATE()

	UPDATE	dbo.AppointmentTypes
	SET		[Name]			= @Name,
			[Description]	= @Description,
			Prefix			= @Prefix,
			BackgroundColor	= @BackgroundColor,
			ForegroundColor = @ForegroundColor,
			UserUpdated		= @UserUpdated,
			DateUpdated		= @DateUpdated
	WHERE	Id				= @Id
END
