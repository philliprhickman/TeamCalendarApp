using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

using Dapper;

using Microsoft.Extensions.Configuration;

using TeamCalendar.DataAccessLibrary.Interfaces;
using TeamCalendar.DataAccessLibrary.Models;
using TeamCalendar.DataAccessLibrary.ViewModels;

namespace TeamCalendar.DataAccessLibrary.Repositories
{
    public class AppointmentRepository : IAppointmentRepository
    {
        private readonly int _commandTimeout;
        private readonly string _connectionString;

        public AppointmentRepository(IConfiguration config)
        {
            _commandTimeout = config.GetValue<int>("CommandTimeout");
            _connectionString = config.GetConnectionString("TeamCalendarConnection");
        }

        public async Task Create(AppointmentViewModel entity, int userCreated)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            await connection.ExecuteAsync("tmclndr_Appointments_Insert",
                new
                {
                    entity.EmployeeId,
                    entity.Title,
                    entity.Description,
                    entity.StartsAt,
                    entity.EndsAt,
                    userCreated
                },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task Delete(int id, int userDeleted)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            await connection.ExecuteAsync("tmclndr_Appointments_Delete",
                new
                {
                    id,
                    userDeleted
                },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<AppointmentViewModel>> GetAll()
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            return await connection.QueryAsync<AppointmentViewModel>("tmclndr_Appointments_GetAll",
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<AppointmentViewModel> GetById(int id)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            return await connection.QueryFirstOrDefaultAsync<AppointmentViewModel>("tmclndr_Appointments_GetById",
                new { id },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<AppointmentViewModel>> GetByMonthAndYear(int month, int year)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            return await connection.QueryAsync<AppointmentViewModel>("tmclndr_Appointments_GetByMonthAndYear",
                new { month, year },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task Update(AppointmentViewModel entity, int userUpdated)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            await connection.ExecuteAsync("tmclndr_Appointments_Update",
                new
                {
                    entity.Id,
                    entity.EmployeeId,
                    entity.Title,
                    entity.Description,
                    entity.StartsAt,
                    entity.EndsAt,
                    userUpdated
                },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }
    }
}
