<%-- 
    Document   : managerHome
    Created on : Apr 4, 2017, 8:12:42 PM
    Author     : mamos
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
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Manager Home</title>
    </head>
    <body>

        <ul>
            <li><a class="active" href="managerHome.jsp">Home</a></li>
            <li><a href="inventory.jsp">Inventory</a></li>
            <li><a href="reports.jsp">Reports</a></li>
            <li><a href="home.jsp">Log Out</a></li>            
        </ul> <br> <br>

        <%-- CUSTOMER PROFILES --%>

        <h1>Welcome! Please see below for: </h1>
          <h1>  Customer Profiles, Movie Checkouts, Sales, and Revenue</h1><br> <br>

        <h1>Customer Profiles</h1>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="nbuser"/>

        <sql:query dataSource="${snapshot}" var="result">
            SELECT USERID,  FIRSTNAME, LASTNAME, EMAIL, PASSWORD
            FROM USERS 
            WHERE ISMANAGER = '0'
        </sql:query>

        <table border="1" width="100%">
            <tr>
                <th>User ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Password</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.USERID}"/></td>
                    <td><c:out value="${row.FIRSTNAME}"/></td>
                    <td><c:out value="${row.LASTNAME}"/></td>
                    <td><c:out value="${row.EMAIL}"/></td>
                    <td><c:out value="${row.PASSWORD}"/></td>
                </tr>
            </c:forEach>
        </table>


        <%-- MOVIE CHECKOUTS --%>

        <h1>Movie Checkouts</h1>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="nbuser"/>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * 
            FROM TRANSACTIONS
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
                <th>Credit Card Pin Number</th>
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

        <%-- SALES --%>

        <h1>Sales</h1>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="nbuser"/>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT USERID, FILMID, TITLE, TRANSDATE, AMOUNT
            FROM TRANSACTIONS
        </sql:query>

        <table border="1" width="100%">
            <tr>
                <th>User ID</th>
                <th>Film ID</th>
                <th>Title</th>
                <th>Transaction Date</th>
                <th>Amount</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.USERID}"/></td>
                    <td><c:out value="${row.FILMID}"/></td>
                    <td><c:out value="${row.TITLE}"/></td>
                    <td><c:out value="${row.TRANSDATE}"/></td>
                    <td><c:out value="${row.AMOUNT}"/></td>
                </tr>
            </c:forEach>
        </table>



        <%-- REVENUE --%>

        <h1>Revenue</h1>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="nbuser"/>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT SUM(AMOUNT) AS REVENUE
            FROM TRANSACTIONS
        </sql:query>

        <table border="1" width="100%">
            <tr>
                <th>REVENUE</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.REVENUE}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
