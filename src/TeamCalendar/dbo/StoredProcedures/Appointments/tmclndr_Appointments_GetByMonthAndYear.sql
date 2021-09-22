CREATE PROCEDURE [dbo].[tmclndr_Appointments_GetByMonthAndYear]
	@Month	INT,
	@Year	INT
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
	WHERE	MONTH(StartsAt) = @Month 
	AND		YEAR(StartsAt) = @Year
	AND		IsDeleted = 0
END
