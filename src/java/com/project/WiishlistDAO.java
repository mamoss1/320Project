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

public class WiishlistDAO {

    private Connection connection;

    public WiishlistDAO() {
        connection = DbConnectionUtil.getConnection();
    }

   
    public Wishlist getWishlist(int userid)
    {
        Wishlist wishlist = new Wishlist();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.
                    prepareStatement("select * from wishlist where userid =?");
            preparedStatement.setInt(1, userid);
            
            ResultSet rs = preparedStatement.executeQuery();
            wishlist.setFilm_id(rs.getInt("filmid"));
            wishlist.setTitle(rs.getString("title"));
          
            
            
        } catch (SQLException ex) {
            
        }
        
        return wishlist;
    }
    
    
    
    
    
    public void addWishlist(Wishlist wishlist) {
        try {
            PreparedStatement preparedStmt = connection
                    .prepareStatement("INSERT INTO wishlist(userid, title) values (?,?)");

            
            preparedStmt.setInt(1, wishlist.getUser_id());
            preparedStmt.setString(2, wishlist.getTitle());
            preparedStmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void addCart(Wishlist wishlist) {
        try {
            PreparedStatement preparedStmt = connection
                    .prepareStatement("INSERT INTO cart(userid, filmid, title) values (?, ?, ?)");

            
            preparedStmt.setInt(1, wishlist.getUser_id());
            preparedStmt.setInt(2, wishlist.getFilm_id());
            preparedStmt.setString(3, wishlist.getTitle());
            preparedStmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
   public void deleteWishlist (String title){
      try{
          PreparedStatement preparedStatement = connection
                  .prepareStatement("delete from wishlist inner join wishlist on users.USERID=wishlist.USERID"
                          + " where title=?");
            preparedStatement.setString(1,title);
            preparedStatement.executeUpdate();
      
      } catch (SQLException e) {
        e.printStackTrace();
      }  
    }
    public List <Wishlist> getAllWishlist(){
      List <Wishlist> wishlists= new ArrayList<Wishlist>();
      try{
          Statement statement =connection.createStatement();
          ResultSet rs= statement.executeQuery("select * from wishlist");
        while (rs.next()) {
            Wishlist wishlist= new Wishlist();
            wishlist.setUser_id(rs.getInt("USERID"));
            wishlist.setFilm_id(rs.getInt("FILMID"));
            wishlist.setTitle(rs.getString("TITLE"));
    
            wishlists.add(wishlist);
        }
      } catch(SQLException e) {
          e.printStackTrace();
      }
      return wishlists;
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
            preparedStatement.setString(2, title);
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
