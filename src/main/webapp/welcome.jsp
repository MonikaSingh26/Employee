<%@page import="java.sql.DriverManager" %>
  <%@page import="java.sql.Connection" %>
    <%@page import="java.sql.Statement" %>
      <%@page import="java.sql.ResultSet" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
          <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"
            id="bootstrap-css">
          <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
          <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
          <meta charset="UTF-8">
          <title>Search Page</title>
        </head>

        <body>
          <nav class="navbar navbar-dark bg-primary">
            <div class="container">
              <span class="navbar-brand mb-0 h1"></span>
              <p class="h3">WELCOME TO YOUR PROFILE</p>
              <a href="login.jsp" class="btn btn-secondary" role="button">Logout</a>
            </div>
          </nav>
          <div class="col-lg-8 mx-auto p-3 py-md-5">


            <% String firstName=request.getParameter("firstName"); 
            String lastName=request.getParameter("lastName");
            session.setAttribute("firstname",firstName);
            session.setAttribute("lastname",lastName); 
            %>

              <% 
              Connection connection=null; 
              Statement statement=null; 
              ResultSet resultSet=null; 
              String url="jdbc:mysql://localhost:3306/application" ; // MySQL URL and followed by the Database name 
              String username="root" ; // MySQL username 
              String password="123456" ; // MySQL password 
              try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Loading MySQL driver
                connection=DriverManager.getConnection(url, username, password); // Attempting to connect to MySQL Database 
                System.out.println("Database Connection Established"); 
              } catch (ClassNotFoundException exception)
                 { 
                   exception.printStackTrace(); 
                  } 
              %>

                <% try { 
                  connection=DriverManager.getConnection(url, username, password);
                  statement=connection.createStatement();
                  System.out.println(request.getParameter("firstName"));
                  System.out.println(request.getParameter("lastName"));
                  String firstname=request.getParameter("firstName");
                  String lastname=request.getParameter("lastName");
                  resultSet=statement.executeQuery("SELECT * FROM employee e Join userlogin ulogin on e.employeeId=ulogin.employeeId WHERE firstName='"
                 + firstname + "' AND lastName='" + lastname + "'");

                  while(resultSet.next()) {

                %>
           <div>

<table class=" table table-dark">
                  <thead>
                    <tr>

                      <th scope="col">FirstName</th>
                      <th scope="col">LastName</th>
                      <th scope="col">Address</th>
                      <th scope="col">Gender</th>
                      <th scope="col">Birthdate</th>
                      <th scope="col">Salary</th>
                      <th scope="col">UserLoginId</th>

                    </tr>
                  </thead>
                  <tbody>

                    <tr>
                      <td>
                        <%=resultSet.getString("firstName")%>
                      </td>

                      <td>
                        <%=resultSet.getString("lastName")%>
                      </td>

                      <td>
                        <%=resultSet.getString("address")%>
                      </td>

                      <td>
                        <%=resultSet.getString("gender")%>
                      </td>

                      <td>
                        <%=resultSet.getString("birthdate")%>
                      </td>

                      <td>
                        <%=resultSet.getString("salary")%>
                      </td>

                      <td>
                        <%=resultSet.getString("userLoginId")%>
                      </td>


                    </tr>

                  </tbody>
                  </table>

          </div>
          </div>
          </div>
          </div>

          <% } 
          connection.close(); } 
          catch (Exception exception) { 
            exception.printStackTrace(); 
          } 
          %>

            </span>
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
          </section>
        </body>
        </html>