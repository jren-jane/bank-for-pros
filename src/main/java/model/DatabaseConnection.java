package model;

import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static String databaseHost = "jdbc:mysql://localhost/banking?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private static String username = "root";
    private static String password = "txj10114ever";
    private static Connection connection;

    public static Connection createNewDatabaseConnection() throws Exception {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try{
            connection = DriverManager.getConnection(databaseHost, username, password);
        }
        catch (SQLException throwables) {
            System.out.println("Cannot create database connection");
            throwables.printStackTrace();
        }
        finally {
            return connection;
        }
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        MysqlDataSource dataSource = new MysqlDataSource();
//        dataSource.setUser("scott");
//        dataSource.setPassword("tiger");
//        dataSource.setServerName("myDBHost.example.org");
//        dataSource.setDatabaseName("database");
//        return dataSource.getConnection();
    }
}