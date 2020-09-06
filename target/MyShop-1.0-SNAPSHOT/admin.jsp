<%-- 
    Document   : admin
    Created on : Aug 26, 2020, 5:27:47 PM
    Author     : Rohit Gupta
--%>
<%@page import="java.util.Map"%>
<%@page import="com.myshop.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.myshop.entities.Category"%>
<%@page import="com.myshop.helper.FactoryProvider"%>
<%@page import="com.myshop.dao.CategoryDao"%>
<%@page import="com.myshop.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "you are not loged in !!!");
        response.sendRedirect("login.jsp");
        return;
    } else {

        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "you are not admin ! Do not Access this Page");
            response.sendRedirect("login.jsp");

            return;
        }

    }
%>
<% CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cDao.getCategories();
//count
    Map<String, Long> map = Helper.getCount(FactoryProvider.getFactory());

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel: My Shop</title>
        <%@include file="components/common_css_jsp.jsp" %>
    </head>


    <body>
        <%@include file="navbar.jsp" %>

        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>

            </div>
            <div class="row mt-4">

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="width: 130px" class="rounded-circle img-fluid" src="img/usergroup.png" accesskey="user_icon">
                            </div>
                            <h1><%= map.get("userCount") %></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>    
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">                            
                            <div class="container">
                                <img style="width: 130px" class="rounded-circle img-fluid" src="img/list.png" accesskey="user_icon">
                            </div>
                            <h1><%= list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Category</h1>
                        </div>
                    </div>    
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="width: 130px" class="rounded-circle img-fluid" src="img/product.png" accesskey="user_icon">
                            </div>
                            <h1><%= map.get("productCount") %></h1> 
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>    
                </div>
            </div>

            <!--second row-->

            <div class="row">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-model">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="width: 125px" class="rounded-circle img-fluid" src="img/maths.png" accesskey="user_icon">
                            </div>
                            <p class="mt-2">Click here to add category</p> 
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>

                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="width: 125px" class="rounded-circle img-fluid" src="img/add.png" accesskey="user_icon">
                            </div>
                            <p class="mt-2">Click here to add new Product</p> 
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>

                    </div>
                </div>

            </div>
        </div>



        <!-- Add  Category modal -->

        <!-- Modal -->
        <div class="modal fade" id="add-category-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document"> 
                <div class="modal-content">
                    <div class="modal-header custum-bg text-white">  
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Detail  </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="productionOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addCategory" 
                                   <div cla class="form-group">
                            <input type="text" class="form-control" name="catTitle" placeholder="Enter Ctaegory Title" required>


                            </div>

                            <div class="form-group">
                                <textarea type="text" style="height: 300px" class="form-control" name="catDescription" placeholder="Enter Ctaegory description" required></textarea>

                            </div>
                            <div class="container text-center mb-3">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>



                    </div>
                </div>
            </div>
        </div>

        <!--        End Category Model-->

        <!--ADD Product Model-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <!--form start-->
                    <form action="productionOperationServlet" method="post" enctype="multipart/form-data" >
                        <input type="hidden" name="operation" value="addProduct" >

                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Enter title of Product" name="pName" required>



                            <div class="form-group">
                                <textarea type="text" style="height: 150px" class="form-control" name="pDescription" placeholder="Enter Product description" required></textarea>

                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter price of Product" name="pPrice" required>
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Discount of Product" name="pDiscount" required>
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter quantity of Product" name="pQuantity" required>
                            </div>



                            <div class="form-group">

                                <select name="catId" class="form-control" id="">
                                    <%                                    for (Category c : list) {
                                    %>
                                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>

                                    <%
                                        }
                                    %>
                                </select>   
                            </div>

                            <div class="form-group">
                                <label for="pPic">Select image for Product</label><br> 
                                <input type="file" id="pPic" name="pPic" required>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                            </div>

                    </form>

                    <!--form end-->

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>

        <!--close add model-->
        <%@include file="components/common-model.jsp" %>
    </body>
</html>
