    <%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

      <%@page import="java.sql.*"%>
      <%@page import="java.sql.Connection"%>
      <%@page import="java.sql.DriverManager"%>
      <%@page import="java.sql.ResultSet"%>
      <%@page import="javax.servlet.http.*" %>

      <!DOCTYPE html>
        <html lang="en">
          <head>
              <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
              integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
              <meta charset="UTF-8">
              <title>Profile Page</title>
          </head>

          <body>
            <nav class="navbar navbar-dark bg-primary">
              <div class="container">
                <span class="navbar-brand mb-0 h1"></span>
                <p class="h3">WELCOME TO YOUR PROFILE</p>
                <a href="search.jsp" class ="btn btn-success" role="button">Search</a>
                <a href="userLogout" class="btn btn-secondary" role="button">Logout</a>

              </div>
            </nav>

              <div class="col-lg-8 mx-auto p-3 py-md-5">

             <%
                  String userLoginId = (String)session.getAttribute("userLoginId");
                  String password = (String)session.getAttribute("password");
                  System.out.println(session.getAttribute("password"));
                  String firstName="";
                  String lastName="";
                  String address="";
                  String Gender="";
                  String Salary="";
                  String Birthdate="";
                  String EmployeeId="";

                   try {
                           Connection connection = null;
                      try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/application", "root", "123456");
                             System.out.println("Database Connection Established");
                         } catch (SQLException sqlException){
                           sqlException.printStackTrace();
                          }

                     Statement statement = connection.createStatement();
                     ResultSet resultSet = statement.executeQuery("SELECT userLoginId, password FROM userlogin");
                     while(resultSet.next()){
                         if(resultSet.getString("userLoginId").equalsIgnoreCase(userLoginId)
                                 && resultSet.getString("password").equals(password)) {

                             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM employee natural join userlogin WHERE userLoginId = ?");
                             preparedStatement.setString(1, userLoginId);
                             ResultSet resultSet1 = preparedStatement.executeQuery();

                             if(resultSet1.next()){
                                firstName = resultSet1.getString("firstName");
                                lastName = resultSet1.getString("lastName");
                                address = resultSet1.getString("address");
                                gender = resultSet1.getString("gender");
                                salary = resultSet1.getString("salary");
                                birthdate = resultSet1.getString("birthdate");
                                partyId = resultSet1.getString("partyId");
                             }
                             request.getSession();
                             session.setAttribute("employeeId", employeeId);
                         }
                     }
                 } catch (ClassNotFoundException | SQLException sqlException) {
                     sqlException.printStackTrace();
                 }
            %>

                <section class="vh-70" style="background-color: #ffffff;">
                  <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-80">
                      <div class="col col-xl-10">
                        <div class="card mb-5">
                          <div class="card-body p-4">
                            <div class="row">
                              <div class="col-9">
                                <h4 class="mb-3">
                                  <%= firstName%>
                                    <%= lastName%>
                                </h4>
                              </div>

                              <div class="col-1">
                               <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal"
                                 data-bs-target="#editModal">Edit</button>
                               <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                 <div class="modal-dialog">
                                   <div class="modal-content">
                                     <div class="modal-header">
                                       <h4 class="modal-title" id="exampleModalLabel">Edit User Profile</h4>
                                      </div>

                                     <div class="modal-body">
                                       <form action="editUserProfile" method="POST" style="align-items: center;">
                                         <div class="col-md-12">
                                           <label for="inputFirstName" class="form-label">First Name</label>
                                           <input type="text" class="form-control" id="inputFirstName" name="firstName"
                                             placeholder="firstname" value=<%= firstName%> required>
                                         </div>

                                         <div class="col-md-12">
                                           <label for="inputLastName" class="form-label">Last Name</label>
                                           <input type="text" class="form-control" id="inputLastName" name="lastName"
                                             placeholder="lastname" value=<%= lastName%> required>
                                         </div>

                                         <div class="col-md-12">
                                           <label for="inputAddress" class="form-label">Address</label>
                                           <input type="text" class="form-control" id="inputAddress" name="address"
                                            placeholder="address" value=<%= address%> required>
                                            </div>

                                         <div class="col-md-12">
                                           <label for="inputGender" class="form-label">Gender</label>
                                           <input type="text" class="form-control" id="inputGender" name="gender"
                                           placeholder="gender" value=<%= gender%> required>
                                         </div>

                                         <div class="col-md-12">
                                           <label for="inputSalary" class="form-label">Salary</label>
                                           <input type="text" class="form-control" id="inputSalary" name="salary"
                                           placeholder="salary" value=<%= salary%> required>
                                         </div>

                                         <div class="col-md-12">
                                           <label for="inputBirthdate" class="form-label">Birthdate</label>
                                           <input type="text" class="form-control" id="InputBirthdate" name="birthdate"
                                           placeholder="birthdate" value=<%= birthdate%> required>
                                         </div>
                                     </div>

                                     <div class="modal-footer">
                                       <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                                       <button type="submit" class="btn btn-success">Save</button>
                                     </div>

                                   </div>
                                 </div>
                               </div>
                              </div>

                              <div class="col-2">
                                <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal"
                                  data-bs-target="#deleteModal">Delete</button>

                                <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                  aria-hidden="true">
                                  <div class="modal-dialog">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h4 class="modal-title" id="exampleModalLabel">Delete User Profile</h4>
                                      </div>

                                      <div class="modal-body">Are you sure you want to delete your profile?</div>

                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-primary"
                                          data-bs-dismiss="modal">Close</button>
                                        <a class="btn btn-danger" href="/deleteUserProfile" role="button">Delete</a>
                                      </div>
                                    </div>
                                  </div>
                                </div>

                              </div>
                            </div>
                            <p class="small mb-0"><i class="far fa-star fa-lg"></i> <span class="mx-2">|</span> UserLoginId:
                              <strong>
                                <%= userLoginId%>
                              </strong>
                            </p>

                            <p class="small mb-0"><i class="far fa-star fa-lg"></i> <span class="mx-2">|</span> Address:
                               <strong>
                                  <%= address%>
                               </strong>
                            </p>

                            <p class="small mb-0"><i class="far fa-star fa-lg"></i> <span class="mx-2">|</span> City:
                              <strong>
                                <%= city%>
                              </strong>
                            </p>

                            <p class="small mb-0"><i class="far fa-star fa-lg"></i> <span class="mx-2">|</span> Zip:
                              <strong>
                                <%= zip%>
                              </strong>
                            </p>

                            <p class="small mb-0"><i class="far fa-star fa-lg"></i> <span class="mx-2">|</span> State:
                              <strong>
                                <%= state%>
                              </strong>
                            </p>

                            <p class="small mb-0"><i class="far fa-star fa-lg"></i> <span class="mx-2">|</span> Country:
                              <strong>
                                <%= country%>
                              </strong>
                            </p>

                            <p class="small mb-0"><i class="far fa-star fa-lg"></i> <span class="mx-2">|</span> Phone:
                              <strong>
                                 <%= phone%>
                              </strong>
                            </p>

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