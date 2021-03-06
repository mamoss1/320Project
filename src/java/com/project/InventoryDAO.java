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

public class InventoryDAO {

    private Connection connection;

    public InventoryDAO() {
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
    

    public void deleteFilm(int filmId) {
        try {
            PreparedStatement preparedStatement = 
                    connection.prepareStatement("delete from inventory where film_id = " + filmId +
                            "delete from film_text where film_id = " + filmId + 
                            "delete from film_category where film_id = " + filmId + 
                            "delete from film_actor where film_id = " + filmId);

            preparedStatement.executeUpdate();
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        try {
            PreparedStatement preparedStatement = 
                    connection.prepareStatement("delete from film where film_id = " + filmId);

            preparedStatement.executeUpdate();
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
    }
//
//    public void updateProduct(Product product) {
//        try {
//            PreparedStatement preparedStmt = connection
//                    .prepareStatement("update product set customer_id=?, product_id=?, quality=?, shipping_cost=?, sales_date=?, shipping_date=? where order_num = ?");
//
//            
//            
//            preparedStmt.setInt(1, product.getCustomer_id());
//            preparedStmt.setInt(2, product.getProduct_id());
//            preparedStmt.setInt(3, product.getQuality());
//            preparedStmt.setInt(4, product.getShipping_cost());
//            preparedStmt.setDate(5, new java.sql.Date(product.getSales_date().getTime()));
//            preparedStmt.setDate(6, new java.sql.Date(product.getShipping_date().getTime()));
//            preparedStmt.setInt(7, product.getOrder_num());
//            preparedStmt.executeUpdate();
//            
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
//
//    public List<Product> getAllProducts() {
//        List<Product> products = new ArrayList<Product>();
//        try {
//            Statement statement = connection.createStatement();
//            ResultSet rs = statement.executeQuery("select * from product");
//            while (rs.next()) {
//                Product product = new Product();
//                product.setOrder_num(rs.getInt("order_num"));
//                product.setCustomer_id(rs.getInt("customer_id"));
//                product.setProduct_id(rs.getInt("product_id"));
//                product.setQuality(rs.getInt("quality"));
//                product.setShipping_cost(rs.getInt("shipping_cost"));
//                product.setSales_date(rs.getDate("sales_date"));
//                product.setShipping_date(rs.getDate("shipping_date"));
//                
//                products.add(product);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return products;
//    }
//
//    public Product getProductById(int order_num) {
//        Product product = new Product();
//        try {
//            PreparedStatement preparedStatement = connection.
//                    prepareStatement("select * from product where order_num=?");
//            preparedStatement.setInt(1, order_num);
//            ResultSet rs = preparedStatement.executeQuery();
//
//            if (rs.next()) {
//                             
//                product.setOrder_num(rs.getInt("order_num"));
//                product.setCustomer_id(rs.getInt("customer_id"));
//                product.setProduct_id(rs.getInt("product_id"));
//                product.setQuality(rs.getInt("quality"));
//                product.setShipping_cost(rs.getInt("shipping_cost"));
//                product.setSales_date(rs.getDate("sales_date"));
//                product.setShipping_date(rs.getDate("shipping_date"));
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return product;
//    }
}
