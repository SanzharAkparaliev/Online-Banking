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
    <title>Login</title>
</head>
<body class="d-flex align-items-center justify-content-center">
<div class="card login-form-card col-4 bg-transparent border-0">
    <div class="card-body">
        <h1 class="form-header card-title mb-3">
            <i class="fa fa-user-circle"> </i> Login
        </h1>
        <c:if test="${requestScope.success != null}">
            <div class="alert alert-success text-center border border-success">
                <b>${requestScope.success}</b>
            </div>
        </c:if>
        <c:if test="${requestScope.error != null}">
            <div class="alert alert-danger text-center border border-danger">
                <b>${requestScope.error}</b>
            </div>
        </c:if>

        <form action="/login" method="post" class="login-form">

            <div class="form-group ">
                <input type="email"  name="email" class="form-control form-control-lg" placeholder="Enter email">
            </div>
            <div class="form-group ">
                <input type="password"  name="password" class="form-control form-control-lg" placeholder="Enter password">
            </div>
            <div class="form-group ">
                <input type="hidden"  name="_token" value="${token}">
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