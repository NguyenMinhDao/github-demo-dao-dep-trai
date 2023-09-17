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
                            <h1 class="page-title">My Courses<span>Checkout</span></h1>
                        </div><!-- End .container -->
                    </div><!-- End .page-header -->
                    <nav aria-label="breadcrumb" class="breadcrumb-nav">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item"><a href="cart">Cart</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                            </ol>
                        </div><!-- End .container -->
                    </nav><!-- End .breadcrumb-nav -->

                    <div class="page-content">
                        <div class="checkout">
                            <div class="container">
                                <form action="order" method="post">
                                    <div class="row">
                                        <div class="col-lg-9">
                                            <h2 class="checkout-title">
                                                Billing Details
                                            </h2><!--End .checkout-title -->

                                            <label>Full Name *</label>
                                            <input type="text" class="form-control" name="fullname" value="${account.fullname}" required>

                                        <label>Phone Number *</label>
                                        <input type="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" class="form-control" name="phone" value="${account.phone}" required placeholder="012-345-6789" id="phoneInput"  oninput="formatPhoneNumber(this)">

                                        <label>Email (Optional)</label>
                                        <input type="email" class="form-control" name="email" value="${account.email}" placeholder="abc@example.com">

                                        <label>Address *</label>
                                        <textarea class="form-control" cols="30" rows="4" name="address" required>${account.address}</textarea>
                                    </div><!-- End .col-lg-9 -->
                                    <aside class="col-lg-3">
                                        <div class="summary">
                                            <h3 class="summary-title">Your Order</h3><!-- End .summary-title -->

                                            <table class="table table-summary">
                                                <thead>
                                                    <tr>
                                                        <th>Product</th>
                                                        <th>Total</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach var="o" items="${cart.items}">
                                                        <tr>
                                                            <td>${o.p.name}</td>
                                                            <td>$${o.subtotal}</td>
                                                        </tr>
                                                        <c:set var="total" value="${total + o.subtotal}"></c:set>
                                                    </c:forEach>
                                                <input type="hidden" name="total" value="${total}">
                                                <tr class="summary-total">
                                                    <td>Total:</td>
                                                    <td>$${total}</td>
                                                </tr><!-- End .summary-total -->
                                                </tbody>
                                            </table><!-- End .table table-summary -->

                                            <button type="submit" class="btn btn-outline-primary-2 btn-order btn-block">PLACE ORDER</button>
                                        </div><!-- End .summary -->
                                    </aside><!-- End .col-lg-3 -->
                                </div><!-- End .row -->
                            </form>

                        </div><!-- End .container -->
                    </div><!-- End .checkout -->
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


    <!-- molla/checkout.html  22 Nov 2019 09:55:06 GMT -->
</html>