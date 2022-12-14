<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Error</title>
    <style>
        *{
            box-sizing: border-box;
            font-family:Verdana, Geneva, Tahoma, sans-serif;
        }
        body{
            height: 100vh;
            background-image: url("../images/main_bg.png");
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
        }
        .card{
            box-shadow: 0px 3px 6px rgb(0, 14, 53);
        }
        .card .card-text{
            font-size: 16px;
        }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center">
<div class="card col-4 alert alert-danger border border-danger text-danger">
    <div class="card-title">
        <i class="fa fa-window-close mr-2"></i>Errors:
        <hr>

        <div class="card-body">
            <p class="card-text">
                <c:if test="${requestScope.error != null}">
                    <div class="alert alert-danger text-center border border-danger">
                        <b>${requestScope.error}</b>
                    </div>
                </c:if>
            </p>
            <hr>
            <a href="/login" class="btn  btn-sm btn-danger">
                <i class="fa fa-arrow-circle-left mr-2" aria-hidden="true"></i>Back
            </a>
        </div>
    </div>
</div>
</body>
</html>