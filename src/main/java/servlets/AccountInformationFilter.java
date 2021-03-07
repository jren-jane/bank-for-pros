package servlets;

import model.*;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class AccountInformationFilter implements Filter {

    private ClientDatabaseUtil clientDatabaseUtil;
    private CurrencyDatabaseUtil currencyDatabaseUtil;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

        clientDatabaseUtil = new ClientDatabaseUtil();
        currencyDatabaseUtil = new CurrencyDatabaseUtil();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpSession session = ((HttpServletRequest) servletRequest).getSession();

        if (session.getAttribute("id") == null) {
            session.setAttribute("display", "logInButton"); // Not logged in, show log in button.
        }
        else {
            int clientId = (Integer) session.getAttribute("id");
            Account account = new Account(clientId, DefaultValues.defaultCurrencyTypeId);
            AccountDatabaseUtil accountDatabaseUtil = new AccountDatabaseUtil(account);
            AvailableBalanceCalculator availableBalanceCalculator = new AvailableBalanceCalculator(account);

            try {
                session.setAttribute("display", "username");

                String username = clientDatabaseUtil.getUsername(clientId);
                session.setAttribute("username", username);

                Double currentBalanceTemp = accountDatabaseUtil.getBalance();
                String currentBalance = String.format("%,.2f", currentBalanceTemp);
                session.setAttribute("currentBalance", currentBalance);

                String currencyName = currencyDatabaseUtil.getCurrencyName(DefaultValues.defaultCurrencyTypeId);
                session.setAttribute("currencyName", currencyName);

                Double availableBalanceTemp = availableBalanceCalculator.calculateAvailableBalance();
                String availableBalance = String.format("%,.2f", availableBalanceTemp);
                session.setAttribute("availableBalance", availableBalance);

            }
            catch (Exception e) {
                throw new ServletException("An Error Occurred When Displaying Account Information : " + e.getMessage());
            }
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }
}
