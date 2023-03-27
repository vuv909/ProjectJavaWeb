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
            #tableCart tbody tr:hover {
                background-color: #ccc; /* Change this to the color you want */
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

                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle hover-effect"  id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"  style="color: white;">Shop</a>

                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
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

                                <!--                                <a href="login" onmouseover="over()" style="text-decoration: none;color: white;">
                                                                    <i class="bi bi-person"></i>
                                                                    Login</a>-->
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

        <div class="container pt-2 border-bottom" style="padding:0;">
            <div class="row">
                <div class="col-1" style="padding:0;"></div>
                <div class="col-auto" style="padding:0;">
                    <nav aria-label="breadcrumb ">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a id="breaditem1" href="home">Home</a></li>
                            <li class="breadcrumb-item"><a id="breaditem2" href="carts">Carts</a></li>
                            <li class="breadcrumb-item"><a id="breaditem3" href="checkout">Checkouts</a></li>
                        </ol>
                    </nav>
                </div>    
            </div>
        </div>  

                            <div class="container mt-5" style="margin-bottom: 30%">

            <div class="row justify-content-center mt-2">
                <div class="col-7 card" style="margin-right: 1%">
                    <table class="table" id="tableCart">
                        <tbody>
                            <c:if test="${sessionScope.carts == null || sessionScope.carts.size()==0}">
                            <h1>Empty Cart</h1>
                        </c:if>
                        <c:if test="${!(sessionScope.carts == null || sessionScope.carts.size()==0)}">
                            <h1>Check Out</h1>
                        </c:if>

                        <c:forEach items="${carts}" var="c">
                            <form action="update-quantity">
                                <tr>
                                <input type="hidden" name="productID" value="${c.value.product.id}"/>
                                <td><img src="img/${c.value.product.img}" alt="..." width="50px" height="50px" /></td>
                                <td>${c.key}</td>
                                <td>${c.value.product.name}</td>
                                <td>Price: ${df.format(c.value.product.price)}</td>
                                <td>Quantity : ${c.value.quantity}</td>
                                <td>Total price : ${df.format(c.value.product.price * c.value.quantity)}</td>

                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${!(sessionScope.carts == null || sessionScope.carts.size()==0)}">
                        <h3>Total amount: ${df.format(requestScope.total)}</h3>  
                    </c:if>
                </div>
                <div class="col-4 card">
                    <form action="checkout" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" name="name" aria-describedby="emailHelp" required>
                           
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="number" class="form-control" id="phone" name="phone" aria-describedby="emailHelp" required>
                 
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control" id="address" name="address" aria-describedby="emailHelp" required>
          
                        </div>
                        <div class="mb-3">
                            <label for="note" class="form-label">Note</label>
                            <textarea class="form-control" id="note" name="note" rows="3"></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary mb-3">Submit</button>
                    </form>
                </div>
            </div>

        </div>

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
