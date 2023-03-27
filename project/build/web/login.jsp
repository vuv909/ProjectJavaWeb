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
            body{
                background-image: url('img/login.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
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
        <div class="container">
            <div>
                <a href="home" style="text-decoration: none;color: black">
                    <h1><span style="opacity: 1;">H</span><span style="opacity: 0.9;">D</span><span style="opacity: 0.8;">p</span><span style="opacity: 0.7;">h</span><span style="opacity: 0.6;">o</span><span style="opacity: 0.5;">n</span><span style="opacity: 0.4;">e</span></span>
                        <span class="bi bi-badge-hd-fill" ></span></h1>
                </a>
            </div>
        </div>
        <div class="container align-self-center" style="margin-top: 10%">
            <div class="row justify-content-center">
                <div class="col-8 card">  
                    <div class="card-header text-center" style="font-weight: bolder;font-size: larger">Login</div>      
                    <div class="card-body">
                        <form action="login" method="post">
                            <h3 id="err" class="text-success">${requestScope.success}</h3>
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" aria-describedby="emailHelp">

                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password">
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1" name="remember">
                                <label class="form-check-label" for="exampleCheck1">Remember me</label>
                            </div>

                            <h3 id="err" class="text-danger">${requestScope.error}</h3>
                            <div class="row">
                                <div class="row justify-content-end" style="margin-left: 350px">
                                    <a  href="forgot" class="btn">Forgot password</a>
                                </div>
                                <button type="submit" class="btn btn-primary">Login</button>
                                <a href="signup" class="btn btn-dark mt-2">Sign Up</a>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
