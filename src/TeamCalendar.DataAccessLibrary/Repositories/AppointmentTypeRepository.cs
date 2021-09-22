using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

using Dapper;

using Microsoft.Extensions.Configuration;

using TeamCalendar.DataAccessLibrary.Interfaces;
using TeamCalendar.DataAccessLibrary.ViewModels;

namespace TeamCalendar.DataAccessLibrary.Repositories
{
    public class AppointmentTypeRepository : IAppointmentTypeRepository
    {
        private readonly int _commandTimeout;
        private readonly string _connectionString;

        public AppointmentTypeRepository(IConfiguration config)
        {
            _commandTimeout = config.GetValue<int>("CommandTimeout");
            _connectionString = config.GetConnectionString("TeamCalendarConnection");
        }

        public async Task Create(AppointmentTypeViewModel entity, int userCreated)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            await connection.ExecuteAsync("tmclndr_AppointmentTypes_Insert",
                new
                {
                    entity.Name,
                    entity.Description,
                    entity.Prefix,
                    entity.BackgroundColor,
                    entity.ForegroundColor,
                    userCreated
                },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task Delete(int id, int userDeleted)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            await connection.ExecuteAsync("tmclndr_AppointmentTypes_Delete",
                new
                {
                    id,
                    userDeleted
                },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<AppointmentTypeViewModel>> GetAll()
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            return await connection.QueryAsync<AppointmentTypeViewModel>("tmclndr_AppointmentTypes_GetAll",
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<AppointmentTypeViewModel> GetById(int id)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            return await connection.QueryFirstOrDefaultAsync<AppointmentTypeViewModel>("tmclndr_AppointmentTypes_GetById",
                new { id },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task Update(AppointmentTypeViewModel entity, int userUpdated)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            await connection.ExecuteAsync("tmclndr_AppointmentTypes_Update",
                new
                {
                    entity.Id,
                    entity.Name,
                    entity.Description,
                    entity.Prefix,
                    entity.BackgroundColor,
                    entity.ForegroundColor,
                    userUpdated
                },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }
    }
}
