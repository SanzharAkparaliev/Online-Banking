<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>

<header class="main-page-header mb-3 bg-primary">
    <div class="container d-flex align-items-center">
        <div class="company-name">
            Easy-Way Bank
        </div>
        <nav class="navigation">
            <li><a href="/app/dashboard">Dashboard</a></li>
            <li><a href="/app/payment_history">Payment History</a></li>
            <li><a href="/app/transact_history">Transaction History</a></li>
        </nav>
        <div class="text-white ml-auto display-name ">
            <i class="fa fa-circle text-success mr-2"></i>Welcome: <span style="font-weight: 200; margin-right: 30px;">${user.first_name} ${user.last_name}</span>
        </div>

        <a href="/logout" class="btn btn-sm text-white">
            <i class="fa fa-sign-out mr-2" aria-hidden="true"></i>Sign out
        </a>
    </div>
</header>
