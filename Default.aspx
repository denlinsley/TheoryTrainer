<%@ Page Title="Music Theory Trainer" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">
  <section id="DefaultPage">
    <%--<asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="False" />--%>
    <h1>Welcome to the Music Theory Trainer Web Site!</h1>
    <p>
      Have you ever wanted to learn more about music theory? Do you remember a few things from your 
      piano or instrument lessons? Do you know just a few chords but want to learn more?
      This site will help you learn the basics of intervals, chords, and harmony.
    </p>
    <p>
      This site is currently construction and new features will be added soon. To go straight to the "meat" of the site 
      head over to the <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Chords/ChordTrainer.aspx">Chord Trainer</asp:HyperLink> page.
    </p>
    
    
  </section>
  <aside id="Quotes">
    <p>
      &quot;There is no such thing as silence. Something is always happening that makes a sound.&quot; 
      <br />
      ~ John Cage
    </p>
    <p>
      &quot;An argument about harmony is hardly the place for a discord.&quot; 
      <br />
      ~ Plato
    </p>
    <p>
      &quot;Music is a system of proportions in the service of a spiritual impulse.&quot; 
      <br />
      ~ George Crumb
    </p>
    <p>
      &quot;I love the shiny music that descends from overhead.&quot; 
      <br />
      ~ Phish, &quot;Roggae&quot;
    </p>
  </aside>
</asp:Content>

