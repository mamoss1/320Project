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
public class ReturnController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String CUSTOMER = "/customerHome.jsp";
    private static String MANAGER = "/managerHome.jsp";
    private ReturnDAO dao;

    public ReturnController() {
        super();
        dao = new ReturnDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String forward="/return.jsp";
     
        int filmId = Integer.parseInt(request.getParameter("filmId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        int days = dao.getDays(userId, filmId) - 7;
        double charge = 0.0;
        
        if (days>0)
        {
            charge = days * .6;
            dao.setTransaction(userId, filmId, charge);
        }
        
        dao.setReturn(userId, filmId);
        
            String chargeString = Double.toString(charge);
            RequestDispatcher view= request.getRequestDispatcher(forward);
            request.setAttribute("charge", chargeString);
            view.forward(request, response);
            
    }
}




