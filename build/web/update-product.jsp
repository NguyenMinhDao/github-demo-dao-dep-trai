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
                    <div class="page-header text-center" style="background-image:url('assets/images/page-header-bg.jpg')">
                        <div class="container">
                            <h1 class="page-title">My Courses<span>Edit Courses</span></h1>
                        </div><!-- End .container -->
                    </div><!-- End .page-header -->
                    <nav aria-label="breadcrumb" class="breadcrumb-nav">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item"><a href="management">My Account</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Update Courses</li>
                            </ol>
                        </div><!-- End .container -->
                    </nav><!-- End .breadcrumb-nav -->
                    <div class="page-content">
                        <div class="container">
                            <form action="product?action=update&productId=${requestScope.p.productId}" method="post">
                            <label>Courses Name</label>
                            <input type="text" class="form-control" name="name" value="${requestScope.p.name}">

                            <label>Image Url</label>
                            <input type="text" class="form-control" name="img" value="${requestScope.p.img}">

                            <div class="row">
                                <div class="col-sm-4">
                                    <label>Price</label>
                                    <input type="text" pattern="\d*\.?\d*" class="form-control" name="price" value="${requestScope.p.price}">
                                </div>

                                <div class="col-sm-4">
                                    <label>Quantity</label>
                                    <input type="number" class="form-control" name="quantity" value="${requestScope.p.quantity}" step="1">
                                </div>

                                <div class="col-sm-4">
                                    <label>Category</label>
                                    <select name="categoryId" class="form-control custom-select">
                                        <c:forEach var="o" items="${requestScope.listC}">
                                            <c:if test="${o.categoryId == requestScope.p.categoryId}">
                                                <option value="${o.categoryId}" selected>${o.name}</option>
                                            </c:if>
                                            <c:if test="${o.categoryId != requestScope.p.categoryId}">
                                                <option value="${o.categoryId}">${o.name}</option>
                                            </c:if>
                                        </c:forEach> 
                                    </select>
                                </div>
                            </div>

                            <label>Description</label>
                            <textarea class="form-control" cols="30" rows="4" name="description">${requestScope.p.description}</textarea>

                            <button type="submit" class="btn btn-outline-primary-2">
                                <span>SAVE CHANGES</span>
                            </button>
                        </form>
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
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>