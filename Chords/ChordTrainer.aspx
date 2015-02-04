<%@ Page Title="Chord Trainer" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="ChordTrainer.aspx.cs" Inherits="ChordTrainer" EnableViewState="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <!-- Set EnableViewState to "false" to ensure that state is being maintained by the Session object not by the built-in ViewState engine -->
  <title>Chords</title>
  <style type="text/css">
    .auto-style1
    {
      width: 65%;
    }

    .auto-style2
    {
      height: 19px;
    }

    .auto-style3
    {
      width: 76px;
    }

    .auto-style4
    {
      width: 149px;
    }

    .auto-style6
    {
      height: 19px;
      width: 129px;
    }

    .auto-style7
    {
      width: 129px;
    }
    .auto-style8 {
      width: 366px;
    }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="Server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
    <Services>
      <asp:ServiceReference Path="~/WebServices/ChordOfTheDayService.svc" />
    </Services>
  </asp:ScriptManager>
  <div class="Speller">
    <p>
      To get started, choose which chords you would like to practice in Settings. If you
      would like
      to store your results and keep track of your best score make sure to log in first.
    </p>
    <p>
      To practice spelling chords click the button to get a new chord, click the buttons
      to spell the chord, then click the button to check your answer.
    </p>
    <asp:UpdatePanel runat="server">
      <ContentTemplate>
    <table class="ButtonTable">
      <tr>
        <td class="auto-style3">User name:</td>
        <td class="auto-style4">
          <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
        </td>
        <td>
          &nbsp;&nbsp;
          <asp:Button ID="btnLogIn" runat="server" Text="Log in"
            OnClick="btnLogIn_Click" />
          &nbsp;&nbsp;&nbsp;
          <asp:Button ID="btnLogOut" runat="server" OnClick="btnLogOut_Click"
            Text="Log out" />
        </td>
      </tr>
    </table>
    <br />
    
    <table>
          <tr>
            <td class="auto-style8">
              <asp:Button ID="btnGetChord" runat="server" OnClick="btnGetChord_Click" Text="Get New Chord" />&nbsp;&nbsp;
              <asp:Label ID="lblChordToSpell" runat="server"></asp:Label>            
            </td>
            <td>
              Your spelling:&nbsp;&nbsp;<asp:Label ID="lblUserSpelling" runat="server"></asp:Label>
            </td>
          </tr>
        </table>

    <br />
        <table class="ButtonTable">
          <tr>
            <td>
              <asp:Button ID="Csharp" runat="server" OnClick="button_Click" Text="C#"
                CssClass="SharpFlatButtons" />
            </td>
            <td>
              <asp:Button ID="Dsharp" runat="server" OnClick="button_Click" Text="D#"
                CssClass="SharpFlatButtons" />
            </td>
            <td>
              <asp:Button ID="Esharp" runat="server" OnClick="button_Click" Text="E#"
                CssClass="SharpFlatButtons" />
            </td>
            <td>
              <asp:Button ID="Fsharp" runat="server" OnClick="button_Click" Text="F#"
                CssClass="SharpFlatButtons" />
            </td>
            <td>
              <asp:Button ID="Gsharp" runat="server" OnClick="button_Click" Text="G#"
                CssClass="SharpFlatButtons" />
            </td>
            <td>
              <asp:Button ID="Asharp" runat="server" OnClick="button_Click" Text="A#"
                CssClass="SharpFlatButtons" />
            </td>
            <td>
              <asp:Button ID="Bsharp" runat="server" OnClick="button_Click" Text="B#"
                CssClass="SharpFlatButtons" />
            </td>
          </tr>
          <tr>
            <td>
              <asp:Button ID="C" runat="server" OnClick="button_Click" Text="C" CssClass="NaturalButtons" />
            </td>
            <td>
              <asp:Button ID="D" runat="server" OnClick="button_Click" Text="D" CssClass="NaturalButtons" />
            </td>
            <td>
              <asp:Button ID="E" runat="server" OnClick="button_Click" Text="E" CssClass="NaturalButtons" />
            </td>
            <td>
              <asp:Button ID="F" runat="server" OnClick="button_Click" Text="F" CssClass="NaturalButtons" />
            </td>
            <td>
              <asp:Button ID="G" runat="server" OnClick="button_Click" Text="G" CssClass="NaturalButtons" />
            </td>
            <td>
              <asp:Button ID="A" runat="server" OnClick="button_Click" Text="A" CssClass="NaturalButtons" />
            </td>
            <td>
              <asp:Button ID="B" runat="server" OnClick="button_Click" Text="B" CssClass="NaturalButtons" />
            </td>
          </tr>
          <tr>
            <td>
              <asp:Button ID="Cflat" runat="server" OnClick="button_Click" Text="Cb"
                CssClass="SharpFlatButtons" />
            </td>
            <td>
              <asp:Button ID="Dflat" runat="server" OnClick="button_Click" Text="Db"
                CssClass="SharpFlatButtons" />
            </td>
            <td>
              <asp:Button ID="Eflat" runat="server" OnClick="button_Click" Text="Eb"
                CssClass="SharpFlatButtons" />
            </td>
            <td>
              <asp:Button ID="Fflat" runat="server" OnClick="button_Click" Text="Fb"
                CssClass="SharpFlatButtons" />
            </td>
            <td>
              <asp:Button ID="Gflat" runat="server" OnClick="button_Click" Text="Gb"
                CssClass="SharpFlatButtons" />
            </td>
            <td>
              <asp:Button ID="Aflat" runat="server" OnClick="button_Click" Text="Ab"
                CssClass="SharpFlatButtons" />
            </td>
            <td>
              <asp:Button ID="Bflat" runat="server" OnClick="button_Click" Text="Bb"
                CssClass="SharpFlatButtons" />
            </td>
          </tr>
        </table>
        <br />

        <asp:Button ID="btnCheckSpelling" runat="server" OnClick="btnCheckSpelling_Click"
          Text="Check Spelling" />
        <asp:Label ID="lblResult" runat="server"></asp:Label>
        <br />
        <br />
        <table class="auto-style1">
          <tr>
            <td class="auto-style7">Stats for</td>
            <td>
              <asp:Label ID="lblUser" runat="server"></asp:Label>
            </td>
          </tr>
          <tr>
            <td class="auto-style7">
              <asp:Label ID="Label1" runat="server" Text="Correct Answers: "></asp:Label>
            </td>
            <td>
              <asp:Label ID="lblCorrect" runat="server"></asp:Label>
            </td>
          </tr>
          <tr>
            <td class="auto-style6">
              <asp:Label ID="Label2" runat="server" Text="Attempts: "></asp:Label>
            </td>
            <td class="auto-style2">
              <asp:Label ID="lblAttempts" runat="server"></asp:Label>
            </td>
          </tr>
          <tr>
            <td class="auto-style7">
              <asp:Label ID="Label3" runat="server" Text="Percentage: "></asp:Label>
            </td>
            <td>
              <asp:Label ID="lblPercentage" runat="server"></asp:Label>
            </td>
          </tr>
          <tr>
            <td class="auto-style7">Best percentage:</td>
            <td>
              <asp:Label ID="lblBestPercentage" runat="server"></asp:Label>
            </td>
          </tr>
        </table>
      </ContentTemplate>
    </asp:UpdatePanel>
        <br />
    
    
  </div>
  <aside id="Settings">
    <h2>Settings</h2>
    <p>Select Triads</p>
    <asp:CheckBoxList ID="triadsCheckBoxList" runat="server">
      <asp:ListItem Selected="True">major</asp:ListItem>
      <asp:ListItem Selected="True">minor</asp:ListItem>
      <asp:ListItem Selected="True">augmented</asp:ListItem>
      <asp:ListItem Selected="True">diminished</asp:ListItem>
    </asp:CheckBoxList>
    <br />
    <p>Select Seventh Chords</p>
    <asp:CheckBoxList ID="seventhsCheckBoxList" runat="server">
      <asp:ListItem Selected="True">major</asp:ListItem>
      <asp:ListItem Selected="True">minor</asp:ListItem>
      <asp:ListItem Selected="True">dominant</asp:ListItem>
      <asp:ListItem Selected="True">half-diminished</asp:ListItem>
      <asp:ListItem Selected="True">fully-diminished</asp:ListItem>
    </asp:CheckBoxList>
    <br />
    <asp:Button ID="btnApplySettings" runat="server" OnClick="btnApplySettings_Click"
      Text="Apply Settings" />
  </aside>
  <p>
    <input type="button" id="ChordButton" value="Click for the Chord of the Day" onclick="chordOfDay()" />
    <script>
      function chordOfDay()
      {
        ChordOfTheDayService.GetChordOfTheDay(chordOfDayCallback);
      }
      function chordOfDayCallback(result)
      {
        var resultString = 'The Chord of the Day is ' + result + '.\n\n' + 'Can you spell it?';
        alert(resultString);
      }
    </script>
  </p>
</asp:Content>

