package model;

import java.sql.*;

public class AccountDatabaseUtil {

    private Account account;

    public AccountDatabaseUtil(Account account) {
        this.account = account;
    }


    public void addAccount() throws Exception {

        try (Connection connection = DatabaseConnection.createNewDatabaseConnection()) {

            String query = "INSERT INTO accounts" + "(client_id, currency_type_id, current_balance, daily_limit)" + "VALUES(?, ?, ?, ?)";

            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, account.getClientId());
                statement.setInt(2, account.getCurrencyTypeId());
                statement.setDouble(3, DefaultValues.defaultInitialBalance);
                statement.setDouble(4, DefaultValues.defaultDailyLimit);

                statement.execute();
            }
        }
    }

    public double getBalance () throws Exception {
        String query = "SELECT current_balance " + "FROM accounts " +
                "WHERE client_id = '" + account.getClientId() + "' AND currency_type_id = '"+account.getCurrencyTypeId()+"'";
        try (Connection connection = DatabaseConnection.createNewDatabaseConnection();
             Statement statement = connection.createStatement();
             ResultSet results = statement.executeQuery(query)) {

            Double amount = 0.00;
            while (results.next()) {
                amount = results.getDouble("current_balance");
            }

            return amount;
        }
    }

    public void updateBalance (double amount) throws Exception {
        try (Connection connection = DatabaseConnection.createNewDatabaseConnection()) {
            String query = "UPDATE accounts SET current_balance = ? WHERE client_id = ? AND currency_type_id = ?";
            try (PreparedStatement preparedStatementOwn = connection.prepareStatement(query)) {
                preparedStatementOwn.setDouble(1, amount);
                preparedStatementOwn.setInt(2, account.getClientId());
                preparedStatementOwn.setInt(3, account.getCurrencyTypeId());
                preparedStatementOwn.executeUpdate();
            }
        }
    }

    public Double getDailyLimit() throws Exception {
        String query = "SELECT daily_limit FROM accounts " +
                "WHERE client_id = '" + account.getClientId() + "' AND currency_type_id = '"+account.getCurrencyTypeId()+"'";
        try (Connection connection = DatabaseConnection.createNewDatabaseConnection();
             Statement statement = connection.createStatement();
             ResultSet results = statement.executeQuery(query)) {

            Double dailyLimit = 0.00;
            while (results.next()) {
                dailyLimit = results.getDouble("daily_limit");
            }

            return dailyLimit;
        }
    }

    public void setDailyLimit (double amount) throws Exception {
        try (Connection connection = DatabaseConnection.createNewDatabaseConnection()) {
            String query = "UPDATE accounts SET daily_limit = ? WHERE client_id = ? AND currency_type_id = ?";
            try (PreparedStatement preparedStatementOwn = connection.prepareStatement(query)) {
                preparedStatementOwn.setDouble(1, amount);
                preparedStatementOwn.setInt(2, account.getClientId());
                preparedStatementOwn.setInt(3, account.getCurrencyTypeId());
                preparedStatementOwn.executeUpdate();
            }
        }
    }

    public boolean existsAccount () throws Exception {
        String sql  = "SELECT * FROM accounts WHERE client_id = ? AND currency_type_id = ?";
        try (Connection connection = DatabaseConnection.createNewDatabaseConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, account.getClientId());
            statement.setInt(2, account.getCurrencyTypeId());
            try (ResultSet results = statement.executeQuery()) {
                return results.next();
            }
        }
    }


    public boolean isEnoughBalance (double amount) throws Exception {
        return amount <= getBalance();
    }

    public boolean isValidAmount (double amount) {
        return amount >= 0.01;
    }

    public boolean reachedLimit(double amount) throws Exception {
        return amount > getDailyLimit();
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
}
