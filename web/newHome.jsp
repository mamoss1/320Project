<%-- 
    Document   : home
    Created on : Apr 4, 2017, 3:53:25 PM
    Author     : memos
--%>
<%-- 
   HOME PAGE WITH ALERT THAT USERNAME OR PASSWORD WAS WRONG
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
        <img src="css/ui-lightness/images/logo.png" width="247" height="65" alt="captcha"/> <br>
        <script language ="JavaScript" >
            alert("Invalid Login \nIncorrect Username or Password \nPlease Try Again");
        </script>
        
        <h1>User Login</h1>
        <%-- User Login --%>
        <form method="GET" action="ProductController" name="frmUserLogin">
            Email : <input type="text" name="email"
                           value="<c:out value="${user.email}" />" /> <br> 
            Password: <input type="password" name="password" value= "<c:out value="${user.password}" />" /> <br> <br>
            <input type="submit" value="Submit" />
        </form>

        <h1>User Register</h1>    
        <%-- User Register --%>   
        <form method="POST" action="ProductController" name="frmUserRegister">
            <input type="hidden" readonly="readonly" name="order_num"
                   value="<c:out value="${user.user_id}" />" /> <br> 
            First Name : <input type="text" name="firstName"
                                value="<c:out value="${user.firstName}" />" /> <br> 
            Last Name: <input type="text" name="lastName"
                              value= "<c:out value="${user.lastName}" />" /> <br> 
            Email : <input type="text" name="email"
                           value="<c:out value="${user.email}" />" /> <br> 
            Password: <input type="password" name="password"
                             value= "<c:out value="${user.password}" />" /> <br> 
            Manager: <input type="radio" name="isManager" value="True" checked/> <br> 
            Customer: <input type="radio" name="isManager" value="False" /> <br> <br>

            <img src="css/ui-lightness/images/newCaptcha.png" width="175" height="45" alt="captcha"/> <br>
            <input type="text" name="userAnswer" value="" />
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>
