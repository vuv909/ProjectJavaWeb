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
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/adtocarts","/checkout","/carts","/deletecart","/update-quantity","/buy","/manage","/update","/admin/*","/shipping"})
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        //kiem tra dang nhap
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            //cho qua
            chain.doFilter(request, response);
        } else {
            //kiem tra cookies
            Cookie[] cookies = req.getCookies();
            String username = null;
            String password = null;
            for (Cookie c : cookies) {
                if (c.getName().equals("username")) {
                    username = c.getValue();
                }
                if (c.getName().equals("password")) {
                    password = c.getValue();
                }
                if (username != null && password != null) {
                    break;
                }
            }
            if (username != null && password != null) {
                Account accountLogin = new AccountDAO().login(username, password);
                if (account != null) {//cookie hop le
                    req.getSession().setAttribute("account", account);
                    chain.doFilter(request, response);
                    return;
                }
            }
            resp.sendRedirect("login");
        }

    }

    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {

    }
}
