package com.connection;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @suresh java3
 */
public class DbConnection {
    public static Connection getConnection()
    {
        Connection con = null;
        try{
             Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Enhancing_Data", "root", "root");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}
