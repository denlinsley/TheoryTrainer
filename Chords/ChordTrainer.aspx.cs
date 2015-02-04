using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ChordTrainer : System.Web.UI.Page
{
    //public enum TriadQuality { Major, Minor, Augmented, Diminished };
    //public enum SeventhQuality { Dominant, Major, Minor, HalfDiminished, FullyDiminished };

    ChordSpeller speller;
    int noteClicks; // accumulator for UI-specific display logic

    // Using constants for Session object keys
    const string SPELLER = "speller";
    const string CLICKS = "clicks";


    protected void Page_Load(object sender, EventArgs e)
    {
        // This version stores the entire ChordSpeller object in Session
        if (Session[SPELLER] == null)
        {
            // The first time the page loads, instantiate a new speller
            speller = new ChordSpeller();
            ApplySettings(); // load all chord types by default
            Session[SPELLER] = speller; // store the speller in Session
            Session[CLICKS] = 0;
        }
        else
        {
            // Otherwise, get the current speller out of Session
            speller = (ChordSpeller)Session[SPELLER];
            lblChordToSpell.Text = speller.ChordName; // this label must persist through each postback
            lblUserSpelling.Text = speller.UserSpelling; // persisting here so that when you click Check Answer it still displays
            lblUser.Text = speller.UserName;
        }

        DisplayStats();
    }

    #region UI display logic
    // Generic event handler for all note button clicks
    protected void button_Click(object sender, EventArgs e)
    {
        Button button = (Button)sender; // Get a reference to the button clicked
        noteClicks = (int)Session[CLICKS]; // Get the number of clicks out of Session

        // Determine whether we have a 3-note chord (triad) or 4-note chord (seventh)
        string chordType;
        if (speller.ChordName.Contains("triad"))
            chordType = "triad";
        else
            chordType = "seventh";

        // This is a UI-specific tweak
        // Based on chord type, do not put a hyphen after the last note
        switch (chordType)
        {
            case "triad":
                if (noteClicks < 2)
                {
                    // The first 2 times a note button is clicked, add a hyphen after the note name
                    speller.UserSpelling += button.Text + "-";
                    noteClicks++;
                    Session[CLICKS] = noteClicks;
                }
                else
                {
                    // The 3rd time a note button is clicked, do not put a hyphen after the note name
                    speller.UserSpelling += button.Text;
                    noteClicks++;
                    Session[CLICKS] = noteClicks;
                }
                break;
            case "seventh":
                if (noteClicks < 3)
                {
                    // The first 3 times a note button is clicked, add a hyphen after the note name
                    speller.UserSpelling += button.Text + "-";
                    noteClicks++;
                    Session[CLICKS] = noteClicks;
                }
                else
                {
                    // The 4th time a note button is clicked, do not put a hyphen after the note name
                    speller.UserSpelling += button.Text;
                    noteClicks++;
                    Session[CLICKS] = noteClicks;
                }
                break;
        }
        lblUserSpelling.Text = speller.UserSpelling; // Display the current state of the user's attempt
    }


    protected void btnGetChord_Click(object sender, EventArgs e)
    {
        ResetUIChords();
        speller.GetRandomChord();
        lblChordToSpell.Text = speller.ChordName;
    }


    protected void btnCheckSpelling_Click(object sender, EventArgs e)
    {
        string result;
        if (speller.CheckChordSpelling(speller.UserSpelling, speller.ChordSpelling))
        {
            result = "CORRECT!";
            lblResult.Text = result;
            lblResult.ForeColor = System.Drawing.Color.Green;
            speller.CorrectAnswers++;
        }
        else
        {
            result = "Incorrect. The correct spelling is " + speller.ChordSpelling;
            lblResult.Text = result;
            lblResult.ForeColor = System.Drawing.Color.Red;
        }

        // Increment Attempts property and display
        speller.Attempts++;
        DisplayStats();

        // Reset UserSpellign property for next chord attempt
        speller.UserSpelling = "";
    }


    protected void ResetUIStats()
    {
        txtUser.Text = "";
        lblUser.Text = "";
        lblCorrect.Text = "";
        lblAttempts.Text = "";
        lblPercentage.Text = "";
        lblBestPercentage.Text = "";
    }


    protected void ResetUIChords()
    {
        lblChordToSpell.Text = "";
        lblResult.Text = "";
        lblUserSpelling.Text = "";
        Session[CLICKS] = 0;
    }

    protected void DisplayStats()
    {
        lblCorrect.Text = speller.CorrectAnswers.ToString();
        lblAttempts.Text = speller.Attempts.ToString();
        //lblPercentage.Text = speller.PercentageCorrect.ToString("p1");

        // Doubles can return NaN ("not a number")
        // Use this method to prevent NaN from displaying in UI until the user has made the first attempt
        if (!Double.IsNaN(speller.PercentageCorrect))
            lblPercentage.Text = speller.PercentageCorrect.ToString("p1");
    }
    #endregion

    #region User logic
    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        string userName = txtUser.Text.Trim();

        // using stmt is not really necessary
        // we use it the whole time, and the object will be released at the end of the event handler
        var entities = new TheoryTrainerEntities();

        // see if the user exists in the database
        var user = (from u in entities.Users
                    where u.Name == userName
                    select u).SingleOrDefault<User>(); // returns null if not found

        if (user == null)
        {
            // if user does not exist, create a new User object and add to db
            var newUser = new User
            {
                Name = userName,
                CreateDateTime = DateTime.Now,
                UpdateDateTime = DateTime.Now
            };
            entities.Users.Add(newUser);
            entities.SaveChanges();

            // then set UserName property of speller
            speller.UserName = newUser.Name;
        }
        else
        {
            // if user was found, retrieve user from db
            var existingUser = (from u in entities.Users
                                where u.Name == userName
                                select u).SingleOrDefault<User>();

            // set UserNAme property of speller
            speller.UserName = existingUser.Name;

            // display best percentage and datetime
            lblBestPercentage.Text = string.Format("{0} on {1}",
                existingUser.BestPercentage.ToString("p1"),
                existingUser.UpdateDateTime.ToShortDateString());
        }

        // Display UserName
        lblUser.Text = speller.UserName;

    }


    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        string userName = txtUser.Text.Trim(); // TODO: this could be unreliable

        var entities = new TheoryTrainerEntities();

        var currentUser = (from u in entities.Users
                           where u.Name == userName
                           select u).SingleOrDefault<User>();

        // update the session percentage, rounded to 3 decimal places
        // the if stmt prevents an exception if user logs in and immediately logs out without trying to spell a chord
        if (speller.PercentageCorrect > 0)
            currentUser.SessionPercentage = Math.Round(speller.PercentageCorrect, 3);
        else
            currentUser.SessionPercentage = 0;

        // check to see if it's a new "best" percentage
        if (speller.PercentageCorrect > currentUser.BestPercentage)
            currentUser.BestPercentage = Math.Round(speller.PercentageCorrect, 3);

        currentUser.UpdateDateTime = DateTime.Now;
        entities.SaveChanges();

        ResetUIChords();
        ResetUIStats();

        // Reset the "user" properties of speller to clear out the user who logged out
        speller.UserName = null;
        speller.UserSpelling = null;
        speller.Attempts = 0;
        speller.CorrectAnswers = 0;
    }
    #endregion

    #region Settings logic
    protected void btnApplySettings_Click(object sender, EventArgs e)
    {
        ApplySettings();
    }

    protected void ApplySettings()
    {
        // Add/Remove triads from the speller's chordLibrary if checked/unchecked
        // NOTE: the Add/Remove methods of ChordSpeller use an if statement 
        // to prevent adding chords that already exist, or removing chords that don't exist
        foreach (ListItem item in triadsCheckBoxList.Items)
        {
            if (item.Selected)
                speller.AddTriads(item.Value);
            else
                speller.RemoveTriads(item.Value);
        }

        foreach (ListItem item in seventhsCheckBoxList.Items)
        {
            if (item.Selected)
                speller.AddSevenths(item.Value);
            else
                speller.RemoveSevenths(item.Value);
        }
    }
    #endregion
}