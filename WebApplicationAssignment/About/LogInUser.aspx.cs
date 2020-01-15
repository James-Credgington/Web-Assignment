using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing.Imaging;
using System.Drawing;

public partial class About_LogIn : BasePage /* About_Login class is inherited by the subclass BasePage */
{
    protected void Page_Load(object sender, EventArgs e) /* start of the method when in this case nothing happens to the page when it loads up */
    {

    }


    protected void Btn_SubmitEnquiry_Click(object sender, EventArgs e) // when the submit button is pressed 
    {
        // connection to the database has started
        SqlConnection con = new 
            SqlConnection(ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString);
        con.Open(); 
        // sql statement for selecting data from the database
        SqlCommand cmd = new SqlCommand("SELECT * FROM UserLogin WHERE EmailAddress=@EmailAddress and Password=@Password", con);
        // replacing values with the sql statement with textbox input
        cmd.Parameters.AddWithValue("@EmailAddress", Txt_Username.Text);
        cmd.Parameters.AddWithValue("@Password", Txt_Password.Text);
        // sql data adapter using the sql statement.
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable(); // new instance of the class DataTable with an object called dt 
        da.Fill(dt); // SQL Data Adapter fills the Data Table
        if (dt.Rows.Count > 0) // when the number of rows with the filtered database is greater than one 
        {
            lbl_Incorrect.Visible = false; // when the incorrect label is invisible
            Response.Redirect("~/home.aspx"); // redirect to the homepage
        }
        else // otherwise
        {
            lbl_Incorrect.Visible = true; // when the incorrect label is visible
            SqlCommand cmd2 = new SqlCommand("UPDATE [UserLogin] WHERE EmailAddress=@EmailAddress SET [LoggedOn]=@LoggedOn", con); // sql command to add data into the UserLogin page
            // replacing values with the sql statement with textbox input
            cmd2.Parameters.AddWithValue("@EmailAddress", Txt_Username.Text); 
            cmd2.Parameters.AddWithValue("@LoggedOn", true);
        }
    }
}
