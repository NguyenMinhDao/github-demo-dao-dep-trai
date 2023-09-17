/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DAO;
import entity.Category;
import entity.Item;
import entity.Product;
import java.io.IOException;
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
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

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
        DAO dao = new DAO();
        ArrayList<Category> listC = dao.getAllCategory();
        for (Category category : listC) {
            category.setItemCount(dao.getProductByCid(category.getCategoryId()).size());
        }

        ArrayList<Product> listP = dao.getAllProduct();
        int page = 1;
        if (request.getParameter("page") != null) {
            String s = request.getParameter("page");
            page = Integer.parseInt(s);
        }
        ArrayList<Product> pageProducts = dao.paginationProduct(page);
        int endPage;
        if (listP.size() % 12 != 0) {
            endPage = listP.size() / 12 + 1;
        } else {
            endPage = listP.size() / 12;
        }
        request.setAttribute("listP", pageProducts);

        if (request.getParameter("cid") != null) {
            int cid = Integer.parseInt(request.getParameter("cid"));
            listP = dao.getProductByCid(cid);
            endPage = 1;
            request.setAttribute("cid", cid);
            request.setAttribute("listP", listP);
        }

        if (request.getParameter("searchValue") != null) {
            endPage = 1;
            listP = dao.searchProductByName(request.getParameter("searchValue"));
            request.setAttribute("listP", listP);
        }

        ArrayList<Item> pendingItems = dao.getPendingItems();
        request.setAttribute("pendingItems", pendingItems);
        HttpSession session = request.getSession();
        session.setAttribute("listC", listC);
        request.setAttribute("endPage", endPage);
        request.setAttribute("currentPage", page);
        request.setAttribute("size", listP.size());
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
