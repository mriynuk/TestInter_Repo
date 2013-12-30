using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using Microsoft.Phone.Controls;

namespace EasyNotesApp1
{
    public partial class MainPage : PhoneApplicationPage
    {
        // Constructor
        public MainPage()
        {
            InitializeComponent();
        }

        private void BtnAddNote_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate( new Uri ("/NotePage.xaml", UriKind.Relative));
        }

        protected override void OnNavigatedTo(System.Windows.Navigation.NavigationEventArgs e)
        {
            //base.OnNavigatedTo(e);
            string notename = "";
            if (NavigationContext.QueryString.TryGetValue("notename", out notename))
            {
                if (notename != "")
                {
                    var newListBoxItem = new ListBoxItem()
                    {
                        Content = notename,
                        FontSize = 24
                    };
                    MainListBox.Items.Add(newListBoxItem);
                }
                NavigationContext.QueryString.Clear();
            }
            base.OnNavigatedTo(e);
        }

        private void BtnDeleteNote_Click(object sender, RoutedEventArgs e)
        {
            //MainListBox.Items.Remove(MainListBox.SelectedItem);
        }

        private void MainListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            NavigationService.Navigate(new Uri("/NotePage.xaml?msg=shownote", UriKind.Relative));
        }
    }
}