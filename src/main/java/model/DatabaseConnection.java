package model;

import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

//    private static String databaseHost = "jdbc:mysql://localhost/banking?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
//    private static String username = "root";
//    private static String password = "password";
//    private static Connection connection;

    public static Connection createNewDatabaseConnection() throws Exception {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

//        try{
//            connection = DriverManager.getConnection(databaseHost, username, password);
//        }
//        catch (SQLException throwables) {
//            System.out.println("Cannot create database connection");
//            throwables.printStackTrace();
//        }
//        finally {
//            return connection;
//        }

            String jdbUrl = "jdbc:mysql://x8ndc68nh58rpy35:ffm6e9yo0ftzsuxx@lmc8ixkebgaq22lo.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/vq7rrt76qdg7hs6r";
            String username = "x8ndc68nh58rpy35";
            String password = "ffm6e9yo0ftzsuxx";

            return DriverManager.getConnection(jdbUrl, username, password);
        }
        catch (Exception e) {
            throw new Exception("Cannot create database connection : " + e.getMessage());
        }

    }
}