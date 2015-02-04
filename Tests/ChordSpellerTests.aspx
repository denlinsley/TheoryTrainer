<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChordSpellerTests.aspx.cs" Inherits="Tests_ChordSpellerTests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h3>Testing 2 methods to generate major and minor chords</h3>
        <asp:TextBox ID="txtMajor" runat="server" Height="125px" TextMode="MultiLine" Width="317px"></asp:TextBox>
        <asp:TextBox ID="txtMinor" runat="server" Height="125px" TextMode="MultiLine" Width="294px"></asp:TextBox>
        <p>
            <asp:Button ID="btnRandomChord" runat="server" OnClick="btnRandomChord_Click" Text="Get Random Chord" />
            <asp:Label ID="lblRandomChord" runat="server"></asp:Label>
        </p>
    </form>
    <p>
        Testing CheckAnswer method</p>
    <p>
        &nbsp;</p>
</body>
</html>
