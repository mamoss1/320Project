<%-- 
    Document   : checkout
    Created on : Apr 11, 2017, 2:22:07 PM
    Author     : mamos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Checkout Page</title>
    </head>
    <body>
        
        <ul>
            <li><a href="customerHome.jsp">Home</a></li>
            <li><a href="cart.jsp">Cart</a></li>
            <li><a href="wishlist.jsp">Wishlist</a></li>    
            <li><a href="search.jsp">Search</a></li>     
            <li><a class="active" href="checkout.jsp">Checkout</a></li>     
        </ul>
        
        <br> <br>
        
        <h1>Checkout</h1>
        <table border="0">
            <tbody>
                <tr>
                    <td>Card Number</td>
                    <td><input type="text" ></td>
                </tr>
                <tr>
                    <td>Expiration Date</td>
                    <td><input type="text"</td>
                </tr>
                <tr>
                    <td>Security Code</td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><a href="customerTransactions.jsp">Checkout</td>
                </tr>    
            </tbody>
        </table>

    </body>
</html>
