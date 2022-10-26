<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">

    <title>Dashboard</title>
</head>
<body >
<header class="main-page-header mb-3 bg-primary">
    <div class="container d-flex align-items-center">
        <div class="company-name">
            Easy-Way Bank
        </div>
        <nav class="navigation">
            <li><a href="">Dashboard</a></li>
            <li><a href="">Payment History</a></li>
            <li><a href="">Transaction History</a></li>
        </nav>
        <div class="text-white ml-auto display-name ">
            <i class="fa fa-circle text-success mr-2"></i>Welcome: <span style="font-weight: 200; margin-right: 30px;">Sanzhar Taalaibek uulu</span>
        </div>

        <a href="" class="btn btn-sm text-white">
            <i class="fa fa-sign-out mr-2" aria-hidden="true"></i>Sign out
        </a>
    </div>
</header>

<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title text-white" id="offcanvasExampleLabel">Transact</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <small class="card-text  text-white">
            Choose an option below to perform a transaction
        </small>
        <select name="transact-type" class="form-control mb-3" id="transact-type">
            <option value="">-- Select Transaction Type --</option>
            <option value="payment">Payment</option>
            <option value="transfer">Transfer</option>
            <option value="deposit">Deposit</option>
            <option value="withdraw">Withdraw</option>
        </select>

        <div class="card payment-card">
            <!-- Card Body -->
            <div class="card-body">
                <!-- Payment Form -->
                <form action="/transact/payment" method="POST">

                    <!-- Form Group -->
                    <div class="form-group mb-2">
                        <label for=""> Account Holder / Beneficiary</label>
                        <input type="text" name="beneficiary" class="form-control" placeholder="Enter Account holder / Beneficiary name">
                    </div>
                    <!-- End Of Form Group -->

                    <!-- Form Group -->
                    <div class="form-group mb-2">
                        <label for=""> Beneficiary Account Number</label>
                        <input type="text" name="account_number"class="form-control" placeholder="Enter Beneficiary Account No">
                    </div>
                    <!-- End Of Form Group -->

                    <!-- Form Group -->
                    <div class="form-group">
                        <label for="">Select Account</label>
                        <!-- Select Account Option -->
                        <select name="account_id" class="form-control" id="">
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
                    <div class="form-group mb-2">
                        <label for=""> Reference</label>
                        <input type="text" name="reference" class="form-control" placeholder="Enter Reference">
                    </div>
                    <!-- End Of Form Group -->

                    <!-- Form Group -->
                    <div class="form-group mb-2">
                        <label for=""> Enter Payment Amount</label>
                        <input type="text" name="payment_amount"class="form-control" placeholder="Enter Payment Amount">
                    </div>
                    <!-- End Of Form Group -->

                    <!-- Form Group -->
                    <div class="form-group mb-2">
                        <button id="" class="btn btn-md transact-btn">Pay</button>
                    </div>
                    <!-- End Of Form Group -->

                </form>
                <!-- End Of Payment Form -->
            </div>
            <!-- End Of Card Body -->

        </div>
        <!-- End Of Card: Payment Card -->

        <!-- Card: Transfer Card -->
        <div class="card transfer-card">
            <!-- Card Body -->
            <div class="card-body">

                <!-- Transfer Form -->
                <form action="/transact/transfer" method="POST">

                    <!-- Form Group -->
                    <div class="form-group">
                        <label for="">Select Account</label>
                        <!-- Select Account Option -->
                        <select name="transfer_from" class="form-control" id="">
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
                    <div class="form-group">
                        <label for="">Select Account</label>
                        <!-- Select Account Option -->
                        <select name="transfer_to" class="form-control" id="">
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
                    <div class="form-group mb-2">
                        <label for=""> Enter transfer Amount</label>
                        <input type="text" name="transfer_amount" class="form-control" placeholder="Enter transfer Amount">
                    </div>
                    <!-- End Of Form Group -->

                    <!-- Form Group -->
                    <div class="form-group my-2">
                        <button id="" class="btn btn-md transact-btn">Transfer</button>
                    </div>
                    <!-- End Of Form Group -->

                </form>
                <!-- End Of Transfer Form -->

            </div>
            <!-- End Of Card Body -->

        </div>
        <!-- End Of Card: Transfer Card -->

        <!-- Card: Deposit Card -->
        <div class="card deposit-card">
            <!-- Card Body -->
            <div class="card-body">

                <!-- Deposit Form -->
                <form action="/transact/deposit" method="POST" class="deposit-form">
                    <!-- Form Group -->
                    <div class="form-group mb-2">
                        <label for=""> Enter Deposit Amount</label>
                        <input type="text" name="deposit_amount"class="form-control" placeholder="Enter Deposit Amount">
                    </div>
                    <!-- End Of Form Group -->


                    <!-- Form Group -->
                    <div class="form-group">
                        <label for="">Select Account</label>
                        <!-- Select Account Option -->
                        <select name="account_id" class="form-control" id="">
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
                        <button id="" class="btn btn-md transact-btn">Deposit</button>
                    </div>
                    <!-- End Of Form Group -->
                </form>
                <!-- End Deposit Form  -->

            </div>
            <!-- End Of Card Body -->

        </div>
        <!-- End Of Card: Deposit Card -->

        <!-- Card: Withdraw Card -->
        <div class="card withdraw-card">
            <!-- Card Body -->
            <div class="card-body">

                <!-- Deposit Form -->
                <form action="/transact/withdraw" method="POST" class="deposit-form">
                    <!-- Form Group -->
                    <div class="form-group mb-2">
                        <label for=""> Enter Withdrawal Amount</label>
                        <input type="text" name="withdrawal_amount"class="form-control" placeholder="Enter Withdrawal Amount">
                    </div>
                    <!-- End Of Form Group -->

                    <!-- Form Group -->
                    <div class="form-group">
                        <label for="">Select Account</label>
                        <!-- Select Account Option -->
                        <select name="account_id" class="form-control" id="">
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
                        <button id="" class="btn btn-md transact-btn">Withdraw</button>
                    </div>
                    <!-- End Of Form Group -->
                </form>
                <!-- End Withdrawal Form  -->
            </div>
            <!-- End Of Card Body -->
        </div>
        <!-- End Of Card: Withdraw Card -->


    </div>
