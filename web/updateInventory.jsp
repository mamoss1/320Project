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
        <h1>Delete Film</h1>
        <%-- Delete movie --%>
        <form method="GET" action="InventoryController" name="frmDeleteFilm">
            Film ID : <input type="number" required min ="1" name="filmId"/> <br>  
            <input type="submit" value="Submit" />
        </form>
          
        <h1>Add Film</h1>    
         <%-- Add Film --%>   
        <form method="POST" action="InventoryController" name="frmAddFilm">
            Title: <input type="text" name="title"/> <br> 
            Description : <input type="text" name="description"/> <br> 
            Release Year: <input type="number" required min ="1000" name="releaseYear"/> <br> 
            Rental Duration (Days): <input type="number" required min ="1" name="rentalDuration"/> <br> 
            Length (Minutes): <input type="number" required min ="1" name="length"/> <br> 
            Special Features: <input type="text" name="specialFeatures"/> <br> 
            <input type="submit" value="Submit" />
        </form>
            
                  
        
    </body>
</html>
