package DAO;

import Connectivity.DatabaseConnection;
import Model.EmployeeBean;
import Model.UserLoginBean;

import java.sql.*;

public class EmployeeDao {

        public static boolean registerUser(EmployeeBean employeeBean, UserLoginBean userLoginBean) throws SQLException {

            String userLoginId = userLoginBean.getUserLoginId();
            String password = userLoginBean.getPassword();

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try {
                connection = DatabaseConnection.getConnection(); // Fetch Database connection object
                statement = connection.createStatement();
                resultSet = statement.executeQuery("SELECT userLoginId FROM userlogin");

                boolean flag = true;
                while (resultSet.next()) {
                    if (resultSet.getString("userLoginId").equalsIgnoreCase(userLoginId))
                    {
                        return false;
                    }
                }
                if (flag) {
                    Statement statement1 = connection.createStatement();
                    ResultSet resultSet1 = statement1.executeQuery("SELECT MAX(employeeId) as employeeId FROM employee");

                    int employeeId = -1;
                    if (resultSet1 != null) {
                        while (resultSet1.next()) {
                            employeeId = (resultSet1.getInt("employeeId")) + 1;
                        }
                    }
                    statement.close(); //statement close

                    PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `application`.`employee` " +
                            "(`employeeId`, `firstName`, `lastName`, `address`, `gender`, `salary`, `birthdate`) " +
                            "VALUES (?, ?, ?, ?, ?, ?, ?)");
                    preparedStatement.setInt(1, employeeId);
                    preparedStatement.setString(2, employeeBean.getFirstName());
                    preparedStatement.setString(3, employeeBean.getLastName());
                    preparedStatement.setString(4, employeeBean.getAddress());
                    preparedStatement.setString(5, employeeBean.getGender());
                    preparedStatement.setInt(6, employeeBean.getSalary());
                    preparedStatement.setString(7, employeeBean.getBirthdate());
                    preparedStatement.executeUpdate();
                    preparedStatement.close(); //preparedStatement close

                    PreparedStatement preparedStatement1 = connection.prepareStatement("INSERT INTO `application`.`userlogin` " +
                            "(`userLoginId`, `password`, `employeeId`) " +
                            "VALUES (?, ?, ?)");
                    preparedStatement1.setString(1, userLoginId);
                    preparedStatement1.setString(2, password);
                    preparedStatement1.setInt(3, employeeId);
                    preparedStatement1.executeUpdate();
                    preparedStatement1.close(); //preparedStatement1 close
                }

            } catch (SQLException sqlException) {
                sqlException.printStackTrace();
            }
            return true;
        }
    }
