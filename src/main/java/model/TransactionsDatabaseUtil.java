package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionsDatabaseUtil {

    long millis = System.currentTimeMillis();
    Date transactionDate = new Date(millis);

    private Account account;
    private Account targetAccount;

    public TransactionsDatabaseUtil(Account account, Account targetAccount) {
        this.account = account;
        this.targetAccount = targetAccount;
    }

    public TransactionsDatabaseUtil(Account account) {
        this.account = account;
    }

    public void recordTransaction(double amount) throws Exception {

            String ownQuery = "INSERT INTO transactions " + "(transaction_amount, transaction_date, client_id, target_id, currency_type_id, target_currency_type_id) " + "VALUES (?, ?, ?, ?, ?, ?)";

            try (Connection connection = DatabaseConnection.createNewDatabaseConnection();
                 PreparedStatement statement = connection.prepareStatement(ownQuery)) {
                statement.setDouble(1, -DefaultValues.defaultExchangeRate(account.getCurrencyTypeId(), targetAccount.getCurrencyTypeId()) * amount);
                statement.setDate(2, transactionDate);
                statement.setInt(3, account.getClientId());
                statement.setInt(4, targetAccount.getClientId());
                statement.setInt(5, account.getCurrencyTypeId());
                statement.setInt(6, targetAccount.getCurrencyTypeId());
                statement.execute();
            }

            String targetQuery = "INSERT INTO transactions " + "(transaction_amount, transaction_date, client_id, target_id, currency_type_id, target_currency_type_id) " + "VALUES (?, ?, ?, ?, ?, ?)";

            try (Connection connection = DatabaseConnection.createNewDatabaseConnection();
                 PreparedStatement statement = connection.prepareStatement(targetQuery)) {
                statement.setDouble(1, amount);
                statement.setDate(2, transactionDate);
                statement.setInt(3, targetAccount.getClientId());
                statement.setInt(4, account.getClientId());
                statement.setInt(5, targetAccount.getCurrencyTypeId());
                statement.setInt(6, account.getCurrencyTypeId());
                statement.execute();
            }
        }

        public List<Transaction> getTransactionRecords(String fromDate, String toDate, String startAmount, String endAmount, String currencyTypeId) throws Exception {

        List<Transaction> transactions = new ArrayList<>();

            String transactionQuery = "SELECT transaction_date, cast(transaction_amount AS CHAR) AS transaction_amount, email, name " +
                    "FROM transactions t " +
                    "JOIN clients c " +
                    "ON t.target_id = c.client_id " +
                    "JOIN currency_types ct " +
                    "ON t.currency_type_id = ct.currency_type_id " +
                    "WHERE t.client_id = '"+account.getClientId()+"' " ;

            if ( fromDate.length() > 0)
                transactionQuery += " AND t.transaction_date >= '" + fromDate + "'";

            if ( toDate.length() > 0)
                transactionQuery += " AND t.transaction_date <= '" + toDate + "'";

            if ( startAmount.length() > 0)
                transactionQuery += " AND t.transaction_amount >=  '"+ startAmount + "'";

            if ( endAmount.length() > 0)
                transactionQuery += " AND t.transaction_amount <= '"+ endAmount + "'";

            if (currencyTypeId.length() > 0)
                transactionQuery += "AND t.currency_type_id = '"+currencyTypeId+"'";

            transactionQuery += "ORDER BY t.transaction_date";

            try (Connection connection = DatabaseConnection.createNewDatabaseConnection();
                 Statement statement = connection.createStatement();
                 ResultSet results = statement.executeQuery(transactionQuery)) {

                while (results.next()) {
                    Date transactionDate = results.getDate("transaction_date");
                    Double transactionAmountTemp = results.getDouble("transaction_amount");
                    String transactionAmount = String.format("%,.2f", transactionAmountTemp);
                    String targetEmail = results.getString("email");
                    String currencyName = results.getString("name");

                    Transaction transaction = new Transaction(transactionDate, transactionAmount, account.getClientId(), targetEmail, currencyName);
                    transactions.add(transaction);
                }

                return transactions;
            }

        }
    }

