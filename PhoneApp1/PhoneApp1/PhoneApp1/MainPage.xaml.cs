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
            foreach (string Name in GetNames()){
                var ListBoxNew = new ListBoxItem()
                {
                    Content = Name,
                    FontSize = 24,
                };
                ListBox1.Items.Add(ListBoxNew);
            }
        }
        public static List<string> GetNames()
        {
            var list = new List<string> { "name0", "name1", "name2", "name3", "name4" };
            return list;
        }
        public static List<Model> GetModels()
        {
            var list = new List<Model>
                {
                    new Model {Name = "name0", Age = 0},
                    new Model {Name = "name1", Age = 1},
                    new Model {Name = "name2", Age = 2},
                    new Model {Name = "name3", Age = 3},
                    new Model {Name = "name4", Age = 4},
                };
            return list;
        }
        void Button2_Click(object sender, RoutedEventArgs e)
        {
            var ListBoxNew = new ListBoxItem()
            {
                Content = TextBox2.Text,
                FontSize = 24,
            };
            ListBox1.Items.Add(ListBoxNew);
            //ListBox1.Height = ListBox1.Height + 40;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var button = (Button)sender;
            TextBlock1.Text = ("You have pressed: " + button.Name);
        }
        private void ListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            MessageBox.Show("List Item pressed : " + ((ListBoxItem)ListBox1.Items[ListBox1.SelectedIndex]).Content);
        }
    }
}