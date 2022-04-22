/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import oracle.jdbc.OracleDriver;

/**
 *
 * @author LENOVO
 */
public class DbConfig {
    public static Connection connect()
    {
          try {
            //driver maneger is predefined class who manage to convert data
            DriverManager.registerDriver(new OracleDriver());
            String user = "student", password = "student", url = "jdbc:oracle:thin:@localhost:1521:xe";
            Connection connection = DriverManager.getConnection(url, user, password);
           // System.out.println(connection);
           return connection;
        } catch (Exception ex) {
            System.out.println(ex);
            return null;
        }
    }
}
