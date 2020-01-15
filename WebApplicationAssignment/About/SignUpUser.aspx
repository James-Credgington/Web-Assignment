<%@ Page Title="Higher Education Chesterfield College - Signing Up Users" Language="C#" MasterPageFile="~/MasterPages/Master_User.master" AutoEventWireup="true"
    CodeFile="SignUpUser.aspx.cs" Inherits="About_SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of a content page -->
    <h1>Sign Up</h1><!-- heading for the page-->

    <!-- table for adding user details into the database, and validate textboxes to make sure e.g. date of birth is formatted as an date 
        and if all the textboxes have been filled in -->
    <table runat="server" class="form">
        <tr>
            <td class="auto-style1">First Name</td>
            <td class="contactForm"><asp:TextBox ID="Txt_FirstName" runat="server"></asp:TextBox></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validateFirstName" runat="server" ErrorMessage="Type in a first name please" ControlToValidate="Txt_FirstName" 
                CssClass="errorMessage"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Last Name</td>
            <td class="contactForm"><asp:TextBox ID="Txt_LastName" runat="server"></asp:TextBox></td>
            <td class="contactForm">
                <asp:RequiredFieldValidator ID="validateLastName" runat="server" ErrorMessage="Type in a last name please" ControlToValidate="Txt_LastName" 
                    CssClass="errorMessage"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">DOB</td>
            <td class="contactForm"><asp:TextBox ID="Txt_DateOfBirth" runat="server"></asp:TextBox></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validateDOB" runat="server" ErrorMessage ="Type in a date of birth please" ControlToValidate="Txt_DateOfBirth"
                CssClass="errorMessage" /><br />
                <asp:RangeValidator ID="rangeDOB" runat="server" ControlToValidate="Txt_DateOfBirth" CssClass="errorMessage" ErrorMessage="You're too young to do higher education."
                    MaximumValue="31/08/2002" MinimumValue="01/01/1950" Type="Date" />
            </td>
            
        </tr>
        <tr>
            <td class="auto-style1">Gender</td>
            <td>
                <asp:RadioButtonList ID="Rbl_gender" runat="server" RepeatDirection="Horizontal" Width="254px">
                    <asp:ListItem selected="True" Text="Male" Value="male" />
                    <asp:ListItem Text="Female" Value="female"/>
                    <asp:ListItem Text="Other" Value="other" />
                </asp:RadioButtonList>
            </td>
            <td class="contactForm">&nbsp;</td>
        </tr>
        
        <tr>
            <td class="auto-style1">Email Address</td>
            <td class="contactForm"><asp:TextBox ID="Txt_EmailAddress" runat="server"></asp:TextBox></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validateEmailAddress" runat="server" ErrorMessage="Type in an email address please" 
                ControlToValidate="Txt_EmailAddress" CssClass="errorMessage" /><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" EnableClientScript="True" ErrorMessage="Invalid Email Address" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Txt_EmailAddress" CssClass="errorMessage"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td class="auto-style1">Phone Number</td>
            <td class="contactForm"><asp:TextBox ID="Txt_PhoneNumber" runat="server"></asp:TextBox></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validatePhoneNumber" runat="server" ControlToValidate="Txt_PhoneNumber" CssClass="errorMessage" 
                ErrorMessage="Type in an phone number please" /><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" EnableClientScript="True" ErrorMessage="Invalid Phone Number has been entered" 
                    ValidationExpression="^(((\+44\s?\d{4}|\(?0\d{4}\)?)\s?\d{3}\s?\d{3})|((\+44\s?\d{3}|\(?0\d{3}\)?)\s?\d{3}\s?\d{4})|((\+44\s?\d{2}|\(?0\d{2}\)?)\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$" 
                    ControlToValidate="Txt_PhoneNumber" CssClass="errorMessage" />
                
            </td>

        </tr>
        <tr>
            <td class="auto-style1">Current Student</td>
            <td>
                 <asp:RadioButtonList ID="Rbl_student" runat="server"  RepeatDirection="Horizontal" Width="254px">
                    <asp:ListItem selected="true" Text="Yes" Value="yes">
                    </asp:ListItem>
                    <asp:ListItem Text="No" Value="no">
                    </asp:ListItem>

                </asp:RadioButtonList>
             </td>
        </tr>
        <tr>
            <td class="auto-style1">Password</td>
            <td class="contactForm"><asp:TextBox ID="Txt_Password" runat="server" TextMode="Password"></asp:TextBox></td>
            <td class="contactForm">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Type in a last name please" ControlToValidate="Txt_Password" 
                    CssClass="errorMessage"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RangeValidator1" runat="server" ControlToValidate="Txt_Password" CssClass="errorMessage" 
                    ErrorMessage="Password is not secure enough!" Type="Date" ValidateRequestMode="Inherit" 
                    ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="Btn_Refresh" runat="server" SkinID="Button" CssClass="masterButtons"  Text="Reset" OnClick="Btn_Refresh_Click" OnClientClick="refresh()"   />
            </td>
            <td class="contactForm"></td>
            <td class="contactForm">
                <asp:Button ID="Btn_SubmitDetails" runat="server" SkinID="Button" CssClass="masterButtons" Text="Submit" OnClick="Btn_SubmitDetails_Click" />
            </td>
        </tr>


        
    </table>
    <!-- end of the form -->

            <!-- label to show when the username has already been taken -->
            <asp:Label ID="lbl_usernameValid" runat="server" CssClass="errorMessageLogin" Visible="false" Text="Username already taken."/>
            <asp:Label ID="lbl_whenEmailsent" runat="server" CssClass="PleaseWaitLogin" Visible="false" Text="Please Wait..."/><!-- label to show when the email sent -->
            <asp:Label ID="lbl_errorMessage" runat="server" CssClass="errorMessageLogin" Visible="false" 
                Text="Database is not connected"/><!-- label to show when the database is not connected -->
        <asp:Label ID="Lbl_EmailSent" runat="server" CssClass="errorMessageLogin" Visible="false" 
            Text="Email cannot be sent. " /><!-- label to show when the email cannot be sent -->
    <asp:Label ID="Lbl_DatabaseConnection" runat="server" CssClass="errorMessageLogin" Visible="false"
        Text="Cannot connect to the database." />

    <!-- start of a content page -->
</asp:Content>

