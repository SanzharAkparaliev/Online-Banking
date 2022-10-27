<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>

<!-- Card: Withdraw Card -->
<div class="card withdraw-card">
    <!-- Card Body -->
    <div class="card-body">

        <!-- Deposit Form -->
        <form action="/transact/withdraw" method="POST" class="deposit-form">
            <!-- Form Group -->
            <div class="form-group mb-2">
                <label> Enter Withdrawal Amount</label>
                <input type="text" name="withdrawal_amount"class="form-control" placeholder="Enter Withdrawal Amount">
            </div>
            <!-- End Of Form Group -->

            <!-- Form Group -->
            <div class="form-group">
                <label >Select Account</label>
                <!-- Select Account Option -->
                <select name="account_id" class="form-control" >
                    <option value="">-- Select Account --</option>
                    <c:if test="${userAccounts != null}">
                        <c:forEach items="${userAccounts}" var="selectAccount">
                            <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                        </c:forEach>
                    </c:if>
                </select>
                <!-- End Select Account Option -->
            </div>
            <!-- End Of Group -->


            <!-- Form Group -->
            <div class="form-group my-2">
                <button  class="btn btn-md transact-btn">Withdraw</button>
            </div>
            <!-- End Of Form Group -->
        </form>
        <!-- End Withdrawal Form  -->
    </div>
    <!-- End Of Card Body -->
</div>
<!-- End Of Card: Withdraw Card -->
