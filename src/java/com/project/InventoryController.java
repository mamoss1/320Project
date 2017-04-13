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
public class InventoryController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String INVENTORY = "/inventory.jsp";
    private static String UPDATE_INVENTORY = "/updateInventory.jsp";
    private InventoryDAO dao;

    public InventoryController() {
        super();
        dao = new InventoryDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String forward = UPDATE_INVENTORY;
        
        Integer filmId = Integer.parseInt(request.getParameter("filmId"));
        dao.deleteFilm(filmId);

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
        if (!firstName.equals("") && !lastName.equals("") && !email.equals("") && !password.equals("")) {
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setPassword(password);
            user.setIsManager(isManager);

            dao.addUser(user);

//            if (isManager == true) {
//                RequestDispatcher view = request.getRequestDispatcher(MANAGER);
//                request.setAttribute("user", user);
//                view.forward(request, response);
//            } else {
//                RequestDispatcher view = request.getRequestDispatcher(CUSTOMER);
//                request.setAttribute("user", user);
//                view.forward(request, response);
            }
//        } else {
//            RequestDispatcher view = request.getRequestDispatcher("/home.jsp");
//            request.setAttribute("user", user);
//            view.forward(request, response);
//        }

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
    }
}
