<%-- 
    Document   : index
    Created on : Aug 25, 2020, 6:24:14 PM
    Author     : Rohit Gupta
--%>

<%@page import="com.myshop.helper.Helper"%>
<%@page import="com.myshop.entities.Category"%>
<%@page import="com.myshop.dao.CategoryDao"%>
<%@page import="com.myshop.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.myshop.dao.ProductDao"%>
<%@page import="com.myshop.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <%@include file="components/common_css_jsp.jsp" %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>My Shop: Home</title>

    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">
                <%  String cat = request.getParameter("category");
                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    if (cat == null) {
                        list = pdao.getAllProduct();
                    } else if (cat.trim().equals("all")) {

                        list = pdao.getAllProduct();

                    } else {

                        int cid = Integer.parseInt(cat.trim());
                        list = pdao.getAllProductById(cid);
                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();
                %>


                <div class="col-md-2">

                    <div class="list-group mt-3">

                        <div class="list-group">
                            <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                                All Product</a>
                        </div>

                        <%
                            for (Category c : clist) {
                        %>
                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action disabled"><%= c.getCategoryTitle()%></a>
                        <%
                            }

                        %>
                    </div>
                </div>
                <div class="col-md-10 mt-3">

                    <div class="row-md-4">

                        <div class="col-md-12">
                            <div  class="card-columns">

                                <%for (Product p : list) {


                                %>

                                <div class="card product-card">
                                    <div class="container text-center">
                                        <img class="card-img-top m-2" src="img/product/<%= p.getpPhoto()%>" style="max-height: 200px; max-width: 100%;width: auto" alt="Card image cap">

                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%= Helper.getTitleWord(p.getpName())%></h5>
                                        <p class="card-text">
                                            <%= Helper.get10Word(p.getpDesc())%>
                                        </p>


                                    </div>
                                    <div class="card-footer text-center">
                                        <button class="btn custum-bg text-white" onclick="add_to_cart(<%= p.getpId() %>,'<%= p.getpName() %>)',<%= p.getPriceAfterDiscount() %>)" >Add to Cart</button>
                                        <button class="btn btn-outline-success" >&#8377;<%= p.getPriceAfterDiscount()%>/-  <span class="text-secondary discount-level"> <%= p.getpPrice()%> <%= p.getpDiscount()%>% off</span></button>


                                    </div>
                                </div>

                                <% }
                                    if (list.size() == 0) {
                                        out.println("<h3> No Such Filter</h3>");
                                    }

                                %>



                            </div>

                        </div>

                    </div>


                </div>

            </div>
        </div>
                                <%@include file="components/common-model.jsp"%>
    </body>
</html>
