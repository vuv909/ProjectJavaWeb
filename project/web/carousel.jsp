<%-- 
    Document   : detailproduct
    Created on : Mar 2, 2023, 7:40:12 AM
    Author     : vuv90
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />



    </head>
    <body>

        <div class="conrainer">
            <div id="carouselExampleFade" class="carousel slide carousel-fade h-50" data-bs-ride="carousel" data-bs-interval="1500">
                <div class="carousel-inner">

                    <div class="carousel-item active">
                        <a href="detail?productID=9">
                            <img src="img/ss23.png" height="500px" width="100px" class="d-block w-100" alt="...">
                        </a>
                    </div>
                    <div class="carousel-item">
                        <a href="detail?productID=36">
                            <img src="img/xiaomit12banner.png" height="500px" width="100px" class="d-block w-100" alt="...">
                        </a>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
