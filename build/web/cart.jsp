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
                            <h1 class="page-title">My Courses<span>Cart</span></h1>
                        </div><!-- End .container -->
                    </div><!-- End .page-header -->
                    <nav aria-label="breadcrumb" class="breadcrumb-nav">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Cart</li>
                            </ol>
                        </div><!-- End .container -->
                    </nav><!-- End .breadcrumb-nav -->

                <c:choose>
                    <c:when test="${empty sessionScope.cart.items}">
                        <div class="page-content">
                            <div class="container">
                                <div class="empty-cart">
                                    <p>There are no items in the shopping cart. Please return to the store to continue shopping.</p>
                                    <a href="home" class="btn btn-outline-primary-2">
                                        <span>GO SHOP</span>
                                        <i class="icon-long-arrow-right"></i>
                                    </a></div>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${not empty sessionScope.cart.items}">
                        <div class="page-content">
                            <div class="cart">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-9">
                                            <table class="table table-cart table-mobile">
                                                <thead>
                                                    <tr>
                                                        <th>Product</th>
                                                        <th>Price</th>
                                                        <th>Quantity</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach var="o" items="${cart.items}">
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
                                                            <td class="price-col">$${o.p.price}</td>
                                                            <td class="quantity-col">
                                                                <div class="cart-product-quantity">
                                                                    <div class="input-group input-spinner">
                                                                        <div class="input-group-prepend">
                                                                            <a href="update?PID=${o.p.productId}&action=minus" style="min-width:26px" class="btn btn-decrement btn-spinner">
                                                                                <i class="icon-minus"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div class="form-control" style="text-align:center">
                                                                            ${o.quantity}
                                                                        </div>
                                                                        <div class="input-group-append">
                                                                            <a href="update?PID=${o.p.productId}&action=plus" style="min-width:26px" class="btn btn-increment btn-spinner">
                                                                                <i class="icon-plus"></i>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div><!-- End .cart-product-quantity -->
                                                            </td>
                                                            <td class="remove-col"><a class="btn-remove" href="delete?PID=${o.p.productId}"><i class="icon-close"></i></a></td>
                                                        </tr>

                                                    </c:forEach>
                                                </tbody>
                                            </table><!-- End .table table-wishlist -->
                                        </div><!-- End .col-lg-9 -->

                                        <aside class="col-lg-3">
                                            <div class="summary">
                                                <h3 class="summary-title">Your Cart</h3><!-- End .summary-title -->

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
                                                        <tr class="summary-total">
                                                            <td>Total:</td>
                                                            <td>$${total}</td>
                                                        </tr><!-- End .summary-total -->
                                                    </tbody>
                                                </table><!-- End .table table-summary -->

                                                <a href="checkout" class="btn btn-outline-primary-2 btn-order btn-block">PROCEED TO CHECKOUT</a>
                                            </div><!-- End .summary -->

                                            <a href="home" class="btn btn-outline-dark-2 btn-block mb-3"><span>CONTINUE SHOPPING</span><i class="icon-refresh"></i></a>
                                        </aside><!-- End .col-lg-3 -->
                                    </div><!-- End .row -->
                                </div><!-- End .container -->
                            </div><!-- End .cart -->
                        </div><!-- End .page-content -->
                    </c:when>
                </c:choose>
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