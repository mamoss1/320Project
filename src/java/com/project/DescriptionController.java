package com.project;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//https://docs.oracle.com/cd/E17802_01/products/products/servlet/2.1/api/javax.servlet.http.HttpServlet.html

public class DescriptionController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String Details = "/description.jsp";
    private DescriptionDAO dao;

    public DescriptionController() {
        super();
        dao = new DescriptionDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String forward="";
     
        String action = request.getParameter("action");
        if(action.equalsIgnoreCase("d")){
                forward= "description.jsp";
            String title = request.getParameter("title");
            Film film = dao.getFilmByTitle(title);
             request.setAttribute("film", film); 
   
            } else {
                forward="listProduct.jsp";
            }
            RequestDispatcher view= request.getRequestDispatcher(forward);
            
            view.forward(request, response);
            
            
            
            }   
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Film film = new Film();
        String title = request.getParameter("title");
 
        film.setTitle(title);
               
        
       // String title = request.getParameter("title");
        
        RequestDispatcher view = request.getRequestDispatcher("/description.jsp");
        request.setAttribute("films", dao.getTitleFilms());
        view.forward(request, response);
    }
    }


