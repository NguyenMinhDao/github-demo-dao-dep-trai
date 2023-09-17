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
                    <div class="page-header text-center" style="background-image: url('assets/images/background-image-bg.jpg')">
                        <div class="container">
                            <h1 class="page-title">My Courses<span>Order Detail</span></h1>
                        </div><!-- End .container -->
                    </div><!-- End .page-header -->
                    <nav aria-label="breadcrumb" class="breadcrumb-nav">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item"><a href="management">My Account</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Order Detail</li>
                            </ol>
                        </div><!-- End .container -->
                    </nav><!-- End .breadcrumb-nav -->
                    <div class="page-content">
                        <div class="cart">
                            <div class="container">
                            <c:if test="${not empty requestScope.listItem}">
                                <h1 style="margin-bottom:2.5rem;font-weight:500;font-size:1.6rem;">
                                    Order ID: <span style="color:#c96">#${requestScope.oid}</span>
                                </h1>

                                <div class="row">
                                    <div class="col-lg-9">
                                        <table class="table table-cart">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Price</th>
                                                    <th>Qty</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach var="o" items="${requestScope.listItem}">
                                                    <tr>
                                                        <td class="product-col">
                                                            <div class="product">
                                                                <figure class="product-media">
                                                                    <a href="detail?PID=${o.p.productId}">
                                                                        <img src="${o.p.img}" alt="Product image">
                                                                    </a>
                                                                </figure>

                                                                <h3 class="product-title">
                                                                    <a href="detail?PID=${o.p.productId}">${o.p.name}</a>
                                                                </h3><!-- End .product-title -->
                                                            </div><!-- End .product -->
                                                        </td>
                                                        <td class="price-col" style="width:240px">$${o.p.price}</td>
                                                        <td class="stock-col" style="width:80px">${o.quantity}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div><!-- End .col-lg-9 -->

                                    <aside class="col-lg-3">
                                        <div class="summary" style="padding-bottom:1.5rem">
                                            <h3 class="summary-title">Order Summary</h3>

                                            <table class="table table-summary">
                                                <thead>
                                                    <tr>
                                                        <th>Product</th>
                                                        <th>Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="o" items="${requestScope.listItem}">
                                                        <tr>
                                                            <td>${o.p.name}</td>
                                                            <td>$${o.subtotal}</td>
                                                        </tr>
                                                        <c:set var="total" value="${total + o.subtotal}"></c:set>
                                                    </c:forEach>
                                                    <tr class="summary-total">
                                                        <td>Total:</td>
                                                        <td>$${total}</td>
                                                    </tr><!-- End .summary-total -->
                                                </tbody>
                                            </table>
                                        </div><!-- End .summary -->
                                    </aside><!-- End .col-lg-3 -->
                                </div><!-- End .row -->

                            </c:if>
                        </div><!-- End .container -->
                    </div>
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
        <script src="assets/js/bootstrap-input-spinner.js"></script>
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>