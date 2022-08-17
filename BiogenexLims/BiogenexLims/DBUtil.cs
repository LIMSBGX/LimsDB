using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data;

namespace CaliberEdap_Sample
{
    public  class DBUtil
    {
        private static OleDbConnection _con;
        public static OleDbConnection GetConnection()
        {
            if (_con != null)
                return _con;
            else
            {
                string connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|LimsDB.MDB;Persist Security Info=False";
                OleDbConnection con = null;
                try
                {
                    con = new OleDbConnection(connectionString);
                    con.Open();

                }
                catch (Exception e)
                {
                }
                _con = con;
                return con;
            }
             
        }

        private static OleDbConnection _reportcon;
        public static OleDbConnection GetReportDatabaseConnection()
        {
            if (_reportcon != null)
                return _reportcon;
            else
            {
                string connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\\i4000_20\\REPORTS\\Reports.mdb;Persist Security Info=False;";
                OleDbConnection con = null;
                try
                {
                    con = new OleDbConnection(connectionString);
                    con.Open();

                }
                catch (Exception e)
                {
                }
                _reportcon = con;
                return _reportcon;
            }

        }

        private static OleDbConnection _remotereportcon;
        public static OleDbConnection GetReportDatabaseConnectionRemote()
        {

            
            if (_remotereportcon != null)
                return _remotereportcon;
            else
            {
                string strSysIP = string.Empty;
                strSysIP = GetSystemIp();
                string dateFilePath = "\\" + "\\" + strSysIP + "\\i4000_20\\REPORTS\\Reports.mdb;";
                string connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + dateFilePath + "Persist Security Info=False;";
                OleDbConnection con = null;
                try
                {
                    con = new OleDbConnection(connectionString);
                    con.Open();

                }
                catch (Exception e)
                {
                }
                _remotereportcon = con;
                return _remotereportcon;
            }

        }

        public static DataSet GetDataFromReports(string Query)
        {
            DataSet ds = new DataSet();
            OleDbCommand cmd = null;
            try
            {
                using (cmd = new OleDbCommand(Query, GetReportDatabaseConnection()))
                {
                    OleDbDataAdapter Da = new OleDbDataAdapter(cmd);
                    Da.Fill(ds);
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message.ToString());
            }
            return ds;
        }


        public static DataSet GetDataFromReportsRemote(string Query)
        {
            DataSet ds = new DataSet();
            OleDbCommand cmd = null;
            try
            {
                using (cmd = new OleDbCommand(Query, GetReportDatabaseConnectionRemote()))
                {
                    OleDbDataAdapter Da = new OleDbDataAdapter(cmd);
                    Da.Fill(ds);
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message.ToString());
            }
            return ds;
        }




        public static DataSet GetData(string Query)
        {
            DataSet ds=new DataSet();
            OleDbCommand cmd = null;
            try
            {
                using (cmd = new OleDbCommand(Query, GetConnection()))
                {
                    OleDbDataAdapter Da = new OleDbDataAdapter(cmd);
                    Da.Fill(ds);
                }
            }catch(Exception e)
            {
                throw new Exception(e.Message.ToString());
            }
            return ds;
        }

        public static void executeQuery(string InsQuery)
        {
            OleDbCommand cmd = null;
            try
            {
                using (cmd = new OleDbCommand(InsQuery, GetConnection()))
                {
                    cmd.ExecuteNonQuery();                     
                }
            }catch(Exception e)
            {
                throw new Exception(e.Message.ToString());
            }
        }

        public static void executeReportQuery(string InsQuery)
        {
            OleDbCommand cmd = null;
            try
            {
                using (cmd = new OleDbCommand(InsQuery, GetReportDatabaseConnection()))
                {
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message.ToString());
            }
        }


        public  static string GetSystemIp()
        {
            string strSysIp = string.Empty;
            string query = "SELECT * FROM INS_DET_MAST";
            try
            {
                DataSet ds = (DataSet)DBUtil.GetData(query);
                int count = ds.Tables[0].Rows.Count;
                if (count > 0)
                {
                    strSysIp = ds.Tables[0].Rows[0]["INS_IP"].ToString();
                }
            }
            catch (Exception e)
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + e.Message.ToString() + "')", true);
            }
            return strSysIp;
        }
    }
}
