<%-- 
    Document   : index
    Created on : Mar 1, 2023, 12:47:50 PM
    Author     : vuv90
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Smartphone</title>
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

        </style>
        <script>
            function  allchange() {
                window.location.href = 'home'
            }
        </script>
    </head>
    <body>


        <%@include file="navbar.jsp" %>

        <c:if test="${requestScope.categoryId ne null}">

            <div class="container pt-2  border-bottom" style="padding:0;">
                <div class="row">
                    <div class="col-1" style="padding:0;"></div>
                    <div class="col-auto" style="padding:0;">
                        <nav aria-label="breadcrumb ">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a id="breaditem1" href="home">Home</a></li>
                                <li class="breadcrumb-item"><a id="breaditem2" href="filter-category?categoryId=${requestScope.categoryId}">${requestScope.aCategory.name}</a></li>

                            </ol>
                        </nav>
                    </div>    
                </div>



            </div>  
        </c:if>
        <c:if test="${requestScope.textsearch eq null}">
            <div class="container pt-2  border-bottom" style="padding:0;">
                <%@include file="carousel.jsp" %>
            </div>
        </c:if>


        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5">
                <div class="row">
                    <div class="col-md-3 mb-5">


                        <ul class="list-group card">
                            <li class="list-group-item list-group-item-danger fw-bolder">Category</li>
                            <li class="list-group-item"><a  href="home" style="font-weight: bolder;text-decoration: none;color: darkblue;font-style: italic;">ALL</a></li>   
                                <c:forEach items="${requestScope.listcategory}" var="C">
                                <li class="list-group-item"><a  href="filter-category?categoryId=${C.ID}" style="font-weight: bolder;text-decoration: none;color: darkblue;font-style: italic;"> ${C.name}</a></li>
                                </c:forEach>

                        </ul>
                        <form action="filterprice" method="get" class="mt-5">
                            <ul class="list-group card">
                                <li class="list-group-item list-group-item-danger fw-bolder">Filter by price</li>
                                <li class="list-group-item">
                                    <input type="radio" name="price_range"   onchange="allchange()" id="price_range_0_500" checked="">
                                    ALL
                                </li>
                                <li class="list-group-item">
                                    <input type="radio" name="price_range" ${requestScope.checkp eq "0-500" ? "checked" : ""}   onchange="this.form.submit()"value="0-500" id="price_range_0_500">
                                    <label for="price_range_0_500">$0 - $500</label>
                                </li>
                                <li class="list-group-item">
                                    <label for="price_range_500_1000">
                                        <input type="radio" name="price_range" ${requestScope.checkp eq "500-1000" ? "checked" : ""} onchange="this.form.submit()" value="500-1000" id="price_range_500_1000">

                                        <label for="price_range_500_1000">$500 - $1000</label>
                                </li>
                                <li class="list-group-item">
                                    <input type="radio" name="price_range" ${requestScope.checkp eq "1000-1500" ? "checked" : ""}  onchange="this.form.submit()" value="1000-1500" id="price_range_1000_1500">
                                    <label for="price_range_1000_1500">$1000 - $1500</label>
                                </li>
                                <li class="list-group-item">
                                    <input type="radio" name="price_range" ${requestScope.checkp eq "1500-2500" ? "checked" : ""} onchange="this.form.submit()" value="1500-2500" id="price_range_1500">
                                    <label for="price_range_1500">$1500 - $2500</label>
                                </li>
                            </ul>

                        </form>
                    </div>
                    <div class="col-md-9">

                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center">
                            <c:if test="${requestScope.newListc eq null}">
                                <c:forEach items="${requestScope.listprice}" var="p">
                                    <div class="col mb-5">


                                        <div class="card h-100 border-5">
                                            <!-- Sale badge-->
                                            <a href="detail?productID=${p.id}" style="text-decoration: none;">
                                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                                <!-- Product image-->
                                                <img class="card-img-top" src="img/${p.img}" height="350px" width="150px" alt="..." />
                                                <hr  style="color:  grey"/>
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
                                                        <span class="text-muted text-decoration-line-through">$${p.price*2}</span>
                                                        <br/>
                                                        $${p.price}
                                                    </div>
                                                </div>
                                            </a>    
                                            <c:if test="${p.quantity <= 0}">
                                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent text-center">
                                                    <div class="text-center btn btn-danger">Sold out</div>
                                                </div>
                                            </c:if>
                                            <!-- Product actions-->
                                            <c:if test="${p.quantity != 0}">
                                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                    <div class="text-center "><a class="btn btn-success mt-auto" href="adtocarts?productID=${p.id}">Add to cart</a></div>
                                                    <div class="text-center mt-2"><a class="btn btn-dark mt-auto" href="buy?productID=${p.id}">Buy now</a></div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>

                                </c:forEach>
                            </c:if>
                            <c:if test="${requestScope.listprice eq null}">
                                <c:forEach items="${requestScope.newListc}" var="p">
                                    <div class="col mb-5">


                                        <div class="card h-100 border-5">
                                            <!-- Sale badge-->
                                            <a href="detail?productID=${p.id}" style="text-decoration: none;">
                                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                                <!-- Product image-->
                                                <img class="card-img-top" src="img/${p.img}" height="350px" width="150px" alt="..." />
                                                <hr  style="color:  grey"/>
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
                                                        <span class="text-muted text-decoration-line-through">$${p.price*2}</span>
                                                        <br/>
                                                        $${p.price}
                                                    </div>
                                                </div>
                                            </a>    
                                            <c:if test="${p.quantity <= 0}">
                                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent text-center">
                                                    <div class="text-center btn btn-danger">Sold out</div>
                                                </div>
                                            </c:if>
                                            <!-- Product actions-->
                                            <c:if test="${p.quantity != 0}">
                                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                    <div class="text-center "><a class="btn btn-success mt-auto" href="adtocarts?productID=${p.id}">Add to cart</a></div>
                                                    <div class="text-center mt-2"><a class="btn btn-dark mt-auto" href="buy?productID=${p.id}">Buy now</a></div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>

                                </c:forEach>
                            </c:if>
                        </div>
                        <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                            <ul  class="pagination">

                                <c:if test="${requestScope.categoryId eq null}">




                                    <c:forEach begin="1" end="${requestScope.end}" var="e">
                                        <li class="page-item ${page == e?"active":""}"><a  class="page-link"   href="home?page=${e}" >${e}</a></li>
                                        </c:forEach>   


                                </c:if>
                                <c:if test="${requestScope.categoryId ne null}">

                                    <c:forEach begin="1" end="${requestScope.end}" var="e">
                                        <li class="page-item  ${page == e?"active":""}"><a class="page-link" href="filter-category?categoryId=${requestScope.categoryId}&page=${e}" >${e}</a></li>
                                        </c:forEach>  

                                </c:if> 

                                <c:forEach begin="1" end="${requestScope.endPagePrice}" var="e">
                                    <li class="page-item  ${page == e?"active":""}"><a class="page-link" href="filterprice?price_range=${requestScope.value}&page=${e}" >${e}</a></li>
                                    </c:forEach>  


                            </ul>
                        </nav>
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
