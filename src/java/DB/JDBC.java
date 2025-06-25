/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;
import java.io.FileNotFoundException;
import java.sql.*;

/**
 *
 * @author ASUS
 */
public class JDBC {
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=SMS_Web;trustServerCertificate=true";
      private static final String USER = "SASIDHARAN-S";
        private static final String PASSWORD = "sasi";
        
        public static Connection con() throws SQLException , ClassNotFoundException
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        }
    
}
