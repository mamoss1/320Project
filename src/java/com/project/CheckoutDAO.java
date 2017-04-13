/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author mamos
 */
public class CheckoutDAO {
    private Connection connection;

    public CheckoutDAO() {
        connection = DbConnectionUtil.getConnection();
    }
    
    public void addTransaction(Transaction trans) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into transactions(USERID, FILMID, TITLE, TRANSDATE, AMOUNT, CREDITCARD, CCEXP, CCPIN) values (?, ?, ?, ?, ?, ?, ?, ?)");

            preparedStatement.setInt(1, trans.getUserID());
            preparedStatement.setInt(2, trans.getFilmID());
            preparedStatement.setString(3, trans.getTitle());
            preparedStatement.setDate(4, trans.getTransDate());
            preparedStatement.setFloat(5, trans.getAmount());
            preparedStatement.setString(6, trans.getCreditCard());
            preparedStatement.setDate(7, trans.getExpDate());
            preparedStatement.setString(8, trans.getPin());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
