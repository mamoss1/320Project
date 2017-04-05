<%-- 
    Document   : home
    Created on : Apr 4, 2017, 3:53:25 PM
    Author     : memos
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        
        
        <%-- User Login --%>
        
        <form method="POST" action='ProductController' name="frmUserLogin">
            Email : <input type="text" name="email"
                             value="<c:out value="${user.email}" />" /> <br /> 
            
            Password: <input
                type="text" name="password"
                value= "<c:out value="${user.password}" />" /> <br /> 
            <input type="submit" value="Submit" />
        </form>
          
            
            
         <%-- User Register --%>    
        <form method="GET" action='ProductController' name="frmUserRegister">
            User ID: <input type="text" readonly="readonly" name="order_num"
                             value="<c:out value="${user.user_id}" />" /> <br /> 
            
            First Name : <input type="text" name="firstName"
                             value="<c:out value="${user.firstName}" />" /> <br /> 
            
            Last Name: <input type="text" name="password"
                             value= "<c:out value="${user.lastName}" />" /> <br /> 
            
            Email : <input type="text" name="email"
                             value="<c:out value="${user.email}" />" /> <br /> 
            
            Password: <input
                type="text" name="password"
                value= "<c:out value="${user.password}" />" /> <br /> 
            
            
            <input type="submit" value="Submit" />
        </form>    
        
        
        
        
        
        
    </body>
</html>
