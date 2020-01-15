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

public partial class Admin_AddSubjectArea : BasePage /* 'Admin_AddSubjectArea class is a subclass to the BasePage class  */
{
    protected void Page_Load(object sender, EventArgs e) /* function for when the website loads */
    {
        if (Request.QueryString.Get("ID") != null) /* if the session variable is not null */
        {
            addSubjectArea.DefaultMode = DetailsViewMode.Edit; /* can edit data into the database */
        }
    }
    

    protected void BtnUpload_Click(object sender, EventArgs e) /* when the uplaod button is pressed */
    {
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
        if (contenttype != String.Empty) // if the cotnent type is not empty 
        {
            // add image by converting data and sent it to the database
            Stream fs = FileUpload1.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);

            //insert the file into database
            string strQuery = "INSERT INTO [Image] ([Name], [ContentType], [Data]) VALUES (@Name, @ContentType, @Data)";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = filename;
            cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value
              = contenttype;
            cmd.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes;
            InsertUpdateData(cmd);
            lblMessage.ForeColor = System.Drawing.Color.Green; // change the label colour to green
            lblMessage.Text = "File Uploaded Successfully"; // changes message on the label to 'Fiel Uplaoded Successfully'
        }
        else // otherwise
        {
            lblMessage.ForeColor = System.Drawing.Color.Red; // changes the colour of the label to red
            lblMessage.Text = "File format not recognised." + // changes the message of the label
              " Upload Image/Word/PDF/Excel formats";
        }
        Response.Redirect(Request.Url.ToString()); // Refreshes the page
    }
    private Boolean InsertUpdateData(SqlCommand cmd) // the function for the InsertUpdateDate with the parameter of a primitve datatype for an object called cmd
    {
        Lbl_DatabaseConnection2.Visible = false; //  the label is set not to be visible

        // start the connection to the database 
        String strConnString = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;

        // try statement when the connection of the database begins
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            return true;
        }

        // when database connection fails
        catch 
        {
            Lbl_DatabaseConnection2.Visible = true;
            return false;
        }

        // finally closes the system
        finally
        {
            con.Close();
            con.Dispose();
        }
    }


    protected void AddSubjectArea_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            EndEditing();
        }
    }
    private void EndEditing()
    {
        Response.Redirect("~/Admin/EditSubjectArea.aspx");
    }

    protected void AddSubjectArea_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
}
