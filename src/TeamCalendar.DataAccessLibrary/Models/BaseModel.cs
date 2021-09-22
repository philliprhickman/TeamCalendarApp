using System;

namespace TeamCalendar.DataAccessLibrary.Models
{
    public abstract class BaseModel
    {
        public int Id { get; set; }
        public int UserCreated { get; set; }
        public DateTime DateCreated { get; set; }
        public bool IsDeleted { get; set; }
        public int? UserDeleted { get; set; }
        public DateTime? DateDeleted { get; set; }
        public int UserUpdated { get; set; }
        public DateTime DateUpdated { get; set; }
    }
}
