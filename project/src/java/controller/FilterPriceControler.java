/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author vuv90
 */
@WebServlet(name = "FilterPriceControler", urlPatterns = {"/filterprice"})
public class FilterPriceControler extends HttpServlet {

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
            out.println("<title>Servlet FilterPriceControler</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterPriceControler at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        ProductDAO pdao = new ProductDAO();
        DAO dao = new DAO();
        String priceRanges = request.getParameter("price_range");
        String[] prices = priceRanges.split("-");
        String minPrice = prices[0];
        String maxPrice = prices[1];
        int min = Integer.parseInt(minPrice.trim());
        int max = Integer.parseInt(maxPrice.trim());

        List<Category> listcategory = dao.getAll();

        int totalProduct = pdao.getTotalProductBySerachPrice(min, max);
        int endPagePrice = (totalProduct / 9) + 1;
        String indexPage = request.getParameter("page");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Product> newListc = pdao.pageProductByPrice(index, min, max);
        request.setAttribute("page", index);
        request.setAttribute("listcategory", listcategory);
        request.setAttribute("value", priceRanges);
         request.setAttribute("endPagePrice", endPagePrice);
        request.setAttribute("listprice", newListc);
        request.setAttribute("checkp", priceRanges);
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
