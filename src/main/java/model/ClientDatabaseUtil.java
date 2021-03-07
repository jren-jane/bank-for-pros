package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class ClientDatabaseUtil {

    public void addClient(Client client) throws Exception {

        try (Connection connection = DatabaseConnection.createNewDatabaseConnection()) {

            String sql = "INSERT INTO clients" + "(first_name, last_name, email, username, password, address, city, zip_code, phone)" + "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, client.getFirstName());
                statement.setString(2, client.getLastName());
                statement.setString(3, client.getEmail());
                statement.setString(4, client.getUsername());
                statement.setString(5, client.getPassword());
                statement.setString(6, client.getAddress());
                statement.setString(7, client.getCity());
                statement.setString(8, client.getZipCode());
                statement.setString(9, client.getPhone());

                statement.execute();
            }

        }

    }

    public int getId (String email) throws Exception {
        String sql = "SELECT client_id FROM clients WHERE email = '" + email + "'";
        try (Connection connection = DatabaseConnection.createNewDatabaseConnection();
             Statement statement = connection.createStatement();
             ResultSet results = statement.executeQuery(sql)) {

            int id = 0;
            while (results.next()) {
                id = results.getInt("client_id");
            }

            return id;
        }
    }

    public String getEmail (int clientId) throws Exception {
        String sql = "SELECT email FROM clients WHERE client_id = '" + clientId + "'";
        try (Connection connection = DatabaseConnection.createNewDatabaseConnection();
             Statement statement = connection.createStatement();
             ResultSet results = statement.executeQuery(sql)) {

            String email = "";
            while (results.next()) {
                email = results.getString("email");
            }

            return email;
        }
    }

    public String getUsername (int clientId) throws Exception {
        String sql = "SELECT username FROM clients WHERE client_id = '" + clientId + "'";
        try (Connection connection = DatabaseConnection.createNewDatabaseConnection();
             Statement statement = connection.createStatement();
             ResultSet results = statement.executeQuery(sql)) {

            String username = "";
            while (results.next()) {
                username = results.getString("username");
            }

            return username;
        }
    }

    public String getPassword (int clientId) throws Exception {
        String query =  "SELECT password FROM clients WHERE client_id = '" + clientId + "'";
        try (Connection connection = DatabaseConnection.createNewDatabaseConnection();
             Statement statement = connection.createStatement();
             ResultSet results = statement.executeQuery(query)) {

            String password = "";
            while (results.next()) {
                password = results.getString("password");
            }

            return password;
        }
    }

    public void setPassword(int clientId, String password) throws Exception {
        try (Connection connection = DatabaseConnection.createNewDatabaseConnection()) {
            String query = "UPDATE clients SET password = ? WHERE client_id = ? ";
            try (PreparedStatement preparedStatementOwn = connection.prepareStatement(query)) {
                preparedStatementOwn.setString(1, password);
                preparedStatementOwn.setInt(2, clientId);
                preparedStatementOwn.executeUpdate();
            }
        }
    }

    public boolean isCorrectEmail (String email) throws Exception {
        String sql = "SELECT * FROM clients WHERE email = '"+email+"'";
        try (Connection connection = DatabaseConnection.createNewDatabaseConnection();
             Statement statement = connection.createStatement();
             ResultSet results = statement.executeQuery(sql)) {
            return results.next();
        }
    }

    public boolean isValidAccount (String email, String password) throws Exception {
        String sql  = "SELECT * FROM clients WHERE email = ? AND password = ?";
        try (Connection connection = DatabaseConnection.createNewDatabaseConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            statement.setString(2, password);
            try (ResultSet results = statement.executeQuery()) {
                return results.next();
            }
        }
    }

}
