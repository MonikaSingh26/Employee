package Connectivity;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
        public static Connection getConnection() {
            Connection connection = null;
            String url = "jdbc:mysql://localhost:3306/application"; // MySQL URL and followed by the Database name
            String username = "root"; // MySQL username
            String password = "123456"; // MySQL password
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Loading MySQL driver
                    connection = DriverManager.getConnection(url, username, password); // Attempting to connect to MySQL Database
                    System.out.println("Database Connection Established");
                } catch (SQLException | ClassNotFoundException exception) {
                    exception.printStackTrace();
                }
            return connection;
        }
}
