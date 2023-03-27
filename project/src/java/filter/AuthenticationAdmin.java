/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import dal.AccountDAO;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import model.Account;

/**
 *
 * @author vuv90
 */
@WebFilter(filterName = "AuthenticationAdmin", urlPatterns = {"/manage","/update","/delete","/success"})
public class AuthenticationAdmin implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        //kiem tra dang nhap
        Account account = (Account) session.getAttribute("account");
        if (account != null && account.getRole().equalsIgnoreCase(Account.ADMIN)) {
            //cho qua va la admin
            chain.doFilter(request, response);
            return;
        }
        req.getRequestDispatcher("login.jsp").forward(request, response);
    }

    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {

    }
}
