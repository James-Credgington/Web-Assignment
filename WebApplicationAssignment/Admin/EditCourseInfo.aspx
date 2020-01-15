<%@ Page Title="Higher Education Chesterfield College - Editing Course Information" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/Master_Admin.master" 
    CodeFile="EditCourseInfo.aspx.cs" Inherits="Admin_EditCourseInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of content page -->
    <h1>Edit Course Information</h1><!-- heading to this page -->

    <!-- back button -->
         <asp:Button ID="Btn_Back" runat="server" SkinID="Button" CssClass="masterButton" Text="Back" PostBackUrl="~/Admin/EditCourses.aspx" CausesValidation="False" /><br />
    <asp:SqlDataSource ID="SubjectAreaDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
        SelectCommand="SELECT * FROM [Course]"/>
        <!-- introduction to this page -->
        <p>You can only change some things about the course, e.g. its name, additional information, part/full time status and level of course. If you want to change anything more, 
            you will have to delete that course and start again. Sorry for any inconvenience.</p>
    <div class="editData"><!-- start of div with class editData -->

        <!-- form for edit course information straight from the database -->
    <asp:GridView ID="GridView1" runat="server" AllowPaging="False" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="CourseEditData" 
        EmptyDataText="There are no courses for you to delete.">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Name_Course" HeaderText="Name" SortExpression="Name_Course" />
                <asp:BoundField DataField="AdditionalInformation" HeaderText="Additional Information" SortExpression="AdditionalInformation" />
                <asp:BoundField DataField="PartFullTime" HeaderText="Part/FullTime" SortExpression="PartFullTime" />
                <asp:BoundField DataField="LevelOfCourse" HeaderText="Level Of Course" SortExpression="LevelOfCourse" />
               
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="CourseEditData" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>"
            SelectCommand="SELECT * FROM [Course]" 
            UpdateCommand ="UPDATE [Course] SET [Name_Course] = @Name_Course,  PartFullTime=@PartFullTime, AdditionalInformation=@AdditionalInformation, LevelOfCourse = @LevelOfCourse 
            WHERE ID=@ID" >
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="Name_Course" Type="String" />
                <asp:Parameter Name="AdditionalInformation" Type="String" />
                <asp:Parameter Name="PartFullTime" Type="String" />
                <asp:Parameter Name="LevelOfCourse" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="Name_Course" Type="String" />
                <asp:Parameter Name="AdditionalInformation" Type="String" />
                <asp:Parameter Name="PartFullTime" Type="String" />
                <asp:Parameter Name="LevelOfCourse" Type="Int32" />
            </UpdateParameters>

         </asp:SqlDataSource>
                    </div><!-- end of div tag --> 

</asp:Content>
