<%--     Document   : index
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
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Do you want to delete it ?")) {
                    window.location = "delete?productID=" + id;
                }
            }
            function showMore() {
                var tableRows = document.getElementsByTagName("tr");
                var hiddenRows = document.getElementsByClassName("hide");

                var totalRows = tableRows.length;
                var visibleRows = totalRows - hiddenRows.length;
                var increment = 10;

                for (var i = visibleRows; i < visibleRows + increment && i < totalRows; i++) {
                    if (tableRows[i].classList.contains("hide")) {
                        tableRows[i].classList.remove("hide");
                    }
                }

//                if (hiddenRows.length === 0) {
//                    document.getElementById("viewMore").style.display = "none";
//                }
//
//                if (hiddenRows.length > 0) {
//                    document.getElementById("showLess").style.display = "block";
//                }
            }

            function showLess() {
                var tableRows = document.getElementsByTagName("tr");
                var hiddenRows = document.getElementsByClassName("hide");

                var totalRows = tableRows.length;
                var visibleRows = totalRows - hiddenRows.length;
                var decrement = 10;

                for (var i = visibleRows - 1; i >= visibleRows - decrement && i >= 0; i--) {
                    if (!tableRows[i].classList.contains("hide")) {
                        tableRows[i].classList.add("hide");
                    }
                }

//                if (visibleRows <= 12) {
//                    document.getElementById("showLess").style.display = "none";
//                }
//                if (visibleRows > 0) {
//                    document.getElementById("viewMore").style.display = "block";
//                }
            }

        </script>
        <style>
            .hide {
                display: none;
            }
            body{
                background-image: url('img/background.jpg');
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

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-4 card text-center border-light border-5" style="margin-right: 20px;background-color: rgb(181, 178, 178);">

                    <div class="card-header" style="background-color: rgb(181, 178, 178);">
                        <h3 style="font-weight: bolder">Total products in shop</h3>
                    </div>
                    <div class="card-body">
                        <h4>${requestScope.totalpro}</h4>
                    </div>
                </div>

            </div>
            <div class="row justify-content-start mt-4 ">
                <div  class="btn btn-success col-4 card text-center">

                    <a href="success" style="text-decoration:  none">
                        <p  style="font-weight: bolder;color: black;">View products information that have been sold successfully</p>
                    </a>

                </div>

            </div>

            <div class="container card mt-5" style="margin-bottom: 7%;border-radius: 20px;background-color: rgb(181, 178, 178);">


                <div class="card-header">
                    <div class="row">
                        <div class="col-5">
                            <h1 style="font-weight: bolder">List of products</h1>
                            <!--                <h3 style="font-weight: bolder"><a href="add">Add a product</a></h3>-->

                            <!-- add a smartphone -->
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Add a product
                            </button>
                        </div>
                        <div class="col-4 mt-4">
                            <form action="searchmanage" method="post">
                                <div class="row justify-content-end">
                                    <div class = "col-6">
                                        <input type="text" name="name" /><br/>
                                        <label class="mt-1" for="category">Category:</label>
                                        <select id="category" name="category">
                                            <option value="0">All</option>
                                            <option value="1">Iphone</option>
                                            <option value="2">Samsung</option>
                                            <option value="3">Nokia</option>
                                            <option value="4">LG</option>
                                            <option value="5">Xiaomi</option>
                                            <option value="6">Oppo</option>

                                        </select>
                                    </div>
                                    <div class = "col-6">
                                        <input class="btn btn-success" type="submit" value="search" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <form action="add" method="post">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header" style="background-color: #adb5bd">
                                        <h5 class="modal-title fw-bolder text-center" id="exampleModalLabel">Add a smartphone</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-2">
                                            <label for="name">Name:&nbsp;&nbsp;</label><input type="text"  id="name" name="name" required=""><br/>
                                        </div>
                                        <div class="mb-2">
                                            <label for="quantity">Quantity:&nbsp;&nbsp;</label><input type="number"  id="quantity" name="quantity" required=""><br/>
                                        </div>
                                        <div class="mb-2">
                                            <label for="price">Price:&nbsp;&nbsp;</label>
                                            <input type="number" id="price" name="price" step="any"><br/>
                                        </div>
                                        <div class="mb-2">
                                            <label for="des">Description:&nbsp;&nbsp;</label><input type="text"  id="des" name="des" required=""><br/>
                                        </div>
                                        <div class="mb-2">
                                            <label for="img">Image&nbsp;&nbsp;:</label>
                                            <input  type="file" id="img" name="img" required=""><br/>
                                        </div>
                                        <div class="mb-2">
                                            <label for="category">Category:</label>
                                            <select id="category" name="category">
                                                <option value="1">Iphone</option>
                                                <option value="2">Samsung</option>
                                                <option value="3">Nokia</option>
                                                <option value="4">LG</option>
                                                <option value="5">Xiaomi</option>
                                                <option value="6">Oppo</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>




                <table class="table table-hover table-striped table-bordered" style="background-color:white;">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Image</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.allproduct}" var="a" varStatus="status">
                            <tr class="${status.index > 10 ? 'hide' : ''}">
                                <th style="padding: 20px;">${a.id}</th>
                                <td style="padding: 20px;">${a.name}</td>
                                <td style="padding: 20px;"><img src="./img/${a.img}" width="50px" height="70px" alt="alt"/></td>
                                <td style="padding: 20px;">${a.quantity}</td>
                                <td style="padding: 20px;">${a.price}$</td>
                                <td style="padding: 20px;">
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateModal_${a.id}">
                                        Update
                                    </button>
                                    <div class="modal fade" id="updateModal_${a.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <form action="update" method="post">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header" style="background-color: #adb5bd">
                                                        <h5 class="modal-title fw-bolder text-center" id="exampleModalLabel">Update</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="mb-3 text-start mt-5" >
                                                            <input type="hidden" id="id" name="id" value="${a.id}" readonly=""/>
                                                        </div>

                                                        <div class="mb-3 text-start mt-1">
                                                            <label for="name">Name:</label>
                                                            <input type="text" id="name" name="name" value="${a.name}"/>
                                                        </div>
                                                        <div class="mb-3 text-start mt-1">
                                                            <label for="quantity">Quantity:</label>
                                                            <input type="number" id="quantity" name="quantity" value="${a.quantity}"/>
                                                        </div>
                                                        <div class="mb-3 text-start mt-1">
                                                            <label for="price">Price:</label>
                                                            <input type="number" id="price" name="price" value="${a.price}"/>
                                                        </div>
                                                        <div class="mb-3 text-start mt-1">
                                                            <label for="img">Image:</label>
                                                            <input  type="file" id="img" name="img" require=""><br/>
                                                        </div>
                                                        <div class="mb-3 text-start mt-1">
                                                            <label for="category">Category:</label>
                                                            <select id="category" name="category">
                                                                <option value="1">Iphone</option>
                                                                <option value="2">Samsung</option>
                                                                <option value="3">Nokia</option>
                                                                <option value="4">LG</option>
                                                                <option value="5">Xiaomi</option>
                                                                <option value="6">Oppo</option>

                                                            </select>
                                                        </div>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Update</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>


                                    &nbsp;&nbsp;<a class="btn btn-danger" href="#" onclick="doDelete(${a.id})">Delete</a></td>
                            </tr>
                        </c:forEach>  
                    </tbody>
                </table>

                <div class="row justify-content-center">

                    <button id="viewMore" class="btn btn-success col-2 text-center h-25" onclick="showMore()">View More</button>
                    <button id="showLess" class="btn btn-success col-2 text-center h-25" style="margin-left: 10px" onclick="showLess()">Show less</button>
                </div>
                <!-- Bootstrap core JS-->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
                <!-- Core theme JS-->
                <script src="js/scripts.js"></script>
                </body>
                </html>
