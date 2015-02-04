<%@ Page Title="Contact" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="About_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <style type="text/css">
    .auto-style1
    {
      width: 178px;
      text-align: left;
    }

    #ContactFormTable
    {
      width: 593px;
    }

    .auto-style2
    {
      width: 178px;
      text-align: left;
      height: 19px;
    }

    .auto-style3
    {
      height: 19px;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="Server">
  <script type="text/javascript">
    function validatePhone(source, args)
    {
      var phone = document.getElementById('<%= txtPhone.ClientID %>');
          if (phone != '') // TODO: revise so it checks for 10 digits instead (debug it)
            args.IsValid = true;
          else
            args.IsValid = false;
        }
  </script>
  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  <asp:UpdatePanel runat="server">
    <ContentTemplate>
      <p>Use this form to contact me. I'd love to hear your feedback on this site.</p>
      <table id="tableContactForm">
        <tr>
          <td class="auto-style1">Name:</td>
          <td>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" CssClass="Error" ErrorMessage="Enter your name" SetFocusOnError="True">*</asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style1">Email:</td>
          <td>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter you email" CssClass="Error" ControlToValidate="txtEmail" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" CssClass="Error" ErrorMessage="Enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True">*</asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style1">Re-enter email:</td>
          <td>
            <asp:TextBox ID="txtEmailReenter" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Re-enter your email" CssClass="Error" Text="*" ControlToValidate="txtEmailReenter" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtEmail" ControlToValidate="txtEmailReenter" CssClass="Error" ErrorMessage="Email addresses do not match." SetFocusOnError="True">*</asp:CompareValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style1">Phone:</td>
          <td>
            <asp:TextBox ID="txtPhone" runat="server" ClientIDMode="Static"></asp:TextBox>
            <asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="Error" ErrorMessage="Enter a 10-digit phone number" OnServerValidate="CustomValidator1_ServerValidate" ClientValidationFunction="validatePhone" Display="Dynamic" SetFocusOnError="True"></asp:CustomValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style1">Comments:</td>
          <td>
            <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Width="282px" Height="83px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtComments" CssClass="Error" ErrorMessage="Enter a comment" SetFocusOnError="True">*</asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style1">On a scale of 1-10,
                <br />
            how helpful is this site?</td>
          <td>
            <asp:TextBox ID="txtRating" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtRating" CssClass="Error" ErrorMessage="Enter a rating" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtRating" CssClass="Error" ErrorMessage="Enter a number 1-10" MaximumValue="10" MinimumValue="1" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style1">&nbsp;</td>
          <td>
            <asp:Button ID="btnValidate" runat="server" Text="Validate" OnClick="btnValidate_Click" />
            &nbsp;&nbsp; (Email functionality to be added later)</td>
        </tr>
        <tr>
          <td class="auto-style2"></td>
          <td class="auto-style3">&nbsp;</td>
        </tr>
      </table>

      <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="Error" HeaderText="Please fix the following errors:" />
      <asp:Label ID="lblValidation" runat="server" Visible="False">Validation successfull!</asp:Label>
    </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>

