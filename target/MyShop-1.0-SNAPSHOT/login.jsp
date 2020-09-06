<%-- 
    Document   : login
    Created on : Aug 26, 2020, 11:44:48 AM
    Author     : Rohit Gupta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login :My Shop</title>
        <%@include file="components/common_css_jsp.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">

            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">
                        <div class="card-header custum-bg text-white">
                            <h3>Login here</h3>
                        </div>
                        <div class="card-body">

                            <%@include file="components/message.jsp" %>
                            <form action="loginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" required name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" required name="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <a href="register.jsp" class="text-center d-block mb-3">if not register click here</a>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary border-0">Submit</button>
                                    <button type="reset" class="btn btn-primary border-0">Reset</button>

                                </div>
                            </form>
                        </div>
                        <div class="card-fo">

                        </div>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
