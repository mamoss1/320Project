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
        <ul>
            <li><a class="active" href="customerHome.jsp">Home</a></li>
            <li><a href="cart.jsp">Cart</a></li>
            <li><a href="wishlist.jsp">Wishlist</a></li>    
            <li><a href="search.jsp">Search</a></li>     
            <li><a href="checkout.jsp">Checkout</a></li>
            <li><a href="home.jsp">Log Out</a></li>
        </ul> <br> <br> <br>
            <% String email = session.getAttribute("email").toString();
            %>
            <h1>Hello <%=email%>!</h1>
            <h1>Welcome to Crimson Video Store</h1>
            <h2>Please use the navigation bar above to navigate our website.</h2>
    </body>
</html>
