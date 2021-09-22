CREATE PROCEDURE [dbo].[tmclndr_Departments_Update]
	@Id				INT,
	@Name			VARCHAR(100),
	@Description	TEXT,
	@UserUpdated	INT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @DateUpdated DATETIME = GETDATE()

	UPDATE	dbo.Departments
	SET		[Name]			= @Name,
			[Description]	= @Description,
			UserUpdated		= @UserUpdated,
			DateUpdated		= @DateUpdated
	WHERE	Id				= @Id 
END
