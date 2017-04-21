/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author mamos
 */
public class CheckoutDAO {

    private Connection connection;

    public CheckoutDAO() {
        connection = DbConnectionUtil.getConnection();
    }

    public void removeCart(int userID) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement(" delete from cart where userid = " + userID);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addTransactions(int user_id, Transaction t) throws SQLException {
        ArrayList<Transaction> transactions = new ArrayList<Transaction>();

        String creditCard = t.getCreditCard();
        Date expDate = t.getExpDate();
        Date transDate = t.getTransDate();
        String pin = t.getPin();
        Float amount = t.getAmount();
        Statement stmt = null;
        stmt = connection.createStatement();
        // Statement statement=connection.createStatement();

        String query = "SELECT FILMID, TITLE FROM CART WHERE USERID =" + user_id;
        ResultSet rs = null;
        rs = stmt.executeQuery(query);

        while (rs.next()) {
            Transaction trans = new Transaction();
            trans.setUserID(user_id);
            trans.setFilmID(rs.getInt(1));
            trans.setTitle(rs.getString(2));
            trans.setAmount(amount);
            trans.setCreditCard(creditCard);
            trans.setExpDate(expDate);
            trans.setTransDate(transDate);
            trans.setPin(pin);

            transactions.add(trans);
        }

        PreparedStatement preparedStatement = connection
                .prepareStatement("insert into transactions(USERID, FILMID, TITLE, TRANSDATE, AMOUNT, CREDITCARD, CCEXP, CCPIN) values (?, ?, ?, ?, ?, ?, ?, ?)");

        for (int i = 0; i < transactions.size(); i++) {
            try {

                preparedStatement.setInt(1, transactions.get(i).getUserID());
                preparedStatement.setInt(2, transactions.get(i).getFilmID());
                preparedStatement.setString(3, transactions.get(i).getTitle());
                preparedStatement.setDate(4, transactions.get(i).getTransDate());
                preparedStatement.setFloat(5, transactions.get(i).getAmount());
                preparedStatement.setString(6, transactions.get(i).getCreditCard());
                preparedStatement.setDate(7, transactions.get(i).getExpDate());
                preparedStatement.setString(8, transactions.get(i).getPin());
                preparedStatement.executeUpdate();

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

       
    }

}
