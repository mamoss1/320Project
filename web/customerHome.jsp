<%-- 
    Document   : customerHome
    Created on : Apr 4, 2017, 8:11:47 PM
    Author     : mamos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!
        <%-- </h1><form name="customerPage" action="CustomerController">
            <select name="User Type">
                <option value="1">Search Movies</option>
                <option value="2">View Wish List</option>
                <option value="3">View Cart</option>
                <option value="4">Checkout</option>
            </select>
            <input type="submit" value="Submit" name="submit" />
        </form> --%>
        
        <form method="GET" action='CustomerController' name="frmUserLogin">
            <select name="User Type">
                <option value="1">Search Movies</option>
                <option value="2">View Wish List</option>
                <option value="3">View Cart</option>
                <option value="4">Checkout</option>
            </select> 
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>
