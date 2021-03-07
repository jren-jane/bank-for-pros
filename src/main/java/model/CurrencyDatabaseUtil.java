package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CurrencyDatabaseUtil {

    public String getCurrencyName(int currencyTypeId) throws Exception {
        String query = "SELECT name " + "FROM currency_types " + "WHERE currency_type_id = '" + currencyTypeId + "' ";
        try (Connection connection = DatabaseConnection.createNewDatabaseConnection();
             Statement statement = connection.createStatement();
             ResultSet results = statement.executeQuery(query)) {

            String name = "";
            while (results.next()) {
                name = results.getString("name");
            }

            return name;
        }
    }
}
