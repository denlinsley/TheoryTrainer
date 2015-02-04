using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Contains methods for building a Chord Dictionary and working with the Chord Speller page
/// </summary>
public class ChordSpeller
{
    

    private Dictionary<string, string> chordLibrary;
    private double percentageCorrect; // this one property cannot be auto-implemented
    Random rand = new Random();

    public string ChordName { get; set; }
    public string ChordSpelling { get; set; }
    public double CorrectAnswers { get; set; }
    public double Attempts { get; set; }
    public string UserSpelling { get; set; }
    public string UserName { get; set; }


    public ChordSpeller()
    {
        chordLibrary = new Dictionary<string, string>();
    }

    // Read-only property
    public double PercentageCorrect
    {
        get
        {
            return this.CorrectAnswers / this.Attempts;
        }
    }


    // TODO: could the parameter be changed to int and used with an enum defined in ChordSpeller?
    // no, because the LINQ query requires a string name [verify no workaround, translate int to string?]
    public void AddTriads(string quality)
    {
        var entities = new TheoryTrainerEntities();
        
        var triads = from t in entities.Triads
                     where t.TriadQuality.Name == quality
                     select t;

        foreach (var t in triads)
        {
            string key = string.Format("{0} {1} triad", t.Root, t.TriadQuality.Name);
            string value = string.Format("{0}-{1}-{2}", t.Root, t.Third, t.Fifth);
            if (!chordLibrary.ContainsKey(key)) // only add if key does not yet exist
                chordLibrary.Add(key, value);
        }
    }


    public void AddSevenths(string quality)
    {
        var entities = new TheoryTrainerEntities();
        
        var sevenths = from s in entities.SeventhChords
                       where s.SeventhChordQuality.Name == quality
                       select s;

        foreach (var s in sevenths)
        {
            string key = string.Format("{0} {1} seventh", s.Root, s.SeventhChordQuality.Name);
            string value = string.Format("{0}-{1}-{2}-{3}", s.Root, s.Third, s.Fifth, s.Seventh);
            if (!chordLibrary.ContainsKey(key))
                chordLibrary.Add(key, value);
        }
    }


    public void RemoveTriads(string quality)
    {
        var entities = new TheoryTrainerEntities();

        var triads = from t in entities.Triads
                     where t.TriadQuality.Name == quality
                     select t;

        foreach (var t in triads)
        {
            string key = string.Format("{0} {1} triad", t.Root, t.TriadQuality.Name);
            if (chordLibrary.ContainsKey(key)) // only remove if key exists
                chordLibrary.Remove(key);
        }
    }


    public void RemoveSevenths(string quality)
    {
        var entities = new TheoryTrainerEntities();

        var sevenths = from s in entities.SeventhChords
                       where s.SeventhChordQuality.Name == quality
                       select s;

        foreach (var s in sevenths)
        {
            string key = string.Format("{0} {1} seventh", s.Root, s.SeventhChordQuality.Name);
            if (chordLibrary.ContainsKey(key)) // TEST
                chordLibrary.Remove(key);
        }
    }


    public void GetRandomChord()
    {
        // Get a random chord to spell out of the dictionary
        var randChord = chordLibrary.ElementAt(rand.Next(0, chordLibrary.Count));
        // Set 2 properties based on this random chord
        this.ChordName = randChord.Key;
        this.ChordSpelling = randChord.Value;
    }

    public bool CheckChordSpelling(string attempt, string answer)
    {
        if (attempt == answer)
            return true;
        else
            return false;
    }

}