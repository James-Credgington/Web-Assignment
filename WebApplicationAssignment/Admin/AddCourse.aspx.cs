using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing;

public partial class Admin_AddCourse : BasePage // 'Admin_AddCourse' is a class which is a subclass to the 'basePage ' 
{

    protected void Page_Load(object sender, EventArgs e) // start of a method which runs when the page first loads up
    {
        if (Request.QueryString.Get("ID") != null) // when the session variable is set not to be null.
        {
            addCourse.DefaultMode = DetailsViewMode.Edit; /* can edit data into the database */
        }
    }


    protected void BtnUpload_Click(object sender, EventArgs e) // when  upload button is rpessed
    {
        Lbl_DatabaseConnection.Visible = false;
        string filePath = FileUpload1.PostedFile.FileName; /* when the image file path is loaded onto the database */
        string filename = Path.GetFileName(filePath); /* get filepath to load image onto the page */
        string ext = Path.GetExtension(filename); /* change the type of image in the path */
        string contenttype = String.Empty; /* content type of path is to be empty */

        //Set the contenttype based on File Extension
        switch (ext) // whenever the extension changes
        {
            case ".doc": // when ext is ".doc "
                contenttype = "application/vnd.ms-word"; // change content type
                break;
            case ".docx":  // when ext is ".docx "
                contenttype = "application/vnd.ms-word"; // change content type
                break;
            case ".xls": // when ext is ".xls "
                contenttype = "application/vnd.ms-excel"; // change content type
                break;
            case ".xlsx": // when ext is ".xlsx "
                contenttype = "application/vnd.ms-excel"; // change content type
                break;
            case ".jpg":  // when ext is ".jpg "
                contenttype = "image/jpg"; // change content type
                break;
            case ".png": // when ext is ".png "
                contenttype = "image/png"; // change content type
                break;
            case ".gif": // when ext is ".gif "
                contenttype = "image/gif"; // change content type
                break;
            case ".pdf":  // when ext is ".pdf "
                contenttype = "application/pdf"; // change content type
                break;
        }
        if (contenttype != String.Empty) // when the content type is not an empty string
        {
            // add image by converting data and sent it to the database
            Stream fs = FileUpload1.PostedFile.InputStream; 
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);
            try
            {
                //insert the file into database
                string strQuery = "INSERT INTO [Image] ([Name], [ContentType], [Data]) VALUES (@Name, @ContentType, @Data)";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = filename;
                cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value
                  = contenttype;
                cmd.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes;
                InsertUpdateData(cmd);
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "File Uploaded Successfully";
            }
            // when the database connection does not work
            catch {
                // when the database conenction label is to be visible
                Lbl_DatabaseConnection.Visible = true;
            }
        }
        else // otherwise
        {
            // changes label colour to red and text
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "File format not recognised." +
              " Upload Image/Word/PDF/Excel formats";
        }
        Response.Redirect(Request.Url.ToString());
    }
    private Boolean InsertUpdateData(SqlCommand cmd) // start of method that updates data into the datbaase
    {
        Lbl_DatabaseConnection2.Visible = false; // when the database connection label is not visible

        // connection of the database
        String strConnString = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;

        // when the databasee won't connect, it will connect
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            return true; // return that its true
        }
        catch // otherwise
        {
            // database conenction to be visible
            Lbl_DatabaseConnection2.Visible = true;
            return false; // return that its false
        }
        finally // finally
        {
            con.Close(); // closes the connection
            con.Dispose();
        }
    }


    protected void AddCourse_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e) // when add course is not updated
    {
        if (e.Exception == null) // when the exception is not null
        { 
            EndEditing(); // calls endEditing()
        }
    }
    private void EndEditing() // start of end editing method
    {
        Response.Redirect("~/Admin/EditCourses.aspx"); // redirect to this page
    }

}
