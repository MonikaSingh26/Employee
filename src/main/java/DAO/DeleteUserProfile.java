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
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/deleteUserProfile")
    public class DeleteUserProfile extends HttpServlet {

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession httpsession = request.getSession();

            if(httpsession.getAttribute("userLoginId") != null) {
                String employeeId = (String) httpsession.getAttribute("employeeId");

                try {
                    Connection connection = DatabaseConnection.getConnection(); // Fetch Database connection object

                    String employeeQuery = "DELETE FROM employee WHERE employeeId = "+employeeId;
                    Statement statement = connection.createStatement();
                    statement.executeUpdate(employeeQuery);

                    httpsession.invalidate();

                    request.setAttribute("deleteMessage", "Profile Deleted Successfully");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("registration.jsp");
                    requestDispatcher.forward(request, response);

                } catch (SQLException sqlException) {
                    sqlException.printStackTrace();
                }
            } else
                response.sendRedirect("/login.jsp");
        }
    }