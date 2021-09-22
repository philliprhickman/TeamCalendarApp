using System;
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
    public class DepartmentRepository : IDepartmentRepository
    {
        private readonly int _commandTimeout;
        private readonly string _connectionString;

        public DepartmentRepository(IConfiguration config)
        {
            _commandTimeout = config.GetValue<int>("CommandTimeout");
            _connectionString = config.GetConnectionString("TeamCalendarConnection");
        }

        public async Task Create(DepartmentViewModel entity, int userCreated)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            await connection.ExecuteAsync("tmclndr_Departments_Insert",
                new
                {
                    entity.Id,
                    entity.Name,
                    entity.Description,
                    userCreated
                },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task Delete(int id, int userDeleted)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            await connection.ExecuteAsync("tmclndr_Departments_Delete",
                new
                {
                    id,
                    userDeleted
                },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<DepartmentViewModel>> GetAll()
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            return await connection.QueryAsync<DepartmentViewModel>("tmclndr_Departments_GetAll",
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<DepartmentViewModel> GetById(int id)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            return await connection.QueryFirstOrDefaultAsync<DepartmentViewModel>("tmclndr_Departments_GetById",
                new { id },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }

        public async Task Update(DepartmentViewModel entity, int userUpdated)
        {
            IDbConnection connection = new SqlConnection(_connectionString);

            await connection.ExecuteAsync("tmclndr_Departments_Update",
                new
                {
                    entity.Id,
                    entity.Name,
                    entity.Description,
                    userUpdated
                },
                commandTimeout: _commandTimeout,
                commandType: CommandType.StoredProcedure);
        }
    }
}
