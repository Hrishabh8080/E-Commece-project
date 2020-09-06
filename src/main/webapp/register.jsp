<%-- 
    Document   : register
    Created on : Aug 25, 2020, 10:23:48 PM
    Author     : Rohit Gupta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="components/common_css_jsp.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Register : My Shop</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container-fluid">

            <div class="row mt-5">

                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <%@include file="components/message.jsp" %>
                        <div class="card-body px-5">
                            <div class="container text-center">
                                <img src="img/userProfile.png"  style="width:100px;" >
                            </div>
                            <h3 class="text-center my-3">Sign up here!!</h3>                
                            <form action="registerServlet" method="post">

                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input type="text" required name="user_name" class="form-control "id="name" placeholder="Enter Name" aria-describedby="emailHelp" >
                                </div>

                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input type="email" required name="user_email"  class="form-control" id="email" placeholder="Enter Email" aria-describedby="emailHelp" >
                                </div>

                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input type="password" required name="user_password" class="form-control" id="password" placeholder="Enter Password" aria-describedby="emailHelp" >
                                </div>

                                <div class="form-group">
                                    <label for="phone">User Phone</label>
                                    <input type="number" required name="user_phone" class="form-control" id="phone" placeholder="Enter Phone" aria-describedby="emailHelp" >
                                </div>

                                <div class="form-group">
                                    <label for="address">User Address</label><textarea  name="user_address" required style="height: 150px" class="form-control" id="address" placeholder="Enter Address"  >
                                    </textarea>
                                </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-success">Register</button>
                                    <button type="reset" class="btn btn-outline-warning">Reset</button>

                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
