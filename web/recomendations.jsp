<%-- 
    Document   : recomendations
    Created on : Apr 12, 2017, 8:10:25 PM
    Author     : memos
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Recommendations</title>
    </head>
    <body>
        <ul>
            <li><a href="customerHome.jsp">Home</a></li>
            <li><a href="home_cart.jsp">Cart</a></li>
            <li><a href="home_wishlist.jsp">Wishlist</a></li>    
            <li><a href="search.jsp">Search</a></li>     
            <li><a href="checkout.jsp">Checkout</a></li>
            <li><a class="active" href="recomendations.jsp">Movie Recommendations</a></li>
            <li><a href="return.jsp">Return</a></li>
            <li><a href="home.jsp">Log Out</a></li>
        </ul> <br> 
        
        <img src="css/ui-lightness/images/logo.png" width="247" height="65" alt="captcha"/> <br>
        
        <h1>The Following Are Our Bestsellers: </h1><br>
        
        <%-- BEST SELLERS --%>

        <h1>Best Sellers</h1>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="nbuser"/>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT SUM(AMOUNT) AS REVENUE, FILMID
            FROM TRANSACTIONS
            GROUP BY FILMID
            ORDER BY SUM(AMOUNT) DESC
        </sql:query>

        <table border="1" width="100%">
            <tr>
                <th>Revenue</th>
                <th>Film ID</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.REVENUE}"/></td>
                    <td><c:out value="${row.FILMID}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
