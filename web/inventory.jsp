<%-- 
    Document   : inventory
    Created on : Apr 11, 2017, 8:19:46 PM
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
        <title>Inventory</title>
    </head>
    <body>
        <%-- AVAILABLE INVENTORY --%>
        <a href="managerHome.jsp">Back</a> <br> <br>
        <h1>Available Inventory</h1>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="nbuser"/>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT F.title AS Title, COUNT(I.film_id) AS NumAvailable
            FROM inventory AS I
            JOIN film AS F
            ON I.film_id = F.film_id
            GROUP BY I.film_id
        </sql:query>

        <table border="1" width="100%">
            <tr>
                <th>Title</th>
                <th>Number Available</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.TITLE}"/></td>
                    <td><c:out value="${row.NUMAVAILABLE}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
