/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DAO;
import entity.Account;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author bcd12
 */
@WebServlet(name = "ProductManagementServlet", urlPatterns = {"/product"})
public class ProductManagementServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        DAO dao = new DAO();
        ArrayList<Category> listC = dao.getAllCategory();
        String action = request.getParameter("action");
        if (action.equals("add")) {
            request.setAttribute("listC", listC);
            request.getRequestDispatcher("add-product.jsp").forward(request, response);
        }
        if (action.equals("delete")) {
            String id = request.getParameter("productId");
            int productId = Integer.parseInt(id);
            dao.deleteProduct(productId);
            response.sendRedirect("management");
        }
        if (action.equals("update")) {
            String id = request.getParameter("productId");
            int productId = Integer.parseInt(id);
            Product p = dao.getProductByPid(productId);
            request.setAttribute("p", p);
            request.setAttribute("listC", listC);
            request.getRequestDispatcher("update-product.jsp").forward(request, response);
        }
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
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String action = request.getParameter("action");
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String demo = request.getParameter("demo");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        if (action.equals("add")) {
            String category = request.getParameter("category");
            int categoryId = 0;
            boolean check = false;
            for (Category c : dao.getAllCategory()) {
                if (category.equalsIgnoreCase(c.getName())) {
                    categoryId = c.getCategoryId();
                    check = true;
                }
            }
            if (check == false) {
                dao.addCategory(category);
                categoryId = dao.getLastCategoryId();
            }
            dao.addProduct(name, description, price, quantity, categoryId, img, demo);
        }

        if (action.equals("update")) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            dao.updateProduct(name, description, price, quantity, categoryId, img, productId);
        }
        response.sendRedirect("management");
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
