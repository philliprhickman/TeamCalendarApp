using System.Collections.Generic;
using System.Threading.Tasks;

using TeamCalendar.DataAccessLibrary.ViewModels;

namespace TeamCalendar.DataAccessLibrary.Interfaces
{
    public interface IEmployeeRepository : IGenericRepository<EmployeeViewModel>
    {
        Task<IEnumerable<EmployeeViewModel>> GetByDepartmentId(int departmentId);
        Task<IEnumerable<EmployeeViewModel>> GetByManagerId(int managerId);
        Task<EmployeeViewModel> GetByUsername(string username);
        Task<IEnumerable<EmployeeDisplayViewModel>> GetEmployeeDisplayViewModels();
    }
}
