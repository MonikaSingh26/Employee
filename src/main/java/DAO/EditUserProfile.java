package DAO;

import Connectivity.DatabaseConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/editUserProfile")
    public class EditUserProfile extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();

        Connection connection = null;

        try {
            connection = DatabaseConnection.getConnection(); // Fetch Database connection object

            String employeeId = (String) httpSession.getAttribute("employeeId");
            PreparedStatement statement = connection.prepareStatement("UPDATE employee SET firstName = ?, lastName = ?, " +
                    "address = ?, gender = ?, salary = ?, birthdate = ? WHERE employeeId =" +employeeId);

            statement.setString(1, request.getParameter("firstName"));
            System.out.println("First Name "+request.getParameter("firstName"));

            statement.setString(2, request.getParameter("lastName"));
            System.out.println("Last Name "+request.getParameter("lastName"));

            statement.setString(3, request.getParameter("address"));
            System.out.println("Address "+request.getParameter("address"));

            statement.setString(4, request.getParameter("gender"));
            System.out.println("Gender "+request.getParameter("gender"));

            statement.setInt(5, Integer.parseInt(request.getParameter("salary")));
            System.out.println("Salary "+request.getParameter("salary"));

            statement.setString(6, request.getParameter("birthdate"));
            System.out.println("Birthdate "+request.getParameter("birthdate"));

            statement.executeUpdate();
            connection.close();

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/profile.jsp");
            requestDispatcher.include(request, response);

        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
    }
}

