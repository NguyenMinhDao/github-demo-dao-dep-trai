<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>My Courses</title>
        <!-- Plugins CSS File -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <!-- Main CSS File -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
    </head>

    <body>
        <div class="page-wrapper">
            <jsp:include page="header.jsp"></jsp:include>

                <main class="main">
                    <div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
                        <div class="container">
                            <h1 class="page-title">My Courses<span>My Account</span></h1>
                        </div><!-- End .container -->
                    </div><!-- End .page-header -->
                    <nav aria-label="breadcrumb" class="breadcrumb-nav mb-3">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">My Account</li>
                            </ol>
                        </div><!-- End .container -->
                    </nav><!-- End .breadcrumb-nav -->

                    <div class="page-content">
                        <div class="dashboard">
                            <div class="container">
                                <div class="row">
                                    <aside class="col-md-4 col-lg-3">
                                        <ul class="nav nav-dashboard flex-column mb-3 mb-md-0" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="tab-dashboard-link" data-toggle="tab" href="#tab-dashboard" role="tab" aria-controls="tab-dashboard" aria-selected="true">Dashboard</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="tab-orders-link" data-toggle="tab" href="#tab-orders" role="tab" aria-controls="tab-orders" aria-selected="false">Orders</a>
                                            </li>
                                        <c:if test="${requestScope.role != 3}">
                                            <li class="nav-item">
                                                <a class="nav-link" id="tab-downloads-link" data-toggle="tab" href="#tab-downloads" role="tab" aria-controls="tab-downloads" aria-selected="false">Manage Products</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${requestScope.role == 1}">
                                            <li class="nav-item">
                                                <a class="nav-link" id="tab-address-link" data-toggle="tab" href="#tab-address" role="tab" aria-controls="tab-address" aria-selected="false">Manage Accounts</a>
                                            </li>
                                        </c:if>
                                        <li class="nav-item">
                                            <a class="nav-link" id="tab-account-link" data-toggle="tab" href="#tab-account" role="tab" aria-controls="tab-account" aria-selected="false">Account Details</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="logout">Sign Out</a>
                                        </li>
                                    </ul>
                                </aside><!-- End .col-lg-3 -->

                                <div class="col-md-8 col-lg-9">
                                    <div class="tab-content">
                                        <div class="tab-pane fade show active" id="tab-dashboard" role="tabpanel" aria-labelledby="tab-dashboard-link">
                                            <p>Hello <span class="font-weight-normal text-dark">${account.fullname}</span>
                                                <br>
                                                From your account dashboard you can view your 
                                                <a href="#tab-orders" class="tab-trigger-link">recent orders</a>,
                                                <a href="#tab-downloads" class="tab-trigger-link">  manage products</a>,  and
                                                <a href="#tab-account" class="tab-trigger-link link-underline">edit account details</a>.</p>
                                        </div><!-- .End .tab-pane -->

                                        <div class="tab-pane fade" id="tab-orders" role="tabpanel" aria-labelledby="tab-orders-link">
                                            <c:if test="${empty requestScope.listOrder}">
                                                <p>No order has been made yet.</p>
                                                <a href="home" class="btn btn-outline-primary-2"><span>GO SHOP</span><i class="icon-long-arrow-right"></i></a> 
                                                </c:if>
                                                <c:if test="${not empty requestScope.listOrder}">
                                                <table class="table" style="text-align:center">
                                                    <thead>
                                                        <tr>
                                                            <th>Order ID</th>
                                                            <th>Customer Name</th>
                                                            <th>Phone Number</th>
                                                            <th>Address</th>
                                                            <th>Total</th>
                                                            <th>Order Date</th>
                                                            <th>Status</th>
                                                                <c:if test="${requestScope.role != 3}">
                                                                <th></th>
                                                                <th></th>
                                                                </c:if>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <c:forEach var="o" items="${requestScope.listOrder}">
                                                            <tr>
                                                                <td><a href="orderDetail?orderId=${o.orderId}">#${o.orderId}</a></td>
                                                                <td>${o.customerName}</td>
                                                                <td>${o.customerPhone}</td>
                                                                <td>${o.customerAddress}</td>
                                                                <td>$${o.total}</td>
                                                                <td>${o.orderDate}</td>
                                                                <td>${o.status}</td>
                                                                <c:if test="${requestScope.role != 3 && o.status eq 'pending'}">
                                                                    <td class="remove-col">
                                                                        <a href="status?action=confirm&orderId=${o.orderId}" title="Approve Order">
                                                                            <i class="icon-check-circle-o"></i>
                                                                        </a>
                                                                    </td>
                                                                    <td class="remove-col">
                                                                        <a href="status?action=cancel&orderId=${o.orderId}" title="Disapprove Order">
                                                                            <i class="icon-close"></i>
                                                                        </a>
                                                                    </td>
                                                                </c:if>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </c:if>

                                        </div><!-- .End .tab-pane -->

                                        <c:if test="${requestScope.role != 3}">
                                            <div class="tab-pane fade" id="tab-downloads" role="tabpanel" aria-labelledby="tab-downloads-link">
                                                <c:if test="${empty listP}">
                                                    <p>You haven't sold any products yet.</p>
                                                    <a href="product?action=add" class="btn btn-outline-primary-2">
                                                        <span>SELL NOW</span><i class="icon-long-arrow-right"></i>
                                                    </a>
                                                </c:if>
                                                <c:if test="${not empty listP}">
                                                    <a href="product?action=add" style="float:right; margin-bottom:2rem">
                                                        <i class="icon-plus-square-o"></i>
                                                        <span>Add New</span>
                                                    </a>
                                                    <table class="table table-cart">
                                                        <thead>
                                                            <tr>
                                                                <th>Product</th>
                                                                <th>Price</th>
                                                                <th>Stock</th>
                                                                <th>Edit</th>
                                                                <th>Del</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <c:forEach var="o" items="${listP}">
                                                                <tr>
                                                                    <td class="product-col">
                                                                        <div class="product">
                                                                            <figure class="product-media">
                                                                                <a href="detail?PID=${o.productId}">
                                                                                    <img src="${o.img}" alt="Product image">
                                                                                </a>
                                                                            </figure>

                                                                            <h3 class="product-title">
                                                                                <a href="detail?PID=${o.productId}">${o.name}</a>
                                                                            </h3><!-- End .product-title -->
                                                                        </div><!-- End .product -->
                                                                    </td>
                                                                    <td class="price-col" style="width:160px">$${o.price}</td>
                                                                    <td class="stock-col">${o.quantity}</td>
                                                                    <td style="width:110px">
                                                                        <a href="product?action=update&productId=${o.productId}" title="Edit Product">
                                                                            <i class="icon-edit"></i>
                                                                        </a>
                                                                    </td>
                                                                    <td>
                                                                        <a href="product?action=delete&productId=${o.productId}" title="Delete Product">
                                                                            <i class="icon-close"></i>
                                                                        </a>
                                                                    </td>    
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </c:if>
                                            </div>
                                        </c:if>

                                        <c:if test="${requestScope.role == 1}">
                                            <div class="tab-pane fade" id="tab-address" role="tabpanel" aria-labelledby="tab-address-link">
                                                <table class="table" style="text-align:center">
                                                    <thead>
                                                        <tr>
                                                            <th>Username</th>
                                                            <th>Role</th>
                                                            <th>Set Role</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <c:forEach var="o" items="${requestScope.listA}">
                                                            <tr>
                                                                <td>${o.username}</td>
                                                                <td>
                                                                    <c:if test="${o.role == 2}">Seller</c:if>
                                                                    <c:if test="${o.role == 3}">Customer</c:if>
                                                                    </td>
                                                                    <td>
                                                                    <c:if test="${o.role == 2}">
                                                                        <a href="setRole?username=${o.username}&role=3">Set to Customer</a>
                                                                    </c:if>
                                                                    <c:if test="${o.role == 3}">
                                                                        <a href="setRole?username=${o.username}&role=2">Set to Seller</a>
                                                                    </c:if>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </c:if>

                                        <div class="tab-pane fade" id="tab-account" role="tabpanel" aria-labelledby="tab-account-link">
                                            <form action="updateInfo" method="get">
                                                <label>Display Name</label>
                                                <input type="text" class="form-control" name="fullname" value="${account.fullname}">

                                                <label>Phone number</label>
                                                <input type="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" class="form-control" name="phone" value="${account.phone}" placeholder="012-345-6789" id="phoneInput" oninput="formatPhoneNumber(this)">

                                                <label>Email address</label>
                                                <input type="email" class="form-control" name="email" value="${account.email}" placeholder="abc@example.com">

                                                <label>Address</label>
                                                <textarea class="form-control" cols="30" rows="4" name="address">${account.address}</textarea>

                                                <button type="submit" class="btn btn-outline-primary-2">
                                                    <span>SAVE CHANGES</span>
                                                    <i class="icon-long-arrow-right"></i>
                                                </button>
                                            </form>
                                        </div><!-- .End .tab-pane -->
                                    </div>
                                </div><!-- End .col-lg-9 -->
                            </div><!-- End .row -->
                        </div><!-- End .container -->
                    </div><!-- End .dashboard -->
                </div><!-- End .page-content -->
            </main><!-- End .main -->

            <jsp:include page="footer.jsp"></jsp:include>
            </div><!-- End .page-wrapper -->
            <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

        <jsp:include page="mobile-menu.jsp"></jsp:include>

        <!-- Plugins JS File -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.hoverIntent.min.js"></script>
        <script src="assets/js/jquery.waypoints.min.js"></script>
        <script src="assets/js/superfish.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
        <script src="assets/script.js"></script>
    </body>
</html>