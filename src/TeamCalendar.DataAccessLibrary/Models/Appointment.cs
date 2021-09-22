using System;

namespace TeamCalendar.DataAccessLibrary.Models
{
    public class Appointment : BaseModel
    {
        public int AppointmentTypeId { get; set; }
        public int EmployeeId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime StartsAt { get; set; }
        public DateTime EndsAt { get; set; }
    }
}
