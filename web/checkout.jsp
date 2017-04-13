<%-- 
    Document   : checkout
    Created on : Apr 11, 2017, 2:22:07 PM
    Author     : mamos
--%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>

        <link rel="stylesheet" type="text/css" href="style.css">
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
        <title>Checkout Page</title>
    </head>
    <body>

        <ul>
            <li><a href="customerHome.jsp">Home</a></li>
            <li><a href="cart.jsp">Cart</a></li>
            <li><a href="wishlist.jsp">Wishlist</a></li>    
            <li><a href="search.jsp">Search</a></li>     
            <li><a class="active" href="checkout.jsp">Checkout</a></li>
            <li><a href="recomendations.jsp">Movie Recommendations</a></li>
            <li><a href="home.jsp">Log Out</a></li>
        </ul>

        <br> <br>

        <h1>Checkout</h1>
        <script>
            $(function () {
                $('input[name=expDate]').datepicker();
            });
        </script>
        <% String email = session.getAttribute("email").toString();
            %>
       
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/sakila"
                       user="root"  password="nbuser"/>
    
   

    <sql:query dataSource="${snapshot}" var="result">
        SELECT USERID 
        from USERS
        WHERE EMAIL = '<%=email%>'
    </sql:query>   
        
        
    
        
        
 
        <form method="POST" action='CheckoutController' name="frmAddTransaction">
            User ID : <input type="text"  name="userID" readonly="readonly"
                             value="<c:forEach var="row" items="${result.rows}"> <c:out value="${row.USERID}" /> </c:forEach>"<c:out value="${transaction.userID}" />" /> <br /> 
            Film ID : <input
                type="text" name="filmID"
                value="<c:out value="${transaction.filmID}" />" /> <br /> 
            Film Title : <input
                type="text" name="title"
                value="<c:out value="${transaction.title}" />" /> <br /> 
            Credit Card : <input
                type="text" name="creditCard"
                value="<c:out value="${transaction.creditCard}" />" /> <br /> 
            Expiration Date : <input
                type="text" name="expDate"
                value="<fmt:formatDate pattern="MM/dd/yyyy" value="${transaction.expDate}" />" /> <br /> 
            Security Code : <input type="text" name="pin"
                           value="<c:out value="${transaction.pin}" />" /> <br />
            Amount : <input type="text" name="amount"
                           value="<c:out value="${transaction.amount}" />" /> <br />
            <input type="submit" value="Checkout" />
        </form>

    </body>
</html>
