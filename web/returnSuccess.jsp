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
      
            <%
              //Integer user_id=(Integer)session.getAttribute("user_id");
              Integer user_id=1;
              String film_id = request.getParameter("filmId");
              String charge = request.getParameter("charge");
              Double total = Double.parseDouble(charge) + 2.99;
            %>
        
            
            <h1>Return Success</h1>
            
            <h1>Movie returned successfully!</h1>
            <h1>You have been charged <%=total%> for this rental</h1>
            <h2>This includes any late charges</h2>
            <ul>
            <li><a href="return.jsp">Back</a></li>     
            </ul>

        

   
</body>

</html> 

