/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import dal.ShippingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.LinkedHashMap;
import java.util.Map;
import model.Account;
import model.Cart;
import model.Order;
import model.Shipping;

/**
 *
 * @author vuv90
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/checkout"})
public class CheckoutController extends HttpServlet {

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
            out.println("<title>Servlet CheckoutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutController at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        //tinh tong tien
        double totalMoney = 0;
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer productID = entry.getKey();
            Cart cart = entry.getValue();

            totalMoney += cart.getQuantity() * cart.getProduct().getPrice();

        }
        request.setAttribute("total", totalMoney);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note");

        //luu shipping
        Shipping shipping = new Shipping(name, phone, address);
        ShippingDAO sdao = new ShippingDAO();
        int shippingId = sdao.createReturnId(shipping); // tra ve id tu tang cua ban ghi vua luu vao database

        //luu order
        HttpSession session = request.getSession();
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        //tinh tong tien
        ProductDAO pdao = new ProductDAO();
        double totalMoney = 0;
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer productID = entry.getKey();
            Cart cart = entry.getValue();
            totalMoney += cart.getQuantity() * cart.getProduct().getPrice();
            pdao.updateAfterCheckOut(cart.getQuantity(), cart.getProduct().getId());
        }

        Account account = (Account) session.getAttribute("account");
//        Order order =new Order   
        int orderId = new OrderDAO().createReturnId(new Order(account.getId(), totalMoney, note, shippingId));

        //luu orderdetail
        new OrderDetailDAO().saveCart(carts, orderId, "Đang chuẩn bị hàng");
        session.removeAttribute("carts");

        response.sendRedirect("finishorder");
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
