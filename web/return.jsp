<%-- 
    Document   : return
    Created on : Apr25, 2017, 3:53:25 PM
    Author     : marley
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Return</title>
    </head>
         
<body>
    
            <ul>
            <li><a href="customerHome.jsp">Home</a></li>
            <li><a href="home_cart.jsp">Cart</a></li>
            <li><a href="home_wishlist.jsp">Wishlist</a></li>    
            <li><a href="search.jsp">Search</a></li>     
            <li><a href="checkout.jsp">Checkout</a></li>
            <li><a href="recomendations.jsp">Movie Recommendations</a></li>
            <li><a class="active" href="return.jsp">Return</a></li>
            <li><a href="home.jsp">Log Out</a></li>
        </ul> <br> 
      
            <%
              //Integer user_id=(Integer)session.getAttribute("user_id");
              Integer userid=1;
            %>
        
            
            <h1>Return Page</h1>

        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="nbuser"/>

        <sql:query dataSource="${snapshot}" var="result">
            SELECT FILMID, TITLE
            FROM TRANSACTIONS
            WHERE USERID = <%=userid%> AND ISRETURNED = '0'
        </sql:query>

        <table border="1" width="100%">
            <tr>
                <th>Film ID</th>
                <th>Title</th>
                <th>Action</th>

            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.FILMID}"/></td>
                    <td><c:out value="${row.TITLE}"/></td>
                    <td><a href="ReturnController?userId=<c:out value="<%=userid%>"/>&filmId=<c:out value="${row.FILMID}"/>">Return</a></td>
                </tr>
            </c:forEach>
        </table>

   
</body>

</html> 