package servlets;

import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BankingControllerServlet", value = "/BankingControllerServlet")
public class BankingControllerServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");

        // The following block is for older version of JDK
        switch (command) {
            case "authenticate":
                try {
                    authenticate(request, response);
                    break;
                }
                catch (Exception e) {
                    throw new ServletException("An error occurred when logging in: " + e.getMessage());
                }

            case "changePassword":
                try {
                    changePassword(request, response);
                    break;
                } catch (Exception e) {
                    throw new ServletException("An error occurred when changing password: " + e.getMessage());
                }

            case "createAccount":
                try {
                    createAccount(request, response);
                    break;
                } catch (Exception e) {
                    throw new ServletException("An error occurred when creating account: " + e.getMessage());
                }

            case "convertCurrency":
                try {
                    convertCurrency(request, response);
                    break;
                } catch (Exception e) {
                    throw new ServletException("An error occurred when converting currency: " + e.getMessage());
                }

            case "createForeignCurrencyAccount":
                try {
                    createForeignCurrencyAccount(request, response);
                    break;
                } catch (Exception e) {
                    throw new ServletException("An error occurred when creating foreign currency account: " + e.getMessage());
                }

            case "getTransactionRecord":
                try {
                    getTransactionRecord(request, response);
                    break;
                } catch (Exception e) {
                    throw new ServletException("An error occurred when getting transaction records: " + e.getMessage());
                }

            case "transferFunds":
                try {
                    transferFunds(request, response);
                    break;
                } catch (Exception e) {
                    throw new ServletException("An error occurred when transferring funds: " + e.getMessage());
                }


//        switch (command) {
//            case "authenticate" -> {
//                try {
//                    authenticate(request, response);
//                }
//                catch (Exception e) {
//                    throw new ServletException("An error occurred when logging in: " + e.getMessage());
//                }
//            }
//            case "changePassword" -> {
//                try {
//                    changePassword(request, response);
//                } catch (Exception e) {
//                    throw new ServletException("An error occurred when changing password: " + e.getMessage());
//                }
//            }
//            case "createAccount" -> {
//                try {
//                    createAccount(request, response);
//                } catch (Exception e) {
//                    throw new ServletException("An error occurred when creating account: " + e.getMessage());
//                }
//            }
//            case "convertCurrency" -> {
//                try {
//                    convertCurrency(request, response);
//                } catch (Exception e) {
//                    throw new ServletException("An error occurred when converting currency: " + e.getMessage());
//                }
//            }
//            case "createForeignCurrencyAccount" -> {
//                try {
//                    createForeignCurrencyAccount(request, response);
//                } catch (Exception e) {
//                    throw new ServletException("An error occurred when creating foreign currency account: " + e.getMessage());
//                }
//            }
//            case "getTransactionRecord" -> {
//                try {
//                    getTransactionRecord(request, response);
//                } catch (Exception e) {
//                    throw new ServletException("An error occurred when getting transaction records: " + e.getMessage());
//                }
//            }
//            case "transferFunds" -> {
//                try {
//                    transferFunds(request, response);
//                } catch (Exception e) {
//                    throw new ServletException("An error occurred when transferring funds: " + e.getMessage());
//                }
//            }
        }

}

    private ClientDatabaseUtil clientDatabaseUtil = new ClientDatabaseUtil();
    private CurrencyDatabaseUtil currencyDatabaseUtil = new CurrencyDatabaseUtil();


    private void authenticate(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (!clientDatabaseUtil.isCorrectEmail(email)) {
            request.setAttribute("isCorrectEmail", "No");
        }
        else if (!clientDatabaseUtil.isValidAccount(email, password)) {
            request.setAttribute("isCorrectPassword", "No");
        }
        else {
            request.setAttribute("logInSuccessful", "Yes");
            int id = clientDatabaseUtil.getId(email);
            HttpSession session = request.getSession();
            session.setAttribute("id", id);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("logIn.jsp");
        dispatcher.forward(request, response);
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        int id = (Integer) session.getAttribute("id");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");
        String password = clientDatabaseUtil.getPassword(id);

            if (oldPassword.equals(newPassword)) {
                request.setAttribute("samePassword", "Yes");
            }
            else if (!oldPassword.equals(password)) {
                request.setAttribute("oldPasswordCorrect", "No");
            }
            else if (!newPassword.equals(confirmNewPassword)) {
                request.setAttribute("newPasswordsMatch", "No");
            }
            else {
                clientDatabaseUtil.setPassword(id, newPassword);
                request.setAttribute("passwordChanged","Yes");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("changePassword.jsp");
            dispatcher.forward(request, response);
    }

    private void createAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String zipCode = request.getParameter("zipCode");
        String phone = request.getParameter("phone");
        String confirmPassword = request.getParameter("confirmPassword");

            if (clientDatabaseUtil.isCorrectEmail(email)) {
                request.setAttribute("emailExists", "Yes");
            }
            else if (!password.equals(confirmPassword)) {
                request.setAttribute("passwordsMatch", "No");
            }
            else {
                Client client = new Client(firstName, lastName, username, password, email, address, city, zipCode, phone);
                clientDatabaseUtil.addClient(client);

                int id = clientDatabaseUtil.getId(email);
                Account account = new Account(id, DefaultValues.defaultCurrencyTypeId);
                AccountDatabaseUtil accountDatabaseUtil = new AccountDatabaseUtil(account);
                accountDatabaseUtil.addAccount();

                HttpSession session = request.getSession();
                session.setAttribute("id", id);

                request.setAttribute("accountCreated","Yes");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("createAccount.jsp");
            dispatcher.forward(request, response);
    }

    private void convertCurrency(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        int clientId = (Integer) session.getAttribute("id");
        String convertAmountTemp = request.getParameter("convertAmount");
        Double amount = Double.parseDouble(convertAmountTemp);
        String currencyTypeIdTemp = request.getParameter("currencyTypeId");
        int currencyTypeId = Integer.parseInt(currencyTypeIdTemp);
        String targetCurrencyTypeIdTemp = request.getParameter("targetCurrencyTypeId");
        int targetCurrencyTypeId = Integer.parseInt(targetCurrencyTypeIdTemp);

        Account account = new Account(clientId, currencyTypeId);
        AccountDatabaseUtil accountDatabaseUtil = new AccountDatabaseUtil(account);
        Account targetAccount = new Account(clientId, targetCurrencyTypeId);
        AccountDatabaseUtil targetAccountDatabaseUtil1 = new AccountDatabaseUtil(targetAccount);
        TransferTask transferTask = new TransferTask();

        if (currencyTypeId == targetCurrencyTypeId) {
            request.setAttribute("sameCurrencyType", "Yes");
        }
        else if  (!accountDatabaseUtil.existsAccount()) {
            request.setAttribute("existsCurrencyAccount", "No");
        }
        else if (!targetAccountDatabaseUtil1.existsAccount()) {
            request.setAttribute("existsTargetCurrencyAccount", "No");
        }
        else if (!accountDatabaseUtil.isEnoughBalance(DefaultValues.defaultExchangeRate(currencyTypeId, targetCurrencyTypeId) * amount)) {
            request.setAttribute("isEnoughBalance", "No");
        }
        else if (accountDatabaseUtil.reachedLimit(DefaultValues.defaultExchangeRate(currencyTypeId, targetCurrencyTypeId) * amount)) {
            request.setAttribute("reachedLimit", "Yes");
        }
        else if (!accountDatabaseUtil.isValidAmount(amount)) {
            request.setAttribute("isValidAmount", "No");
        }
        else {
            String currencyName = currencyDatabaseUtil.getCurrencyName(currencyTypeId);
            String targetCurrencyName = currencyDatabaseUtil.getCurrencyName(targetCurrencyTypeId);
            transferTask.execute(account, targetAccount, amount);
            request.setAttribute("isConversionSuccessful", "Yes");
            String transferAmount = String.format("%,.2f", amount);
            request.setAttribute("transferAmount", transferAmount);
            request.setAttribute("currencyName", currencyName);
            request.setAttribute("targetCurrencyName", targetCurrencyName);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("convertCurrency.jsp");
        dispatcher.forward(request, response);
    }

    private void createForeignCurrencyAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        int clientId = (Integer) session.getAttribute("id");

        String currencyTypeIdTemp = request.getParameter("currencyTypeId");
        int currencyTypeId = Integer.parseInt(currencyTypeIdTemp);

        Account account = new Account(clientId, currencyTypeId);
        AccountDatabaseUtil accountDatabaseUtil = new AccountDatabaseUtil(account);

            if (accountDatabaseUtil.existsAccount()){
                request.setAttribute("existsAccount", "Yes");
            }
            else {
                accountDatabaseUtil.addAccount();
                request.setAttribute("accountCreated","Yes");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("createForeignCurrencyAccount.jsp");
            dispatcher.forward(request, response);
    }

    private void getTransactionRecord(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        int clientId = (Integer) session.getAttribute("id");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String startAmount = request.getParameter("startAmount");
        String endAmount= request.getParameter("endAmount");
        String currencyTypeId = request.getParameter("currencyTypeId");

        Account account = new Account(clientId, DefaultValues.defaultCurrencyTypeId);
        TransactionsDatabaseUtil transactionsDatabaseUtil = new TransactionsDatabaseUtil(account);

        List<Transaction> transactions = transactionsDatabaseUtil.getTransactionRecords(fromDate, toDate, startAmount, endAmount, currencyTypeId);

        request.setAttribute("transactionsList", transactions);
        RequestDispatcher dispatcher = request.getRequestDispatcher("transactionRecord.jsp");
        dispatcher.forward(request, response);
    }

    private void transferFunds(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        int clientId = (Integer) session.getAttribute("id");
        String targetEmail = request.getParameter("targetEmail");
        String transferAmountTemp = request.getParameter("transferAmount");
        double amount = Double.parseDouble(transferAmountTemp);
        String currencyTypeIdTemp = request.getParameter("currencyTypeId");
        int currencyTypeId = Integer.parseInt(currencyTypeIdTemp);
        int targetId = clientDatabaseUtil.getId(targetEmail);

        Account account = new Account(clientId, currencyTypeId);
        Account targetAccount = new Account(targetId, currencyTypeId);
        AccountDatabaseUtil accountDatabaseUtil = new AccountDatabaseUtil(account);
        AccountDatabaseUtil targetAccountDatabaseUtil = new AccountDatabaseUtil(targetAccount);
        TransferTask transferTask = new TransferTask();

        if (!clientDatabaseUtil.isCorrectEmail(targetEmail)) {
            request.setAttribute("isCorrectEmail", "No");
        }
        else if (!accountDatabaseUtil.existsAccount()) {
            request.setAttribute("existsClientForeignCurrencyAccount", "No");
        }
        else if (!targetAccountDatabaseUtil.existsAccount()) {
            request.setAttribute("existsTargetForeignCurrencyAccount", "No");
        }
        else if (!accountDatabaseUtil.isEnoughBalance(amount)) {
            request.setAttribute("isEnoughBalance", "No");
        }
        else if (accountDatabaseUtil.reachedLimit(amount)) {
            request.setAttribute("reachedLimit", "Yes");
        }
        else if (!accountDatabaseUtil.isValidAmount(amount)) {
            request.setAttribute("isValidAmount", "No");
        }
        else {
            transferTask.execute(account, targetAccount, amount);
            String currencyName = currencyDatabaseUtil.getCurrencyName(currencyTypeId);
            request.setAttribute("isTransactionSuccessful", "Yes");
            String transferAmount = String.format("%,.2f", amount);
            request.setAttribute("transferAmount", transferAmount);
            request.setAttribute("currencyName", currencyName);
            request.setAttribute("targetEmail", targetEmail);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("transfer.jsp");
        dispatcher.forward(request, response);
    }

}
