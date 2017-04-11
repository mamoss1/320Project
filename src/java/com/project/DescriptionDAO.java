/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author carte
 */
public class DescriptionDAO {
      private Connection connection;

    public DescriptionDAO() {
        connection = DbConnectionUtil.getConnection();
    }

    public List<Film> getTitleFilms() {
        List<Film> films = new ArrayList<Film>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select title from film");
            while (rs.next()) {
                Film film = new Film();
                film.setTitle(rs.getString("title"));
                
                
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

