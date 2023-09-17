/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DAO;
import entity.Product;
import entity.Cart;
import entity.Item;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bcd12
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/add"})
public class AddToCartServlet extends HttpServlet {

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
        String id = request.getParameter("PID");
        int pid = Integer.parseInt(id);
        Product p = dao.getProductByPid(pid);
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            List<Item> items = new ArrayList<>();
            Item item = new Item();
            item.setP(p);
            item.setQuantity(quantity);
            item.setSubtotal(p.getPrice() * item.getQuantity());
            items.add(item);
            cart.setItems(items);
            session.setAttribute("cart", cart);
        } else {
            List<Item> items = cart.getItems();
            boolean check = false;
            for (Item item : items) {
                if (item.getP().getProductId() == p.getProductId()) {
                    item.setQuantity(item.getQuantity() + quantity);
                    item.setSubtotal(p.getPrice() * item.getQuantity());
                    check = true;
                }
            }

            if (check == false) {
                Item item = new Item();
                item.setP(p);
                item.setQuantity(quantity);
                item.setSubtotal(p.getPrice() * item.getQuantity());
                items.add(item);
            }
            session.setAttribute("cart", cart);
        }
        String previousPageUrl = request.getHeader("Referer");
        response.sendRedirect(previousPageUrl);
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
