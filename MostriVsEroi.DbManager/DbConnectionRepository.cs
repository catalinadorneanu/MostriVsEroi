using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MostriVsEroi.DbManager
{
    public class DbConnectionRepository
    {
        const string connectionString = @"Data Source=(localdb)\mssqllocaldb;" +
         "Initial Catalog = MostriVsEroi;" +
         "integrated Security=true;";

        public static void Connection(out SqlConnection connection, out SqlCommand cmd)
        {
            connection = new SqlConnection(connectionString);
            connection.Open();
            cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandType = System.Data.CommandType.Text;
        }
    }
}
