<%-- 
    Document   : customerTransactions
    Created on : Apr 11, 2017, 3:33:13 PM
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
        <title>Customer Transactions</title>

    </head>
    <body>
        <ul>
            <li><a href="search.jsp">Back</a></li>     
        </ul> <br> <br> 
        <img src="css/ui-lightness/images/logo.png" width="247" height="65" alt="captcha"/> <br>
        <h1>Your Transactions</h1>
        <% String email = session.getAttribute("email").toString();
            Integer user_id=(Integer)session.getAttribute("user_id");
            %>

    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/sakila"
                       user="root"  password="nbuser"/>

   

    <sql:query dataSource="${snapshot}" var="result2">
        SELECT USERID, FILMID, TITLE, TRANSDATE, AMOUNT 
        from TRANSACTIONS
        WHERE USERID = <%=user_id%>
        
    </sql:query>
  
    <table border="1" width="100%">
        <tr>
            <th>User ID</th>
            <th>Film ID</th>
            <th>Title</th>
            <th>Transaction Date</th>
            <th>Amount</th>
        </tr>
        <c:forEach var="row" items="${result2.rows}">
            <tr>
            <td><c:out value="${row.USERID}"/></td>
            <td><c:out value="${row.FILMID}"/></td>
            <td><c:out value="${row.TITLE}"/></td>
            <td><c:out value="${row.TRANSDATE}"/></td>
            <td><c:out value="${row.AMOUNT}"/></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
