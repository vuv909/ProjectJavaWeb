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
            body{
                background-image: url('img/background.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
            }

        </style>

    </head>
    <body>
        <div class="container">
            <div>
                <a href="home" style="text-decoration: none;color: black">
                    <h1><span style="opacity: 1;">H</span><span style="opacity: 0.9;">D</span><span style="opacity: 0.8;">p</span><span style="opacity: 0.7;">h</span><span style="opacity: 0.6;">o</span><span style="opacity: 0.5;">n</span><span style="opacity: 0.4;">e</span></span>
                        <span class="bi bi-badge-hd-fill" ></span></h1>
                </a>
            </div>
        </div>
        <div class="text-center mt-5 mb-5">
            <h1 style="font-weight: bolder">Products information that have been sold successfully</h1>
        </div>
        <div class="container card mt-5" style="margin-bottom: 7%;border-radius: 20px;background-color: rgb(181, 178, 178);">

            <table class="table table-hover table-striped table-bordered mt-2" style="background-color:white;">
                <thead>
                    <tr>

                        <th scope="col">Name</th>
                        <th scope="col">Product image</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Product price</th>
                        <th scope="col">Total price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.list}" var="s">
                        <tr>
                            <td>${s.name}</td>
                            <td><img src="img/${s.img}" width="50px" height="70px" alt="alt"/></td>
                            <td>${s.quantity}</td>
                            <td>${df.format(s.price)}$</td>
                            <td>${df.format(s.price * s.quantity)}$</td>
                           
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
