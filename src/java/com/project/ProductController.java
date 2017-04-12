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
import javax.servlet.http.HttpSession;

//https://docs.oracle.com/cd/E17802_01/products/products/servlet/2.1/api/javax.servlet.http.HttpServlet.html

public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String CUSTOMER = "/customerHome.jsp";
    private static String MANAGER = "/managerHome.jsp";
    private ProductDAO dao;

    public ProductController() {
        super();
        dao = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String forward="";
     
        String action = request.getParameter("action");
      
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        session.setAttribute("email", email);
        
        
        try
          {
              //Find the email in the database (if it doesn't exist it will go to catch)
              //Get the password linked to email and check if it equals password entered (if not display invalid login)
              //If it matches, check whether they are employee or member. This will decide which forward to use
              
              User user = new User();
              user = dao.getUser(request.getParameter("email"));
              String password = user.getPassword();
              boolean isManager = user.getIsManager();
              String enteredPassword = request.getParameter("password");
              if(enteredPassword.equals(password))
              {
                  if(isManager == true)
                  {
                      forward = MANAGER;
                      
                  }
                  else
                  {
                      forward = CUSTOMER;
                  }
              }
              else
              {
                  //invalid login
              }
              
              
          }
          catch (Exception e)
          {
              //Display "Ivalid login, please try again"
          } 
        
        
        
        //OLD CODE

//        if (action.equalsIgnoreCase("delete")){
//            int order_num = Integer.parseInt(request.getParameter("order_num"));
//            dao.deleteProduct(order_num);
//            forward = LIST_PRODUCT;
//            request.setAttribute("products", dao.getAllProducts());    
//        } else if (action.equalsIgnoreCase("edit")){
//            forward = INSERT_OR_EDIT;
//            int order_num = Integer.parseInt(request.getParameter("order_num"));
//            Product product = dao.getProductById(order_num);
//            request.setAttribute("product", product);
//        } else if (action.equalsIgnoreCase("listProduct")){
//            forward = LIST_PRODUCT;
//            request.setAttribute("products", dao.getAllProducts());
//        } else {
//            forward = INSERT_OR_EDIT;
//        }

        //fowards it to the specific page
        RequestDispatcher view = request.getRequestDispatcher(forward);
        
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean isManager = Boolean.parseBoolean(request.getParameter("isManager"));
        
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPassword(password);
        user.setIsManager(isManager);
        
        dao.addUser(user);
         
//        String order_num = request.getParameter("order_num");
//        if(order_num == null || order_num.isEmpty())
//        {
//            dao.addProduct(product);
//        }
//        else
//        {
//            product.setOrder_num(Integer.parseInt(order_num));
//            dao.updateProduct(product);
//        }
        
        if(isManager == true)
        {
            RequestDispatcher view = request.getRequestDispatcher(MANAGER);
            request.setAttribute("user", user);
            view.forward(request, response);
        }

        else
        {
            RequestDispatcher view = request.getRequestDispatcher(CUSTOMER);
            request.setAttribute("user", user);
            view.forward(request, response);
        }
    }
}