<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>Delete Page</title>
</head>
<body>
    <nav class=" navbar navbar-dark bg-primary">
        <div class="container">
            <span class="navbar-brand mb-0 h1"></span>
            <a href="/userLogout" class="btn btn-secondary btn-lg role" role="button">Logout</a>
        </div>
    </nav>

    <div class="col-lg-8 mx-auto p-3 py-md-5">
        <header class="d-flex align-items-center pb-3 mb-5 border-bottom">
            <span class="fs-4">Are you sure you want to delete your profile?</span>
            <br>
        </header>
        <div class="container bg-light">
          <div class="col-md-12 text-center">
            <a class="btn btn-primary" href="/profile.jsp" role="button">Cancel</a>
            <a class="btn btn-warning" href="/deleteUserProfile" role="button">Delete</a>
            </div>
        </div>
    </div>

</body>
</html>
