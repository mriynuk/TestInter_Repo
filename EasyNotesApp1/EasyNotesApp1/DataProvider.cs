using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyNotesApp1
{
    public class DataProvider
    {
        public static List<NoteData> NotesListMain = new List<NoteData> ();
    }
    public class NoteData
    {
        public string NoteName { get; set; }
        public string NoteText { get; set; }
    }
}
