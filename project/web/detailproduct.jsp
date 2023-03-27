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
        <style>
            .hover-effect:hover {
                background-color: rgba(123, 121, 121, 0.5);
            }
            #breaditem1{
                text-decoration: none;
                color: #5c636a;
            }
            #breaditem1:hover{
                color: red;
                text-decoration: underline;
            }
            #breaditem2{
                text-decoration: none;
                color: #5c636a;
            }
            #breaditem2:hover{
                color: red;
                text-decoration: underline;
            }
            #breaditem3{
                text-decoration: none;
                color: #5c636a;
            }
            #breaditem3:hover{
                color: red;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>

        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-default bg-danger">
            <div class="container px-4 px-lg-5"  style="color: white;font-family: Arial Black">
                <div style="margin-right: 20px;">
                    <a href="home" style="text-decoration: none;color: white">
                        <div>
                            <h3><span style="opacity: 0.9;">H</span><span style="opacity: 0.8;">D</span><span style="opacity: 0.7;">p</span><span style="opacity: 0.6;">h</span><span style="opacity: 0.5;">o</span><span style="opacity: 0.4;">n</span><span style="opacity: 0.3;">e</span></span>
                                <span class="bi bi-badge-hd-fill" ></span></h3>
                        </div>
                    </a>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="bi bi-list btn btn-outline-light"></i></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">


                    <form class="d-flex mx-auto" action="search" method="get">
                        <input class="form-control me-2" type="text" id="text" name="text" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-light" type="submit"><i class="bi bi-search"></i></button>
                    </form>
                    <div style="border-radius: 80px;margin-right: 20px;">
                        <div class="d-flex my-2 ">
                            <a class="btn btn-outline-light border-5" style="border-radius:20px;" href="carts">
                                <i id="carts" class="bi-cart-fill me-1" ></i>
                                Cart
                                <span class="badge bg-dark text-white ms-1 rounded-pill" >${sessionScope.carts.size()}</span>
                            </a>
                        </div>
                    </div>    

                    <c:choose>
                        <c:when test="${sessionScope.account != null}">
                            <div style="margin-right: 0;">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" >

                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle hover-effect"  id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"  style="color: white;">${sessionScope.account.displayName}</a>

                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <c:if test="${sessionScope.account.role == 'admin'}">
                                                <li> 
                                                    <a href="shipping" class="hover-effect dropdown-item" style="text-decoration: none;color: black">Shipping status</a>
                                                </li>
                                                <li> 
                                                    <a href="manage" class="hover-effect dropdown-item" style="text-decoration: none;color: black">Manage product</a>
                                                </li>
                                            </c:if>
                                                  <c:if test="${sessionScope.account.role == 'shipper'}">
                                                  <li> 
                                                    <a href="shipping" class="hover-effect dropdown-item" style="text-decoration: none;color: black">Shipping status</a>
                                                </li>
                                            </c:if>
                                            <li> <a href="logout" class="dropdown-item" style="color: black;text-decoration: none;">Log out</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <div style="margin-right: 0;">


                                <div style="border-radius: 80px;margin-right: 20px;">
                                    <div class="d-flex my-2 ">
                                        <a class="btn btn-outline-light border-5" style="border-radius:20px;" href="carts">
                                            Login
                                        </a>
                                    </div>
                                </div>    

                            </div>
                        </c:otherwise>
                    </c:choose>  

                </div>
            </div>
        </nav>

        <div class="border-bottom">
            <div class="container pt-2"  style="padding:0;">
                <div class="row">
                    <div class="col-1"  style="padding:0;"></div>
                    <div class="col-auto"  style="padding:0;">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home"  id="breaditem1">Home</a></li>
                                <li class="breadcrumb-item"><a href="filter-category?categoryId=${product.categoryID}"  id="breaditem2">${category.name}</a></li>
                                <li class="breadcrumb-item"><a href="detail?productID=${product.id}" id="breaditem3">${product.name}</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>    
        </div>

        <section class="mt-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-10 col-lg-5">
                        <img class="card-img-top" src="img/${product.img}" alt="loading" />
                    </div>
                    <div class="col-10 col-lg-5">
                        <h1>${product.name}</h1>
                        <div class="mt-3 mb-3"><span style="font-weight: bolder">Price:</span>&nbsp;$${product.price}</div>
                        <p><span style="font-weight: bolder">Description:</span>&nbsp;${product.description}</p>


                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent mt-5">
                            <div class="text-center"><a class="btn btn-success mt-auto"  href="adtocarts?productID=${product.id}" style="padding-left: 20px;padding-right: 20px;">Add to cart</a></div>
                        </div>
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-dark mt-auto" href="buy?productID=${product.id}" style="padding-left: 30px;padding-right: 30px;">Buy now</a></div>
                        </div>

                    </div>
                </div>

                <div class="card mt-5 mb-5" style="width: 100%">
                    <div class="card-body">
                        <h5 class="card-title"> Relation product</h5>
                        <p class="card-text">
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-4 justify-content-center">
                            <c:forEach begin="0" end="7" items="${requestScope.realatedlist}" var="p">
                                <c:if test="${p.id != requestScope.proID}">
                                    <div class="col mb-5">
                                        <a href="detail?productID=${p.id}" style="text-decoration:  none">

                                            <div class="card h-100">
                                                <!-- Sale badge-->
                                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                                <!-- Product image-->
                                                <img class="card-img-top" src="img/${p.img}"  height="350px" width="150px" alt="..." />
                                                <!-- Product details-->
                                                <div class="card-body p-4">
                                                    <div class="text-center">
                                                        <!-- Product name-->
                                                        <h5 class="fw-bolder">${p.name}</h5>
                                                        <!-- Product reviews-->
                                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                                            <div class="bi-star-fill"></div>
                                                            <div class="bi-star-fill"></div>
                                                            <div class="bi-star-fill"></div>
                                                            <div class="bi-star-fill"></div>
                                                            <div class="bi-star-fill"></div>
                                                        </div>
                                                        <!-- Product price-->
                                                        <span class="text-muted text-decoration-line-through">${p.price*2}</span><br/>
                                                        ${p.price}
                                                    </div>
                                                </div>
                                                <!-- Product actions-->
                                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent mt-5">
                                                    <div class="text-center"><a class="btn btn-success mt-auto"  href="adtocarts?productID=${p.id}" style="padding-left: 20px;padding-right: 20px;">Add to cart</a></div>
                                                </div>
                                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                    <div class="text-center"><a class="btn btn-dark mt-auto" href="buy?productID=${p.id}" style="padding-left: 30px;padding-right: 30px;">Buy now</a></div>
                                                </div>
                                            </div>
                                    </div>
                                    </a>
                                </c:if>
                            </c:forEach>
                        </div>
                        </p>
                    </div>
                </div>        
            </div>

        </section>

          <footer class="footer bg-danger">
            <div class="container">
                <div class="row">             
                    <div class="col-4 offset-1 col-sm-2 p-5">
                        <h5>Links</h5>
                        <ul class="list-unstyled">
                            <li><a style="color: whitesmoke" href="#">Home</a></li>
                            <li><a style="color: whitesmoke" href="#">About</a></li>
                            <li><a style="color: whitesmoke" href="#">Menu</a></li>
                            <li><a style="color: whitesmoke" href="#">Contact</a></li>
                        </ul>
                    </div>
                    <div class="col-7 col-sm-5 p-5">
                        <h5>Our Address</h5>
                        <address class="address">
                            121, Clear Water Bay Road<br>
                            Clear Water Bay, Kowloon<br>
                            HONG KONG<br>
                            Tel.: +852 1234 5678<br>
                            Fax: +852 8765 4321<br>
                            Email: <a style="color: whitesmoke" href="mailto:confusion@food.net">confusion@food.net</a>
                        </address>
                    </div>
                    <div class="col-12 col-sm-4 align-self-center p-5">
                        <div class="text-center">
                            <a style="color: whitesmoke" href="http://google.com/+">Google+</a>
                            <a style="color: whitesmoke" href="http://www.facebook.com/profile.php?id=">Facebook</a>
                            <a style="color: whitesmoke" href="http://www.linkedin.com/in/">LinkedIn</a>
                            <a style="color: whitesmoke" href="http://twitter.com/">Twitter</a>
                            <a style="color: whitesmoke" href="http://youtube.com/">YouTube</a>
                            <a style="color: whitesmoke" href="mailto:">Mail</a>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">             
                    <div class="col-auto">
                        <p>© Copyright 2018 Ristorante Con Fusion</p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
