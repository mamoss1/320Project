<%-- 
    Document   : home_wishlist
    Created on : Apr 12, 2017, 10:58:07 PM
    Author     : carte
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
    
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Wishlist</title>
    </head>
          
<body>
      <ul>
            <li><a href="customerHome.jsp">Home</a></li>
            <li><a href="home_cart.jsp">Cart</a></li>
            <li><a class="active" href="home_wishlist.jsp">Wishlist</a></li>    
            <li><a href="search.jsp">Search</a></li>     
            <li><a href="checkout.jsp">Checkout</a></li>
            <li><a href="recomendations.jsp">Movie Recommendations</a></li>
            <li><a href="return.jsp">Return</a></li>
            <li><a href="home.jsp">Log Out</a></li>
       </ul> <br>
            <%  //this code gets the user's email and the user id so that it can be used in the sql code.
                String email = session.getAttribute("email").toString();
            Integer user_id=(Integer)session.getAttribute("user_id");
            %>
            <h1>Wishlist</h1>
    <table border=1>
        <thead>
            <TR>
                <th> User ID </th>
                <th> Film ID </th>
                <th> Film Title </th>
                <th colspan=2>Action</th> 
            
            </TR>
        </thead>
        <tbody>
            <% // THe code below is the SQL connection 
           Class.forName("com.mysql.jdbc.Driver");
            Connection connection= null;
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root","nbuser");
            Statement stmt= null;
            stmt=connection.createStatement();
            Statement statement=connection.createStatement();
            String titles = request.getParameter("title");                
         
               // the query select the needed infromation for the tables  
           String query="select USERID,FILMID, TITLE  from wishlist where USERID='"+ user_id + "'";
 
           ResultSet rs=null;
           rs=stmt.executeQuery(query);
           while(rs.next()){            
             %>
             <tr>
                 <%
                 
                  String title= rs.getString("title");                   
                 %>
        
            <tr>
               <TD> <%=rs.getString(1)%> </TD>
               <TD> <%= rs.getString(2) %> </TD>
               <TD> <%=title%> </TD>
               <%-- the code below allow the user it add the film to their cart--%>
               <td><a href="CartController?action=d&title=<c:out value="<%=title%>"/>">Add to Cart</a></td>
               <%-- the code below allow the user to remove the film from thier wishlist --%>
               <td><a href="WishListController?action=delete&title=<c:out value="<%=title%>"/>"> Remove</a></td>
             <%      
                }

            %>
            </table>
        </tbody>
   
</body>

</html> 