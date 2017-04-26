package com.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.application.Platform;

public class ProductDAO {

    private Connection connection;

    public ProductDAO() {
        connection = DbConnectionUtil.getConnection();
    }

    public User getUser(String email) {
        User user = new User();
        PreparedStatement preparedStatement;
        try {

            preparedStatement = connection.prepareStatement("select * from users where email=?");
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                user.setUser_id(rs.getInt("userid"));
                user.setFirstName(rs.getString("firstname"));
                user.setLastName(rs.getString("lastname"));
                user.setEmail(rs.getString("email"));
                user.setIsManager(rs.getBoolean("ismanager"));
                user.setPassword(rs.getString("password"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return user;
    }

    public void addUser(User user) {
        try {
            PreparedStatement preparedStmt = connection
                    .prepareStatement("INSERT INTO USERS(firstname, lastname, email, ismanager, password) values (?, ?, ?, ?, ?)");

            
            preparedStmt.setString(1, user.getFirstName());
            preparedStmt.setString(2, user.getLastName());
            preparedStmt.setString(3, user.getEmail());
            preparedStmt.setBoolean(4, user.getIsManager());
            preparedStmt.setString(5, user.getPassword());
            preparedStmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    /**
     *
     * @param infoMessage
     * @param titleBar
     */
    public static void infoBox(String infoMessage, String titleBar)
    {
        infoBox(infoMessage, titleBar, null);
    }
    
    public static void infoBox(String infoMessage, String titleBar, String headerMessage)
    {
        Alert alert = new Alert(AlertType.INFORMATION);
        alert.setTitle(titleBar);
        alert.setHeaderText(headerMessage);
        alert.setContentText(infoMessage);
        alert.showAndWait();
    }

}
 