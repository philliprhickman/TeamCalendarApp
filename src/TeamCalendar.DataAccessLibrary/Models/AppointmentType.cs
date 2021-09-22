namespace TeamCalendar.DataAccessLibrary.Models
{
    public class AppointmentType : BaseModel
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string Prefix { get; set; }
        public string BackgroundColor { get; set; }
        public string ForegroundColor { get; set; }
    }
}
