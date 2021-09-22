using System.Collections.Generic;
using System.Threading.Tasks;

using TeamCalendar.DataAccessLibrary.ViewModels;

namespace TeamCalendar.DataAccessLibrary.Interfaces
{
    public interface IGenericRepository<T> where T : BaseViewModel
    {
        Task<IEnumerable<T>> GetAll();
        Task<T> GetById(int id);
        Task Create(T entity, int userCreated);
        Task Update(T entity, int userUpdated);
        Task Delete(int id, int userDeleted);
    }
}
