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
            #carts:hover{
                color: black;
            }
            #navbarDropdown{
                color: black;
            }

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

                   
                    <form class="d-flex mx-auto" action="search">
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

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
