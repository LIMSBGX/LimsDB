using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace CaliberEdap_Sample
{
    public partial class home : System.Web.UI.Page
    {
        
        OleDbConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindUserDetails();
        }
        protected void BindUserDetails()
        {
            DataSet ds = new DataSet();
            DataSet ds1 = new DataSet();
            DataSet ds2 = new DataSet();
            DataSet ds3 = new DataSet();

              // initiate DB connection
            string connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|CTPLEDAP.MDB";
              try
              {
                  
                  con = new OleDbConnection(connectionString);
                  con.Open();
                  /******************************************************/
                  
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.CommandType = CommandType.Text;
                   // string query = "insert into Contacts (fname,lname,llnum,mobnum,e-mail,street,city,country) values ('" + textBox1.Text + "','" + textBox2.Text + "','" + textBox3.Text + "','" + textBox4.Text + "','" + textBox5.Text + "','" + textBox6.Text + "','" + textBox7.Text + "','" + textBox8.Text + "')";
                    cmd.Connection = con;
                    cmd.CommandText = @"insert into INS_DET_MAST (INS_UCODE	,INS_DESC,INS_REMARKS,INS_REG_ON) values ("+"'sripal'"+","+"'sripal'"+","+"'sripal'"+","+"'5/19/2015 3:12:47 PM'"+")";
                   cmd.Connection = con;
//cmd.ExecuteNonQuery(); 


                 

                  /* string delquery = "delete from INS_DET_MAST";

                   DBUtil.executeQuery(delquery);
                   delquery = "delete from PRT_DET_MAST";
                   DBUtil.executeQuery(delquery);
                   delquery = "delete from SMP_ACP_MAST";
                   DBUtil.executeQuery(delquery);
                   delquery = "delete from SMP_REQ_MAST";
                  DBUtil.executeQuery(delquery);*/




                  string strquery = "SELECT * FROM INS_DET_MAST";

                  using (cmd = new OleDbCommand(strquery, con))
                  {
                      OleDbDataAdapter Da = new OleDbDataAdapter(cmd);
                      Da.Fill(ds);
                  }
                  strquery = "SELECT * FROM PRT_DET_MAST";
                  using (cmd = new OleDbCommand(strquery, con))
                  {
                      OleDbDataAdapter Da = new OleDbDataAdapter(cmd);
                      Da.Fill(ds1);
                  }
                  strquery = "SELECT * FROM SMP_ACP_MAST";
                  using (cmd = new OleDbCommand(strquery, con))
                  {
                      OleDbDataAdapter Da = new OleDbDataAdapter(cmd);
                      Da.Fill(ds2);
                  }
                  strquery = "SELECT * FROM SMP_REQ_MAST";
                  using (cmd = new OleDbCommand(strquery, con))
                  {
                      OleDbDataAdapter Da = new OleDbDataAdapter(cmd);
                      Da.Fill(ds3);
                  }


                    
                   //SQL query to list movies
              }
              catch (Exception ex)
              {
                 // MessageBox.Show(ex.Message);
                 return;
              }
             /* gvDetails.DataSource = ds;
              gvDetails.DataBind();

              GridView1.DataSource = ds1;
              GridView1.DataBind();

              GridView2.DataSource = ds2;
              GridView2.DataBind();

              GridView3.DataSource = ds3;
              GridView3.DataBind();*/


          
              
          
            
           /* var db = Database.Open("db123");
            var unitsSQL = "SELECT * FROM Units";
            var units = db.Query(unitsSQL);

            
            DataSet ds = new DataSet();
            string strquery = "SELECT * FROM userdetails";
            using (con = new OleDbConnection(@"PROVIDER=Microsoft.ACE.OLEDB.12;" + @"DATA SOURCE=E:\accessdb\Sampledb.accdb"))
            {
                using (cmd = new OleDbCommand(strquery, con))
                {
                    OleDbDataAdapter Da = new OleDbDataAdapter(cmd);
                    Da.Fill(ds);
                }
            
            gvDetails.DataSource = ds;
            gvDetails.DataBind();*/
        }




    }
}