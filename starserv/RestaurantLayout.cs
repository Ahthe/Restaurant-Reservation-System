using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace starserv
{
    public partial class RestaurantLayout
    {
        public String DateAdded { get; set; }
        public int IsActive { get; set; }

        public int NumChairsPerTable { get; set; }
        public int NumTables { get; set; }
    }
}