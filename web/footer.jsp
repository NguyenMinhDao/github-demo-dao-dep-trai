<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="footer">
    <div class="footer-middle">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-lg-3">
                    <div class="widget widget-about">
                        <img src="assets/images/logo.png" class="footer-logo" alt="Footer Logo" width="105" height="25">
                        <p>Discover the latest courses wonders under one roof! Find cutting-edge features, sleek designs, and unbeatable prices at our courses from the best instru.</p>

                        <div class="social-icons">
                            <a href="https://www.facebook.com/profile.php?id=100009295728123" class="social-icon" target="_blank" title="Facebook"><i class="icon-facebook-f"></i></a>
                            <a href="#" class="social-icon" target="_blank" title="Twitter"><i class="icon-twitter"></i></a>
                            <a href="#" class="social-icon" target="_blank" title="Instagram"><i class="icon-instagram"></i></a>
                            <a href="#" class="social-icon" target="_blank" title="Youtube"><i class="icon-youtube"></i></a>
                            <a href="#" class="social-icon" target="_blank" title="Pinterest"><i class="icon-pinterest"></i></a>
                        </div><!-- End .soial-icons -->
                    </div><!-- End .widget about-widget -->
                </div><!-- End .col-sm-6 col-lg-3 -->

                <div class="col-sm-6 col-lg-3">
                    <div class="widget">
                        <h4 class="widget-title">Useful Links</h4><!-- End .widget-title -->

                        <ul class="widget-list">
                            <li><a href="#">How to purchase</a></li>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="https://www.facebook.com/profile.php?id=100009295728123">Contact us</a></li>
                        </ul><!-- End .widget-list -->
                    </div><!-- End .widget -->
                </div><!-- End .col-sm-6 col-lg-3 -->

                <div class="col-sm-6 col-lg-3">
                    <div class="widget">
                        <h4 class="widget-title">Customer Service</h4><!-- End .widget-title -->

                        <ul class="widget-list">
                            <li><a href="#">Payment Methods</a></li>
                            <li><a href="#">Money-back guarantee!</a></li>
                            <li><a href="#">Terms and conditions</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                        </ul><!-- End .widget-list -->
                    </div><!-- End .widget -->
                </div><!-- End .col-sm-6 col-lg-3 -->

                <div class="col-sm-6 col-lg-3">
                    <div class="widget">
                        <h4 class="widget-title">My Account</h4><!-- End .widget-title -->

                        <ul class="widget-list">
                            <c:if test="${sessionScope.account == null}"><li><a href="login">Log in</a></li> </c:if>
                            <c:if test="${sessionScope.account != null}"><li><a href="logout">Log out</a></li></c:if>
                            <li><a href="cart">View Cart</a></li>
                            <li><a href="management">Track My Order</a></li>
                            <li><a href="#">Help</a></li>
                        </ul><!-- End .widget-list -->
                    </div><!-- End .widget -->
                </div><!-- End .col-sm-6 col-lg-3 -->
            </div><!-- End .row -->
        </div><!-- End .container -->
    </div><!-- End .footer-middle -->
</footer><!-- End .footer -->