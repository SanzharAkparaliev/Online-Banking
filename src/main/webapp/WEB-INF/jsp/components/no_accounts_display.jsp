<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>

<div class="container mt-2">
    <div class="card no-accound-card">
        <div class="card-body">
            <h1 class="card-title">
                <i class="fa fa-ban text-danger"></i> No Register Account
            </h1>
            <hr>

            <div class="card-text">
                You currently do not have any registered account. <br>
                Please click below to register / add a new account
            </div>
            <br>
            <button  class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                <i class="fa fa-credit-card"  aria-hidden="true"></i> Add New Account
            </button>
        </div>
    </div>
</div>