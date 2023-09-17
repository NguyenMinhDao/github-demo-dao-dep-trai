<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Online Courses - Learn Anything</title>
        <!-- Plugins CSS File -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <!-- Main CSS File -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/plugins/nouislider/nouislider.css">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
    </head>

    <body>
        <div class="page-wrapper">
            <jsp:include page="header.jsp"></jsp:include>  

                <main class="main">
                    <div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
                        <div class="container">
                            <h1 class="page-title">My Courses<span>Home</span></h1>
                        </div><!-- End .container -->
                    </div><!-- End .page-header -->
                    <nav aria-label="breadcrumb" class="breadcrumb-nav mb-2">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item active" aria-current="page">Home</li>
                            </ol>
                        </div><!-- End .container -->
                    </nav><!-- End .breadcrumb-nav -->

                    <div class="page-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="toolbox">
                                        <div class="toolbox-right">
                                            <div class="toolbox-info mb-1 pr-4">
                                                Showing <span>${listP.size()} of ${size}</span> Products
                                        </div><!-- End .toolbox-info -->
                                    </div><!-- End .toolbox-left -->
                                </div><!-- End .toolbox -->

                                <div class="products mb-3">
                                    <div class="row">
                                        <c:forEach var="o" items="${listP}">
                                            <div class="col-6 col-md-4 col-lg-3">
                                                <div class="product product-7 text-center">
                                                    <figure class="product-media">
                                                        <c:set var="pendingItemQuantity" value="0"></c:set>
                                                        <c:forEach var="i" items="${pendingItems}">
                                                            <c:if test="${i.p.productId == o.productId}">
                                                                <c:set var="pendingItemQuantity" value="${i.quantity}"></c:set>
                                                            </c:if>
                                                        </c:forEach>

                                                        <c:forEach var="i" items="${sessionScope.cart.items}">
                                                            <c:if test="${i.p.productId == o.productId}">
                                                                <c:if test="${i.quantity + pendingItemQuantity == o.quantity}">
                                                                    <span class="product-label label-out">Out of Stock</span>
                                                                </c:if>
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:if test="${o.quantity == 0}">
                                                            <span class="product-label label-out">Out of Stock</span>
                                                        </c:if>
                                                        <a href="detail?PID=${o.productId}">
                                                            <img src="${o.img}" alt="Product image" class="product-image">
                                                        </a>

                                                        <div class="product-action">
                                                            <a href="detail?PID=${o.productId}" class="btn-product icon-eye">
                                                                <span>view detail</span>
                                                            </a>
                                                        </div><!-- End .product-action -->
                                                    </figure><!-- End .product-media -->

                                                    <div class="product-body">
                                                        <h3 class="product-title"><a href="detail?PID=${o.productId}">${o.name}</a></h3>
                                                        <div class="product-price">
                                                            $${o.price}
                                                        </div><!-- End .product-price -->
                                                    </div><!-- End .product-body -->
                                                </div><!-- End .product -->
                                            </div><!-- End .col-sm-6 col-lg-4 -->
                                        </c:forEach>
                                    </div><!-- End .row -->
                                </div><!-- End .products -->


                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center">
                                        <c:if test="${currentPage == 1}">
                                            <li class="page-item disabled">
                                                <a class="page-link page-link-prev" href="#" aria-label="Previous" tabindex="-1" aria-disabled="true">
                                                    <span aria-hidden="true"><i class="icon-long-arrow-left"></i></span>Prev
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${currentPage > 1}">
                                            <li class="page-item">
                                                <a class="page-link page-link-prev" href="home?page=${currentPage - 1}" aria-label="Previous" tabindex="-1" aria-disabled="true">
                                                    <span aria-hidden="true"><i class="icon-long-arrow-left"></i></span>Prev
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:forEach begin="1" end="${endPage}" var="o">
                                            <c:if test="${o == currentPage}">
                                                <li class="page-item active" aria-current="page"><a class="page-link" href="">${o}</a></li>
                                                </c:if>
                                                <c:if test="${o != currentPage}">
                                                <li class="page-item" aria-current="page"><a class="page-link" href="home?page=${o}">${o}</a></li>
                                                </c:if>
                                            </c:forEach>
                                        <li class="page-item-total">of ${endPage}</li>

                                        <c:if test="${currentPage < endPage}">
                                            <li class="page-item">
                                                <a class="page-link page-link-next" href="home?page=${currentPage + 1}" aria-label="Next">
                                                    Next <span aria-hidden="true"><i class="icon-long-arrow-right"></i></span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${currentPage == endPage}">
                                            <li class="page-item disabled">
                                                <a class="page-link page-link-next" href="#" aria-label="Next">
                                                    Next <span aria-hidden="true"><i class="icon-long-arrow-right"></i></span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>
                            </div>
                            <aside class="col-lg-3 order-lg-first">
                                <div class="sidebar sidebar-shop">
                                    <div class="widget widget-clean">
                                        <label>Filters:</label>
                                        <a href="home" class="pr-2">Clear</a>
                                    </div><!-- End .widget widget-clean -->

                                    <div class="widget widget-collapsible">
                                        <h3 class="widget-title">
                                            <a data-toggle="collapse" href="#widget-1" role="button" aria-expanded="true" aria-controls="widget-1">
                                                Category
                                            </a>
                                        </h3><!-- End .widget-title -->

                                        <div class="collapse show" id="widget-1">
                                            <div class="widget-body">
                                                <div class="filter-items filter-items-count">
                                                    <ul>
                                                        <c:forEach var="o" items="${listC}">
                                                            <li class="custom-control mb-1 pl-0">
                                                                <a href="home?cid=${o.categoryId}" class="tab-trigger-link ${o.categoryId != cid ? '' : 'link-underline'}" style="${o.categoryId != cid ? 'color: #000' : ''}"> 
                                                                    ${o.name}
                                                                </a>
                                                                <span class="item-count">${o.itemCount}</span>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div><!-- End .filter-items -->
                                            </div><!-- End .widget-body -->
                                        </div><!-- End .collapse -->
                                    </div><!-- End .widget -->
                                </div><!-- End .sidebar sidebar-shop -->
                            </aside>
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
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/wNumb.js"></script>
        <script src="assets/js/nouislider.min.js"></script>
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>