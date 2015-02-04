using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;


[ServiceContract(Namespace = "")]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
public class ChordOfTheDayService
{
	// To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
	// To create an operation that returns XML,
	//     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
	//     and include the following line in the operation body:
	//         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
    Random rand = new Random();
    
    [OperationContract]
	public string GetChordOfTheDay()
	{
        //string chord = "C major";
        //return chord;
        List<string> chords = new List<string>
        {
            "C major", "C minor", "D major", "D minor",
            "E major", "E minor", "F major", "F minor",
            "G major", "G minor", "A major", "A minor",
            "B major", "B minor"
        };
        // Get a random number
        int i = rand.Next(chords.Count);
        // Return the chord at random index
        return chords[i];
        
	}

	// Add more operations here and mark them with [OperationContract]
}
