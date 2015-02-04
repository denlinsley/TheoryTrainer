using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tests_ChordSpellerTests : System.Web.UI.Page
{
    ChordSpeller chordDict;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        chordDict = new ChordSpeller();
        //chordDict.AddMajorChords();
        // Need to implement GetEnumerator to use foreach loop
        // Didn't get this error when chordDict.AddMajorChords() called within foreach loop header
        foreach (KeyValuePair<string, string> kv in chordDict.AddMajorChords())
        {
            // set TextMode proprety of TextBox to "MultiLine" to get scroll bar
            txtMajor.Text += kv.Key + " is spelled " + kv.Value + "\n";
        }

        foreach (KeyValuePair<string, string> kv in chordDict.AddMinorChords())
        {
            // TODO: this adds the minor chords to the major chords
            txtMinor.Text += kv.Key + " is spelled " + kv.Value + "\n";
        }
    }


    protected void btnRandomChord_Click(object sender, EventArgs e)
    {
        //KeyValuePair<string, string> randChord = chordDict.GetRandomChord();
        lblRandomChord.Text = "This is a random chord...functionality to be added later";
    }
}