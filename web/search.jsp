<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Show All Products</title>
    </head>
       
     
 <%--the code below allows the user to search for a film 
by the category, actor's name or store. --%>
<body>
    <ul>
            <li><a href="customerHome.jsp">Home</a></li>
            <li><a href="home_cart.jsp">Cart</a></li>
            <li><a href="home_wishlist.jsp">Wishlist</a></li>    
            <li><a class="active" href="search.jsp">Search</a></li>     
            <li><a href="checkout.jsp">Checkout</a></li>
            <li><a href="home.jsp">Log Out</a></li>
        </ul> <br> <br> <br>
        <br> <br> <br>
            <% String email = session.getAttribute("email").toString();
            %>
          
            <h1>Welcome to the Search Page!</h1>
        
        
      <form action="search.jsp" method="POST"> 
     
            Please enter the Film category:
            <input type="text" name="category">
            <br>
            Please enter the Films Actor's First Name:
              <input type="text" name="F_actor">
            <br>
              Please enter the Films Actor's Last Name:
              <input type="text" name="L_actor">
            <br>
            Please enter the Store Number:
              <input type="number" name="store">
            <br>
            <input type="submit" value="Submit">
        </form>
    <table border=1>
        <thead>
            <tr>
          
               <th>Title</th>
           
                <th colspan=2>Action</th> 
            </tr>
        </thead>
        <tbody>
            <%
           Class.forName("com.mysql.jdbc.Driver");
            Connection connection= null;
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root","nbuser");
             Statement stmt= null;
            stmt=connection.createStatement();
                
            Statement statement = connection.createStatement();

            String category = request.getParameter("category");  
                  String F_actor = request.getParameter("F_actor");
                  String L_actor=request.getParameter("L_actor");
                  String store= request.getParameter("store");
           
       
            
             String query= " select F.title from store as S join inventory as I"
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
                     + " where C.name like '" + category + "' or  "
                     + "A.first_name like '" + F_actor + "' or "
                     + "A.last_name like '" + L_actor + "' or "
                     + "S.store_id like '"+ store + "'"
                      +"group by F.title";
             ResultSet rs= null;
             rs= stmt.executeQuery(query);
             while(rs.next()){
             %>
             <tr>
                 <%
                 String title= rs.getString("title");  
                 
                 %>
             
          <td><a href="DescriptionController?action=d&title=<c:out value="<%=title%>"/>"><%=title%></a></td>
          <td><a href="CartController?action=d&title=<c:out value="<%=title%>"/>">Cart</a></td>
            <td><a href="WishListController?action=d&title=<c:out value="<%=title%>"/>">Wish List</a></td>     
         

               </tr>
             <%      
                }

            %>
         
        </tbody>
    </table>
</body>

</html>
