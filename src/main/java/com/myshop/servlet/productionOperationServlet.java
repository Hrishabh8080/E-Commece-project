package com.myshop.servlet;

import com.myshop.dao.CategoryDao;
import com.myshop.dao.ProductDao;
import com.myshop.entities.Category;
import com.myshop.entities.Product;
import com.myshop.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Rohit Gupta
 */
@MultipartConfig
@WebServlet(name = "productionOperationServlet", urlPatterns = {"/productionOperationServlet"})
public class productionOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            String op = request.getParameter("operation");

            if (op.trim().equals("addCategory")) {
// fatcting category Data
                String catTitle = request.getParameter("catTitle");
                String catDescription = request.getParameter("catDescription");

                Category category = new Category();
                category.setCategoryTitle(catTitle);
                category.setCategoryDescription(catDescription);

                //save to database
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Category Addes Successfully !!" + catId);
                response.sendRedirect("admin.jsp");
                return;

            } else if (op.trim().equals("addProduct")) {

                try {
                    String pName = request.getParameter("pName");
                    String pDescription = request.getParameter("pDescription");
                    int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                    int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                    int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                    int catId = Integer.parseInt(request.getParameter("catId"));
                    Part part = request.getPart("pPic");

                    Product p = new Product();
                    p.setpName(pName);
                    p.setpDesc(pDescription);
                    p.setpPrice(pPrice);
                    p.setpDiscount(pDiscount);
                    p.setpQuantity(pQuantity);
                    p.setpPhoto(part.getSubmittedFileName());

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    Category categoryById = cdao.getCategoryById(catId);
                    p.setCategory(categoryById);

                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    pdao.saveProduct(p);
                    String path = request.getRealPath("img") + File.separator + "product" + File.separator + part.getSubmittedFileName();

                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream fin = part.getInputStream();

//                reading data
                    byte[] data = new byte[fin.available()];
                    fin.read(data);

//                writing data
                    fos.write(data);
                    fos.close();
                    HttpSession httpsession = request.getSession();
                    httpsession.setAttribute("message", "Product Addes Successfully ..");
                    response.sendRedirect("admin.jsp");

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
