namespace TeamCalendar.DataAccessLibrary.Models
{
    public class Employee : BaseModel
    {
        public int DepartmentId { get; set; }
        public int ManagerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string EmailAddress { get; set; }
        public string JobTitle { get; set; }
        public bool IsManager { get; set; }
        public bool IsSiteAdmin { get; set; }
    }
}
