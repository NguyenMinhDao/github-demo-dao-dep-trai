<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header">
    <div class="header-top">
        <div class="container" style="padding:1rem">
            <div class="header-right">
                <ul class="top-menu">
                    <li>
                        <a href="#">Links</a>
                        <ul>   
                            <c:choose>
                                <c:when test="${sessionScope.account == null}">
                                    <li><a href="login"><i class="icon-user"></i>Login</a></li>
                                    </c:when>
                                    <c:when test="${sessionScope.account != null}">
                                    <li><a href="management"><i class="icon-user"></i>${sessionScope.account.fullname}</a></li>
                                    <li><a href="logout"> <i class='fa fa-sign-out'></i>Logout</a></li>
                                    </c:when>
                                </c:choose>
                        </ul>
                    </li>
                </ul><!-- End .top-menu -->
            </div><!-- End .header-right -->
        </div><!-- End .container -->
    </div><!-- End .header-top -->

    <div class="header-middle sticky-header">
        <div class="container">
            <div class="header-left">
                <button class="mobile-menu-toggler">
                    <span class="sr-only">List of Courses</span>
                    <i class="icon-bars"></i>
                </button>

                <a href="home" class="logo">
                    <img src="assets/images/logo.png" alt="Molla Logo" width="105" height="25">
                </a>

                <nav class="main-nav">
                    <ul class="menu sf-arrows">
                        <li class="megamenu-container active">
                            <a href="home" class="pr-1">Home</a>
                        </li>

                        <li>
                            <a href="" class="sf-with-ul">Category</a>

                            <ul>
                                <c:forEach var="o" items="${listC}">
                                    <li>
                                        <a href="home?cid=${o.categoryId}">${o.name}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>

                        <li>
                            <a href="" class="sf-with-ul">Pages</a>
                            <ul>
                                <li><a href="management">My Account</a></li>
                                <li><a href="cart">Cart</a></li>
                                    <c:if test="${sessionScope.account == null}">
                                    <li><a href="login">Login</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.account != null}">
                                    <li><a href="logout">Logout</a></li>
                                    </c:if>
                            </ul>
                        </li>

                    </ul><!-- End .menu -->
                </nav><!-- End .main-nav -->
            </div><!-- End .header-left -->

            <div class="header-right">
                <div class="header-search">
                    <a href="#" class="search-toggle" role="button" title="Search"><i class="icon-search"></i></a>
                    <form action="home" method="get">
                        <div class="header-search-wrapper">
                            <label for="q" class="sr-only">Search</label>
                            <input type="search" class="form-control" name="searchValue" id="q" placeholder="Search..." required>
                        </div><!-- End .header-search-wrapper -->
                    </form>
                </div><!-- End .header-search -->

                <div class="dropdown cart-dropdown">
                    <a href="cart" class="dropdown-toggle" aria-haspopup="true" aria-expanded="false" data-display="static">
                        <i class="icon-shopping-cart"></i>
                        <c:choose>
                            <c:when test="${empty sessionScope.cart.items}">
                                <span class="cart-count">0</span>
                            </c:when>
                            <c:when test="${not empty sessionScope.cart.items}">
                                <span class="cart-count">${sessionScope.cart.items.size()}</span>
                            </c:when>
                        </c:choose>
                    </a>

                    <div class="dropdown-menu dropdown-menu-right">
                        <c:choose>
                            <c:when test="${empty sessionScope.cart.items}">
                                <p>Your cart is empty.</p>
                            </c:when>
                            <c:when test="${not empty sessionScope.cart.items}">
                                <div class="dropdown-cart-products">
                                    <c:forEach var="o" items="${sessionScope.cart.items}">
                                        <div class="product">
                                            <div class="product-cart-details">
                                                <h4 class="product-title">
                                                    <a href="detail?PID=${o.p.productId}">${o.p.name}</a>
                                                </h4>

                                                <span class="cart-product-info">
                                                    <span class="cart-product-qty">${o.quantity}</span>
                                                    x $${o.p.price}
                                                </span>
                                            </div><!-- End .product-cart-details -->

                                            <figure class="product-image-container">
                                                <a href="detail?PID=${o.p.productId}" class="product-image">
                                                    <img src="${o.p.img}" alt="product">
                                                </a>
                                            </figure>
                                            <a href="delete?PID=${o.p.productId}" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                                        </div><!-- End .product -->
                                        <c:set var="total" value="${total + o.subtotal}"></c:set>
                                    </c:forEach>
                                </div><!-- End .cart-product -->

                                <div class="dropdown-cart-total">
                                    <span>Total</span>

                                    <span class="cart-total-price">$${total}</span>
                                </div><!-- End .dropdown-cart-total -->
                                <div class="dropdown-cart-action">
                                    <a href="cart" class="btn btn-primary">View Cart</a>
                                    <a href="checkout" class="btn btn-outline-primary-2"><span>Checkout</span><i class="icon-long-arrow-right"></i></a>
                                </div><!-- End .dropdown-cart-total -->
                            </c:when>
                        </c:choose>
                    </div><!-- End .dropdown-menu -->
                </div><!-- End .cart-dropdown -->
            </div><!-- End .header-right -->
        </div><!-- End .container -->
    </div><!-- End .header-middle -->
</header><!-- End .header -->