</div>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header">
        <h5 id="offcanvasRightLabel" class="text-white">Create / Add on Account</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <div class="card">
            <div class="card-body">
                <form action="" class="add-account-form">
                    <div class="form-group mb-3">
                        <label for="">Enter Account Name</label>
                        <input type="text" name="account_name" class="form-control" placeholder="Enter Account name..">
                    </div>
                    <div class="form-group mb-3">
                        <label for="" >Select Account Type</label>
                        <select name="account_type" class="form-control" id="">
                            <option value="">-- Select Account Type --</option>
                            <option value="check">Check</option>
                            <option value="savings">Savings</option>
                            <option value="business">Business</option>
                        </select>
                    </div>
                    <div class="form-group my-2">
                        <button id="" class="btn btn-md transact-btn">Add Account </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="container d-flex ">
    <button  class="btn " style="background-color: #e77918" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
        <i class="fa fa-credit-card"  aria-hidden="true"></i> Add New Account
    </button>

    <button  class="btn btn-warning ms-auto" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
        <i class="fa fa-address-card"></i> Transact
    </button>
</div>
<div class="container d-flex py-3">
    <h2 class="mr-auto">Total Account Balanse</h2>
    <h2 class="ms-auto">0.00</h2>
</div>
<div class="container mt-2 accordion accordion-flush" id="accordionFlushExample">
    <div class="accordion-item">
        <h2 class="accordion-header" id="flush-headingOne">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                Accordion Item #1
            </button>
        </h2>
        <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
            <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
        </div>
    </div>
    <div class="accordion-item">
        <h2 class="accordion-header" id="flush-headingTwo">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                Accordion Item #2
            </button>
        </h2>
        <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
            <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
        </div>
    </div>
    <div class="accordion-item">
        <h2 class="accordion-header" id="flush-headingThree">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                Accordion Item #3
            </button>
        </h2>
        <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
            <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
        </div>
    </div>
</div>

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
<script src="../js/main.js"></script>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</html>