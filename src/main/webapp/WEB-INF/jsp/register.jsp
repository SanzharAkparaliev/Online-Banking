<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>

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

        <form:form action="/register" class="req-form" modelAttribute="registerUser">
            <div class="row">
                <div class="form-group col">
                    <form:input type="text" path="first_name" class="form-control form-control-lg" placeholder="Enter first Name"/>
                    <form:errors path="first_name" class="text-white bg-danger" />
                </div>
                <div class="form-group col">
                    <form:input type="text" path="last_name" class="form-control form-control-lg" placeholder="Enter last Name"/>
                    <form:errors path="last_name" class="text-white bg-danger" />
                </div>
            </div>

            <div class="form-group ">
                <form:input type="email"  path="email" class="form-control form-control-lg" placeholder="Enter email" />
                <form:errors path="last_name" class="text-white bg-danger" />
            </div>

            <div class="row">
                <div class="form-group col">
                    <form:input type="password" path="password" class="form-control form-control-lg" placeholder="Enter Password"/>
                    <form:errors path="password" class="text-white bg-danger" />
                </div>
                <div class="form-group col">
                    <input type="password" name="confirm_password" class="form-control form-control-lg" placeholder="Enter Confirm Password">
                    <small class="text-white bg-danger">${confirm_pass}</small>
                </div>
            </div>

            <div class="form-group ">
                <button class="btn btn-lg">Register</button>
            </div>

        </form:form>
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