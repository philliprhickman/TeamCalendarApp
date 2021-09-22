CREATE PROCEDURE [dbo].[tmclndr_Employees_Update]
	@Id				INT,
	@DepartmentId	INT,
	@ManagerId		INT,
	@FirstName		VARCHAR(50),
	@LastName		VARCHAR(50),
	@Username		VARCHAR(255),
	@EmailAddress	VARCHAR(255),
	@JobTitle		VARCHAR(100),
	@IsManager		BIT,
	@IsSiteAdmin	BIT,
	@UserUpdated	INT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @DateUpdated DATETIME = GETDATE()

	UPDATE	dbo.Employees
	SET		DepartmentId	= @DepartmentId,
			ManagerId		= @ManagerId,
			FirstName		= @FirstName,
			LastName		= @LastName,
			Username		= @Username,
			EmailAddress	= @EmailAddress,
			JobTitle		= @JobTitle,
			IsManager		= @IsManager,
			IsSiteAdmin		= @IsSiteAdmin,
			UserUpdated		= @UserUpdated,
			DateUpdated		= @DateUpdated
	WHERE	Id				= @Id 
END
