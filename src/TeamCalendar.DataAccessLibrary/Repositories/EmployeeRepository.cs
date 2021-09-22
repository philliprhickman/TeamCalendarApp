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
    public class EmployeeRepository : IEmployeeRepository
    {
        private readonly int _commandTimeout;
        private readonly string _connectionString;

        public EmployeeRepository(IConfiguration config)
        {
            _commandTimeout = config.GetValue<int>("CommandTimeout");
            _connectionString = config.GetConnectionString("TeamCalendarConnection");
        }

        public async Task Create(EmployeeViewModel entity, int userCreated)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            await connection.ExecuteAsync("tmclndr_Employees_Insert",
                new
                {
                    entity.DepartmentId,
                    entity.ManagerId,
                    entity.FirstName,
                    entity.LastName,
                    entity.Username,
                    entity.EmailAddress,
                    entity.JobTitle,
                    entity.IsManager,
                    entity.IsSiteAdmin,
                    userCreated
                },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task Delete(int id, int userDeleted)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            await connection.ExecuteAsync("tmclndr_Employees_Delete",
                new
                {
                    id,
                    userDeleted
                },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<EmployeeViewModel>> GetAll()
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            return await connection.QueryAsync<EmployeeViewModel>("tmclndr_Employees_GetAll",
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<EmployeeViewModel>> GetByDepartmentId(int departmentId)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            return await connection.QueryAsync<EmployeeViewModel>("tmclndr_Employees_GetByDepartmentId",
                new { departmentId },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<EmployeeViewModel> GetById(int id)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            return await connection.QueryFirstOrDefaultAsync<EmployeeViewModel>("tmclndr_Employees_GetById",
                new { id },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<EmployeeViewModel>> GetByManagerId(int managerId)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            return await connection.QueryAsync<EmployeeViewModel>("tmclndr_Employees_GetByManagerId",
                new { managerId },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<EmployeeViewModel> GetByUsername(string username)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            return await connection.QueryFirstOrDefaultAsync<EmployeeViewModel>("tmclndr_Employees_GetByUsername",
                new { username },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<EmployeeDisplayViewModel>> GetEmployeeDisplayViewModels()
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            return await connection.QueryAsync<EmployeeDisplayViewModel>("tmclndr_Employees_GetViewModels",
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task Update(EmployeeViewModel entity, int userUpdated)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            await connection.ExecuteAsync("tmclndr_Employees_Update",
                new
                {
                    entity.Id,
                    entity.DepartmentId,
                    entity.ManagerId,
                    entity.FirstName,
                    entity.LastName,
                    entity.Username,
                    entity.EmailAddress,
                    entity.JobTitle,
                    entity.IsManager,
                    entity.IsSiteAdmin,
                    userUpdated
                },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }
    }
}
