using System.Threading.Tasks;

namespace TeamCalendar.DataAccessLibrary.Interfaces
{
    public interface IEmailService
    {
        Task SendEmail(string toName, string toAddress, string subject, string body);
    }
}
