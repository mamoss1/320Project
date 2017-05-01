<%-- 
    Document   : home_cart
    Created on : Apr 12, 2017, 10:58:54 PM
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
        <title>Cart</title>
    </head>
          
<body>  
  
      <ul>
            <li><a href="customerHome.jsp">Home</a></li>
            <li><a class="active" href="home_cart.jsp">Cart</a></li>
            <li><a href="home_wishlist.jsp">Wishlist</a></li>    
            <li><a href="search.jsp">Search</a></li>     
            <li><a href="checkout.jsp">Checkout</a></li>
            <li><a href="recomendations.jsp">Movie Recommendations</a></li>
            <li><a href="return.jsp">Return</a></li>
            <li><a href="home.jsp">Log Out</a></li>
        </ul> <br>
      </ul> <br>
            <% //this code gets the user's email and the user id so that it can be used in the sql code.
                String email = session.getAttribute("email").toString();
              Integer user_id=(Integer)session.getAttribute("user_id");
            %>
        
            <h1>Cart</h1>
     Your cart is allowed up to 5 DVDs. If you try to add more than 5 DVDs to your
         cart, they will be added to your wishlist.
    <table border=1>
        <thead>
            <TR>
                <th> User ID </th>
                <th> Film ID </th>
                <th> Film Title </th>
                 <th colspan=1>Action</th> 
          
            </TR>
        </thead>
        <tbody>
            <%
                  //the code below gets the title from the search page. The title is then used to get the film id. 
          Class.forName("com.mysql.jdbc.Driver");
            Connection connection= null;
           connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root","nbuser");
            Statement stmt= null;
            stmt=connection.createStatement();
            String titles = request.getParameter("title");  
              // the code below select the information for the table.
           String query="select USERID,FILMID, TITLE  from cart where USERID='"+ user_id + "'";
           ResultSet rs=null;
           rs=stmt.executeQuery(query);
           while(rs.next()){            
             %>
             <tr>
                 <%
                  String title= rs.getString("title");           
                 %>
        
            <tr>
               <TD> <%= rs.getString(1) %> </TD>
                <TD> <%= rs.getString(2) %> </TD>
                <TD> <%=title%> </TD>
                   <%-- The code below allows the user to delete the films that they dont want  --%>
                     < <td><a href="CartController?action=delete&title=<c:out value="<%=title%>"/>"> Remove</a></td>
            </tr>
             <%      
                }

            %>
            </table>
        </tbody>
   
      
         
    
 
</body>

</html> 