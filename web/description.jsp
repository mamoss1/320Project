<%-- 
    Document   : description
    Created on : Apr 5, 2017, 4:53:51 PM
    Author     : carte
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Description</title>
    </head>
          
<body>
 
    <%-- This page show the details of the film, so that the user can know more about it.--%>
    
      <ul>
            <li><a href="search.jsp">Back</a></li>     
        </ul> <br> <br> <br>
          <h1>Welcome to the Description Page!</h1>
    <table border=1>
        <thead>
            <tr>
          
               <th>Title</th>
               <th>Category</th>
               <th>Description</th>
               <th>Actor's First Name</th>
               <th> Actor's Last Name </th>
               <th>Length</th>
               <th>Rating</th>
       
            </tr>
        </thead>
        <tbody>
           
            <% //This java code gets the need information for the description page.
           Class.forName("com.mysql.jdbc.Driver");
            Connection connection= null;
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root","nbuser");
             Statement stmt= null;
            stmt=connection.createStatement();
                
            Statement statement = connection.createStatement();

            String title = request.getParameter("title");  
              
           
           //This is a really long query to get the infromation need for the description.
            
             String query= " select F.title,C.name, F.description, A.first_name, A.last_name, F.length, F.rating from store as S join inventory as I"
                     + " on S.store_id=I.store_id"
                      + " join film_category as FC"
                      + " on I.film_id=FC.film_id"
                     +" join film as F"
                     +" on FC.film_id=F.film_id"
                     +" join film_actor as FA"
                     +" on F.film_id=FA.film_id"
                     +" join actor as A"
                     +" on FA.actor_id=A.actor_id"
                     +" join category as C"
                     +" on FC.category_id=C.category_id"
                     + " where F.title like '" + title + "'  "
                      +"group by F.title";
             ResultSet rs= null;
             rs= stmt.executeQuery(query);
             while(rs.next()){
             %>
             <tr>
                 <%
               
                
                                    
                 %>
             
                 <td><c:out value="<%= rs.getString(1) %>"/></td>
                 <td><c:out value="<%= rs.getString(2) %>"/></td>
                 <td><c:out value="<%= rs.getString(3) %>"/></td>
                 <td><c:out value="<%= rs.getString(4) %>"/></td>
                 <td><c:out value="<%= rs.getString(5) %>"/></td>
                 <td><c:out value="<%= rs.getString(6) %>"/></td>
                 <td><c:out value="<%= rs.getString(7) %>"/></td>
              
             
               </tr>
             <%      
                }

            %>
         
        </tbody>
      </body>     
</html> 