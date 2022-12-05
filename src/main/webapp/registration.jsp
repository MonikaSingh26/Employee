<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>Sign Up</title>
</head>
<body>
<form action = "registration" method="post">
<section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                        <span style="color:red;">
                            <%
                                if(null!=request.getAttribute("deleteMessage")) {
                                 out.println(request.getAttribute("deleteMessage"));
                                }
                            %>
                            </span>
                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign Up</p>
                <p class="text-center h4 mb-5 mx-1 mx-md-4 mt-4">It's quick and easy.</p>

                <form class="mx-1 mx-md-4">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                     <input type="text" class="form-control" id="InputFirstName" placeholder="First Name" name="firstName" required>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-0">
                        <input type="text" class="form-control" id="InputLastName" placeholder="Last Name" name="lastName" required>
                     </div>
                   </div>

                <div class="d-flex flex-row align-items-center mb-4">
                  <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                   <div class="form-outline flex-fill mb-0">
                    <input type="text" class="form-control" id="InputAddress" placeholder="Address" name="address" required>
                  </div>
                </div>

                <div class="d-flex flex-row align-items-center mb-4">
                 <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                  <div class="form-outline flex-fill mb-0">
                    <input type="text" class="form-control" id="InputGender" placeholder="Gender" name="gender" required>
                  </div>
               </div>

               <div class="d-flex flex-row align-items-center mb-4">
                  <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                   <div class="form-outline flex-fill mb-0">
                    <input type="text" class="form-control" id="InputSalary" placeholder="Salary" name="salary" required>
                  </div>
               </div>

               <div class="d-flex flex-row align-items-center mb-4">
                 <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                  <div class="form-outline flex-fill mb-0">
                    <input type="text" class="form-control" id="InputBirthdate" placeholder="Birthdate" name="birthdate" required>
                  </div>
                </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="email" class="form-control" id="InputEmail" aria-describedby="emailHelp" placeholder="Email Address" name="userLoginId" required>
                          <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                          <span style="color:red;">
                              <%
                                 if(null!=request.getAttribute("AlreadyExist")) {
                                 out.println(request.getAttribute("AlreadyExist")); }
                              %>
                          </span>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="password" class="form-control" id="InputPassword" placeholder="New Password" name="password" required>
                    </div>
                  </div>

                  <div class="container bg-light">
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primary">Sign Up</button>
                                <a href="login.jsp" class="btn btn-secondary" role="button">Login</a>
                            </div>
                  </div>

                </form>
              </div>
              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp" class="img-fluid" alt="Sample image">

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html