<%-- 
    Document   : checkout
    Created on : Aug 29, 2020, 7:08:02 PM
    Author     : Rohit Gupta
--%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "you are not loged in !!! Login for Checkout ");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout : My Shop</title>
        <%@include file="components/common_css_jsp.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <!--cart details-->
                    <div class="card">

                        <div class="cart-body">
                            <h1 class="text-center mb-5">Your Selected Item</h1>
                        </div>
                    </div> 
                </div>
                <div class="col-md-6">
                    <!--form detail-->

                    <div class="card">

                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Details for order</h3>
                            <form action="#">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email" required >
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Your Name</label>
                                    <input required value="<%= user.getUserName()%>" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Contact number</label>
                                    <input required value="<%= user.getUserPhone()%>" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Number">
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Shipping Address</label>
                                    <textarea required value="<%= user.getUserAddress()%>" class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your Address" rows="3"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Place Now</button>
                                    <button class="btn btn-outline-success">Continue Shopping</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <%@include file="components/common-model.jsp" %>
    </body>
</html>
