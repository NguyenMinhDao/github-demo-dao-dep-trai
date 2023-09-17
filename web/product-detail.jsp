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
        <link rel="stylesheet" href="assets/css/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/plugins/magnific-popup/magnific-popup.css">
        <!-- Main CSS File -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/plugins/nouislider/nouislider.css">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>

    <body>
        <div class="page-wrapper">
            <jsp:include page="header.jsp"></jsp:include>
                <main class="main">
                    <div class="page-header text-center" style="background-image: url('img/background-image-bg.jpg')">
                        <div class="container">
                            <h1 class="page-title">My Courses<span>Courses to get you started</span></h1>
                        </div><!-- End .container -->
                    </div>
                    <nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-2">
                        <div class="container d-flex align-items-center">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">${P.name}</li>
                        </ol>
                    </div><!-- End .container -->
                </nav><!-- End .breadcrumb-nav -->

                <div class="page-content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-9">
                                <div class="product-details-top">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="product-gallery">
                                                <figure class="product-main-image">
                                                    <img src="${P.img}" alt="product image">
                                                </figure><!-- End .product-main-image -->
                                            </div><!-- End .product-gallery -->
                                        </div>

                                        <div class="col-md-7 mt-1">
                                            <div class="product-details product-details-sidebar">
                                                <h1 class="product-title">${P.name}</h1><!-- End .product-title -->

                                                <div class="product-price">
                                                    $${P.price}
                                                </div><!-- End .product-price -->

                                                <div class="product-content">
                                                    <h2 style="font-size: 24px">What you'll learn</h2>
                                                    <ul>
                                                        <li><i class="fa-solid fa-check"></i> Test your knowledge with a diverse range of quizzes covering topics.</li>
                                                        <li><i class="fa-solid fa-check"></i> Earn various programming languages and cutting-edge technologies through interactive tutorials, coding exercises, and real-world projects.</li>
                                                        <li><i class="fa-solid fa-check"></i> Access a rich collection of academic resources and study materials to enhance your learning experience.</li>
                                                        <li><i class="fa-solid fa-check"></i> Explore career paths, job opportunities, and valuable insights into the professional world.</li>
                                                    </ul>
                                                </div><!-- End .product-content -->

                                                <c:set var="quantity" value="0"></c:set>
                                                <c:forEach var="o" items="${sessionScope.cart.items}">
                                                    <c:if test="${o.p.productId == P.productId}">
                                                        <c:set var="quantity" value="${o.quantity}"></c:set>
                                                    </c:if>
                                                </c:forEach>

                                                <c:set var="pendingItemQuantity" value="0"></c:set>
                                                <c:forEach var="o" items="${pendingItems}">
                                                    <c:if test="${o.p.productId == P.productId}">
                                                        <c:set var="pendingItemQuantity" value="${o.quantity}"></c:set>
                                                    </c:if>
                                                </c:forEach>

                                                <div class="product-details-action">
                                                    <c:if test="${quantity + pendingItemQuantity < P.quantity}">
                                                        <form action="add" method="get">
                                                            <input type="hidden" name="PID" value="${P.productId}">
                                                            <div class="details-action-col">
                                                                <div class="product-details-quantity">
                                                                    <input type="number" id="qty" class="form-control" name="quantity" value="1" min="1" max="${P.quantity - quantity - pendingItemQuantity}" step="1" data-decimals="0" required>
                                                                </div><!-- End .product-details-quantity -->
                                                                <button type="submit" class="btn btn-product btn-cart">
                                                                    <span>ADD TO CART</span>
                                                                </button>
                                                            </div><!-- End .details-action-col -->
                                                        </form>
                                                        <div class="test-quiz">
                                                            <button><a href="show.jsp">TEST YOURSELF</a></button>
                                                        </div>     
                                                    </c:if>

                                                    <c:if test="${quantity + pendingItemQuantity == P.quantity}">
                                                        <div class="btn btn-outline-primary disabled" style="opacity:1;color:#cccccc;background-color:#fafafa;border-color:#ebebeb;cursor:default;pointer-events:none">
                                                            OUT OF STOCK
                                                        </div>
                                                    </c:if>
                                                </div><!-- End .product-details-action -->
                                            </div><!-- End .product-details -->
                                        </div>
                                    </div><!-- End .row -->
                                </div><!-- End .product-details-top -->

                                <div class="product-details-tab">
                                    <ul class="nav nav-pills" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="product-desc-link" data-toggle="tab" href="#product-desc-tab" role="tab" aria-controls="product-desc-tab" aria-selected="true">Description</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="product-desc-link-2" data-toggle="tab" href="#product-desc-tab-2" role="tab" aria-controls="product-desc-tab-2" aria-selected="false">Demo</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade show active" id="product-desc-tab" role="tabpanel" aria-labelledby="product-desc-link">
                                            <div class="product-desc-content">
                                                <h3>Courses information</h3>
                                                <p>${P.description}</p>
                                            </div><!-- End .product-desc-content -->
                                        </div><!-- .End .tab-pane -->
                                        <div class="tab-pane fade show active" id="product-desc-tab-2" role="tabpanel" aria-labelledby="product-desc-link-2">
                                            <div class="product-desc-content-2">
                                                <h3>Demo Courses</h3>
                                                <div class="video-container">
                                                    <p>${P.demo}</p>;
                                                </div>
                                            </div><!-- End .product-desc-content -->
                                        </div><!-- .End .tab-pane -->

                                    </div><!-- End .tab-content -->
                                </div><!-- End .product-details-tab -->

                                <h2 class="title text-center mb-4">You May Also Like</h2><!-- End .title text-center -->

                                <div class="owl-carousel owl-simple carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                                     data-owl-options='{
                                     "nav": false, 
                                     "dots": true,
                                     "margin": 20,
                                     "loop": false,
                                     "responsive": {
                                     "0": {
                                     "items":1
                                     },
                                     "480": {
                                     "items":2
                                     },
                                     "768": {
                                     "items":3
                                     },
                                     "992": {
                                     "items":4
                                     },
                                     "1200": {
                                     "items":4,
                                     "nav": true,
                                     "dots": false
                                     }
                                     }
                                     }'>
                                    <c:forEach var="o" items="${listP}">
                                        <c:if test="${o.productId != P.productId}">
                                            <div class="product product-7 text-center">
                                                <figure class="product-media">
                                                    <a href="detail?PID=${o.productId}">
                                                        <img src="${o.img}" alt="Product image" class="product-image">
                                                    </a>

                                                    <div class="product-action">
                                                        <a href="detail?PID=${o.productId}" class="btn-product icon-eye"><span>view detail</span></a>
                                                    </div><!-- End .product-action -->
                                                </figure><!-- End .product-media -->

                                                <div class="product-body">
                                                    <h3 class="product-title"><a href="detail?PID=${o.productId}">${o.name}</a></h3><!-- End .product-title -->
                                                    <div class="product-price">
                                                        $${o.price}
                                                    </div><!-- End .product-price -->
                                                </div><!-- End .product-body -->
                                            </div><!-- End .product -->
                                        </c:if>
                                    </c:forEach>    
                                </div><!-- End .owl-carousel -->
                            </div><!-- End .col-lg-9 -->

                            <aside class="col-lg-3 mt-1">
                                <div class="sidebar sidebar-product">
                                    <div class="widget widget-products">
                                        <h4 class="widget-title">Top Selling</h4><!-- End .widget-title -->

                                        <c:forEach var="o" items="${listI}">
                                            <div class="products">
                                                <div class="product product-sm">
                                                    <figure class="product-media">
                                                        <a href="detail?PID=${o.p.productId}">
                                                            <img src="${o.p.img}" alt="Product image" class="product-image">
                                                        </a>
                                                    </figure>

                                                    <div class="product-body">
                                                        <h5 class="product-title"><a href="detail?PID=${o.p.productId}">${o.p.name}</a></h5><!-- End .product-title -->
                                                        <div class="product-price">
                                                            <span>$${o.p.price}</span>
                                                        </div><!-- End .product-price -->
                                                    </div><!-- End .product-body -->
                                                </div><!-- End .product product-sm -->
                                            </div><!-- End .products -->
                                        </c:forEach>

                                        <a href="home" class="btn btn-outline-dark-3"><span>View More Products</span><i class="icon-long-arrow-right"></i></a>
                                    </div><!-- End .widget widget-products -->

                                </div><!-- End .sidebar sidebar-product -->
                            </aside><!-- End .col-lg-3 -->
                        </div><!-- End .row -->

                    </div><!-- End .container -->
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
        <script src="assets/js/jquery.elevateZoom.min.js"></script>
        <script src="assets/js/bootstrap-input-spinner.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>