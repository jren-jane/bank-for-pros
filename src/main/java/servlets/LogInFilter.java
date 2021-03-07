package servlets;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LogInFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws ServletException, IOException {
        if (((HttpServletRequest) servletRequest).getSession().getAttribute("id") == null) {
            ((HttpServletResponse) servletResponse).sendRedirect("logIn.jsp"); // Not logged in, redirect to login page.
        }
        else {
            filterChain.doFilter(servletRequest, servletResponse); // Logged in, just continue servletRequest.
        }
    }
}
