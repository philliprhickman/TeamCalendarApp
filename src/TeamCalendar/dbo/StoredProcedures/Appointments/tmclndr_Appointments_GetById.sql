CREATE PROCEDURE [dbo].[tmclndr_Appointments_GetById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT	[Id], 
			[AppointmentTypeId], 
			[EmployeeId], 
			[Title], 
			[Description], 
			[StartsAt], 
			[EndsAt], 
			[UserCreated], 
			[DateCreated], 
			[IsDeleted], 
			[UserDeleted], 
			[DateDeleted], 
			[UserUpdated], 
			[DateUpdated]
	FROM	dbo.Appointments (NOLOCK)
	WHERE	Id = @Id 
END
