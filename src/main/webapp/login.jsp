<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
     integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>Log In Page</title>
</head>

<body>
<section class="vh-100 gradient-custom">
    <div class="container py-5 h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
          <div class="card bg-dark text-white" style="border-radius: 1rem;">
            <div class="card-body p-5 text-center">

              <div class="mb-md-5 mt-md-4 pb-5">

                <div>
                    <form action="login" class="pt-5" method="post">
                        <h1 class="h3 mb-3 fw-normal">Please Sign In</h1>
                        <div class="form-outline form-white mb-4"></div>
                          <input type="email" class="form-control" id="InputEmail" aria-describedby="emailHelp" placeholder="Email Address" name="userLoginId" required>
                          <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                        </div>
                        <div class="form-outline form-white mb-4"></div>
                          <input type="password" class="form-control" id="InputPassword" placeholder="Password" name="password" required>
                          <span style="color:red;">
                               <%
                                  if(null!=request.getAttribute("Message")) {
                                  out.println(request.getAttribute("Message"));
                                  }
                               %>
                          </span>
                        </div>

                <button class="btn btn-outline-light btn-lg px-5" type="submit">Sign In</button>
              </div>

              <div>
                <p class="d-flex justify-content-center mx-4 mb-3 mb-lg-4"> Don't have an account? <a href="registration.jsp" class="text-white-50 fw-bold"> Sign up </a></p>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

</body>
</html>

