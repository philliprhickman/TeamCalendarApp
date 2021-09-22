using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using TeamCalendar.DataAccessLibrary.Interfaces;

namespace TeamCalendar.DataAccessLibrary.Services
{
    public class EmailService : IEmailService
    {
        public Task SendEmail(string toName, string toAddress, string subject, string body)
        {
            throw new NotImplementedException();
        }
    }
}
