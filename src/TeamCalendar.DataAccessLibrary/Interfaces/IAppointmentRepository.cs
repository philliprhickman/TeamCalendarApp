using System.Collections.Generic;
using System.Threading.Tasks;

using TeamCalendar.DataAccessLibrary.ViewModels;

namespace TeamCalendar.DataAccessLibrary.Interfaces
{
    public interface IAppointmentRepository : IGenericRepository<AppointmentViewModel>
    {
        Task<IEnumerable<AppointmentViewModel>> GetByMonthAndYear(int month, int year);
    }
}
