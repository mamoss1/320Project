<%-- 
    Document   : customerHome
    Created on : Apr 4, 2017, 8:11:47 PM
    Author     : mamos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
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
        
        <form method="GET" action='CustomerController' name="frmCustomerHome">
            <% String email = session.getAttribute("email").toString();
            %>
            Hello<%=email%>
            Search: <input type="radio" name="page" value="1" /> <br> 
            Wishlist: <input type="radio" name="page" value="2" /> <br> 
            Cart: <input type="radio" name="page" value="3" /> <br> 
            Checkout: <input type="radio" name="page" value="4" /> <br> 
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>
