using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;

namespace EasyNotesApp1
{
    public partial class Page1 : PhoneApplicationPage
    {
        public Page1()
        {
            InitializeComponent();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            var note = new NoteData
            {
                NoteName = TextBoxNoteName.Text,
                NoteText = TextBoxNoteText.Text
            };
            DataProvider.NotesListMain.Add(note);
            NavigationService.Navigate(new Uri("/MainPage.xaml", UriKind.Relative));
        }
        protected override void OnBackKeyPress(System.ComponentModel.CancelEventArgs e)
        {
            TextBoxNoteName.Text = "";
            TextBoxNoteText.Text = "";
            base.OnBackKeyPress(e);
        }
        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            TextBoxNoteName.Text = "";
            TextBoxNoteText.Text = "";
            string selectedItemIndex = "";
            if (NavigationContext.QueryString.TryGetValue("itemselected", out selectedItemIndex))
            {
                TextBoxNoteName.Text = DataProvider.NotesListMain[Int32.Parse(selectedItemIndex)].NoteName;
                TextBoxNoteText.Text = DataProvider.NotesListMain[Int32.Parse(selectedItemIndex)].NoteText;
            };
            base.OnNavigatedTo(e);
        }
    }
}