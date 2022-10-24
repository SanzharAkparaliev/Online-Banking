<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/default.css">
    <title>Login</title>
</head>
<body class="d-flex align-items-center justify-content-center">
<div class="card login-form-card col-4 bg-transparent border-0">
    <div class="card-body">
        <h1 class="form-header card-title mb-3">
            <i class="fa fa-user-circle"> </i> Login
        </h1>

        <form action="" class="login-form">

            <div class="form-group ">
                <input type="email"  name="email" class="form-control form-control-lg" placeholder="Enter email">
            </div>
            <div class="form-group ">
                <input type="password"  name="password" class="form-control form-control-lg" placeholder="Enter password">
            </div>

            <div class="form-group ">
                <button class="btn btn-lg">Login</button>
            </div>

        </form>
        <p class="card-text text-white ">
            Dont have an account? <span class="ms-2 text-warning"><a href="/register" class="btn btn-sm text-warning">Sign Up</a></span>
        </p>
        <small class="text-warning">
            <i class="fa fa-arrow-circle-left " aria-hidden="true"></i><a href="/" class="btn btn-sm text-warning">Back</a>
        </small>
    </div>
</div>
</body>
</html>