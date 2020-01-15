<%@ Page Title="Higher Education Chesterfield College - Adding Courses" Language="C#" AutoEventWireup="true" CodeFile="AddCourse.aspx.cs"
    MasterPageFile="~/MasterPages/Master_Admin.master" Inherits="Admin_AddCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of content page -->
    <h1>Add Courses</h1><!-- heading for the page -->

    <!-- back button not go back to the previous page -->
         <asp:Button ID="Btn_Back" runat="server" SkinID="Button" CssClass="masterButton" Text="Back" PostBackUrl="~/Admin/EditCourses.aspx" 
             CausesValidation="False" /><br />
    
    <!-- introduction for the addCourse page -->
    <p>This page you can import an image ready to be used to be uploaded so the user can see it and can also write some information for that 
        course in the website too.</p>
    
    <!-- heading for the class left for the adding images pages -->
    <h2 class="left">Add Image</h2>
     <asp:Label ID="Lbl_DatabaseConnection" runat="server" CssClass="errorMessage" Visible="false" Text="Cannot connect to the database." />

         <div class="addData"><!-- start of div with class addData -->
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="BtnUpload" runat="server" Text="Upload" OnClick="BtnUpload_Click" CausesValidation="false" SkinID="Button" />
        <asp:Label ID="lblMessage" runat="server" Text="" Font-Names = "Arial"></asp:Label>
         </div><!-- end of div -->

    <!-- heading for the class left for adding content to course pages -->
    <h2 class="left">Add Content for Courses pages</h2>

    <!-- label which is invisible unless the connection to the database is not working -->
    <asp:Label ID="Lbl_DatabaseConnection2" runat="server" CssClass="errorMessage" Visible="false" Text="Cannot connect to the database." />
    
    <!-- form for adding courses into the database. Includes validation where appropriate whether the textboxes have no text or have 
        data to be wrong when entered into the database -->
    <asp:DetailsView ID="addCourse" runat="server" CssClass="addData" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="AddIntoCourseTable" 
        DefaultMode="Insert" Height="50px"  OnItemUpdated="AddCourse_ItemUpdated">
     <Fields>
      <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
      <asp:TemplateField HeaderText="Subject Area:" SortExpression="SubjectAreaID">
        <EditItemTemplate>
          <asp:DropDownList ID="Ddl_SubjectArea" runat="server" CssClass="txt_addData" DataSourceID="SubjectAreaDataSource" 
              DataTextField="Name_SA" DataValueField="ID" SelectedValue='<%# Bind("SubjectAreaID") %>' />
        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:DropDownList ID="Ddl_SubjectArea" runat="server" CssClass="txt_addData" DataSourceID="SubjectAreaDataSource" 
              DataTextField="Name_SA" DataValueField="ID" SelectedValue='<%# Bind("SubjectAreaID") %>' />
        
        </InsertItemTemplate>
      </asp:TemplateField>
         <asp:TemplateField HeaderText="Course Name" SortExpression="Name_Course">
        <EditItemTemplate>
          <asp:TextBox ID="Txt_Course_Name" runat="server" CssClass="txt_addData" Text='<%# Bind("Name_Course") %>'></asp:TextBox>
          <asp:RequiredFieldValidator ControlToValidate="Txt_Course_Name" runat="server" ErrorMessage="Enter a Subject Area Name" 
              CssClass="errorMessage" />
        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:TextBox ID="Txt_Course_Name" runat="server" CssClass="txt_addData" Text='<%# Bind("Name_Course") %>'></asp:TextBox>
          <asp:RequiredFieldValidator ControlToValidate="Txt_Course_Name" runat="server" ErrorMessage="Enter a Subject Area Name" 
              CssClass="errorMessage" />
        </InsertItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Extra Information about the Course" SortExpression="Extra Information">
        <EditItemTemplate>
          <asp:TextBox ID="Txt_Extra_Info_Course" CssClass="txt_addData" TextMode="MultiLine" Width="300" Height="100" runat="server" 
              Text='<%# Bind("AdditionalInformation") %>'></asp:TextBox><br />
          <asp:RequiredFieldValidator ControlToValidate="Txt_Extra_Info_Course" runat="server" ErrorMessage="Enter some extra information
              based on this course please." CssClass="errorMessage" />
        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:TextBox ID="Txt_Extra_Info_Course" CssClass="txt_addData" TextMode="MultiLine" Width="300" Height="100" runat="server" 
              Text='<%# Bind("AdditionalInformation") %>'></asp:TextBox><br />
          <asp:RequiredFieldValidator ControlToValidate="Txt_Extra_Info_Course" runat="server" ErrorMessage="Enter some extra information
              based on this course please." CssClass="errorMessage" />
        </InsertItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Image" SortExpression="ImageID">
        <EditItemTemplate>
          <asp:DropDownList ID="DropDownList1" runat="server" CssClass="txt_addData" DataSourceID="ImageDataSource" DataTextField="Name" 
              DataValueField="ID" SelectedValue='<%# Bind("ImageID") %>'>
          </asp:DropDownList>
        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:DropDownList ID="DropDownList1" runat="server" CssClass="txt_addData" DataSourceID="ImageDataSource" DataTextField="Name" 
              DataValueField="ID" SelectedValue='<%# Bind("ImageID") %>'>
          </asp:DropDownList>
        </InsertItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Level Of Course" SortExpression="LevelOfCourse">
        <EditItemTemplate>

           <asp:DropDownList ID="Ddl_LevelOfCourse" runat="server" CssClass="txt_addData" SelectedValue='<%# Bind("LevelOfCourse") %>'>
                  <asp:ListItem Selected="true" Value="0">Select a Level</asp:ListItem>
                   <asp:ListItem Text="4" Value="4"></asp:ListItem>
                   <asp:ListItem Text="5" Value="5"></asp:ListItem>
                   <asp:ListItem Text="6" Value="6"></asp:ListItem>
                   <asp:ListItem Text="7" Value="7"></asp:ListItem>
          </asp:DropDownList>
           <asp:CompareValidator ID="ReqLevelOfCourse" runat="server" ControlToValidate="Ddl_LevelOfCourse" 
               ErrorMessage="Select an level of course please."
             ValueToCompare="0" Operator="NotEqual" CssClass="errorMessage"/>

        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:DropDownList ID="Ddl_LevelOfCourse" runat="server" CssClass="txt_addData" SelectedValue='<%# Bind("LevelOfCourse") %>'>
                  <asp:ListItem Selected="true" Value="0">Select a Level</asp:ListItem>
                   <asp:ListItem Text="4" Value="4"></asp:ListItem>
                   <asp:ListItem Text="5" Value="5"></asp:ListItem>
                   <asp:ListItem Text="6" Value="6"></asp:ListItem>
                   <asp:ListItem Text="7" Value="7"></asp:ListItem>
          </asp:DropDownList>
           <asp:CompareValidator ID="ReqLevelOfCourse" runat="server" ControlToValidate="Ddl_LevelOfCourse" 
               ErrorMessage="Select an level of course please."
             ValueToCompare="0" Operator="NotEqual" CssClass="errorMessage"/>
        </InsertItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Days A Week" SortExpression="DaysAWeek">
        <EditItemTemplate>
          <asp:RadioButtonList ID="Rbl_FullPartTime" runat="server"  RepeatDirection="Vertical" Width="254px" SelectedValue='<%# Bind("PartFullTime") %>'>
                    <asp:ListItem Text="Full-Time" Value="Full-Time">
                    </asp:ListItem>
                    <asp:ListItem Text="Part-Time" Value="Part-Time">
                    </asp:ListItem>

                </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="Rfv_FullPartTime" ErrorMessage="Please select whether the course is either full or part time please."
            ControlToValidate="Rbl_FullPartTime" runat="server"  Display="Dynamic" CssClass="errorMessage" />

        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:RadioButtonList ID="Rbl_FullPartTime" runat="server"  RepeatDirection="Horizontal" Width="254px" SelectedValue='<%# Bind("PartFullTime") %>'>
                    <asp:ListItem Text="Full-Time" Value="Full-Time">
                    </asp:ListItem>
                    <asp:ListItem Text="Part-Time" Value="Part-Time">
                    </asp:ListItem>

                </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="Rfv_FullPartTime" ErrorMessage="Please select whether the course is either full or part time please."
            ControlToValidate="Rbl_FullPartTime" runat="server"  Display="Dynamic" CssClass="errorMessage" />
        </InsertItemTemplate>
        </asp:TemplateField>
         <asp:CommandField ShowInsertButton="True" ButtonType="Button" />
    </Fields>
    </asp:DetailsView>

    <!-- data sources for this page -->
    <asp:SqlDataSource ID="ImageDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
        SelectCommand="SELECT [ID], [Name] FROM [Image]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SubjectAreaDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
        SelectCommand="SELECT [ID], [Name_SA] FROM [SubjectArea]" />
    <asp:SqlDataSource ID="AddIntoCourseTable" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
        DeleteCommand="DELETE FROM [Course] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [Course] ([Name_Course], [ImageID], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaID]) 
        VALUES (@Name_Course, @ImageID, @AdditionalInformation, @PartFullTime, @LevelOfCourse, @SubjectAreaID)" 
        SelectCommand="SELECT * FROM [SubjectArea]" 
        UpdateCommand="UPDATE [Course] SET [Name_Course] = @Name_Course, [ImageID] = @ImageID, [AdditionalInformation] = @AdditionalInformation,
        [Part/FullTime] = @FullPartTime, [LevelOfCourse] = @LevelOfCourse, [SubjectAreaID] = @SubjectAreaID WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_Course" Type="String" />
            <asp:Parameter Name="ImageID" Type="Int32" />
            <asp:Parameter Name="AdditionalInformation" Type="String" />
            <asp:Parameter Name="PartFullTime" Type="String" />
            <asp:Parameter Name="LevelOfCourse" Type="Int32" />
            <asp:Parameter Name="SubjectAreaID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_Course" Type="String" />
            <asp:Parameter Name="ImageID" Type="Int32" />
            <asp:Parameter Name="AdditionalInformation" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="PartFullTime" Type="String" />
            <asp:Parameter Name="LevelOfCourse" Type="Int32" />
            <asp:Parameter Name="SubjectAreaID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <!-- data source for adding images into the database -->
    <asp:SqlDataSource ID="AddIntoImageTable" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
        DeleteCommand="DELETE FROM [Image] WHERE [ID] = @ID"
        InsertCommand="INSERT INTO [Image] ([Name], [ContentType], [Data]) VALUES (@Name, @ContentType, @Data)" 
        SelectCommand="SELECT * FROM [Image]"
        UpdateCommand="UPDATE [Image] SET [Name] = @Name, [ContentType] = @ContentType, [Data] = @Data WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ContentType" Type="Int32" />
            <asp:Parameter Name="Data" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ContentType" Type="Int32" />
            <asp:Parameter Name="Data" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
                 
    <!-- start of content page -->
</asp:Content>