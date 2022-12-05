<!DOCTYPE html>
        <html lang="en">
          <head>
              <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
              integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
              <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
              <meta charset="UTF-8">
              <title>Search Page</title>
          </head>
<body>

    <nav class="navbar navbar-dark bg-primary">
        <div class="container">
            <span class="navbar-brand mb-0 h1"></span>
            <a href="login.jsp" class="btn btn-secondary btn-lg" role="button">Logout</a>
        </div>
    </nav>

  <div class="container">
        <div class="row">
            <div class="col-3 md-1"></div>
            <div class="col-6 md-8 mt-5">
                <h1 class="h2 mb-3 fw-normal"><strong>Enter a name to Search</strong></h1>
                <form action="welcome.jsp" method="post">
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

         <div class="container bg-light">
             <div class="col-md-12 text-center">
                 <button type="submit" class="btn btn-primary">Search</button>
             </div>
            </div>
            </form>
        </div>
    </div>
  </div>
</body>
</html>
