using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql;
using System.Data;
using MySql.Data.MySqlClient;

namespace BiogenexLims
{
    public class SQLDBUtil
    {
        private static MySql.Data.MySqlClient.MySqlConnection _con;
        public static MySql.Data.MySqlClient.MySqlConnection GetConnection()
        {

            if (_con != null)
            {
                return _con;
            }
            else
            {
                string myConnectionString;
                myConnectionString = "server=127.0.0.1;uid=root;pwd=biogenex;database=lims";
                try
                {
                    _con = new MySql.Data.MySqlClient.MySqlConnection();
                    _con.ConnectionString = myConnectionString;
                    _con.Open();
                    
                }
                catch (MySql.Data.MySqlClient.MySqlException ex)
                {
                    // MessageBox.Show(ex.Message);
                    return null;
                }

                return _con;
            }
        }
        public static DataSet GetData(string Query)
        {

            if (_con == null)
            {
                GetConnection();
            }
            DataSet ds = new DataSet();
            DataTable dataTable = new DataTable();
            MySqlCommand cmd = null;
            
            try
            {
                cmd = new MySqlCommand(Query, _con);
                //_con.Open();

                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message.ToString());
            }
            return ds;
        }

        public static void executeQuery(string InsQuery)
        {
                if (_con == null)
                {
                    GetConnection();
                }
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = _con;
                cmd.CommandText = InsQuery;
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message.ToString());
                }
            
             /*try
             {
                 cmd = new MySqlCommand(InsQuery, _con);
                // _con.Open();
                 using (cmd = new mysql(InsQuery, GetConnection()))
                 {
                     cmd.ExecuteNonQuery();
                 }
             }
             catch (Exception e)
             {
                 throw new Exception(e.Message.ToString());
             }*/
        }

    
    }
}