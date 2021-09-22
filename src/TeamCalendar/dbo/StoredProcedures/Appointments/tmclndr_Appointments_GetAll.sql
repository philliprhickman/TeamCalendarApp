CREATE PROCEDURE [dbo].[tmclndr_Appointments_GetAll]
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
	WHERE	IsDeleted = 0
END
