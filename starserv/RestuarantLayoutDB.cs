using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace starserv
{
    public class RestuarantLayoutDB
    {
        public static List<RestaurantLayout> GetLayout()
        {
            List<RestaurantLayout> layoutList = new List<RestaurantLayout>();
            string sql = "SELECT DateAdded, IsActive, NumChairsPerTable, NumTables"
                + "FROM RestaurantLayout";
            using (SqlConnection con = new SqlConnection("<%$ ConnectionStrings:starserv %>"))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    RestaurantLayout restaurantlayout;
                    while (dr.Read())
                    {
                        restaurantlayout = new RestaurantLayout();
                        restaurantlayout.DateAdded = dr["DateAdded"].ToString();
                        restaurantlayout.NumChairsPerTable = int.Parse(dr["NumChairsPerTable"].ToString());
                        restaurantlayout.NumTables = int.Parse(dr["NumTables"].ToString());
                        layoutList.Add(restaurantlayout);
                    }
                    dr.Close();
                }
                return layoutList;
            }
        } //end getlayout

        public static void InsertRestaurantLayout(RestaurantLayout restaurantLayout)
        {
            string sql = "INSERT INTO RestaurantLayout "
                + "(DateAdded, NumChairsPerTable, NumTables)"
                + "VALUES (@DateAdded, @NumChairsPerTable, @NumTables";
            using (SqlConnection con = new SqlConnection("<%$ ConnectionStrings:starserv %>"))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("DateAdded", restaurantLayout.DateAdded);
                    cmd.Parameters.AddWithValue("NumChairsPerTable", restaurantLayout.NumChairsPerTable);
                    cmd.Parameters.AddWithValue("NumTables", restaurantLayout.NumTables);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}