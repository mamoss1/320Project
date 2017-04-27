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

public class ReturnDAO {

    private Connection connection;

    public ReturnDAO() {
        connection = DbConnectionUtil.getConnection();
    }

    public int getDays(int userId, int filmId) {
        PreparedStatement preparedStatement;
        int days = 0;
        try {
            preparedStatement = connection.prepareStatement("select datediff(curdate(), "
                    + "transdate) as days from transactions where userid=? and filmid=? and isreturned=0");

            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, filmId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
               days = rs.getInt("days");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReturnDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return days;
    }

   public void setTransaction(int userId, int filmId, double charge)
   {
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement("update transactions set amount = amount +? "
            + "where userid=? and filmid=? and isreturned=0");

            preparedStatement.setDouble(1, charge);
            preparedStatement.setInt(2, userId);
            preparedStatement.setInt(3, filmId);
            preparedStatement.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(ReturnDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
   
   public void setReturn(int userId, int filmId)
   {
       PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement("update transactions set isreturned=1 "
            + "where userid=? and filmid=? and isreturned=0");

            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, filmId);
            preparedStatement.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(ReturnDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
}
