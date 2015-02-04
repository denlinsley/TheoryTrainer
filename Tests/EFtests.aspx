<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EFtests.aspx.cs" Inherits="Tests_EFtests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      Triads
      <br />
      <asp:TextBox ID="triadsTextBox" runat="server" TextMode="MultiLine" 
        Height="162px" Width="257px"></asp:TextBox>
      <br />
      Sevenths
      <br />
      <asp:TextBox ID="seventhsTextBox" runat="server" TextMode="MultiLine" 
        Height="151px" Width="262px"></asp:TextBox>
      <br />
      Triad quality:
      <asp:Label ID="triadQualityLabel" runat="server"></asp:Label>
      <br />
      Seventh quality:
      <asp:Label ID="seventhQualityLabel" runat="server"></asp:Label>
      <br />
      Roots:
      <asp:Label ID="rootsLabel" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
