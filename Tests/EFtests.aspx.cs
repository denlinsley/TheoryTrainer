using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tests_EFtests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var entities = new TheoryTrainerEntities())
        {
            #region Display qualities in labels
            var allTriadQualities = from t in entities.TriadQualities
                                    select t;

            var allSeventhQualities = from s in entities.SeventhChordQualities
                                      select s;

            foreach (var tq in allTriadQualities)
            {
                triadQualityLabel.Text += tq.Name + ", ";
            }

            foreach (var sq in allSeventhQualities)
            {
                seventhQualityLabel.Text += sq.Name + ", ";
            }
            #endregion

            #region Display triads and quality
            var allTriads = from t in entities.Triads
                            select t; // TODO: select the stuff here not in the display [create a new object for more than one property?]

            foreach (var t in allTriads)
            {
                triadsTextBox.Text += string.Format("{0}-{1}-{2}, {3}\n",
                    t.Root, t.Third, t.Fifth, t.TriadQuality.Name);
            }
            #endregion

            #region Display sevenths and quality
            var allSevenths = from s in entities.SeventhChords
                              select s;

            foreach (var s in allSevenths)
            {
                seventhsTextBox.Text += string.Format("{0}-{1}-{2}-{3}, {4}\n",
                    s.Root, s.Third, s.Fifth, s.Seventh, s.SeventhChordQuality.Name);
            }
            #endregion

            #region Test Add methods

        }


    }
}