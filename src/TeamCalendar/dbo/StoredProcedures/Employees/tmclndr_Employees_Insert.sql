CREATE PROCEDURE [dbo].[tmclndr_Employees_Insert]
	@Id				INT OUT,
	@DepartmentId	INT,
	@ManagerId		INT,
	@FirstName		VARCHAR(50),
	@LastName		VARCHAR(50),
	@Username		VARCHAR(255),
	@EmailAddress	VARCHAR(255),
	@JobTitle		VARCHAR(100),
	@IsManager		BIT,
	@IsSiteAdmin	BIT,
	@UserCreated	INt
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @DateCreated DATETIME = GETDATE()

	INSERT INTO dbo.Employees
	(
		DepartmentId,
		ManagerId,
		FirstName,
		LastName,
		Username,
		EmailAddress,
		JobTitle,
		IsManager,
		IsSiteAdmin,
		UserCreated,
		DateCreated,
		UserUpdated,
		DateUpdated
	)
	VALUES
	(
		@DepartmentId,
		@ManagerId,
		@FirstName,
		@LastName,
		@Username,
		@EmailAddress,
		@JobTitle,
		@IsManager,
		@IsSiteAdmin,
		@UserCreated,
		@DateCreated,
		@UserCreated,
		@DateCreated
	)

	SET @Id = SCOPE_IDENTITY()
END
