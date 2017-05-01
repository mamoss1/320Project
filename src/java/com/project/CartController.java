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

public class CartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String Home_Cart="/home_cart.jsp";
    private static String Cart = "/cart.jsp";
    private static String SEARCH = "/search.jsp";
    private CartDAO dao;

    public CartController() {
        super();
        dao = new CartDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String forward="";
     
        String action = request.getParameter("action");
       //This action add the infromation to the cart.
        if(action.equalsIgnoreCase("d")){
                forward= Cart;
            String title = request.getParameter("title");
            Film film = dao.getFilmByTitle(title);
             request.setAttribute("film", film); 
             //This action delete the infromation from the cart.
        } else if (action.equalsIgnoreCase("delete")){
             String title = request.getParameter("title");            
            dao.deleteCart(title);
           forward =Home_Cart; 
            request.setAttribute("wishlists", dao.getAllCart());       
            } else {
                forward="search.jsp";
            }
            RequestDispatcher view= request.getRequestDispatcher(forward);
            
            view.forward(request, response);
            
            
            
            }   
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Film film = new Film();
        String title = request.getParameter("title");
 
        film.setTitle(title);
               
        
       // String title = request.getParameter("title");
        
        RequestDispatcher view = request.getRequestDispatcher("/wishlist.jsp");
        request.setAttribute("films", dao.getTitleFilms());
        view.forward(request, response);
    }
    }