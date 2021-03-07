package servlets;

import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "RecentActivityServlet", value = "/RecentActivityServlet")
public class RecentActivityServlet extends HttpServlet {
    private TransactionsDatabaseUtil transactionsDatabaseUtil;

    @Override
    public void init() throws ServletException {
        super.init();


    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            int clientId = (Integer) session.getAttribute("id");
            LocalDate currentDate = LocalDate.now();
            String fromDate = currentDate.withDayOfMonth(1).toString();
            String toDate = currentDate.toString();

            Account account = new Account(clientId, DefaultValues.defaultCurrencyTypeId);
            transactionsDatabaseUtil = new TransactionsDatabaseUtil(account);

            List<Transaction> transactions = transactionsDatabaseUtil.getTransactionRecords(fromDate, toDate, "", "", "");

            request.setAttribute("transactionsList", transactions);
            RequestDispatcher dispatcher = request.getRequestDispatcher("my-account.jsp");
            dispatcher.forward(request, response);

        }
        catch (Exception ex) {
            throw new ServletException("An Error Occurred During Retrieving Recent Transaction History : " + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
