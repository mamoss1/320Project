<%-- 
    Document   : customerProfiles
    Created on : Apr 10, 2017, 10:47:19 AM
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
        <title>Reports</title>
    </head>
    <body>
        
        <ul>
            <li><a href="managerHome.jsp">Home</a></li>
            <li><a href="inventory.jsp">Inventory</a></li>
            <li><a class="active" href="reports.jsp">Reports</a></li>            
        </ul>
        
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



        <%-- WORST SELLERS --%>

        <h1>Worst Sellers</h1>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="nbuser"/>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT SUM(AMOUNT) AS REVENUE, FILMID
            FROM TRANSACTIONS
            GROUP BY FILMID
            ORDER BY SUM(AMOUNT) ASC
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
            
            <%-- NOT SOLD IN PAST YEAR --%>

        <h1>Movies Not Sold in the Past Year</h1>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="nbuser"/>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT *
            FROM TRANSACTIONS
            WHERE TRANSDATE < '2016-12-30' 
        </sql:query>

        <table border="1" width="100%">
            <tr>
                <th>User ID</th>
                <th>Film ID</th>
                <th>Title</th>
                <th>Transaction Date</th>
                <th>Amount</th>
                <th>Credit Card</th>
                <th>Credit Card Expiration Date</th>
                <th>Credit Card Pin</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.USERID}"/></td>
                    <td><c:out value="${row.FILMID}"/></td>
                    <td><c:out value="${row.TITLE}"/></td>
                    <td><c:out value="${row.TRANSDATE}"/></td>
                    <td><c:out value="${row.AMOUNT}"/></td>
                    <td><c:out value="${row.CREDITCARD}"/></td>
                    <td><c:out value="${row.CCEXP}"/></td>
                    <td><c:out value="${row.CCPIN}"/></td>
                </tr>
            </c:forEach>
        </table>
            
            
        <br> <br>
        <a href="managerHome.jsp">Back</a>
    </body>
</html>
