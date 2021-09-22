CREATE PROCEDURE [dbo].[tmclndr_Departments_Insert]
	@Id				INT OUT,
	@Name			VARCHAR(100),
	@Description	TEXT,
	@UserCreated	INT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @DateCreated DATETIME = GETDATE()

	INSERT INTO dbo.Departments
	(
		[Name],
		[Description],
		UserCreated,
		DateCreated,
		UserUpdated,
		DateUpdated
	)
	VALUES
	(
		@Name,
		@Description,
		@UserCreated,
		@DateCreated,
		@UserCreated,
		@DateCreated
	)

	SET @Id = SCOPE_IDENTITY()
END
