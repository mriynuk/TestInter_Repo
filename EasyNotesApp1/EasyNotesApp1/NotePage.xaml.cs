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
            System.IO.IsolatedStorage.IsolatedStorageFile localStorage = System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForApplication();
            if (!localStorage.DirectoryExists("EasyNotes"))
                localStorage.CreateDirectory("EasyNotes");
            using (var isoFileSteream =
                    new System.IO.IsolatedStorage.IsolatedStorageFileStream("EasyNotes\\Note1.txt", System.IO.FileMode.OpenOrCreate, localStorage))
            {
                using (var isoFileWriter = new System.IO.StreamWriter(isoFileSteream))
                {
                    isoFileWriter.WriteLine(this.TextBoxNoteName.Text);
                    isoFileWriter.WriteLine(this.TextBoxNoteText.Text);
                }
            }
            NavigationService.Navigate(new Uri("/MainPage.xaml?notename=" + TextBoxNoteName.Text, UriKind.Relative));
        }
        protected override void OnBackKeyPress(System.ComponentModel.CancelEventArgs e)
        {
            TextBoxNoteName.Text = "";
            TextBoxNoteText.Text = "";
            base.OnBackKeyPress(e);
        }
        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            base.OnNavigatedTo(e);
            string msg = "";
            if (NavigationContext.QueryString.TryGetValue("msg", out msg))
                if (msg == "shownote")
                {
                    System.IO.IsolatedStorage.IsolatedStorageFile localStorage = System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForApplication();
                    using (var isoFileStream = new System.IO.IsolatedStorage.IsolatedStorageFileStream("EasyNotes\\Note1.txt", System.IO.FileMode.Open, localStorage))
                    {
                        using (var isoFileReader = new System.IO.StreamReader(isoFileStream))
                        {
                            this.TextBoxNoteName.Text = isoFileReader.ReadLine();
                            this.TextBoxNoteText.Text = isoFileReader.ReadLine();
                        }
                    }
                }
        }
    }
}