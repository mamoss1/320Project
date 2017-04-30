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

public class CartDAO {

    private Connection connection;

    public CartDAO() {
        connection = DbConnectionUtil.getConnection();
    }

   
    public Cart getWishlist(int userid)
    {
        Cart cart = new Cart();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.
                    prepareStatement("select * from cart where userid =?");
            preparedStatement.setInt(1, userid);
            
            ResultSet rs = preparedStatement.executeQuery();
            cart.setFilm_id(rs.getInt("filmid"));
            cart.setTitle(rs.getString("title"));
          
            
            
        } catch (SQLException ex) {
            
        }
        
        return cart;
    }
    
    public void addCart(Cart cart) {
        try {
            PreparedStatement preparedStmt = connection
                    .prepareStatement("INSERT INTO cart(userid, filmid, title) values (?, ?, ?)");

            
            preparedStmt.setInt(1, cart.getUser_id());
            preparedStmt.setInt(2, cart.getFilm_id());
            preparedStmt.setString(3, cart.getTitle());
            preparedStmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
   public void deleteCart (String title){
      try{
          PreparedStatement preparedStatement = connection
                  .prepareStatement("delete from cart where title=?");
            preparedStatement.setString(1,title);
            preparedStatement.executeUpdate();
      
      } catch (SQLException e) {
        e.printStackTrace();
      }  
    }
    public List <Cart> getAllCart(){
      List <Cart> carts= new ArrayList<Cart>();
      try{
          Statement statement =connection.createStatement();
          ResultSet rs= statement.executeQuery("select * from cart");
        while (rs.next()) {
            Cart cart= new Cart();
            cart.setUser_id(rs.getInt("USERID"));
            cart.setFilm_id(rs.getInt("FILMID"));
            cart.setTitle(rs.getString("TITLE"));
    
            carts.add(cart);
        }
      } catch(SQLException e) {
          e.printStackTrace();
      }
      return carts;
    }
    
    public List<Film> getTitleFilms() {
        List<Film> films = new ArrayList<Film>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select title, film_id from film where title=?");
            while (rs.next()) {
                Film film = new Film();
                film.setTitle(rs.getString("title"));
                film.setFilm_id(rs.getInt("film_id"));
                
                
                films.add(film);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return films;
    }
  public Film getFilmByTitle(String title) {
        Film film = new Film();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select title from film where title=?");
            preparedStatement.setString(1, title);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                             
                film.setTitle(rs.getString("title"));            
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return film;
    }

    
}
