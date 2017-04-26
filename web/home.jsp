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
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title> 
    </head>
    <body>
    <center>
        <img src="css/ui-lightness/images/logo.png" width="247" height="65" alt="captcha"/> <br>
    </center>

    <%-- User Login --%>
    
    <form method="GET" action="ProductController" name="frmUserLogin">
       <h1>User Login</h1>
        Email : <input type="text" name="email"
                       value="<c:out value="${user.email}" />" /> <br> 
        Password: <input type="password" name="password" value= "<c:out value="${user.password}" />" /> <br> <br>
        <input type="submit" value="Login" />
    </form>



    <%-- User Register --%>   
    <form method="POST" action="ProductController" name="frmUserRegister">
        <input type="hidden" readonly="readonly" name="order_num"
               value="<c:out value="${user.user_id}" />" /> <br> 
        <h1>User Register</h1> 
        First Name : <input type="text" name="firstName"
                            value="<c:out value="${user.firstName}" />" /> <br> 
        Last Name: <input type="text" name="lastName"
                          value= "<c:out value="${user.lastName}" />" /> <br> 
        Email : <input type="text" name="email"
                       value="<c:out value="${user.email}" />" /> <br> 
        Password: <input type="password" name="password"
                         value= "<c:out value="${user.password}" />" /> (Password must be at least 8 characters long, and must contain letters and numbers)<br> 
        Manager: <input type="radio" name="isManager" value="True" checked/> <br> 
        Customer: <input type="radio" name="isManager" value="False" /> <br> <br>

        <img src="css/ui-lightness/images/newCaptcha.png" width="175" height="45" alt="captcha"/> <br>
        <input type="text" name="userAnswer" value="" />
        <input type="submit" value="Register" />
    </form>

</body>
</html>
