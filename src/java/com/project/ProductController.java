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
public class ProductController extends HttpServlet
{

    private static final long serialVersionUID = 1L;
    private static String CUSTOMER = "/customerHome.jsp";
    private static String MANAGER = "/managerHome.jsp";
    private ProductDAO dao;

    public ProductController()
    {
        super();
        dao = new ProductDAO();
    }

    //LOGGING IN AS A RETURNING USER
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        String forward = "";

        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        if (!email.equals(""))
        {
            session.setAttribute("email", email);

            //Find the email in the database (if it doesn't exist it will go to catch)
            //Get the password linked to email and check if it equals password entered (if not display invalid login)
            //If it matches, check whether they are employee or member. This will decide which forward to use
            User user = new User();
            try
            {
                user = dao.getUser(request.getParameter("email"));
                String password = user.getPassword();
                boolean isManager = user.getIsManager();
                String enteredPassword = request.getParameter("password");

                //if the password they entered matches the database's password
                if (enteredPassword.equals(password))
                {
                    //if they're a manager
                    if (isManager == true)
                    {
                        forward = MANAGER;
                    } //if they're a customer
                    else
                    {
                        forward = CUSTOMER;
                    }
                } //if the password they entered didn't match the database's password
                else
                {
                    forward = "/newHome.jsp";
                }
            } //catch for the try - forwards them to the home page w/ alert that their username or password was wrong
            catch (Exception e)
            {
                forward = "/newHome.jsp";
            }
        } //if the session's email is blank
        else
        {
            forward = "/home.jsp";
        }

        //fowards it to the specific page
        RequestDispatcher view = request.getRequestDispatcher(forward);

        view.forward(request, response);
    }

    //REGISTERING AS A NEW USER
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        User user = new User();
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean isManager = Boolean.parseBoolean(request.getParameter("isManager"));
        String userAnswer = request.getParameter("userAnswer");

        //if their captcha answer matches the picture
        if (userAnswer.equals("UBJ3NA"))
        {
            //if the textboxes aren't blank
            if (!firstName.equals("") && !lastName.equals("") && !email.equals("") && !password.equals(""))
            {

                //if the password is at least 8 characters long
                if (password.length() >= 8)
                {
                    Boolean verification = passCheck(password);

                    //if password is made up of letters and numbers
                    if (verification == true)
                    {
                        user.setFirstName(firstName);
                        user.setLastName(lastName);
                        user.setEmail(email);
                        user.setPassword(password);
                        user.setIsManager(isManager);

                        dao.addUser(user);

                        //if they're a manager
                        if (isManager == true)
                        {
                            RequestDispatcher view = request.getRequestDispatcher(MANAGER);
                            request.setAttribute("user", user);
                            view.forward(request, response);
                        } //if they're a customer   
                        else
                        {
                            RequestDispatcher view = request.getRequestDispatcher(CUSTOMER);
                            request.setAttribute("user", user);
                            view.forward(request, response);
                        }

                    } //if password isn't made up of letters and numbers
                    else
                    {
                        RequestDispatcher view = request.getRequestDispatcher("/home.jsp");
                        request.setAttribute("user", user);
                        view.forward(request, response);
                    }

                } //if the password isn't at least 8 characters
                else
                {
                    RequestDispatcher view = request.getRequestDispatcher("/home.jsp");
                    request.setAttribute("user", user);
                    view.forward(request, response);
                }

            } //if one of the text boxes was blank    
            else
            {
                RequestDispatcher view = request.getRequestDispatcher("/home.jsp");
                request.setAttribute("user", user);
                view.forward(request, response);
            }
        } //if they failed the captcha   
        else
        {
            RequestDispatcher view = request.getRequestDispatcher("/alsoNewHome.jsp");
            request.setAttribute("user", user);
            view.forward(request, response);
        }
    }

    public static boolean passCheck(String password)
    {
        for (int i = 0; i < password.length(); i++)
        {
            if (!Character.isLetterOrDigit((password.charAt(i))))
            {
                return false;
            }
        }
        return true;
    }

}
