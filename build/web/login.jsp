<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">


    <!-- molla/login.html  22 Nov 2019 10:04:03 GMT -->
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>My Courses</title>
        <!-- Plugins CSS File -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <!-- Main CSS File -->
        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>
        <div class="page-wrapper">
            <jsp:include page="header.jsp"></jsp:include>

                <main class="main">
                    <nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-0">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Login</li>
                            </ol>
                        </div><!-- End .container -->
                    </nav><!-- End .breadcrumb-nav -->
                    <div class="login-page bg-image pt-8 pb-8 pt-md-12 pb-md-12 pt-lg-17 pb-lg-17" style="background-image: url('img/login-bg.jpg')">
                        <div class="container">
                            <div class="form-box">
                                <div class="form-tab">
                                    <ul class="nav nav-pills nav-fill" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="signin-tab-2" data-toggle="tab" href="#signin-2" role="tab" aria-controls="signin-2" aria-selected="false">Sign In</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="register-tab-2" data-toggle="tab" href="#register-2" role="tab" aria-controls="register-2" aria-selected="true">Register</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade show active" id="signin-2" role="tabpanel" aria-labelledby="signin-tab-2">
                                        
                                        <c:if test="${message!=null}"><div class="alert-message">${message}</div></c:if>
                                            
                                            <form action="login" method="post">
                                                <div class="form-group">
                                                    <label for="singin-email-2">Username *</label>
                                                    <input type="text" class="form-control" id="singin-email-2" name="login-username" required>
                                                </div><!-- End .form-group -->

                                                <div class="form-group">
                                                    <label for="singin-password-2">Password *</label>
                                                    <input type="password" class="form-control" id="singin-password-2" name="login-password" required>
                                                </div><!-- End .form-group -->

                                                <div class="form-footer pt-2 pb-0" style="border-bottom:0">
                                                    <button type="submit" class="btn btn-outline-primary-2">
                                                        <span>LOG IN</span>
                                                        <i class="icon-long-arrow-right"></i>
                                                    </button>
                                                </div><!-- End .form-footer -->
                                            </form>
                                        </div><!-- .End .tab-pane -->
                                        <div class="tab-pane fade" id="register-2" role="tabpanel" aria-labelledby="register-tab-2">

                                            <form action="signup" method="post">
                                                <div class="form-group">
                                                    <label for="register-email-2">Display Name *</label>
                                                    <input type="text" class="form-control" id="register-email-2" name="display-name" required>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <label for="register-email-2">Username *</label>
                                                    <input type="text" class="form-control" id="register-email-2" name="signup-username" required>
                                                </div><!-- End .form-group -->

                                                <div class="form-group">
                                                    <label for="register-password-2">Password *</label>
                                                    <input type="password" class="form-control" id="register-password-2" name="signup-password" required>
                                                </div><!-- End .form-group -->

                                                <div class="form-footer pt-2 pb-0" style="border-bottom:0">
                                                    <button type="submit" class="btn btn-outline-primary-2">
                                                        <span>SIGN UP</span>
                                                        <i class="icon-long-arrow-right"></i>
                                                    </button>
                                                </div><!-- End .form-footer -->
                                            </form>
                                        </div><!-- .End .tab-pane -->
                                    </div><!-- End .tab-content -->
                                </div><!-- End .form-tab -->
                            </div><!-- End .form-box -->
                        </div><!-- End .container -->
                    </div><!-- End .login-page section-bg -->
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
    </body>


    <!-- molla/login.html  22 Nov 2019 10:04:03 GMT -->
</html>