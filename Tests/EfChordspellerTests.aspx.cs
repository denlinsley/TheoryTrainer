using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tests_EfChordspellerTests : System.Web.UI.Page
{
    ChordSpeller speller;

    protected void Page_Load(object sender, EventArgs e)
    {
        //TestAddTriads("diminished");
        //TestAddSevenths("fully-diminished");
    }


    private void TestAddTriads(string quality)
    {
        var entities = new TheoryTrainerEntities();

        var triads = from t in entities.Triads
                     where t.TriadQuality.Name == quality
                     select t;

        foreach (var t in triads)
        {
            string key = string.Format("{0} {1} triad", t.Root, t.TriadQuality.Name);
            string value = string.Format("{0}-{1}-{2}", t.Root, t.Third, t.Fifth);
            TextBox1.Text += key + ", " + value + "\n";
        }
    }

    private void TestAddSevenths(string quality)
    {
        var entities = new TheoryTrainerEntities();

        var sevenths = from s in entities.SeventhChords
                       where s.SeventhChordQuality.Name == quality
                       select s;

        foreach (var s in sevenths)
        {
            string key = string.Format("{0} {1} seventh", s.Root, s.SeventhChordQuality.Name);
            string value = string.Format("{0}-{1}-{2}-{3}", s.Root, s.Third, s.Fifth, s.Seventh);
            TextBox1.Text += key + ", " + value + "\n";
        }
    }


    private void TestRemoveTriads(string quality)
    {
        var entities = new TheoryTrainerEntities();

        var triads = from t in entities.Triads
                     where t.TriadQuality.Name == quality
                     select t;

        foreach (var t in triads)
        {
            string key = string.Format("{0} {1} triad", t.Root, t.TriadQuality.Name);
            //TextBox1.Text -= key + ", " + value + "\n";
            
        }
    }


    private void TestRemoveSevenths(string quality)
    {
        var entities = new TheoryTrainerEntities();

        var sevenths = from s in entities.SeventhChords
                       where s.SeventhChordQuality.Name == quality
                       select s;

        foreach (var s in sevenths)
        {
            string key = string.Format("{0} {1} seventh", s.Root, s.SeventhChordQuality.Name);
            //TextBox1.Text -= key + ", " + value + "\n";
        }
    }
}