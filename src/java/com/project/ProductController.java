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
import javax.swing.*;

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

        String forward = "";

        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        if (!email.equals("")) {
            session.setAttribute("email", email);

            //Find the email in the database (if it doesn't exist it will go to catch)
            //Get the password linked to email and check if it equals password entered (if not display invalid login)
            //If it matches, check whether they are employee or member. This will decide which forward to use
            User user = new User();
            try {
                user = dao.getUser(request.getParameter("email"));
                String password = user.getPassword();
                boolean isManager = user.getIsManager();
                String enteredPassword = request.getParameter("password");
                if (enteredPassword.equals(password)) {
                    if (isManager == true) {
                        forward = MANAGER;

                    } else {
                        forward = CUSTOMER;
                    }
                } else {
                    forward = "/newHome.jsp";
                }
            } catch (Exception e) {
                forward = "/home.jsp";
            }

        }
        else
        {
            forward = "/home.jsp";
        }

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

            if (isManager == true) {
                RequestDispatcher view = request.getRequestDispatcher(MANAGER);
                request.setAttribute("user", user);
                view.forward(request, response);
            } else {
                RequestDispatcher view = request.getRequestDispatcher(CUSTOMER);
                request.setAttribute("user", user);
                view.forward(request, response);
            }
        } else {
            RequestDispatcher view = request.getRequestDispatcher("/home.jsp");
            request.setAttribute("user", user);
            view.forward(request, response);
        }

    }
}
 