<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/default.css">
    <title>Register</title>
</head>
<body class="d-flex align-items-center justify-content-center">
<div class="card registration-form-card col-6 bg-transparent border-0">
    <div class="card-body">
        <h1 class="form-header card-title mb-3">
            <i class="fa fa-edit"> </i> Register
        </h1>

        <form action="" class="req-form">
            <div class="row">
                <div class="form-group col">
                    <input type="text" name="first_name" class="form-control form-control-lg" placeholder="Enter first Name">
                </div>
                <div class="form-group col">
                    <input type="text" name="last_name" class="form-control form-control-lg" placeholder="Enter last Name">
                </div>
            </div>

            <div class="form-group ">
                <input type="email"  name="email" class="form-control form-control-lg" placeholder="Enter email">
            </div>

            <div class="row">
                <div class="form-group col">
                    <input type="password" name="password" class="form-control form-control-lg" placeholder="Enter Password">
                </div>
                <div class="form-group col">
                    <input type="password" name="confirm_password" class="form-control form-control-lg" placeholder="Enter Confirm Password">
                </div>
            </div>

            <div class="form-group ">
                <button class="btn btn-lg">Register</button>
            </div>

        </form>
        <p class="card-text text-white ">
            Already have an account? <span class="ms-2 "><a href="/login" class="btn btn-sm text-warning">Sign in</a> </span>
        </p>
        <small class="text-warning">
            <i class="fa fa-arrow-circle-left " aria-hidden="true"></i><a href="/" class="btn btn-sm text-warning">Back</a>
        </small>
    </div>
</div>

</body>
</html>