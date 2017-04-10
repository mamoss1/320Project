<%-- 
    Document   : managerHome
    Created on : Apr 4, 2017, 8:12:42 PM
    Author     : mamos
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Home</title>
    </head>
    <body>
        <h1>Manager Home</h1>

        
         <table border=1>
        <thead>
        <tr>
               <th>USERID</th>
               <th>FIRSTNAME</th>
               <th>LASTNAME</th>
               <th>EMAIL</th>
               <th>PASSWORD</th>
        </tr>
        </thead>
        <tbody>
            <%
           Class.forName("com.mysql.jdbc.Driver");
           Connection connection= null;
           connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root","nbuser");
           Statement stmt= null;
           stmt=connection.createStatement();    
           Statement statement = connection.createStatement();
           String query= " SELECT USERID, FIRSTNAME, LASTNAME, EMAIL, PASSWORD FROM USERS WHERE ISMANAGER = '0'";
           ResultSet rs= null;
           rs= stmt.executeQuery(query);
             %>
        <c:forEach var="row" items="${rs.rows}">
        <tr>             
        <td><c:out value="${row.USERID}"/></td>
        <td><c:out value="${row.FIRSTNAME}"/></td>           
        <td><c:out value="${row.LASTNAME}"/></td> 
        <td><c:out value="${row.EMAIL}"/></td>
        <td><c:out value="${row.PASSWORD}"/></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
