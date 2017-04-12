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
        <br> <br>
        <a href="managerHome.jsp">Back</a>
    </body>
</html>
