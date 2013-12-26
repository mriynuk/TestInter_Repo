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

namespace PhoneApp1
{
    public partial class MainPage : PhoneApplicationPage
    {
        // Constructor
        public MainPage()
        {
            InitializeComponent();
            Button2.Click += Button2_Click;
            foreach (string name in DataAccess.GetNames()){
                var listBoxNew = new ListBoxItem()
                {
                    Content = name,
                    FontSize = 24,
                };
                ListBox1.Items.Add(listBoxNew);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var button = (Button)sender;
            TextBlock1.Text = ("You have pressed: " + button.Name);
        }
        private void Button2_Click(object sender, RoutedEventArgs e)
        {
            if (TextBox2.Text != "")
            {
                var listBoxNew = new ListBoxItem()
                {
                    Content = TextBox2.Text,
                    FontSize = 24,
                };
                ListBox1.Items.Add(listBoxNew);
            }
        }

        private void ListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            MessageBox.Show("List Item pressed : " + ((ListBoxItem)ListBox1.Items[ListBox1.SelectedIndex]).Content);
        }
    }
}