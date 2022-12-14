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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/main.css">

  <title>Dashboard</title>
</head>
<body >

<!-- Header -->
<c:import url="components/incl/header.jsp"/>



<!-- Container -->
<div class="container my-4">

  <!-- Card: Transaction History Card -->
  <div class="card transaction-history shadow">
    <!-- Card Header -->
    <div class="card-header">
      <i class="fas fa-credit-card me-2" aria-hidden="true"></i> Transaction History
    </div>
    <!-- End Of Card Header -->

    <!-- Card Body -->
    <div class="card-body">
      <c:if test="${requestScope.transact_history != null}">
        <table class="table text-center table-striped">
          <tr>
            <th>Transaction ID</th>
            <th>Transaction Type</th>
            <th>Amount</th>
            <th>Source</th>
            <th>Status</th>
            <th>Reason Code</th>
            <th>Created at</th>
          </tr>
          <c:forEach items="${requestScope.transact_history}" var="transactionHistory">
            <tr>
              <td>${transactionHistory.transaction_id}</td>
              <td>${transactionHistory.transaction_type}</td>
              <td>${transactionHistory.amount}</td>
              <td>${transactionHistory.source}</td>
              <td>${transactionHistory.status}</td>
              <td>${transactionHistory.reason_code}</td>
              <td>${transactionHistory.created_at}</td>
            </tr>
          </c:forEach>
        </table>
      </c:if>
    </div>
    <!-- End Of Card Body -->
  </div>
  <!-- End Of Card: Transaction History Card -->
</div>
<!-- End Of Container -->


<c:import  url="components/incl/footer.jsp"/>
