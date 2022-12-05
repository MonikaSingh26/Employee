package DAO;

import Connectivity.DatabaseConnection;
import Model.UserLoginBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserLoginDao {
    public static boolean authenticateUserLogin(UserLoginBean userLoginBean) {

        String userLoginId = userLoginBean.getUserLoginId();
        String password = userLoginBean.getPassword();

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String userLoginIdDb;
        String passwordDb;

        try {
            connection = DatabaseConnection.getConnection(); // Fetch Database connection object
            statement = connection.createStatement();
            resultSet = statement.executeQuery ("SELECT userLoginId, password FROM userlogin");

            while (resultSet.next()) {

                userLoginIdDb = resultSet.getString("userLoginId");
                passwordDb = resultSet.getString("password");
                System.out.println(userLoginIdDb + passwordDb);

                if (userLoginId.equals(userLoginIdDb) && password.equals(passwordDb)) {
                    System.out.println("Record matched successfully");
                    return true;
                }
                else System.out.println("Record not matched");
            }
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
        return false;
    }
}