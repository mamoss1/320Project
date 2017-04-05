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
        Product product = new Product();
        String customer_id = request.getParameter("customer_id");
        String product_id = request.getParameter("product_id");
        String quality = request.getParameter("quality");
        String shipping_cost = request.getParameter("shipping_cost");
        
        product.setCustomer_id(Integer.parseInt(customer_id));
        product.setProduct_id(Integer.parseInt(product_id));
        product.setQuality(Integer.parseInt(quality));
        product.setShipping_cost(Integer.parseInt(shipping_cost));
        
        try {
            Date sales_date = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("sales_date"));
            product.setSales_date(sales_date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        try {
            Date shipping_date = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("shipping_date"));
            product.setShipping_date(shipping_date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        
        
        String order_num = request.getParameter("order_num");
        if(order_num == null || order_num.isEmpty())
        {
            dao.addProduct(product);
        }
        else
        {
            product.setOrder_num(Integer.parseInt(order_num));
            dao.updateProduct(product);
        }
        RequestDispatcher view = request.getRequestDispatcher(MANAGER);
        request.setAttribute("products", dao.getAllProducts());
        view.forward(request, response);
    }
}