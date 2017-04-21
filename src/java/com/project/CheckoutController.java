/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mamos
 */
public class CheckoutController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String CHECKOUT = "/customerTransactions.jsp";
    //private static String LIST_USER = "/listUser.jsp";
    private CheckoutDAO dao;

    public CheckoutController() {
        super();
        dao = new CheckoutDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Transaction trans = new Transaction();
        String userID = request.getParameter("userID");
        Integer user_id = Integer.parseInt(userID);
        trans.setUserID(Integer.parseInt(userID));

//        String filmID = request.getParameter("filmID");
//        trans.setFilmID(Integer.parseInt(filmID));
//
//        trans.setTitle(request.getParameter("title"));

        float amount = (float) 2.99;
        trans.setAmount(amount);

        trans.setCreditCard(request.getParameter("creditCard"));

        
        trans.setPin(request.getParameter("pin"));

        try {
            java.util.Date expDate = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("expDate"));
            trans.setExpDate(new java.sql.Date(expDate.getTime()));

        } catch (ParseException e) {
            e.printStackTrace();
        }

        try {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
            LocalDateTime now = LocalDateTime.now();
            String transDate = dtf.format(now.toLocalDate());
            SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");
            java.util.Date date = sdf1.parse(transDate);
            java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());
            trans.setTransDate(sqlStartDate);

        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        try{
            dao.addTransactions(user_id,trans);
            dao.removeCart(user_id);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        

//        user.setEmail(request.getParameter("email"));
//        String userid = request.getParameter("userid");
//        if(userid == null || userid.isEmpty())
//        {
//            dao.addUser(user);
//        }
//        else
//        {
//            user.setUserid(Integer.parseInt(userid));
//            dao.updateUser(user);
//        }
        RequestDispatcher view = request.getRequestDispatcher(CHECKOUT);
//        request.setAttribute("users", dao.getAllUsers());
        view.forward(request, response);
    }

}
