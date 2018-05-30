package conect;
import java.sql.*;
public class DBconnection {
    static Connection conn= null;
    
    public static Connection getDBConnection()
            {
                try {
                   
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventary", "root", "");
                       // System.err.println("Connected To Database \n");
                    
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return conn;
            }
    
}
