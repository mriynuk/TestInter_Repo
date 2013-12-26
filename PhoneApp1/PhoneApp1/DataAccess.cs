using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PhoneApp1
{
    public class DataAccess
    {
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

        public static List<string> GetNames()
        {
            var list = new List<string> { "name0", "name1", "name2", "name3", "name4" };
            return list;
        }
    }
}
