package Controller;

import DAO.EmployeeDao;
import Model.EmployeeBean;
import Model.UserLoginBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/registration")
    public class EmployeeServlet extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            int salary = Integer.parseInt(request.getParameter("salary"));
            String birthdate = request.getParameter("birthdate");
            String userLoginId = request.getParameter("userLoginId");
            String password = request.getParameter("password");

            UserLoginBean userLoginBean = new UserLoginBean();
            EmployeeBean employeeBean = new EmployeeBean();

            employeeBean.setFirstName(firstName);
            employeeBean.setLastName(lastName);
            employeeBean.setAddress(address);
            employeeBean.setGender(gender);
            employeeBean.setSalary(salary);
            employeeBean.setBirthdate(birthdate);

            userLoginBean.setUserLoginId(userLoginId);
            userLoginBean.setPassword(password);

            boolean authenticateUser = false;
            try {
                authenticateUser = EmployeeDao.registerUser(employeeBean, userLoginBean);
            } catch (SQLException sqlException) {
                sqlException.printStackTrace();
            }

            RequestDispatcher requestDispatcher;
            HttpSession httpSession = null;
            if (authenticateUser) {
                requestDispatcher = request.getRequestDispatcher("profile.jsp");
                httpSession = request.getSession(true);
                httpSession.setAttribute("userLoginId", userLoginId);
                httpSession.setAttribute("message", "Successful");
                response.sendRedirect("login.jsp");
            } else {
                requestDispatcher = request.getRequestDispatcher("registration.jsp");
                request.setAttribute("AlreadyExist", "User Already Exists");
                requestDispatcher.forward(request, response);
            }
        }
    }
